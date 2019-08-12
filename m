Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail.openembedded.org (Postfix) with ESMTP id B12027ECAD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 17:42:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e16so11243151edv.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2019 10:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DeK2wY/a5v7fe+7/ER+y16HOmTktvrpOwuNhwr7odTE=;
	b=kB9KyV92qWx/GeYzkzB5pOWk0uVsrAhf5LiRNqrgXchaMyL8ti1KV0WCZIDJqFYY1g
	gZz/62YbBVP6Jy5vdA0Nd+iNIayJBOoUXiGuqXphkWtkJPRibEQ87i6SBmBq9jk5ntjX
	73Qaf3taMP2YXvbkJtp7JtKsh5nMusERVepNtG73WGPVkEHx/iKu02+S6aj70odBLeNN
	472+XwX6IP9FlZSt0g2SKIVaursZh34+HnKoP+gPsN9QB3o44esc4GJ5VB2WfjDvOnkb
	JlttrEl/8/xNj+TpGwQxHH9hsb7tIQzli+aWMjitt2rINttqYFpNWUX5+QKZyXfacF3z
	jhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DeK2wY/a5v7fe+7/ER+y16HOmTktvrpOwuNhwr7odTE=;
	b=FW9ruf1eS/WtmkZ5ORRLFS95fB5H/8g8+0B5xOv5+/1QVZy824Vo6PSjibUxe+nBa8
	Iet/tfulzNZGzKirBy1IXA+tMO6s3zfONF3F70Ko9Bg7Y8SY9Z/1TTbKYbDw8vXrcyFa
	boCGD8UqHGWXurH/CVF8bhiM7PxnjtLYt0CU+3Z0lN8gKbY+nP13jekQ7K415soRgfbY
	/Q53q4XK8PYq3GB+2km3v25E+VTSxlPA6f6sKaFjp+I0eE7RTHV6NgDE3GvyVCHKSf8+
	V24wppClGOkncIs9rlDDuQsrd3LevkHW1k42QMmhfNNT30awAMUI+IFvhXWDkK39URCl
	Cidw==
X-Gm-Message-State: APjAAAXF9JUDgjAt42VBWrrfR0yza1YJK4UmUV4vE6nAAGVZH6aqp2fR
	hiSIiPiVz4LCRtvG+3ZAs+r46jSj/NbgkS+Xuj8=
X-Google-Smtp-Source: APXvYqw7ErvB0M9qqoKhWIEOtP3GtoOQ9IbQ/oglMW8sVjHXFM1+ZnyoyC40gQOdfVoCbTBRdQdND4/5RjW64Y92FuU=
X-Received: by 2002:a50:c35b:: with SMTP id q27mr38058317edb.98.1565631732001; 
	Mon, 12 Aug 2019 10:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561696450.git.timothy.t.orling@linux.intel.com>
	<a853162aa82bf2c1723190f00fc6ad608ab21fc8.1561696450.git.timothy.t.orling@linux.intel.com>
	<CA+chaQfnfvnSjEJbKoEf7gtF-FaM0rfNoRVWiJtSPcfuR+s4oQ@mail.gmail.com>
	<910f1d32-e526-6ecc-ba4f-cf5c75461725@gmail.com>
	<CA+chaQdCTa5q5ds7OVxiss-rwTvjj_uP8fGcoz=oVNBYnehkKg@mail.gmail.com>
	<CAMKF1sroB7p8YhnLCumPT+Fk1cCk5s90SdDPdhzeXfyOf6bAng@mail.gmail.com>
In-Reply-To: <CAMKF1sroB7p8YhnLCumPT+Fk1cCk5s90SdDPdhzeXfyOf6bAng@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Aug 2019 19:42:02 +0200
Message-ID: <CA+chaQdNPShafeJzJ5LOE5BOmFaNU2p2JoJ-iGM3HkmYE_LSCQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/9] libdbi-perl: fix dependencies
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
X-List-Received-Date: Mon, 12 Aug 2019 17:42:12 -0000
Content-Type: text/plain; charset="UTF-8"

I've triggered another round of workspace-prepare jobs to update the
local.conf and triggered another oe_world_workspace-compare-signatures:
http://jenkins.nas-admin.org/view/OE/job/oe_world_workspace-compare-signatures/685/console

Now it shows the issues correctly, so there is this issue in more perl
recipes, I'll leave that to meta-perl maintainer to resolve.

 === Comparing signatures for task do_configure.sigdata between qemux86copy
and qemux86 ===


 === Comparing signatures for task do_populate_sysroot.sigdata between
qemux86copy and qemux86 ===


 === Comparing signatures for task do_package_write_ipk.sigdata between
qemux86copy and qemux86 ===
ERROR: runit different signature for task do_package_write_ipk.sigdata
between qemux86copy and qemux86
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
38203, PID: 32316
Hash for dependent task runit/runit-serialgetty.bb:do_packagedata changed
from 036a49f6a16bc40635c9381a09c31f4552c5d4949da82fdcd892c67394fbfcfd to
60303a92764e08e5858a6ecb4793cadcf61473d8701407742c549b5dc43ab09d
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-core/runit/runit-serialgetty.bb:do_packagedata
with hashes
036a49f6a16bc40635c9381a09c31f4552c5d4949da82fdcd892c67394fbfcfd or
60303a92764e08e5858a6ecb4793cadcf61473d8701407742c549b5dc43ab09d

ERROR: xscreensaver different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemux86
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
45803, PID: 32327
Hash for dependent task x11-common/xserver-nodm-init_3.0.bb:do_packagedata
changed from
dc0a28fc0749e5144ef2d5047680dbb6db1694cbcf499e7d14f6fa717beac14c to
52ef291d9ddba1c201182957c8c28fb0b3ced0fcfb0c9be12225b0ddd0580a9c
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb:do_packagedata
with hashes
dc0a28fc0749e5144ef2d5047680dbb6db1694cbcf499e7d14f6fa717beac14c or
52ef291d9ddba1c201182957c8c28fb0b3ced0fcfb0c9be12225b0ddd0580a9c

ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1565614951/signatures.qemux86.do_package_write_ipk.sigdata.log


 === Comparing signatures for task do_configure.sigdata between qemux86copy
and qemuarm ===
INFO: acpica-native task do_configure.sigdata doesn't exist in qemuarm
ERROR: atmel-qt-demo-init different signature for task do_configure.sigdata
between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
41251, PID: 32354
Hash for dependent task
apps/atmel-qt-demo-init_1.1.bb:do_prepare_recipe_sysroot
changed from
66d94a66f7b2aab40da064cee80e798976971265fc3e7bb92205879790e8f643 to
efaed50f7bdcec5a918f1a7784023784e535e32fb10b70763f97f89c49cc90e6
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/meta-atmel/recipes-atmel/apps/atmel-qt-demo-init_1.1.bb:do_prepare_recipe_sysroot
with hashes
66d94a66f7b2aab40da064cee80e798976971265fc3e7bb92205879790e8f643 or
efaed50f7bdcec5a918f1a7784023784e535e32fb10b70763f97f89c49cc90e6

INFO: binutils-cross-i686 task do_configure.sigdata doesn't exist in qemuarm
INFO: gcc-cross-i686 task do_configure.sigdata doesn't exist in qemuarm
INFO: gdb-cross-i686 task do_configure.sigdata doesn't exist in qemuarm
INFO: go-cross-core2-32 task do_configure.sigdata doesn't exist in qemuarm
ERROR: libxml-filter-buffertext-perl-native different signature for task
do_configure.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
40431, PID: 32365
Hash for dependent task libxml/libxml-filter-buffertext-perl_1.01.bb:
do_prepare_recipe_sysroot:virtual:native:/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libxml/
libxml-filter-buffertext-perl_1.01.bb changed from
c83f737f32f1b6932b1eb547e7150415666b399aac5b7550209a6b9a9a7d711a to
40e3866a209e6a44ad91e68f8c83c2f64bacb6b73c5e9ad45d7cf6e7045bf49b
Unable to find matching sigdata for
virtual:native:/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb:do_prepare_recipe_sysroot
with hashes
c83f737f32f1b6932b1eb547e7150415666b399aac5b7550209a6b9a9a7d711a or
40e3866a209e6a44ad91e68f8c83c2f64bacb6b73c5e9ad45d7cf6e7045bf49b

INFO: ovmf-native task do_configure.sigdata doesn't exist in qemuarm
INFO: python-pyparsing-native task do_configure.sigdata doesn't exist in
qemuarm
ERROR: 2 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1565614951/signatures.qemuarm.do_configure.sigdata.log


 === Comparing signatures for task do_populate_sysroot.sigdata between
qemux86copy and qemuarm ===
INFO: acpica-native task do_populate_sysroot.sigdata doesn't exist in
qemuarm
ERROR: atmel-qt-demo-init different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
45357, PID: 32392
Hash for dependent task apps/atmel-qt-demo-init_1.1.bb:do_install changed
from bf630df2d8f96e57e4a4e004e857ec9675b19c281b4d4b647df7d086d52af563 to
7d595e3209a285f5c128f22d3c73d83f630243e3c2b15486c0fff47c9a034d50
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/meta-atmel/recipes-atmel/apps/atmel-qt-demo-init_1.1.bb:do_install
with hashes
bf630df2d8f96e57e4a4e004e857ec9675b19c281b4d4b647df7d086d52af563 or
7d595e3209a285f5c128f22d3c73d83f630243e3c2b15486c0fff47c9a034d50

INFO: binutils-cross-i686 task do_populate_sysroot.sigdata doesn't exist in
qemuarm
INFO: gcc-cross-i686 task do_populate_sysroot.sigdata doesn't exist in
qemuarm
INFO: gdb-cross-i686 task do_populate_sysroot.sigdata doesn't exist in
qemuarm
INFO: go-cross-core2-32 task do_populate_sysroot.sigdata doesn't exist in
qemuarm
ERROR: libcrypt-openssl-guess-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
40325, PID: 32403
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: libextutils-config-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
38927, PID: 32414
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: libextutils-helpers-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
42381, PID: 32425
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: libextutils-installpaths-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
33173, PID: 32436
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: libmodule-build-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
35863, PID: 32447
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: liburi-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
40087, PID: 32458
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: libxml-filter-buffertext-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
42667, PID: 32469
Hash for dependent task perl/libxml-sax-perl_1.02.bb:
do_populate_sysroot:virtual:native:/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-extended/perl/
libxml-sax-perl_1.02.bb changed from
53f8a47dcc87a348f4169f86ced3abb57db8016f46a2b204c7dfc613c5510064 to
cc580585df4a08188edcdf15c9b58e0fb6091f9114364984aaec65b6ed5fbd3c
Unable to find matching sigdata for
virtual:native:/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb:do_populate_sysroot
with hashes
53f8a47dcc87a348f4169f86ced3abb57db8016f46a2b204c7dfc613c5510064 or
cc580585df4a08188edcdf15c9b58e0fb6091f9114364984aaec65b6ed5fbd3c

ERROR: libxml-sax-base-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
37821, PID: 32480
Hash for dependent task perl/perl_5.30.0.bb:do_populate_sysroot changed
from af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 to
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/perl/perl_5.30.0.bb:do_populate_sysroot
with hashes
af26e532bbfda98de4f92cb71e1d20199a0c510b8bcd159dce462f568d962ca7 or
179f4fccadfc3355609bedcf470052d70e25323c1cbfc2e887bdf0669b06796f

ERROR: libxml-sax-perl-native different signature for task
do_populate_sysroot.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
45829, PID: 32491
Hash for dependent task perl/libxml-sax-base-perl_1.09.bb:
do_populate_sysroot:virtual:native:/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-extended/perl/
libxml-sax-base-perl_1.09.bb changed from
1190dc26bbf2f485296c691c8ed7498f5df195c2cf71b388cdc5c58c2902e99a to
914f23a20324ea36ed9e70323201fc8f670a992f54acfe5d8d7783dee6253de4
Unable to find matching sigdata for
virtual:native:/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb:do_populate_sysroot
with hashes
1190dc26bbf2f485296c691c8ed7498f5df195c2cf71b388cdc5c58c2902e99a or
914f23a20324ea36ed9e70323201fc8f670a992f54acfe5d8d7783dee6253de4

INFO: ovmf-native task do_populate_sysroot.sigdata doesn't exist in qemuarm
INFO: python-pyparsing-native task do_populate_sysroot.sigdata doesn't
exist in qemuarm
ERROR: 10 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1565614951/signatures.qemuarm.do_populate_sysroot.sigdata.log


 === Comparing signatures for task do_package_write_ipk.sigdata between
qemux86copy and qemuarm ===
ERROR: 96boards-tools different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
33165, PID: 32518
Hash for dependent task e2fsprogs/e2fsprogs_1.45.3.bb:do_packagedata
changed from
ff2bbda3d802c2f49dbaf9f46f7b2c2a512bb6be91d3992ef01c725c05de4595 to
1d2865b1b1d65d9ce05dff8d59acde6e74af04044f027a5f4010a82bad3aed74
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb:do_packagedata
with hashes
ff2bbda3d802c2f49dbaf9f46f7b2c2a512bb6be91d3992ef01c725c05de4595 or
1d2865b1b1d65d9ce05dff8d59acde6e74af04044f027a5f4010a82bad3aed74

ERROR: atmel-qt-demo-init different signature for task
do_package_write_ipk.sigdata between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
33831, PID: 32529
Hash for dependent task udev-at91/udev-rules-at91.bb:do_packagedata changed
from 854eb3b867ea03744272ff9d33ea2510bb0e9440ff34e77baa60825cd82a6bd6 to
3b0a21671cfce4107118723c398299e910c26af82073ca14bb468fbd3e084c3e
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/meta-atmel/recipes-core/udev-at91/udev-rules-at91.bb:do_packagedata
with hashes
854eb3b867ea03744272ff9d33ea2510bb0e9440ff34e77baa60825cd82a6bd6 or
3b0a21671cfce4107118723c398299e910c26af82073ca14bb468fbd3e084c3e

ERROR: phpmyadmin different signature for task do_package_write_ipk.sigdata
between qemux86copy and qemuarm
NOTE: Starting bitbake server...
NOTE: Started PRServer with DBfile:
/home/jenkins/oe/world/yoe/cache/prserv.sqlite3, IP: 127.0.0.1, PORT:
42149, PID: 32540
Hash for dependent task php/php_7.3.8.bb:do_packagedata changed from
4172c495593fb8ff181beac91594e1d178ac4cfae53f1e719c312705740bc849 to
11fea76db7353ef5c20b53d2703e45cd4361694bf8a592e6aeec5bebf43b0b5d
Unable to find matching sigdata for
/home/jenkins/oe/world/yoe/sources/meta-openembedded/meta-oe/recipes-devtools/php/php_7.3.8.bb:do_packagedata
with hashes
4172c495593fb8ff181beac91594e1d178ac4cfae53f1e719c312705740bc849 or
11fea76db7353ef5c20b53d2703e45cd4361694bf8a592e6aeec5bebf43b0b5d

ERROR: 3 errors found in
/home/jenkins/oe/world/yoe/build/tmpfs/sstate-diff/1565614951/signatures.qemuarm.do_package_write_ipk.sigdata.log
ERROR: 17 issues were found in these recipes: 96boards-tools
atmel-qt-demo-init libcrypt-openssl-guess-perl-native
libextutils-config-perl-native libextutils-helpers-perl-native
libextutils-installpaths-perl-native libmodule-build-perl-native
liburi-perl-native libxml-filter-buffertext-perl-native
libxml-sax-base-perl-native libxml-sax-perl-native phpmyadmin runit
xscreensaver

On Mon, Aug 12, 2019 at 6:44 AM Khem Raj <raj.khem@gmail.com> wrote:

> thx applied, lets see in next run
>
> On Sun, Aug 11, 2019 at 9:40 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > khem: see
> > https://github.com/kraj/jenkins-jobs/pull/1
> > which might fix the oe_world_workspace-compare-signatures jenkins job
> for you.
> >
> > On Sun, Jul 21, 2019 at 4:22 AM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>
> >> On 7/17/19 6:04 AM, Martin Jansa wrote:
> >> > This causes libdbi-perl-native to depend on target perl again, why
> did you
> >> > revert the fix from:
> >> >
> http://git.openembedded.org/meta-openembedded/commit/?id=eb868d056d15a56596cbf6ed3a4b66b054f2d563
> >> > ?
> >>
> >>
> >> I think we should reintroduce the above patch Martin, would you be
> >> interested to send patch ? we need to rejig the checksum match tests on
> >> jenkins so
> >>
> >> such oversight does not happen.
> >>
> >>
> >> >
> >> >   === Comparing signatures for task do_populate_sysroot.sigdata
> between
> >> > qemux86 and qemux86copy ===
> >> > ERROR: libdbi-perl-native different signature for task
> >> > do_populate_sysroot.sigdata between qemux86 and qemux86copy
> >> > NOTE: Starting bitbake server...
> >> > NOTE: Started PRServer with DBfile: build/cache/prserv.sqlite3, IP:
> >> > 127.0.0.1, PORT: 38307, PID: 13970
> >> > Hash for dependent task perl/perl_5.30.0.bb.do_populate_sysroot
> >> > changed from
> e3a38726fc849347a14b574ef52a59f5578632accbf70259a6ffd09fea54dc4e
> >> > to de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
> >> > Unable to find matching sigdata for
> >> > oe-core/meta/recipes-devtools/perl/perl_5.30.0.bb.do_populate_sysroot
> >> > with hash
> de2eb1fa749aab50f0e99c144a875bd50025fbb6299723f2e7ad28b49bbadf78
> >> >
> >> > ERROR: 1 errors found in
> >> >
> sstate-diff/1563367471/signatures.qemux86copy.do_populate_sysroot.sigdata.log
> >> >
> >> >
> >> >
> >> > On Fri, Jun 28, 2019 at 7:00 AM Tim Orling <
> timothy.t.orling@linux.intel.com>
> >> > wrote:
> >> >
> >> >> * Fix RDEPENDS, drop class-target (dependencies are the same for
> native)
> >> >> * Reorganize recipe to best practices
> >> >> * Add ptest dependencies
> >> >>
> >> >> Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
> >> >> ---
> >> >>   .../perl/libdbi-perl_1.642.bb                 | 38
> +++++++++++++++----
> >> >>   1 file changed, 31 insertions(+), 7 deletions(-)
> >> >>
> >> >> diff --git a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> >> b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> >> index ff4a9d0610..77991bd158 100644
> >> >> --- a/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> >> +++ b/meta-oe/recipes-devtools/perl/libdbi-perl_1.642.bb
> >> >> @@ -7,13 +7,6 @@ database interface independent of the actual
> database
> >> >> being used. \
> >> >>   HOMEPAGE = "http://search.cpan.org/dist/DBI/"
> >> >>   SECTION = "libs"
> >> >>   LICENSE = "Artistic-1.0 | GPL-1.0+"
> >> >> -RDEPENDS_${PN}_class-target = " \
> >> >> -    perl-module-carp \
> >> >> -    perl-module-exporter \
> >> >> -    perl-module-exporter-heavy \
> >> >> -    perl-module-dynaloader \
> >> >> -"
> >> >> -
> >> >>   LIC_FILES_CHKSUM =
> "file://LICENSE;md5=10982c7148e0a012c0fd80534522f5c5"
> >> >>
> >> >>   SRC_URI = "
> >> >> http://search.cpan.org/CPAN/authors/id/T/TI/TIMB/DBI-${PV}.tar.gz"
> >> >> @@ -34,4 +27,35 @@ do_install_prepend() {
> >> >>          rm -rf ${B}/t/z*.t
> >> >>   }
> >> >>
> >> >> +RDEPENDS_${PN} = " \
> >> >> +    perl-module-carp \
> >> >> +    perl-module-exporter \
> >> >> +    perl-module-exporter-heavy \
> >> >> +    perl-module-dynaloader \
> >> >> +    perl-module-io-dir \
> >> >> +    perl-module-scalar-util \
> >> >> +    perl-module-universal \
> >> >> +"
> >> >> +
> >> >> +RDEPENDS_${PN}-ptest = " \
> >> >> +    ${PN} \
> >> >> +    perl-module-b \
> >> >> +    perl-module-benchmark \
> >> >> +    perl-module-cwd \
> >> >> +    perl-module-data-dumper \
> >> >> +    perl-module-encode \
> >> >> +    perl-module-encode-byte \
> >> >> +    perl-module-encode-encoding \
> >> >> +    perl-module-file-copy \
> >> >> +    perl-module-file-path \
> >> >> +    perl-module-lib \
> >> >> +    perl-module-perlio \
> >> >> +    perl-module-perlio-scalar \
> >> >> +    perl-module-perlio-via \
> >> >> +    perl-module-sdbm-file \
> >> >> +    perl-module-storable \
> >> >> +    perl-module-test-more \
> >> >> +    perl-module-utf8 \
> >> >> +    "
> >> >> +
> >> >>   BBCLASSEXTEND = "native"
> >> >> --
> >> >> 2.20.1
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >>
>

