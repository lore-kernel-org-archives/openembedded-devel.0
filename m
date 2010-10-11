Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P5GUA-0006WD-P5
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 13:24:10 +0200
Received: by iwn7 with SMTP id 7so2560117iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Oct 2010 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6QI0uWjLdGaNWg3bKOUGIrUYUL9ea4wdebDb/4J0Ev4=;
	b=ih+QEu6yk2yYT1jVp6gBp+Y+yac5nE6T73LBGqFhR8KRmGWLISd+2/bb3QNzqLjZ+x
	1EtzYbbGBhGISHOyydqiKVXXASe5lGhpJ+TqqM+dsH9Q6/CCUWfMWUtsI2MJd4dID1wA
	nRl3aogNhYp3KwJgBmfS5Ie34+aOESIr//JrQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=gM7ItLen0d8boeptQ5a/JDzRrb4N+hQYFiV6uvmzd/6M2p77Ifg9dQs1JJxWs4XBjJ
	B99vmicmnsr8fKAIAYhC9C+QQ8YhEG7VDaJg9W2Ff+PKrSsjnmaEIViAbeII5yLMfN4k
	wcEF6odxS1TR6+ChXeeo2zsKMr7IRriB1Vrcs=
MIME-Version: 1.0
Received: by 10.231.30.76 with SMTP id t12mr4376102ibc.161.1286796221667; Mon,
	11 Oct 2010 04:23:41 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 11 Oct 2010 04:23:41 -0700 (PDT)
In-Reply-To: <AA9C90F1-F206-461B-8CDB-383678BA363A@mac.com>
References: <F34D057F-F640-4BB6-841B-2B66AFE37A99@mac.com>
	<AANLkTin8xbEBR=mVr3PHN9cjwqtUoM9BxpYkgBE7p_UY@mail.gmail.com>
	<i8ufek$27r$2@dough.gmane.org>
	<AA9C90F1-F206-461B-8CDB-383678BA363A@mac.com>
Date: Mon, 11 Oct 2010 13:23:41 +0200
Message-ID: <AANLkTimFAn7+SrrqLBbnb7k3Jp4FRc6yaAh6i_BJ_Dnv@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Building for multiple machines
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
X-List-Received-Date: Mon, 11 Oct 2010 11:24:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/11 Elvis Dowson <elvis.dowson@mac.com>:
>
> On Oct 11, 2010, at 11:47 AM, Koen Kooi wrote:
>>>
>>> I guess trying this would ahve been much faster than waiting for an ans=
wer here.
>>>
>>> And OE does not have an auto.conf
>>
>> OE *does* have an auto.conf, pretty much since the start:
>
> There was a reason why I didn't try it right away. A while back, i had a =
working overo-oe, and auto.conf was set to MACHINE=3D"overo"
>
> After that, I changed it to MACHINE=3D"beagleboard".
>
> It created two output folders in tmp/deply for both the targets, but the =
images didn't work properly, I had some issues. Can't recall exactly what i=
t was. So, I had to delete my tmp folder, and repeat the build process afre=
sh, this time, with only MACHINE=3D'beagleboard".
>
> I was wondering what the recommended process is for building for multiple=
 machine architectures?
>
> Elvis Dowson

I've build multiple machines in one tmp but often they are for
different architectures (e.g. hawkboard and beagleboard (whcih is
armv5 and armv7a resp)
If you are going to mix distro's things might become more troublesome
(and machine specific pinnings (with DEFAULT_PREFERENCE) might also
cause mismatches).

Of course you can also change your TMPDIR (and set it e.g. to
tmp_${DISTRO}_${MACHINE})
That way you'll get different tmp dirs (probably you want to inherit
rm_work to keep the space usage manageable).

Have fun! Frans

Frans


