Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nd27o-0003Dc-Hu
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Feb 2010 14:52:07 +0100
Received: by gxk27 with SMTP id 27so116295gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2010 05:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=TtjVbeOpbg7g6lfkUIiaNQSn9RJN102pn0QRueWs+pk=;
	b=Zu50C4EYnnHzWbQYvGGoqGpDvQ0X0TbN7oAHf4xx5nplAJBBZ5yQM4AttVrN+OULEN
	6C3Q3SgDI6YDQIzArruwO7INCdnGPLuyP3Y4MwiBVWj0GgyRib4kRQ0B5G03sjbTer3F
	wxyGllQcPv7Phe/RSLmr62yM3C7sfKfSiXpZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=tUQ5vklwJGiFrYAgLpzjQ6WKnsKbh6Yhn62+4oWM4UzYGVfNgpBsVuVT84ZgWKcFhP
	UiB0o3z/kjwisdYGeeksE79CCBrGtfynjjzUz/wSctEowxRdyY1Vvkn//Fm6qGUaDCPO
	zOvl4Y07ucSncqB8ModUhRLPXLIj/q/BvX1Zw=
MIME-Version: 1.0
Received: by 10.101.106.16 with SMTP id i16mr1416486anm.194.1265291372115; 
	Thu, 04 Feb 2010 05:49:32 -0800 (PST)
In-Reply-To: <4B6AC59A.90000@dresearch.de>
References: <BAY127-W217652A5FD6DFB2C0B4E2FD8570@phx.gbl>
	<4B684D9D.2030001@dresearch.de> <4B699C5A.70909@dresearch.de>
	<20100203162120.GB26844@xora-build.xora.org.uk>
	<4B6AC59A.90000@dresearch.de>
Date: Thu, 4 Feb 2010 14:49:32 +0100
Message-ID: <ac9c93b11002040549p1536be1di20d94a83468ec0bf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem in bitbaking
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
X-List-Received-Date: Thu, 04 Feb 2010 13:52:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

.
>
> Sorry about that. But i wasn't sure if you read the ml daily. So i put
> you on the Cc.
>
> BTW, i would call the hint, that your commit broke[1] the baking of at
> least glib-2.0 (which isn't that exotic) an 'information'.
>
> [1] I've rechecked this again with angstrom distro and hipox,
> beagleboard, and x86 machine making a clean build of glib-2.0:
>
> =A0rm -rf tmp.5
> =A0bitbake glib-2.0
>
> Steffen

For me it also build for both i686 (machine eee701) and beagleboard.
key difference is probably that for me glib got build as part of
console-image. Didn't try a solo build of glib.

FM


