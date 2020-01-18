Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7BD7F9F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 19:04:27 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id z76so26182331qka.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bjazJYzjmGrm+ijk1rOpPyYOaGY9BYYc7nbt1SlSgDg=;
	b=RktyDHc/jsfK8TKs+g3CcSXLcv4Safx8Y7gE9FiJwjUS7ooeBAi3K/o+G4jsw4VMoM
	21Tg5D25DIfSrm70nWm4uNyqxEC7nFRpbuUSfx2JNozLQOvEnM0+Af7lEFdXEJDjyzvF
	c3RE+ogfpHrmNa3s8N1a8pzwcEd0ypTjzthxe+q4bQzvl0Mo/+qz5C+8bwAcSkIaK4O7
	lYjUoQ5T8gCXnr40pZ8vKJoT5dfhijs4878DmBNfzap5wf83E/GqSr/hMsEF2a+En2/8
	5XBNBAih/ylsUgB5QZ2IsHhY/oPgUMAHJ5XIR9qqH7yyJjcUuxu89H7B14U7dacKBu9B
	PefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bjazJYzjmGrm+ijk1rOpPyYOaGY9BYYc7nbt1SlSgDg=;
	b=mhQuYWG8x5oIF7/ouln0+7uGBp2KrYeDEVts9jvRfMt22sJn5yyQtcORXyZ0gPvD3v
	24NLtbB9XozYflkbq3n4uyesl8q82WC4BGwKOff+36QHbJL7MxTwxWoIqqPDJS10Tyd1
	z1TigS/wmXY6m8cRepTgzYX2AV+i3rXGs1NQu4s067oxZHc+vlwP1vaU/yAVCbXZxFUk
	Kwj0snE78jekC9M1GJe8PVBypmCqtA+8ZzBmK7Vh4y3BNqtoJpuIwXy4vsLEGVvFMtS8
	aIyVTJN4sYGudNV5RedoGUZi/jsWVDTuge4iHmidJADol1I40ywX0Jxak2i/79QQ2hLh
	xTwg==
X-Gm-Message-State: APjAAAV49oniLJivvuMlgb6u7Lw5mJD7zZOWN15l08ABCxysG+pCccBh
	Fal3NEVDJN78LYTnQTbI+5tE/y4PzJkaXVQVd3X0bXcS2m0=
X-Google-Smtp-Source: APXvYqyGKtBmUlrf7GSC8dLpRienlyMWA5OFyBtGMH3sa2NIx1jp8ClEoRoiu47fJGMP3D9B+i6K53QCgiMuY4MH1Ao=
X-Received: by 2002:a37:de05:: with SMTP id h5mr44850806qkj.474.1579374267739; 
	Sat, 18 Jan 2020 11:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20200106133957.8305-1-sno@netbsd.org>
In-Reply-To: <20200106133957.8305-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Jan 2020 11:04:01 -0800
Message-ID: <CAMKF1spDRpU=EU6P2tpmij=wOedP=iGpES9rqYhd5qJAb-9sZg@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH v2] libconfig-autoconf-perl: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Jan 2020 19:04:27 -0000
Content-Type: text/plain; charset="UTF-8"

this is causing state failures

ERROR: libconfig-autoconf-perl different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
33795, PID: 21500
Hash for dependent task
libconfig/libconfig-autoconf-perl_0.318.bb:do_install_ptest_base
changed from 3708b1201aea32d1ef4786f0a7210065b551070615eb8ac9116af82f3b509ce5
to b4e69184523533f7bc5287910eaf676a37c1864d8bfb03017872710388a4073f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb:do_install_ptest_base
with hashes 3708b1201aea32d1ef4786f0a7210065b551070615eb8ac9116af82f3b509ce5
or b4e69184523533f7bc5287910eaf676a37c1864d8bfb03017872710388a4073f

On Mon, Jan 6, 2020 at 5:40 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Introduce Config::Autoconf module to meta-perl which will allow some
> probes can be run without leaving perl5 context.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  .../libconfig-autoconf-perl_0.318.bb          | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
>
> diff --git a/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
> new file mode 100644
> index 000000000..e4f8fe7e2
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libconfig/libconfig-autoconf-perl_0.318.bb
> @@ -0,0 +1,41 @@
> +# Copyright (C) 2020 Jens Rehsack <sno@netbsd.org>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +SUMMARY = "A module to implement some of AutoConf macros in pure perl"
> +DESCRIPTION = "Config::AutoConf is intended to provide the same opportunities to Perl \
> +developers as GNU Autoconf <http://www.gnu.org/software/autoconf/> does for \
> +Shell developers."
> +
> +HOMEPAGE=       "https://metacpan.org/release/Config-AutoConf"
> +
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "${CPAN_MIRROR}/authors/id/R/RE/REHSACK/Config-AutoConf-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "0bea721ad3996e20324b84b3b924ec71"
> +SRC_URI[sha256sum] = "33c930feec3003de251ca222abe8bbeb74610ad07f65fc16f27d74d195eeab34"
> +RDEPENDS_${PN} += "libcapture-tiny-perl"
> +RDEPENDS_${PN} += "perl-module-base"
> +RDEPENDS_${PN} += "perl-module-carp"
> +RDEPENDS_${PN} += "perl-module-config"
> +RDEPENDS_${PN} += "perl-module-constant"
> +RDEPENDS_${PN} += "perl-module-file-basename"
> +RDEPENDS_${PN} += "perl-module-file-spec"
> +RDEPENDS_${PN} += "perl-module-file-temp"
> +RDEPENDS_${PN} += "perl-module-extutils-cbuilder"
> +RDEPENDS_${PN} += "perl-module-extutils-cbuilder-platform-unix"
> +RDEPENDS_${PN} += "perl-module-scalar-util"
> +RDEPENDS_${PN} += "perl-module-strict"
> +RDEPENDS_${PN} += "perl-module-text-parsewords"
> +RDEPENDS_${PN} += "perl-module-warnings"
> +RRECOMMENDS_${PN} += "libfile-slurper-perl"
> +
> +S = "${WORKDIR}/Config-AutoConf-${PV}"
> +
> +inherit cpan ptest-perl allarch
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

