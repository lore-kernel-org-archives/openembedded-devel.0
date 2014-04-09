Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 24FF860782
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 20:30:05 +0000 (UTC)
Received: by mail-ig0-f178.google.com with SMTP id hn18so2914017igb.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Apr 2014 13:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/dfUcKrRXZ0M7awI64gdDNr56JTo44DirZ8BP/zIH8Q=;
	b=gqCEGlnNa5CFW9cKJOjnYW5AaLSSJxQEY4fOjuHg5scGEeNnktcpoeroI5tB+BKs5T
	YRmdY6Px7d2V3imbZV6/DqClC9UTYxfDb3XSDHekI6yFG4CzwXHc5rOC5SkhzLlXnhNv
	JmCphX8p1/jV5T+ziEie+tSCV/UmBFPFvk634AqyW91EARskxPKLUkdzAYjto9MVVo31
	2tbThSq7aaTESMYtVb4jowEypg3u99N2l/HZxuo3FYpkXYUwhtUO+8Do+3JF2clg+MD9
	dy97iuMc8F300L4i/s6mr1fC+ocsffRTzpQb3iW5kx75IeNWfhVw+soEeCjzBAOdZPeB
	U+4A==
MIME-Version: 1.0
X-Received: by 10.43.143.211 with SMTP id jn19mr10114223icc.0.1397075406083;
	Wed, 09 Apr 2014 13:30:06 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 13:30:05 -0700 (PDT)
Received: by 10.50.229.14 with HTTP; Wed, 9 Apr 2014 13:30:05 -0700 (PDT)
In-Reply-To: <20140409173022.GA2661@windriver.com>
References: <20140409173022.GA2661@windriver.com>
Date: Wed, 9 Apr 2014 13:30:05 -0700
Message-ID: <CAMKF1sqJTJQtxbv2uKjQkxGYFmXa2AWSTcJ7SnexyKnytCHJJw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: Re: [meta-networking] Uprev memcached from upstream
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
X-List-Received-Date: Wed, 09 Apr 2014 20:30:08 -0000
Content-Type: text/plain; charset=UTF-8

On Apr 9, 2014 7:30 AM, "Amy Fong" <amy.fong@windriver.com> wrote:
>
> commit 3d0b80c5667a2c1d8634173948048567d0bc9c36
> Author: Amy Fong <amy.fong@windriver.com>
> Date:   Tue Apr 8 14:29:19 2014 -0400
>
>     Uprev memcached from upstream
>
>     memcached 1.4.15 has some configuration errors:
>     configure:5798: error: cannot run test program while cross compiling
>
>     Uprev has the needed fix for the configuration error and some other
fixes.
>
>     Signed-off-by: Amy Fong <amy.fong@windriver.com>
>
> diff --git a/recipes-support/memcached/memcached_1.4.17.bbb/recipes-support/memcached/
memcached_1.4.17.bb
> new file mode 100644
> index 0000000..906896c
> --- /dev/null
> +++ b/recipes-support/memcached/memcached_1.4.17.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "A high-performance memory object caching system"
> +DESCRIPTION = "\
> + Danga Interactive developed memcached to enhance the speed of
LiveJournal.com, \
> + a site which was already doing 20 million+ dynamic page views per day
for 1 \
> + million users with a bunch of webservers and a bunch of database
servers. \
> + memcached dropped the database load to almost nothing, yielding faster
page \
> + load times for users, better resource utilization, and faster access to
the \
> + databases on a memcache miss. \
> + . \
> + memcached optimizes specific high-load serving applications that are
designed \
> + to take advantage of its versatile no-locking memory access system.
Clients \
> + are available in several different programming languages, to suit the
needs \
> + of the specific application. Traditionally this has been used in
mod_perl \
> + apps to avoid storing large chunks of data in Apache memory, and to
share \
> + this burden across several machines."
> +
> +HOMEPAGE = "http://www.danga.com/memcached/"
> +LICENSE = "BSD"

which bsd ?
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
> +
> +inherit autotools
> +
> +DEPENDS += "libevent"
> +RDEPENDS += "perl perl-module-posix perl-module-autoloader
perl-module-tie-hash"
> +

rdepend should be package specific

> +SRC_URI = "http://www.memcached.org/files/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
> +SRC_URI[sha256sum] =
"d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
> +
> +python __anonymous () {
> +    endianness = d.getVar('SITEINFO_ENDIANNESS', True)
> +    if endianness == 'le':
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=little")
> +    else:
> +        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=big")
> +}
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME = "memcached"
> +INITSCRIPT_PARAMS = "defaults"
> +
> +do_install_append() {
> +       install -D -m 755 ${S}/scripts/memcached-init
${D}${sysconfdir}/init.d/memcached
> +       mkdir -p ${D}/usr/share/memcached/scripts
> +       install -m 755 ${S}/scripts/memcached-tool
${D}/usr/share/memcached/scripts
> +       install -m 755 ${S}/scripts/start-memcached
${D}/usr/share/memcached/scripts
> +}
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

