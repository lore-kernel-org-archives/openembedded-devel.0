Return-Path: <matt.hoosier@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id D6556782EA
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Aug 2017 20:12:33 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id 80so19341599uas.0
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Aug 2017 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=nihlU6WVXolqh8UOwUlEC3aqpw/T/tuZovhLIGBHQJU=;
	b=mNdTd0B+V3zjrp/jo2VCbf8jKAU8dHdfauF0lUYDmjG3MxEswnBlC2WJ3zDuc+VdLy
	6xtUR0rZk1qyCZ4E4TJEzCdDU0w2kthZzpovUVGZaIj8q4PZt+9ep9aVLgeCmyXegjmY
	qFurrNZc5tiRmiif8fbkkiWSSEN3o2q7paYF9yY+ODT+6VVhKgfmhs/5Rvm6H7yM6tb5
	KXmMS71j0tE2C90FUvW0myzvozVi3HDZ5kYZ5gzOtI71elYJUcdBpAOIAJx4Z8JNisDd
	+Q7Uw/qFWv+H/Tynl/ZO1qLARn3vWGelZZH4RkKa5MW83raOAKsr82vdZ2DfO+5JV7M0
	rwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nihlU6WVXolqh8UOwUlEC3aqpw/T/tuZovhLIGBHQJU=;
	b=isLULRDB80jK+5dpF+MD7FbDDaxLjpElJgKCEwj4ImTTF/2C9CKWO8xZnz5vvWGoGy
	uCeIJEjDRM8wc/cIWFkZrrZsHWN43jyrj9p1CLq7WV1nJXgeMe1ivRy3BpC94vxBBKYt
	VnznkmXTWiZhbXkcUxI51KiUYoNw57M9+6NLTHepizZE2kSxKOJEuOoukqeUYEtusDAa
	GpS3jPqplUNT3Astdc9wF/IN6VKI0v9R++wW8vMlBJ6jiO3CcpvBgJyz0gFB83i7JJve
	+Kw2C7UfKzpC2pIq1rICrsPJmrGAClW2rkPFJcqgpXb6Hf5IrNskuFffVhpuYRy+YuDG
	E7xA==
X-Gm-Message-State: AHYfb5in1UQgStBIJIwqWYShgTq2mU/xUI5Pz2zIYah/SJ5ig8KDCihf
	/16EBemYHMh3eFJFEUvULpLnwDi3+9/RNWk=
X-Received: by 10.159.53.36 with SMTP id o33mr12849328uao.95.1502482354663;
	Fri, 11 Aug 2017 13:12:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.70.88 with HTTP; Fri, 11 Aug 2017 13:11:54 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Fri, 11 Aug 2017 15:11:54 -0500
Message-ID: <CAJgxT38uSRVXyYaMPPTE_pnDU94txQ9_Gp4nvkv3FLQHE1ABLw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Minimum required Yocto version for 5.9 branch?
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
X-List-Received-Date: Fri, 11 Aug 2017 20:12:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I observe that qtbase-native from jansa/master-5.9 fails on releases
versions of Yocto prior to 2.2 with a message like:

| +
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/work/x86_64-linux/qtbase-native/5.9.1+gitAUTOINC+160533328c-r0/build/bin/qmake
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/work/x86_64-linux/qtbase-native/5.9.1+gitAUTOINC+160533328c-r0/git
> -- -opensource -confirm-license -sysroot
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux
> -no-gcc-sysroot -system-zlib -no-libjpeg -no-libpng -no-gif
> -no-accessibility -no-cups -no-gui -no-qml-debug -no-sql-mysql
> -no-sql-sqlite -no-opengl -no-openssl -no-xcb -no-icu -verbose -release
> -prefix
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
> -hostprefix
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
> -bindir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/qt5
> -hostbindir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/qt5
> -libdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib
> -hostlibdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib
> -headerdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/include/qt5
> -archdatadir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/qt5
> -datadir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/qt5
> -hostdatadir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/qt5
> -docdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/doc/qt5
> -sysconfdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/etc/qt5
> -no-glib -no-iconv -silent -nomake examples -nomake tests -no-rpath
> -platform linux-oe-g++
> | Command line: -opensource -confirm-license -sysroot
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux
> -no-gcc-sysroot -system-zlib -no-libjpeg -no-libpng -no-gif
> -no-accessibility -no-cups -no-gui -no-qml-debug -no-sql-mysql
> -no-sql-sqlite -no-opengl -no-openssl -no-xcb -no-icu -verbose -release
> -prefix
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
> -hostprefix
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
> -bindir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/qt5
> -hostbindir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/qt5
> -libdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib
> -hostlibdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib
> -headerdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/include/qt5
> -archdatadir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/qt5
> -datadir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/qt5
> -hostdatadir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/qt5
> -docdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/doc/qt5
> -sysconfdir
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/etc/qt5
> -no-glib -no-iconv -silent -nomake examples -nomake tests -no-rpath
> -platform linux-oe-g++
> | Cannot read
> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib/qt5/mkspecs/linux-oe-g++/qmake.conf:
> No such file or directory


Does anybody know what might be going on with this error?

