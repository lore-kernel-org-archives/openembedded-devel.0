Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcosmamorim@gmail.com>) id 1NgsQF-0003f2-Oh
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Feb 2010 05:19:02 +0100
Received: by fxm25 with SMTP id 25so2547398fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=Twi3QUp8wKDknE+bPqyxJb7tMF80zitPkmduzLxxJ8k=;
	b=YS1egIMfrl8Ibi+DV2Fa61SyEFerHqNQrRWhfaiNIHCZ3ZcIXT6qtthD0/cpR6FTqL
	Hbm/uBwQ4nTqRpYaIL66s+RAsUIUzTja20c61oHGQmdIFEQSpVFJQo9F1YNu0U3KQ+nk
	bAhRFJTC3Ir1eWv9qK+cUZkBF99eg9Us4YFBg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gzadEUKaPknL9BHxsaRjDHjHUmkgRG6HX9nfQumP6HTjySPuEzPqu/6Wij+3JNQAjn
	mn2nuj7au7+XeHuIzvKnuLvIYTuG0SVuor2XXv9msREhjfnWRodki8hw7NTkhyeG+7e8
	hfDxc9IaUvbV9vBwLe/gtFJdIoUIQZgEoIEO8=
MIME-Version: 1.0
Received: by 10.223.5.207 with SMTP id 15mr2401868faw.6.1266207382286; Sun, 14 
	Feb 2010 20:16:22 -0800 (PST)
In-Reply-To: <20100214215341.GL30265@mx.loc>
References: <b8e1ecc81002111744u4e9c2d84xc5cc1e3d2d1b3a0d@mail.gmail.com>
	<20100213152222.GA30029@mx.loc> <20100214215341.GL30265@mx.loc>
Date: Mon, 15 Feb 2010 02:16:22 -0200
Message-ID: <b8e1ecc81002142016h7c9d8252g561d816c506e4b52@mail.gmail.com>
From: Marcos Amorim <marcosmamorim@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: marcosmamorim@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: busybox* Fix URI
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
X-List-Received-Date: Mon, 15 Feb 2010 04:19:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Do not consider my patch, use the patch that is in the patchwork.

What I said earlier was that in busybox.inc has SRC_URI to address, SRC_URI
= "http://www.busybox.net/downloads/busybox-$(PV).tar.bz2"
so do not need the same address in other files, but I have not tested it
yet.


Marcos Amorim

2010/2/14 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

> On Sat, Feb 13, 2010 at 04:22:22PM +0100, Bernhard Reutner-Fischer wrote:
> >On Thu, Feb 11, 2010 at 11:44:04PM -0200, Marcos Amorim wrote:
> >>Hi All,
> >>
> >>I suggest move SRC_URI from all busybox_${PV}.bb for busybox.inc, but i
> dont
> >>really if is possible.
> >
> >The patch posted here:
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-February/017232.html
> >uses tar.bz2 and switches to new-style checksums. Please use that one
> >and
> >
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-February/017231.html
> >instead.
>
> These 2 abovementioned patches got applied now, so the patch in this
> thread should be (please confirm):
> Superseded
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

