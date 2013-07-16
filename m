Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1D86B1FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 10:44:37 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id gd11so337598vcb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2013 03:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=nia7DN6CinhG2m5js/Fl3VZ3X4GxAUdEDScLeHoEMqA=;
	b=aXyOf6fPbNDG/msdP/alCeb0Q6D2CMGC9Tp1a72Zb8k+BYoVJVAT5u5t00cVlj5uUm
	bx8tNROCQYKeAQe657pUF/ySR+MGC8wLw0SDxVTXKgvFcGP2PMBYWK/zcB1bMwzhuXc2
	6rrxelQEOfxKgbOMM6zONJlB4JoViglExoBFCi9KYVc4BfzacHGjK16flibNuxz37ul5
	BCCIiKEhn38RhNr10+6zDyozf+UEzYmycvU5u4t4TWAdYG2TAEfOB3CuwzREh2nUPfXK
	HyCDy6BnAaubnpFttU1uHsdaNiy/14l2W86sX8326VeSERjZZgLa6WFeSsJDXtkVOHOh
	ZSYA==
MIME-Version: 1.0
X-Received: by 10.58.233.173 with SMTP id tx13mr266174vec.31.1373971478018;
	Tue, 16 Jul 2013 03:44:38 -0700 (PDT)
Received: by 10.52.236.136 with HTTP; Tue, 16 Jul 2013 03:44:37 -0700 (PDT)
In-Reply-To: <51E3F30A.2070205@gmail.com>
References: <20130708083024.252B2502D7@opal>
	<CALbNGRT+FYkwWQzvaSUo0zarUx7MyNEJWjWs17M0cP2z6iYgBw@mail.gmail.com>
	<51E3F30A.2070205@gmail.com>
Date: Tue, 16 Jul 2013 12:44:37 +0200
Message-ID: <CALbNGRRzaPZUO1CyvJ1KMDjRcRHVeyNcp+51reqjLh8OsJCsSg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Jonathan Liu : qt-creator: add new recipe for version 2.7.2
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
X-List-Received-Date: Tue, 16 Jul 2013 10:44:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2013 at 3:03 PM, Jonathan Liu <net147@gmail.com> wrote:
> On 15/07/2013 7:03 PM, Andreas M=C3=BCller wrote:
>>
>> On Mon, Jul 8, 2013 at 10:30 AM,  <git@git.openembedded.org> wrote:
>>>
>>> Module: meta-openembedded.git
>>> Branch: master
>>> Commit: 4d2b8ed90614a21d8d7d7c38d013c0c74d9ffffc
>>> URL:
>>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D4=
d2b8ed90614a21d8d7d7c38d013c0c74d9ffffc
>>>
>>> Author: Jonathan Liu <net147@gmail.com>
>>> Date:   Sat Jul  6 02:46:58 2013 +0000
>>>
>>> qt-creator: add new recipe for version 2.7.2
>>>
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>
>>> ---
>>>
>>>   meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb |   30
>>> +++++++++++++++++++++
>>>   1 files changed, 30 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
>>> b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
>>> new file mode 100644
>>> index 0000000..2948d81
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.7.2.bb
>>> @@ -0,0 +1,30 @@
>>> +DESCRIPTION =3D "Lightweight, cross-platform integrated development
>>> environment"
>>> +
>>> +HOMEPAGE =3D "http://qt-project.org/"
>>> +LICENSE =3D "LGPLv2.1"
>>> +LIC_FILES_CHKSUM =3D
>>> "file://LGPL_EXCEPTION.TXT;md5=3Deb6c371255e1262c55ae9b652a90b528 \
>>> +
>>> file://LICENSE.LGPL;md5=3D243b725d71bb5df4a1e5920b344b86ad"
>>> +SECTION =3D "qt/app"
>>> +
>>> +SRC_URI =3D
>>> "http://download.qt-project.org/official_releases/qtcreator/2.7/${PV}/$=
{BP}-src.tar.gz"
>>> +SRC_URI[md5sum] =3D "7f1c10740784d3edf2347c27be21fd1a"
>>> +SRC_URI[sha256sum] =3D
>>> "5df913faa43a5fbf44fb1f25faaf6d258134b8f9e6b8ef8a21277136dec9e189"
>>> +
>>> +S =3D "${WORKDIR}/${BP}-src"
>>> +
>>> +inherit qt4x11
>>> +
>>> +do_install() {
>>> +       oe_runmake INSTALL_ROOT=3D${D}${prefix} install
>>> +       oe_runmake INSTALL_ROOT=3D${D}${prefix} install_docs
>>> +       rm -f ${D}${libdir}/qtcreator/lib*.so
>>> +}
>>> +
>>> +FILES_${PN} +=3D "${datadir}/icons \
>>> +                ${datadir}/qtcreator \
>>> +                ${libdir}/qtcreator/*"
>>> +FILES_${PN}-dbg +=3D "${datadir}/qtcreator/*/*/*/*/.debug \
>>> +                    ${libdir}/qtcreator/.debug \
>>> +                    ${libdir}/qtcreator/*/*/.debug"
>>> +RRECOMMENDS_${PN} +=3D "packagegroup-core-buildessential \
>>> +                      packagegroup-qt-toolchain-target"
>>>
>> I get
>>
>> Log data follows:
>> | DEBUG: Executing python function sysroot_cleansstate
>> | DEBUG: Python function sysroot_cleansstate finished
>> | DEBUG: Executing shell function do_configure
>> | NOTE: using qmake spec in
>>
>> /home/andreas/tmp/oe-core-eglibc/sysroots/overo/usr/share/qt4/mkspecs/li=
nux-gnueabi-oe-g++,
>> using profiles ''
>> | Project MESSAGE: Cannot build Qt Creator with Qt version .
>> | Project ERROR: Use at least Qt 4.8.0.
>> | ERROR: Error calling
>> /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/qmake2
>> on qtcreator.pro
>> | ERROR: Function failed: do_configure (see
>>
>> /home/andreas/tmp/oe-core-eglibc/work/cortexa8hf-vfp-neon-angstrom-linux=
-gnueabi/qt-creator/2.7.2-r0/temp/log.do_configure.29576
>> for further information)
>>
>> Is it possible that iti is caused by checking host's qt version (this is
>> 4.7.4)?
>>
>> Andreas
>
> Are you using the latest openembedded-core master? These have been many
> fixes for Qt.
> For example:
> http://cgit.openembedded.org/openembedded-core/commit/?id=3Ddcaa40e65d986=
587fa7c44f4285bbd0883478cc3
>
> Regards,
> Jonathan
Thanks for the helping hint. You are right I am not using latest
oe-core. After cherry-picking qt-related patches (especially the one
you mentioned) configure passes.

But now I fail for known ARM issue [1]

-I.moc/release-shared -I.uic -o .obj/release-shared/botan.o
../3rdparty/botan/botan.cpp
| ../3rdparty/botan/botan.cpp:46220:21: fatal error: cpuid.h: No such
file or directory
|    #include <cpuid.h>
|                      ^
| compilation terminated.
| make[3]: *** [.obj/release-shared/botan.o] Error 1

Have not found a solution yet. FWIW qt-creator 2.8.0 fails same.

Andreas

[1] https://bugreports.qt-project.org/browse/QTCREATORBUG-8107

