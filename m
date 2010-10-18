Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7mmt-0004yd-IM
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 12:17:52 +0200
Received: by gwb17 with SMTP id 17so288150gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JjTAnSvyNFbKVgmAYr4YsQ0SlwE4wTQ/gv6rbjehiVc=;
	b=dmynOthNLiNw2e/oH7WcP94AcQTBbmKWAGgvdODQ9A4S9x7IVNuMhXGyXXPjJl4ENf
	hfsccnqsEBNGD9EgTwNwb246B9ZK0M/pLBF9/o90yrNAayoPDcpNCIA3BJhuAXqa1uyw
	Ig0gSNKEqBtRZfPRMm1ozX4Pk8WXvFzC4/yFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AASkNxnLMmNIs7e9DcFsc/AgTrgXg4m1g9GcdmbfhUP08YQCVulFQt09GO/8WMOZ2M
	0ZacBqXTtpmjjXDpP1L8RaFl4XJgyIV5zg/cDt1GzM4zv2322l9PUaMJzGGWGm8/rt6O
	fsq22ZCrXLpMsRtiraaPZOweWtAEbtGypvxoQ=
MIME-Version: 1.0
Received: by 10.42.243.132 with SMTP id lm4mr2959037icb.177.1287397033239;
	Mon, 18 Oct 2010 03:17:13 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 03:17:12 -0700 (PDT)
In-Reply-To: <lybp6r96cz.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1286544852-15635-1-git-send-email-msmith@cbnco.com>
	<AANLkTi=9bQq6q8NBTPgHhGMfmLs6Ae+oiLugNd+RyK=2@mail.gmail.com>
	<AANLkTikYuii4mEWxWh7HahgFVzYgaUz-DADyUyibqa4d@mail.gmail.com>
	<AANLkTimJLCis3ZhSs0Bqj=aY6hX3pXhPLJAj55uX8tdQ@mail.gmail.com>
	<AANLkTimBs3B9i4hWe4TR-YPVrz9tjWXNqoWDoVWEfuZy@mail.gmail.com>
	<lybp6r96cz.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 18 Oct 2010 12:17:12 +0200
Message-ID: <AANLkTi=Z7wibE-jQj3ZZ4bTFVConRCQ9EBVZfCSH0dt6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] package.bbclass: copy dotfiles in root D to PKGD
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
X-List-Received-Date: Mon, 18 Oct 2010 10:17:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/18 Enrico Scholz <enrico.scholz@sigma-chemnitz.de>:
> Frans Meulenbroeks <fransmeulenbroeks@gmail.com> writes:
>
>> - =A0 =A0 os.system('cp -pPR %s/* %s/' % (dest, dvar))
>> + =A0 =A0 os.system('cp -pPR %s/* %s/.??* %s/' % (dest, dest, dvar))
>
> why not "os.system('cp -pPR %s/. %s/' % (dest, dvar))"?
>
>

Even better. Didn't think of that one.


