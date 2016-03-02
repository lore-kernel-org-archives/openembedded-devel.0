Return-Path: <net147@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1472F762AD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Mar 2016 03:36:50 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so62233631wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Mar 2016 19:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=rVm02tPEGXxkGKlYL/d+oZxOkyPyu0KGxKiYFUKdSxQ=;
	b=sfxStCVNmcsqC76MIyeJJH2M47miebDpIqq+1SG6KgP7Z6IgOUTXX2HozcnbC7pYIG
	5D/ihGs/h8Thgn8Bf/FCWG+ZCLeXt0oeL3fJf1HahJjg5te3UXvhuzUSJ0FL1PLi8+zw
	nJtaaeSm7E6nEikLprZIJME9YMbMTYz3XWjBdVW09gfbsnaFWSEwHUlQk3CVlf7hfqXc
	zvDYYp33upTWPIlus7s4z+2VTn2k0bdUJBGjsgJ3or/DthqajkbJ6hybO9m8ZGbhVl6a
	5DaaaJ7HTv2cqBnpKs6eIQ5CJtev5bVm53aX1VCMy5vN+r14PWvNzRAmaOYn4peo324e
	wAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=rVm02tPEGXxkGKlYL/d+oZxOkyPyu0KGxKiYFUKdSxQ=;
	b=PD2BII0+w5a4ba4nhKNdzQ5YAKsVDHriZuubybqfl8aU4en7aCtAbuA0yuxwdrY/cs
	oG6Sbi+ZDyOQh9j4x/drXiXQ9lBhv0YiHt2AUwktL7G7d9fS/rujhQMGyXcWO/K36vxy
	Xigf3Tr3wiCJVAFzUyc0sFISHEH9sBDdhoLx+IkX4ndfFtleZ+3ueeujToXf1NLxc3gl
	wiVG1WJuOy0zHDTNTnBxt1FPUF2ShFqskb2xPeb53Rgc+lrKt/iopCjXfMy4IsBmPbP/
	IPIwZYL04QwtgYwTI2jaww3JlO3Y+z7AjemfB9LpiRHyvyv1Qdlk5DsduanJP5Pdk8HR
	XoQA==
X-Gm-Message-State: AD7BkJKPyE521WOb13vzK8XOJquqEpUe2a1V2RKAzuWEyC8XwM8XWQivvLBAAYl+wf09kXQHUzC2hLrITbUhaw==
MIME-Version: 1.0
X-Received: by 10.194.174.197 with SMTP id bu5mr26311740wjc.23.1456889810633; 
	Tue, 01 Mar 2016 19:36:50 -0800 (PST)
Received: by 10.27.9.133 with HTTP; Tue, 1 Mar 2016 19:36:50 -0800 (PST)
In-Reply-To: <20160301161840.GD6407@jama>
References: <1456474768-24329-1-git-send-email-net147@gmail.com>
	<20160301161840.GD6407@jama>
Date: Wed, 2 Mar 2016 14:36:50 +1100
Message-ID: <CANwerB2fDfGHd70Fi1HuMxTaCs1RvQ7O4=CT0JXVG1+CETForQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase: fix up pkgconfig replacements
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
X-List-Received-Date: Wed, 02 Mar 2016 03:36:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 March 2016 at 03:18, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Feb 26, 2016 at 07:19:28PM +1100, Jonathan Liu wrote:
>> The replacements were being done in qt_module.prf which is not included
>> when building 3rd party libraries. To resolve this, move the
>> replacements from qt_module.prf to qt.prf which is included when
>> building any qmake project. The pkgconfig include replacement is removed
>> as it doesn't seem to be needed anymore and causes issues when the
>> includedir path in pkgconfig has part of its path replaced with
>> ${includedir} resulting in a circular reference that causes the OE
>> package_do_pkgconfig task to fail.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  ...le-Fix-pkgconfig-and-libtool-replacements.patch | 56 +++++++++++----=
-------
>>  1 file changed, 27 insertions(+), 29 deletions(-)
>
> This seems to break qtwebengine's pkg-config
>
> NOTE: recipe qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76=
-r0: task do_populate_sysroot: Started
> ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 do=
_populate_sysroot: QA Issue: Qt5WebEngineCore.pc failed sanity test (tmpdir=
) in path /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/=
qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0/sysroot-des=
tdir/usr/lib/pkgconfig [pkgconfig]
> ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 do=
_populate_sysroot: QA staging was broken by the package built above
> ERROR: qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76-r0 do=
_populate_sysroot: Function failed: do_qa_staging
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-=
glibc/work/core2-64-oe-linux/qtwebengine/5.5.99+5.6.0-rc+gitAUTOINC+64dc919=
d31_7e655fbb76-r0/temp/log.do_populate_sysroot.22802
> NOTE: recipe qtwebengine-5.5.99+5.6.0-rc+gitAUTOINC+64dc919d31_7e655fbb76=
-r0: task do_populate_sysroot: Failed
> ERROR: Task 22201 (/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt=
5/qtwebengine_git.bb, do_populate_sysroot) failed with exit code '1'
>
> Any idea why this replacement wouldn't be used for qtwebengine?
>

It works for me in meta-qt5 master-next branch. Revision 64dc919d31
doesn't seem to exist in the git://code.qt.io/qt/qtwebengine.git
repository.

I tested with qtwebengine
PV=3D"5.5.99+5.6.0-rc+gitAUTOINC+3f02c25de4_779a2388fc" and it is
working.
Can you check whether it is working in master-next for you?

Regards,
Jonathan

>>
>> diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libt=
ool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig=
-and-libtool-replacements.patch
>> index 7520107..4807df0 100644
>> --- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-rep=
lacements.patch
>> +++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-rep=
lacements.patch
>> @@ -61,11 +61,36 @@ Content-Transfer-Encoding: 8bit
>>  Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
>>  Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> +Signed-off-by: Jonathan Liu <net147@gmail.com>
>>  ---
>> + mkspecs/features/qt.prf        | 13 +++++++++++++
>>   mkspecs/features/qt_common.prf |  2 +-
>> - mkspecs/features/qt_module.prf | 16 ++++++++++++++++
>> - 2 files changed, 17 insertions(+), 1 deletion(-)
>> + 2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> +diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
>> +index f62b6bb..91be8b3 100644
>> +--- a/mkspecs/features/qt.prf
>> ++++ b/mkspecs/features/qt.prf
>> +@@ -321,6 +321,19 @@ contains(TEMPLATE, .*app) {
>> +     QTPLUGIN =3D $$manualplugs $$autoplugs
>> + }
>> +
>> ++contains(TEMPLATE, .*lib) {
>> ++    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
>> ++    pkgconfig_prefix_replace.replace =3D "prefix=3D"
>> ++    pkgconfig_prefix_replace.CONFIG =3D path
>> ++    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
>> ++
>> ++    # drop -L/usr/lib in .prl files
>> ++    prl_replace.match =3D "-L\$${libdir}"
>> ++    prl_replace.replace =3D ""
>> ++    prl_replace.CONFIG =3D path
>> ++    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
>> ++}
>> ++
>> + QT_PLUGIN_VERIFY =3D DEPLOYMENT_PLUGIN
>> + contains(QT_CONFIG, static) {
>> +     QT_PLUGIN_VERIFY +=3D QTPLUGIN
>>  diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_commo=
n.prf
>>  index 38602f6..f9c401f 100644
>>  --- a/mkspecs/features/qt_common.prf
>> @@ -79,33 +104,6 @@ index 38602f6..f9c401f 100644
>>       }
>>       lib_replace.CONFIG =3D path
>>       QMAKE_PRL_INSTALL_REPLACE +=3D lib_replace
>> -diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_modul=
e.prf
>> -index aefd3ae..775cda2 100644
>> ---- a/mkspecs/features/qt_module.prf
>> -+++ b/mkspecs/features/qt_module.prf
>> -@@ -276,6 +276,22 @@ load(qt_targets)
>> -         ltlib_replace.replace =3D $$QMAKE_LIBTOOL_LIBDIR
>> -     ltlib_replace.CONFIG =3D path
>> -     QMAKE_LIBTOOL_INSTALL_REPLACE +=3D ltlib_replace
>> -+
>> -+    pkgconfig_include_replace.match =3D $$rplbase/include
>> -+    pkgconfig_include_replace.replace =3D "\$$\\{includedir}"
>> -+    pkgconfig_include_replace.CONFIG =3D path
>> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_include_replace
>> -+
>> -+    pkgconfig_prefix_replace.match =3D "prefix=3D$$[QT_SYSROOT]"
>> -+    pkgconfig_prefix_replace.replace =3D "prefix=3D"
>> -+    pkgconfig_prefix_replace.CONFIG =3D path
>> -+    QMAKE_PKGCONFIG_INSTALL_REPLACE +=3D pkgconfig_prefix_replace
>> -+
>> -+    # drop -L/usr/lib in .prl files
>> -+    prl_replace.match =3D "-L\$${libdir}"
>> -+    prl_replace.replace =3D ""
>> -+    prl_replace.CONFIG =3D path
>> -+    QMAKE_PRL_INSTALL_REPLACE +=3D prl_replace
>> - }
>> -
>> - contains(QT_PRODUCT, OpenSource.*):DEFINES *=3D QT_OPENSOURCE
>>  --
>>  2.7.1
>>
>> --
>> 2.7.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

