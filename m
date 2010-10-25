Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAIQt-0005bN-TD
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 10:29:37 +0200
Received: by iwn41 with SMTP id 41so490453iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 01:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ZR/DJH5r6qsVkjGzMuYi3i7wg47G/ltxox7Ft+WrvKY=;
	b=KK8EN31Jb9w5zfKtbMwdpx0v+zEp7a9GUAfwzTM3llVuAYWHFI0DsXMwzsJoe4xBOF
	lUtpLB35EHjH2GKl0osSOqklym/U3ba8+q4+vBWAX6wrxT23//3X/2XjTLCzy5qMhuzi
	XK7cWGuutS/Nl4LALmzWlOcpUpCTuLPbRoWmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=pbug5Gi7pC/6IooSfrgtdGUdFzsZAjsq7Hc0b/dhVd8aRkimHjrAUHDCS++7M5YBWK
	tW0yfInoWTZKiw66l37kQsizfY21hciEHRgem0QEB7Nxu/e0HrbNDF4YOiR+zFR/c4i9
	aBlYNd0NcTS+8y4DZBdKaRGFTTqOGlzQRAArU=
MIME-Version: 1.0
Received: by 10.231.154.73 with SMTP id n9mr5460618ibw.10.1287995320630; Mon,
	25 Oct 2010 01:28:40 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 01:28:40 -0700 (PDT)
In-Reply-To: <AANLkTikDAdLBYfZpkfKpBCU7JOEx+i9g=yJjzwoeeM+v@mail.gmail.com>
References: <AANLkTim1GALcyTjqpHAmy1L=8SqomVLqrKr7dYOwFhc4@mail.gmail.com>
	<AANLkTikDAdLBYfZpkfKpBCU7JOEx+i9g=yJjzwoeeM+v@mail.gmail.com>
Date: Mon, 25 Oct 2010 10:28:40 +0200
Message-ID: <AANLkTinTG5AgpVjhA6_4MDw=oqm1bvHxCo5OX5xEjmiM@mail.gmail.com>
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
Subject: Re: Revert + apologies (was: Re: [oe-commits] Frans Meulenbroeks : lsof/lsof_4.83.bb: removed unneeded EXTRA_OEMAKE)
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
X-List-Received-Date: Mon, 25 Oct 2010 08:29:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/25 Andrea Adami <andrea.adami@gmail.com>:
> Frans,
>
> nerverthless some recipes of the group *did* build flawlessy after
> removing the EXTRA_OEMAKE.
>
> ifupdown/ifupdown_0.6.10.bb
> ifupdown/ifupdown-ubuntu_0.6.8.bb
> man-pages/man-pages_3.21.bb
>
> I tested only a few...probably others too.
>
> It looks to me this was a quick hack to make broken recipes build...
>
> Anyway, thank again for your work. Keep on!
>
> Andrea

Andrea, all, I know some build flawless as I tested one which did, but
I had no easy and quick way to identify which ones did.

I did a quick peek at it (building tinylogin):
bitbaek -e only reveals one line with EXTRA_OEMAKE in it (with the
original recipe, so without my mod)
# EXTRA_OEMAKE=
after changing it I do get a different line for EXTRA_OEMAKE, so guess
something went wrong with the diff
No idea what, but will sort that out.

Also my assumption that EXTRA_OEMAKE was empty apparently is flawed.
Did a quick grep in classes and conf:

classes/qmake_base.bbclass:EXTRA_OEMAKE = ' MAKEFLAGS= '
classes/dietlibc.bbclass:    cfg = bb.data.getVar('EXTRA_OEMAKE', d, 1) or ""
classes/dietlibc.bbclass:    cfg = oe_filter_out("\'CC=",
bb.data.getVar('EXTRA_OEMAKE', d, 1) or "", d)
classes/dietlibc.bbclass:    bb.data.setVar('EXTRA_OEMAKE', cfgtmp, d)
classes/kernel.bbclass:# For the kernel, we don't want the '-e
MAKEFLAGS=' in EXTRA_OEMAKE.
classes/kernel.bbclass:EXTRA_OEMAKE = ""
classes/cmake.bbclass:# If declaring this, make sure you also set
EXTRA_OEMAKE to
classes/distutils-common-base.bbclass:EXTRA_OEMAKE = ""
classes/base.bbclass:	oenote ${MAKE} ${EXTRA_OEMAKE} "$@"
classes/base.bbclass:	${MAKE} ${EXTRA_OEMAKE} "$@" || die "oe_runmake failed"
classes/autotools.bbclass:EXTRA_OEMAKE = ""
classes/recipe_sanity.bbclass:              "SECTION", "PACKAGES",
"EXTRA_OECONF", "EXTRA_OEMAKE"]:
classes/ccdv.bbclass:EXTRA_OEMAKE_append = " ${@quiet_libtool(bb,d)}"
classes/devshell.bbclass:EXTRA_OEMAKE[export] = "1"
conf/bitbake.conf:EXTRA_OEMAKE = "-e MAKEFLAGS="
conf/bitbake.conf:EXTRA_OEMAKE_prepend_task_do_compile = "${PARALLEL_MAKE} "
conf/bitbake.conf:EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "


With tinylogin and the line removed I get:
EXTRA_OEMAKE="-e MAKEFLAGS="

It was my assumption that the EXTRA_OEMAKE var was empty and just
could be used in assigns, but it shows it is not. Not sure if that is
a good thing though.
The docs do not really mention that you should not assign, but append
but also not otherwise.
I'm in favour of giving the system part of it a separate name, and
keep EXTRA_OEMAKE strictly for recipe settings.

Frans


