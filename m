Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKItu-0007bi-35
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 00:00:52 +0100
Received: by wwb34 with SMTP id 34so134634wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Nov 2010 14:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ojcmaKWjPTckKKXeYarffBm9y0FfrUu9deVakP5mST8=;
	b=wDB1/rpMi0+2jccybcnxsNDKgrNZX1M2eHEr/QLMq9hqrYw2X8/ImjiiM8vBCymnwD
	DjIkH76XVZfVlXNCQEEJS9H0I8daD1JcjqwJHjvK5HBXbjoArzZvPcND3be+ApyapY8f
	IzXkNHEYBYBZPL+/1RRiuostM6nTVKIWMsM2g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Cep9bHGrwN3L+HYERkwvqLhmGrFA4RHX+DcFLnIRsCk8KG4cgUVTFXwFGpXIZfmEmH
	lahCZJVoLyZrg79ICJDdRqBqRn/N4xm9rmD0FtFKiEnaWO+jZAmjr2Z9yvUKQdOFSFXr
	oTnH7SSgMLnAwwQsju7pHwRUKsLeX3iZcEOYk=
MIME-Version: 1.0
Received: by 10.227.143.199 with SMTP id w7mr5133250wbu.20.1290380378197; Sun,
	21 Nov 2010 14:59:38 -0800 (PST)
Received: by 10.227.32.147 with HTTP; Sun, 21 Nov 2010 14:59:38 -0800 (PST)
In-Reply-To: <AANLkTi=aMYQXCUQLzTAfAPeNmvV38Emtckaw_EmXzBmL@mail.gmail.com>
References: <AANLkTi=aMYQXCUQLzTAfAPeNmvV38Emtckaw_EmXzBmL@mail.gmail.com>
Date: Mon, 22 Nov 2010 09:29:38 +1030
Message-ID: <AANLkTi=LXoE99ae4VdBt1BgHdsDh8h8nYddOacU3LGpv@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: any reason to not cache `opkg list`?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Nov 2010 23:00:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 November 2010 09:48, AJ ONeal <coolaj86@gmail.com> wrote:
> My assumption is that the only time the results of `opkg list`
> will change is after `opkg update`.
>
> Is that correct?
>
>
> If so, why not have `opkg update` generate the output
> which `opkg list` produces such that `opkg list` is instantaneous?
>
> AJ ONeal
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

On my 300Mhz mipsel:

root@quokka:~# ls -l /var/lib/opkg/
-rw-r--r--    1 root     root      3558222 Nov 21 22:53 base
-rw-r--r--    1 root     root       145482 Nov 21 22:53 no-arch
-rw-r--r--    1 root     root        66288 Nov 21 22:53 quokka
root@quokka:~# time opkg list > /dev/null
real    0m 2.78s
user    0m 2.50s
sys     0m 0.26s

Ok, so its not the quickest. Opkg has to read in the package info and
parse it each time.

What is your use case for needing to call 'opkg list' so frequently
that this becomes painful?

-Graham


