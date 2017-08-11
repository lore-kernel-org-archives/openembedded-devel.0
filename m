Return-Path: <matt.hoosier@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2814878551
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Aug 2017 22:17:23 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id k43so20214723uaf.3
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Aug 2017 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=2D+15D8oxhuPSlMiAqw3dO0iIs7diRWn36b86/XQAtU=;
	b=UAyvdyCGfc8552nUmo2sIIAdCZYEhQx25BUxqlXodfpWtHWDQfi5Y3skVBUKobn+mx
	CUU3ppjNRI7V1Go+29HkzjW0Q6/Bl7UY6I93h0IdsxzO8AN2iIxgaBfmfOqgDGZi+Pro
	dkvK6uSLsFS9yF8F9BQh7r+Nn7xcCTJqN7S3P1jm6rLXVrCbV4AB1Arh8wUrWvuVgRDJ
	Fxd0wFQq73PlBDi6BMnOoBYplRSPbd47KaHBcrMSZRmMqeWj2e+7wtZRaJDVojMt/3w/
	M9vGtKv8gzTIcHjJFw/nGTRhNWwsoAzoSp33lmI7QLgL4Y2Z1tyIbqltkvj1wJdZKBYf
	NDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=2D+15D8oxhuPSlMiAqw3dO0iIs7diRWn36b86/XQAtU=;
	b=D05Kxz93Q5hQ3FhVgxn6o6/GlR4Qhug70K3gxorEmzfZY3kVOdxvRMXbw2Gi/+x2su
	B0ayjpN/t++MHYwbfL7jGaLGswWmwePEPRsQkNgiCArxoPxuA6mzeSqXeBDjwo9PwDC+
	Z3fijl9pDlGMg1VkdqxdvFN5uUG/nUM+SgCRbmQd2yOMKeapV1zUbxJ7PZrNqi7nh5qc
	JGhCtLyQyF1b9tb2RK6PcyS6h42qY2by4d3MekIWLIlx7IHILs/ceKR6ow9HVYps8u/Q
	3OExe9e+F2khE0fPpMxFeBJsZ2tXdLJnYfnvsKvIZgg3AqBoikAFYDQyE9S4mrDeLZvd
	EzSQ==
X-Gm-Message-State: AHYfb5iLg73fENJGbB+Kr9fDJscEXGdEdBCTpyTavK/vKBfGzhgcmyAF
	4jqLx1Q38lu1b/5otKPUbMcMSmoGUkkSRGU=
X-Received: by 10.176.2.68 with SMTP id 62mr11972920uas.202.1502489844645;
	Fri, 11 Aug 2017 15:17:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.70.88 with HTTP; Fri, 11 Aug 2017 15:16:44 -0700 (PDT)
In-Reply-To: <CAJgxT38uSRVXyYaMPPTE_pnDU94txQ9_Gp4nvkv3FLQHE1ABLw@mail.gmail.com>
References: <CAJgxT38uSRVXyYaMPPTE_pnDU94txQ9_Gp4nvkv3FLQHE1ABLw@mail.gmail.com>
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Fri, 11 Aug 2017 17:16:44 -0500
Message-ID: <CAJgxT3-uULn7v7QO+i26Y-15jpt2CXsy8LXU5B_VGSo+snbGJw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Minimum required Yocto version for 5.9 branch?
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
X-List-Received-Date: Fri, 11 Aug 2017 22:17:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 11, 2017 at 3:11 PM, Matt Hoosier <matt.hoosier@gmail.com>
wrote:

> Hi,
>
> I observe that qtbase-native from jansa/master-5.9 fails on releases
> versions of Yocto prior to 2.2 with a message like:
>
> | + /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/work/x86_64-linux/qtbase-native/5.9.1+gitAUTOINC+160533328c-r0/build/bin/qmake
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/work/x86_64-linux/qtbase-native/5.9.1+gitAUTOINC+160533328c-r0/git
>> -- -opensource -confirm-license -sysroot /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux -no-gcc-sysroot
>> -system-zlib -no-libjpeg -no-libpng -no-gif -no-accessibility -no-cups
>> -no-gui -no-qml-debug -no-sql-mysql -no-sql-sqlite -no-opengl -no-openssl
>> -no-xcb -no-icu -verbose -release -prefix /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr -hostprefix
>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
>> -bindir /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/bin/qt5 -hostbindir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/qt5 -libdir
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib -hostlibdir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib -headerdir
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/include/qt5 -archdatadir
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib/qt5 -datadir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/qt5
>> -hostdatadir /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib/qt5 -docdir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/doc/qt5
>> -sysconfdir /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/etc/qt5 -no-glib -no-iconv -silent -nomake
>> examples -nomake tests -no-rpath -platform linux-oe-g++
>> | Command line: -opensource -confirm-license -sysroot
>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux
>> -no-gcc-sysroot -system-zlib -no-libjpeg -no-libpng -no-gif
>> -no-accessibility -no-cups -no-gui -no-qml-debug -no-sql-mysql
>> -no-sql-sqlite -no-opengl -no-openssl -no-xcb -no-icu -verbose -release
>> -prefix /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
>> -hostprefix /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr
>> -bindir /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/bin/qt5 -hostbindir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/bin/qt5 -libdir
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib -hostlibdir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib -headerdir
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/include/qt5 -archdatadir
>> /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib/qt5 -datadir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/qt5
>> -hostdatadir /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib/qt5 -docdir /home/hoosier/projects/
>> consumer/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/doc/qt5
>> -sysconfdir /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/etc/qt5 -no-glib -no-iconv -silent -nomake
>> examples -nomake tests -no-rpath -platform linux-oe-g++
>> | Cannot read /home/hoosier/projects/consumer/tools/yocto/build/
>> tmp/sysroots/x86_64-linux/usr/lib/qt5/mkspecs/linux-oe-g++/qmake.conf:
>> No such file or directory
>
>
> Does anybody know what might be going on with this error?
>
>

After a bit of digging, I find that the following commit in poky is the one
that's required to let the 5.9 branch of meta-qt5 build correctly with
Yocto <= 2.1:

Author: Ross Burton <ross.burton@intel.com>  2016-07-14 13:56:22
> Committer: Richard Purdie <richard.purdie@linuxfoundation.org>
>  2016-07-19 02:56:50
> Parent: faa726824dfb5bc0141919bb16c0d0069a3da69e (bitbake:
> lib/bb/build.py: decode the command as UTF-8)
> Branches: remotes/origin/morty, remotes/origin/pyro
> Follows: 2.2_M1
> Precedes: 2.2_M2
>     bitbake: build: don't use $B as the default cwd for functions
>
>     When bitbake executes a shell or Python function it can cd/chdir()
> into a
>     directory before executing the task. If no directory is specified then
> the
>     default of $B is used.  However $B is an OpenEmbedded variable and
> BitBake
>     shouldn't be aware of it.
>
>     To solve this change the semantics slightly so that if no directory is
>     specified, the current working directory isn't changed.  There's also
> a sanity
>     check that emits a warning if a Python task does os.chdir() without
> restoring
>     the old path, and the previous working directory is restored.
>
>     This does change semantics: whereas before a function in OE would have
> $B as the
>     working directory unless specified, now the working directory is the
> top of the
>     build tree.  Any breakage this causes can be solved by either adding
>     do_some_task[dirs] = "${B}" or by using absolute paths in the task.

