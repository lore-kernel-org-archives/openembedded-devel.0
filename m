Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfWA7-00023d-4E
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 14:34:19 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1023658wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 05:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zU8qWIxItNq/bX0I329SjAOGesWrozWceLT91OnFCVU=;
	b=Eh6z9QWBsgAper0sI3bweFMsvMvx0Y8jTfncCfaxw86o5FvamYQ14Flsk3t7Yxdwq1
	597C/0qhxhGZKAWmuZ9wuw47v5BBievqTT8Qmz9NFCv4FoIXkn+qlO49bBlX11KKJ9q4
	rHdfJf8RY/IjnM3I0LdFEZQiVZcsDo6bdkBqQaFxaIYltq17m/s0M+vOE6E5gOcUeVcj
	v+TcmGY0NyCP4MuWCrco67RR3NuT+aoVnLQpn7/BBFfJJlhCVjJiJGmNmIepYmYpT3tX
	YDW6EYQLUieYZUEqJ9YAnpii4NoLuP9Yb5EAt/JQeyP2Y54wp+CF5qKXufIGvOdhuBw0
	BdJw==
MIME-Version: 1.0
Received: by 10.180.98.8 with SMTP id ee8mr9536698wib.4.1354540797891; Mon, 03
	Dec 2012 05:19:57 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Mon, 3 Dec 2012 05:19:57 -0800 (PST)
In-Reply-To: <CAGiJk9f6ZzvrZNrgDfmhMEDFNWiY4gsF-0GF4nz1=6qzZLexeg@mail.gmail.com>
References: <20121024064022.C7F781032E@opal>
	<CAGiJk9fcWHvEdK_bc3ApwExvGM1PKVh6-y9Hj1ifMA0HQG19+w@mail.gmail.com>
	<k6oe50$iv9$2@ger.gmane.org>
	<CAGiJk9f6ZzvrZNrgDfmhMEDFNWiY4gsF-0GF4nz1=6qzZLexeg@mail.gmail.com>
Date: Mon, 3 Dec 2012 14:19:57 +0100
Message-ID: <CA+chaQes=2CvfGmW=_vOTiKQPRDgyxEZSty657FuE9SS=ptjWw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Koen Kooi : Revert "maliit-framework: Clean up recipe and use gtk-immodules-cache.bbclass"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 13:34:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 30, 2012 at 2:13 PM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/10/30 Koen Kooi <koen@dominion.thruhere.net>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 30-10-12 10:24, Samuel Stirtzel schreef:
>>> 2012/10/24  <git@git.openembedded.org>:
>>>> Module: meta-openembedded.git Branch: master Commit:
>>>> 80ef3c0aa0f92e93d1581e47ccb77a04022d04cf URL:
>>>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=3D=
80ef3c0aa0f92e93d1581e47ccb77a04022d04cf
>>>>
>>>>
>>>>
>> Author: Koen Kooi <koen@dominion.thruhere.net>
>>>> Date:   Wed Oct 24 08:39:12 2012 +0200
>>>>
>>>> Revert "maliit-framework: Clean up recipe and use
>>>> gtk-immodules-cache.bbclass"
>>>>
>>>> The class hasn't hit oe-core yet
>>>>
>>>> This reverts commit eb66e508e33ccbec8299041265eef183913a3a8c.
>>>>
>>>> ---
>>>>
>>>> .../recipes-support/maliit/maliit-framework_git.bb |   32
>>>> +++++++++++++++---- 1 files changed, 25 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb
>>>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb index
>>>> 534a3c8..3f50d1b 100644 ---
>>>> a/meta-oe/recipes-support/maliit/maliit-framework_git.bb +++
>>>> b/meta-oe/recipes-support/maliit/maliit-framework_git.bb @@ -4,7 +4,7
>>>> @@ HOMEPAGE =3D "https://wiki.maliit.org/Main_Page" LICENSE =3D "LGPLv=
2.1"
>>>> LIC_FILES_CHKSUM =3D
>>>> "file://LICENSE.LGPL;md5=3D5c917f6ce94ceb8d8d5e16e2fca5b9ad"
>>>>
>>>> -inherit autotools qt4x11 gtk-immodules-cache +inherit autotools
>>>> qt4x11
>>>>
>>>>
>>>> SRC_URI =3D
>>>> "git://gitorious.org/maliit/maliit-framework.git;branch=3Dmaster \ @@
>>>> -16,8 +16,9 @@ SRCREV =3D "750842dec74a9b17dca91ef779c4fc5a43c4d9dc" P=
V =3D
>>>> "0.92.3+git${SRCPV}"
>>>>
>>>>
>>>> -PACKAGES =3D+ "${PN}-gtk" -GTKIMMODULES_PACKAGES =3D "${PN}-gtk" +PAC=
KAGES
>>>> =3D+ "\ +    ${PN}-gtk \ +    "
>>>>
>>>> # Maliit needs Qt configured with -accessibility, a patch for that was
>>>> already sent and will get merged in post 1.2. RDEPENDS_${PN} =3D
>>>> "qt4-plugin-inputmethod-imsw-multi libqtsvg4" @@ -57,12 +58,29 @@
>>>> EXTRA_QMAKEVARS_PRE =3D "\ CONFIG+=3Dlocal-install \ "
>>>>
>>>> -EXTRA_OEMAKE +=3D "INSTALL_ROOT=3D${D}" +do_install() { +    cd ${S} =
&&
>>>> (INSTALL_ROOT=3D${D} oe_runmake install)
>>>>
>>>> -do_install_append() { #Fix absolute paths -    sed -i -e
>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
>>>> ${D}/${datadir}/qt4/mkspecs/features/maliit-framework.prf -    sed -i
>>>> -e "s|/usr|${STAGING_DIR_TARGET}${prefix}|"
>>>> ${D}/${datadir}/qt4/mkspecs/features/maliit-plugins.prf +    cd
>>>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-framework.prf +    c=
d
>>>> ${D}/${datadir}/qt4/mkspecs/features && sed -i -e
>>>> "s|/usr|${STAGING_DIR_TARGET}${prefix}|" ./maliit-plugins.prf +} + + +
>>>> +# Update the inputmethod modules in gtk +pkg_postinst_${PN}-gtk() {
>>>> +if [ "x$D" !=3D "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 =
>
>>>> /etc/gtk-2.0/gtk.immodules +} + +pkg_postrm_${PN}-gtk() { +if [ "x$D"
>>>> !=3D "x" ]; then +    exit 1 +fi +gtk-query-immodules-2.0 >
>>>> /etc/gtk-2.0/gtk.immodules }
>>>>
>>>> S=3D "${WORKDIR}/git"
>>>>
>>>>
>>>> _______________________________________________ Openembedded-commits
>>>> mailing list
>>>> Openembedded-commits@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
>>>
>>>>
>>> Hi, can this be re-applied please?
>>>
>>> The .bbclass was taken in OE-Core with commit: [1]
>>>
>>> [1]
>>> https://github.com/openembedded/oe-core/commit/c67f64e5846bb2a6774e61a4=
f3719c5f82fc3bd8
>>
>>
>> That's
>>>
>> not present in the danny branch, see the RFC I sent about that a few
>> days ago.
>
> Alright, this can wait until release branching is done.

Even with this patch applied I still see a lot of QA ERRORs in my build:

ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/settings/.debug/malii=
t-exampleapp-settings
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: maliit-framework-doc path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842=
dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/u=
sr/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-python/libdummy=
.so'
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: maliit-framework-doc path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842=
dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/u=
sr/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-python/.debug/l=
ibdummy.so'
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-python/.debug/li=
bdummy.so
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-python/.debug/li=
bdummy.so.1.0.0
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-python/.debug/li=
bdummy.so.1.0
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-python/.debug/li=
bdummy.so.1
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk2/.debug/maliit-ex=
ampleapp-gtk2
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/embedded/.debug/malii=
t-exampleapp-embedded
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/allinputmethods/.debu=
g/maliit-exampleapp-allinputmethods
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/widgetproperties/.deb=
ug/maliit-exampleapp-widgetproperties
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/plainqt/.debug/maliit=
-exampleapp-plainqt
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk2-overrides/.debug=
/maliit-exampleapp-gtk2-overrides
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: maliit-framework-doc path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842=
dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/u=
sr/share/doc/maliit-framework/maliit-sdk/examples/apps/settings-python3/lib=
dummy.so'
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: maliit-framework-doc path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842=
dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/u=
sr/share/doc/maliit-framework/maliit-sdk/examples/apps/settings-python3/.de=
bug/libdummy.so'
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/settings-python3/.deb=
ug/libdummy.so
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/settings-python3/.deb=
ug/libdummy.so.1.0.0
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/settings-python3/.deb=
ug/libdummy.so.1.0
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/settings-python3/.deb=
ug/libdummy.so.1
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/server-embedded/.debu=
g/maliit-example-embedded-server
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3/.debug/maliit-ex=
ampleapp-gtk3
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/gtk3-overrides/.debug=
/maliit-exampleapp-gtk3-overrides
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/apps/twofields/.debug/mali=
it-exampleapp-twofields
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: maliit-framework-doc path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842=
dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/u=
sr/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/helloworld/li=
bdummy.so'
ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink
.so: maliit-framework-doc path
'/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842=
dec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/u=
sr/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/helloworld/.d=
ebug/libdummy.so'
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/helloworld/.de=
bug/libdummy.so
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/helloworld/.de=
bug/libdummy.so.1.0.0
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/helloworld/.de=
bug/libdummy.so.1.0
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/helloworld/.de=
bug/libdummy.so.1
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/cyclekeys/.deb=
ug/libqmlcyclekeysplugin.so
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/qml/override/.debu=
g/libqmloverrideplugin.so
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/cxx/helloworld/.de=
bug/libcxxhelloworldplugin.so
ERROR: QA Issue: non debug package contains .debug directory:
maliit-framework-doc path
/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-framework/0.92.3+git1+750842d=
ec74a9b17dca91ef779c4fc5a43c4d9dc-r0/packages-split/maliit-framework-doc/us=
r/share/doc/maliit-framework/maliit-sdk/examples/plugins/cxx/override/.debu=
g/libcxxoverrideplugin.so

Cheers,


