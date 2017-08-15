Return-Path: <matt.hoosier@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1BDE378492
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Aug 2017 13:02:31 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id d124so2289082vkf.2
	for <openembedded-devel@openembedded.org>;
	Tue, 15 Aug 2017 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=679Sa6XV0EFdrJzYE9aqz9Ig+Bc0jbsdzsm+5mOLUTk=;
	b=id5VBb8YGy2bx9A0aCN+3oFvqZZENbocNSIvkuL6LIVIoY5Q596h5ZpzFfVFl4PEcm
	sH8fdRa+q/rwgp2Q0+PggjrypxBkYmsgaOpHcEKZCJ15PUp8ritcwRMuKsCGjsFhrrGb
	sCRAF4QZMbX5625gw5dZPuMOLBEjjIgAk0h5Hq1hSQ+FA76maH6e4jXOOf2GfoMo8Ihw
	E4bRQqgXD1Xlsh5qs9htgz+2UFMRFQE/821hDj/+PoQmy1Zk1L2iM2HUND34TbHtbEuV
	e+Ia6wGRj6QiUUA1eIaQkxGC8Kz0x1EKdWGDpcVgKQJT/XOtC02oe7NXvzzrKUHeuqV9
	1giQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=679Sa6XV0EFdrJzYE9aqz9Ig+Bc0jbsdzsm+5mOLUTk=;
	b=avL/kIfhS1+IPWRFxN6Qk4RgTniZ9Lrz6Qau7zoUz6Y23gTIzawG4xX2L6tZJpAaja
	3VmsouwbhYQwVTIPQTwzZ3YTUM98j1XqUv/pjNsfFhDjw5GkEC71pdDcuky5GMB40HdE
	8MVojdFJcxGaU3fp9uzxPHgzv/obTaJ3lM8eCeTWyKx2cr21mw0tdOoKVWH53riI1CWK
	zVGyRsqeGJe9NIwynJUXDqYQ2qdhUl5AQA39qeIbus2MI6wVQGGexGkl4u1YkSEwSdVM
	L6PaIBJ5aYbO673p9yHC31+wsx4qY7VwXNla17UYjwBiCS73ee0Za42wFKxc9lTwZWU6
	2Blw==
X-Gm-Message-State: AHYfb5he0JTS1MbGeb5Q7TS/WKuckcDrpz5MMIAtaiyGEf6w3cPvRWuA
	fOcAV3o0RWu522FJ8lNqriI3peHyaBl6MWE=
X-Received: by 10.31.225.133 with SMTP id y127mr15645071vkg.162.1502802152596; 
	Tue, 15 Aug 2017 06:02:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.1.213 with HTTP; Tue, 15 Aug 2017 06:01:52 -0700 (PDT)
In-Reply-To: <CAJgxT3-uULn7v7QO+i26Y-15jpt2CXsy8LXU5B_VGSo+snbGJw@mail.gmail.com>
References: <CAJgxT38uSRVXyYaMPPTE_pnDU94txQ9_Gp4nvkv3FLQHE1ABLw@mail.gmail.com>
	<CAJgxT3-uULn7v7QO+i26Y-15jpt2CXsy8LXU5B_VGSo+snbGJw@mail.gmail.com>
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Tue, 15 Aug 2017 08:01:52 -0500
Message-ID: <CAJgxT3-Fwi2KJsMezWfvnvDD7WnkK6HzH7FEegfSrzezR5cugw@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Aug 2017 13:02:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is addressed with pull request #62:

From: Matt Hoosier <matt.hoosier@garmin.com>
>
> Date: Mon, 14 Aug 2017 08:04:03 -0500
>
> Subject: [PATCH 1/2] qtbase: fix Krogoth build regression from efa8aaf
>
>
>> With
>
>
>>     commit efa8aaf82e580a7d32eaaab48eb92d436f2e222a
>
>     Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>
>     Date:   Thu Feb  9 00:26:09 2017
>
>
>>     qmake5_base.bbclass: set qt.conf by environment variable again
>
>
>> we stopped pointing ${OE_QMAKE_QTCONF_PATH} at a valid file and
>
> instead directed it to a path which was intended not to exist.
>
>
>> The motivation was to permit qtbase/qtbase-native/nativesdk-qtbase
>
> to build again after Qt 5.8 started paying attention to the
>
> contents of this file.
>
>
>> The change as done in efa8aaf works well enough for Morty and
>
> subsequent releases' copies of Bitbake, but fails on earlier
>
> releases because they lack the following change:
>
>
>>     commit 2afcbfef2cd1ca568e5225884a8021df38ee3db0
>
>     Author: Ross Burton <ross.burton@intel.com>
>
>     Date: 2016-07-14 13:56:22
>
>
>>     bitbake: build: don't use $B as the default cwd for functions
>
>
>> The result is that when we build with Krogoth or prior, the body
>
> of do_generate_qt_config_file() runs with a cwd of ${B}, which was
>
> _not_ the intent of efa8aaf. Because the working directory is ${B},
>
> ${OE_QMAKE_QTCONF_PATH} is written in there too. do_configure() --
>
> whose cwd is by design also ${B} -- then finds the file 'foodummy',
>
> and the build breaks for the reasons outlined in efa8aaf.
>
>
>> This change simply shifts the implementation tactics to suppress
>
> the creation of ${OE_QMAKE_QTCONF_PATH} during qtbase rather than rely
>
> on unspecified behavior about the cwd of do_generate_qt_config_file().
>
>
>
This is a backport from the Qt fork of meta-qt5.

On Fri, Aug 11, 2017 at 5:16 PM, Matt Hoosier <matt.hoosier@gmail.com>
wrote:

> On Fri, Aug 11, 2017 at 3:11 PM, Matt Hoosier <matt.hoosier@gmail.com>
> wrote:
>
>> Hi,
>>
>> I observe that qtbase-native from jansa/master-5.9 fails on releases
>> versions of Yocto prior to 2.2 with a message like:
>>
>> | + /home/hoosier/projects/consumer/tools/yocto/build/tmp/work/
>>> x86_64-linux/qtbase-native/5.9.1+gitAUTOINC+160533328c-r0/build/bin/qma=
ke
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/work/
>>> x86_64-linux/qtbase-native/5.9.1+gitAUTOINC+160533328c-r0/git --
>>> -opensource -confirm-license -sysroot /home/hoosier/projects/consume
>>> r/tools/yocto/build/tmp/sysroots/x86_64-linux -no-gcc-sysroot
>>> -system-zlib -no-libjpeg -no-libpng -no-gif -no-accessibility -no-cups
>>> -no-gui -no-qml-debug -no-sql-mysql -no-sql-sqlite -no-opengl -no-opens=
sl
>>> -no-xcb -no-icu -verbose -release -prefix /home/hoosier/projects/consum=
e
>>> r/tools/yocto/build/tmp/sysroots/x86_64-linux/usr -hostprefix
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-l=
inux/usr
>>> -bindir /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/bin/qt5 -hostbindir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/bin/qt5 -libdir /home/hoosier/projects/consum=
e
>>> r/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib -hostlibdir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-l=
inux/usr/lib
>>> -headerdir /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/include/qt5 -archdatadir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/lib/qt5 -datadir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/share/qt5 -hostdatadir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/lib/qt5 -docdir /home/hoosier/projects/consum=
e
>>> r/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/doc/qt5
>>> -sysconfdir /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysro=
ots/x86_64-linux/etc/qt5
>>> -no-glib -no-iconv -silent -nomake examples -nomake tests -no-rpath
>>> -platform linux-oe-g++
>>> | Command line: -opensource -confirm-license -sysroot
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-l=
inux
>>> -no-gcc-sysroot -system-zlib -no-libjpeg -no-libpng -no-gif
>>> -no-accessibility -no-cups -no-gui -no-qml-debug -no-sql-mysql
>>> -no-sql-sqlite -no-opengl -no-openssl -no-xcb -no-icu -verbose -release
>>> -prefix /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/=
x86_64-linux/usr
>>> -hostprefix /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysro=
ots/x86_64-linux/usr
>>> -bindir /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/bin/qt5 -hostbindir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/bin/qt5 -libdir /home/hoosier/projects/consum=
e
>>> r/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/lib -hostlibdir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysroots/x86_64-l=
inux/usr/lib
>>> -headerdir /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/include/qt5 -archdatadir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/lib/qt5 -datadir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/share/qt5 -hostdatadir
>>> /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/lib/qt5 -docdir /home/hoosier/projects/consum=
e
>>> r/tools/yocto/build/tmp/sysroots/x86_64-linux/usr/share/doc/qt5
>>> -sysconfdir /home/hoosier/projects/consumer/tools/yocto/build/tmp/sysro=
ots/x86_64-linux/etc/qt5
>>> -no-glib -no-iconv -silent -nomake examples -nomake tests -no-rpath
>>> -platform linux-oe-g++
>>> | Cannot read /home/hoosier/projects/consumer/tools/yocto/build/tmp/
>>> sysroots/x86_64-linux/usr/lib/qt5/mkspecs/linux-oe-g++/qmake.conf: No
>>> such file or directory
>>
>>
>> Does anybody know what might be going on with this error?
>>
>>
>
> After a bit of digging, I find that the following commit in poky is the
> one that's required to let the 5.9 branch of meta-qt5 build correctly wit=
h
> Yocto <=3D 2.1:
>
> Author: Ross Burton <ross.burton@intel.com>  2016-07-14 13:56:22
>> Committer: Richard Purdie <richard.purdie@linuxfoundation.org>
>>  2016-07-19 02:56:50
>> Parent: faa726824dfb5bc0141919bb16c0d0069a3da69e (bitbake:
>> lib/bb/build.py: decode the command as UTF-8)
>> Branches: remotes/origin/morty, remotes/origin/pyro
>> Follows: 2.2_M1
>> Precedes: 2.2_M2
>>     bitbake: build: don't use $B as the default cwd for functions
>>
>>     When bitbake executes a shell or Python function it can cd/chdir()
>> into a
>>     directory before executing the task. If no directory is specified
>> then the
>>     default of $B is used.  However $B is an OpenEmbedded variable and
>> BitBake
>>     shouldn't be aware of it.
>>
>>     To solve this change the semantics slightly so that if no directory =
is
>>     specified, the current working directory isn't changed.  There's als=
o
>> a sanity
>>     check that emits a warning if a Python task does os.chdir() without
>> restoring
>>     the old path, and the previous working directory is restored.
>>
>>     This does change semantics: whereas before a function in OE would
>> have $B as the
>>     working directory unless specified, now the working directory is the
>> top of the
>>     build tree.  Any breakage this causes can be solved by either adding
>>     do_some_task[dirs] =3D "${B}" or by using absolute paths in the task=
.
>
>

