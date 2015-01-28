Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8340F60017
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 12:13:46 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id hy4so6591268vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 04:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fzQb8xqCqdIofcgEpT8foC7jxCI7L3uEXdprBkeb69Q=;
	b=qk7nQ82CAbOYQFS32J6ku2aYvvmrFyKm0Uwz+juhaskLIPFeAKKwRXL4eudNz58bzx
	ywqs6F5mAuegGE3tE6dDee2P8YUGD/eoR61pTYXjD9rdo9QlDt+iMPSa0OLmBYn8Rg66
	jvKd5+Ew9HlACyLQrZuZSdXzFGHfdaDct1udUEt34n4VNThwm6dKifU3/Bknl7WClM3+
	d7JPrBXwEJUbWxakbSegQJF4ARR4fSebBNb9/Oh7u9BOX3K+0lP+evAJf4HcsEz+V+Pu
	/yyuBc8njBRbEVTE9YmvQrTrytpJqk4LmLHp0yiy4ONxUv//FRXWO44MXEgjvQri9GTu
	/ARQ==
MIME-Version: 1.0
X-Received: by 10.52.94.76 with SMTP id da12mr1325190vdb.6.1422447227354; Wed,
	28 Jan 2015 04:13:47 -0800 (PST)
Received: by 10.52.183.37 with HTTP; Wed, 28 Jan 2015 04:13:47 -0800 (PST)
In-Reply-To: <20150128105148.GE2477@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<20150128105148.GE2477@jama>
Date: Wed, 28 Jan 2015 13:13:47 +0100
Message-ID: <CALbNGRRMX6r7Tvnp4eN0Kh3JW1K2gGb59=RsMSJ7-bqrXzRvBw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 0/5] qt-creator for target machine
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
X-List-Received-Date: Wed, 28 Jan 2015 12:13:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2015 at 11:51 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Jan 27, 2015 at 06:53:48AM +0100, Andreas M=C3=BCller wrote:
>> These patches were build tested for 5.4.0 with all qt5 recipes I am work=
ing on
>> currently (kf5/hawaii/mauii). Git versions were not yet tested.
>> On target:
>>
>> * toolchain was set
>> * QT5 c++ project was build and debugged
>>
>> We shall see what Martin's world says - maybe we need a EXCLUDE_FROM_WOR=
LD for
>> meta-oe's qt-creator (conditional on meta-qt5 included in layer).
>
> One of these is causing qtbase_git build failure:
>
> | generators/win32/cesdkhandler.cpp:96: error: undefined reference to 'QD=
ebug::~QDebug()'
> | ../src/corelib/io/qdir.cpp:2330: error: undefined reference to 'QDebug:=
:~QDebug()'
> | ../src/corelib/io/qdir.cpp:2330: error: undefined reference to 'QDebug:=
:~QDebug()'
> | ../src/corelib/io/qdir.cpp:2328: error: undefined reference to 'QDebug:=
:~QDebug()'
> | collect2: error: ld returned 1 exit status
> | make: *** [bin/qmake] Error 1
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/qtbase/5.4.0+gi=
tAUTOINC+47326b9c5c-r0/temp/log.do_compile.23226)
>
>> Andreas M=C3=BCller (5):
>>   qtbase: remove patches required for native(-sdk) only
>>   qtbase/EXTERNAL_HOST_BINS: split out code only required for
>>     native-(sdk)
>>   qtbase: build qmake for target with paths aligned
>>   qt5-creator: add 3.3.0 of qt-creator
>>   add gdb append to enable python packageconfig
>>
>>  recipes-devtools/gdb/gdb_%.bbappend                |   1 +
>>  recipes-qt/qt5/nativesdk-qtbase.inc                |   1 +
>>  recipes-qt/qt5/nativesdk-qtbase_git.bb             |   1 +
>>  ...t-creator-to-build-on-arm-aarch32-and-aar.patch |  94 ++++++++++++++=
++++
>>  recipes-qt/qt5/qt5-creator/qtcreator.desktop.in    |  10 ++
>>  recipes-qt/qt5/qt5-creator_3.3.0.bb                |  87 ++++++++++++++=
+++
>>  recipes-qt/qt5/qtbase-native.inc                   |   1 +
>>  recipes-qt/qt5/qtbase.inc                          |  27 +++---
>>  .../0003-Add-external-hostbindir-option.patch      |  75 --------------=
-
>>  ...-build-it-in-configure-but-allow-to-build.patch |  27 ++++--
>>  ...014-Add-external-hostbindir-option-native.patch | 106 ++++++++++++++=
+++++++
>>  .../0015-Set-paths-for-target-properly.patch       |  72 ++++++++++++++
>>  recipes-qt/qt5/qtbase_git.bb                       |   3 +-
>>  13 files changed, 407 insertions(+), 98 deletions(-)
>>  create mode 100644 recipes-devtools/gdb/gdb_%.bbappend
>>  create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator=
-to-build-on-arm-aarch32-and-aar.patch
>>  create mode 100644 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
>>  create mode 100644 recipes-qt/qt5/qt5-creator_3.3.0.bb
>>  create mode 100644 recipes-qt/qt5/qtbase/0014-Add-external-hostbindir-o=
ption-native.patch
>>  create mode 100644 recipes-qt/qt5/qtbase/0015-Set-paths-for-target-prop=
erly.patch
>>
>> --
>> 1.8.3.1
>>
>> --
OK - so I need to take care for git part. I should learn not to expect
good of untested code...

Andreas

