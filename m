Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3EFC370660
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 12:07:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="44084063"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Nov 2014 20:04:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sARC709o017277;
	Thu, 27 Nov 2014 20:07:01 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD01.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Thu, 27 Nov 2014 20:07:27 +0800
Date: Thu, 27 Nov 2014 20:07:15 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20141127200715.71eac052@Fedora>
In-Reply-To: <5476F1AB.3000507@dominion.thruhere.net>
References: <1416473941-23508-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<1417079962-3455-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<5476F1AB.3000507@dominion.thruhere.net>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net
Subject: Re: [meta-oe][PATCH v3] tiptop: Add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Nov 2014 12:07:29 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

On Thu, 27 Nov 2014 10:40:59 +0100
Koen Kooi <koen@dominion.thruhere.net> wrote:

> > diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb
> > b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb new file mode 100644 
> > index 0000000..126976c --- /dev/null +++
> > b/meta-oe/recipes-extended/tiptop/tiptop_2.2.bb @@ -0,0 +1,26 @@ +SUMMARY
> > = "Hardware performance monitoring counters" +HOMEPAGE =
> > "http://tiptop.gforge.inria.fr/" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM =
> > "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" +DEPENDS = "ncurses
> > libxml2" + +SRC_URI =
> > "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz" +SRC_URI[md5sum] =
> > "74255a29acf44569db021b080ad3e3f7" +SRC_URI[sha256sum] =
> > "965cb99b16cb59df78363d83b62877ce8501b0aac1116a86bed8a16aa96b171d" + 
> > +inherit autotools-brokensep +EXTRA_OECONF = "CFLAGS="$CFLAGS
> > -I${STAGING_INCDIR}/libxml2"" +COMPATIBLE_HOST =
> > "(i.86|x86_64|arm|powerpc).*-linux"
> 
> What's broken on mips, armv8 and avr32?

It seems that tiptop is not supported on some architectures. The patch on
bugzilla[1] has only fixed part of this issue(mips not included). I failed to
build it on qemu-mips and have to use COMPATIBLE_HOST to limit the target
architectures. I have only built it on qemux-(x86|x86-64|arm|ppc|mips) and know
few about armv8, arv32. Any documents for them? How can I simulate them in qemu?

By the way, there are also some patches[2-3] on debian. Should I include them
in the next patch?

[1]https://bugzilla.redhat.com/show_bug.cgi?id=1122009
[2]http://anonscm.debian.org/cgit/collab-maint/tiptop.git/tree/debian/patches/0001-Fix-minor-problems-with-the-manpage.patch
[3]http://anonscm.debian.org/cgit/collab-maint/tiptop.git/tree/debian/patches/0002-Fix-linking-phase.patch

> 
> > + +do_configure_prepend () { +    # Two bugs in configure.ac when
> > cross-compiling. +    # 1. The path of libxml2. Specify it in
> > EXTRA_OECONF. +    # 2. hw's value on other platforms. Replace it if the
> > target is +    #    not i*86/x86_64. +    if ( echo "${TARGET_ARCH}" |
> > grep -q -e 'i.86' -e 'x86_64' ); then +        sed -i 's=
> > -I/usr/include/libxml2=='    ${S}/configure.ac +    else +        sed -i
> > 's/hw=`uname -m`/hw="unknown"/'  ${S}/configure.ac +        sed -i 's=
> > -I/usr/include/libxml2=='    ${S}/configure.ac +    fi +}
> 
> Drop the conditional, it should *never* use uname.

Ok, it will be modified in next patch, which will be submitted a few days later.

-- 
Qian Lei

