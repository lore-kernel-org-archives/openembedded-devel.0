Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 25A1A65C9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 13:08:40 +0000 (UTC)
Received: by wicnf17 with SMTP id nf17so68985091wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=/LWJLwPzDtqQJHhle2MggpihMP7bvf4jf/fxwnxQBYg=;
	b=VLHyNQlFScFC4b1V0JGzos+8SUIfHr3LGEjXVX1iC7gCFRv9mE+g2eCxWunB3eGwM+
	Ac0BfKpyizelccrlEUyDFXp8MQhNMucbgO+ME4RtNbX20Hpa9xiBEOufKoTytDjfXTvU
	GbwXaW067Eaq+FboUgT1xV0Ghuhfw0lMXxFLUejFwQ+ldHj5TtGspCKZgx+6M40pg2A+
	6SE7sfEjGMlo4bcxcHUOZTdkHw9Qf12451UEWPwVrcKh9ey6Ql50o7UZj3oIEnQ0S0ps
	fp1H/2boZccV3HoiLF2rMQ7THKu60Eg7EkUaJaSaSiTeZJ6W7iOfbRS2XjiEgUrpfFvB
	tY9A==
X-Received: by 10.180.106.70 with SMTP id gs6mr21420582wib.36.1431954521398;
	Mon, 18 May 2015 06:08:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id kc4sm16868447wjc.2.2015.05.18.06.08.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 May 2015 06:08:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 18 May 2015 15:09:07 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150518130907.GE9407@jama>
References: <1431647846-2409-1-git-send-email-raj.khem@gmail.com>
	<20150516050718.GA9407@jama>
	<CAMKF1sp0nqjQLXZjkBJs52-8vyWZWWty7gV3+atXfJ_T4XNvBg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp0nqjQLXZjkBJs52-8vyWZWWty7gV3+atXfJ_T4XNvBg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-browser][PATCH] cef,chromium: Separate out installs
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
X-List-Received-Date: Mon, 18 May 2015 13:08:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2015 at 11:36:27PM -0700, Khem Raj wrote:
> On Fri, May 15, 2015 at 10:07 PM, Martin Jansa <martin.jansa@gmail.com> w=
rote:
> > On Thu, May 14, 2015 at 04:57:26PM -0700, Khem Raj wrote:
> >> Use specific domains for installation, so they can be built and
> >> installed in a single build
> >
> > Thanks, one more issue was shown in my world builds:
> >
> > WARNING: QA Issue: ELF binary '/home/jenkins/oe/world/shr-core/tmp-glib=
c/work/i586-oe-linux/cef3/280796-r0/packages-split/cef3-codecs-ffmpeg/usr/l=
ib/cef3/libffmpegsumo.so' has relocations in .text [textrel]
> > ERROR: QA Issue: non debug package contains .debug directory: cef3 path=
 /work/i586-oe-linux/cef3/280796-r0/packages-split/cef3/usr/bin/lib/.debug/=
libcef.so [debug-files]
> > WARNING: QA Issue: cef3: found library in wrong location: /usr/bin/lib/=
libcef.so
> > cef3: found library in wrong location: /usr/bin/lib/.debug/libcef.so [l=
ibdir]
> > ERROR: QA run found fatal errors. Please consider fixing them.
> > ERROR: Function failed: do_package_qa
> > ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/i586-oe-linux/cef3/280796-r0/temp/log.do_package_qa.2247
> > NOTE: recipe cef3-280796-r0: task do_package_qa: Failed
> >
>=20
> Have seen those. We need to ignore the relevant insane checks in recipe

one more, can we fix or blacklist it for x86-64 builds?

| Generating CEF project files...
|=20
| ________ running '/usr/bin/python ../build/gyp_chromium cef.gyp -I cef.gy=
pi -I x86_64_ozone.gypi --depth ../' in '/home/jenkins/oe/world/shr-core/tm=
p-glibc/work/core2-64-oe-linux/cef3/280796-r0/chromium_rev_280796/cef'
| Updating projects from gyp files...
| gyp: x86_64_ozone.gypi not found (cwd: /home/jenkins/oe/world/shr-core/tm=
p-glibc/work/core2-64-oe-linux/cef3/280796-r0/chromium_rev_280796/cef) whil=
e reading includes of cef.gyp
| Traceback (most recent call last):
|   File "tools/gclient_hook.py", line 43, in <module>
|     RunAction(cef_dir, gyper)
|   File "/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/=
cef3/280796-r0/chromium_rev_280796/cef/tools/gclient_util.py", line 39, in =
RunAction
|     command, cwd=3Ddir, always=3DTrue)
|   File "/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/=
cef3/280796-r0/depot_tools/gclient_utils.py", line 293, in CheckCallAndFilt=
erAndHeader
|     return CheckCallAndFilter(args, **kwargs)
|   File "/home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/=
cef3/280796-r0/depot_tools/gclient_utils.py", line 538, in CheckCallAndFilt=
er
|     rv, args, kwargs.get('cwd', None), None, None)
| subprocess2.CalledProcessError: Command /usr/bin/python ../build/gyp_chro=
mium cef.gyp -I cef.gypi -I x86_64_ozone.gypi --depth ../ returned non-zero=
 exit status 1 in /home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-o=
e-linux/cef3/280796-r0/chromium_rev_280796/cef
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /home/jenkin=
s/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/cef3/280796-r0/temp/lo=
g.do_configure.11063)
NOTE: recipe cef3-280796-r0: task do_configure: Failed

> > Thanks
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../{chromium/google-chrome =3D> cef3/cef-simple}    |  6 ++---
> >>  recipes-browser/chromium/cef3_280796.bb            |  1 +
> >>  recipes-browser/chromium/chromium.inc              | 30 ++++++++++++-=
---------
> >>  recipes-browser/chromium/chromium/google-chrome    |  4 +--
> >>  .../chromium/chromium/google-chrome.desktop        |  2 +-
> >>  recipes-browser/chromium/chromium_40.0.2214.91.bb  |  4 +--
> >>  6 files changed, 25 insertions(+), 22 deletions(-)
> >>  copy recipes-browser/chromium/{chromium/google-chrome =3D> cef3/cef-s=
imple} (66%)
> >>
> >> diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes=
-browser/chromium/cef3/cef-simple
> >> similarity index 66%
> >> copy from recipes-browser/chromium/chromium/google-chrome
> >> copy to recipes-browser/chromium/cef3/cef-simple
> >> index 78f4a29..ce377e1 100644
> >> --- a/recipes-browser/chromium/chromium/google-chrome
> >> +++ b/recipes-browser/chromium/cef3/cef-simple
> >> @@ -1,11 +1,11 @@
> >>  #!/bin/sh
> >>
> >>  export CHROME_DEVEL_SANDBOX=3D/usr/sbin/chrome-devel-sandbox
> >> -export LD_LIBRARY_PATH=3D/usr/lib/chrome
> >> +export LD_LIBRARY_PATH=3D/usr/lib/cef3
> >>
> >>  CHROME_EXTRA_ARGS=3D""
> >>  if [ "${USER}" =3D "root" ] ; then
> >> -     CHROME_EXTRA_ARGS=3D"${CHROME_EXTRA_ARGS} --user-data-dir=3D${HO=
ME}/.chromium/"
> >> +     CHROME_EXTRA_ARGS=3D"${CHROME_EXTRA_ARGS} --user-data-dir=3D${HO=
ME}/.cef3/"
> >>  fi
> >>
> >> -/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
> >> +/usr/bin/cef3/cefsimple ${CHROME_EXTRA_ARGS} $@
> >> diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser=
/chromium/cef3_280796.bb
> >> index 9ca5810..9a9efe5 100644
> >> --- a/recipes-browser/chromium/cef3_280796.bb
> >> +++ b/recipes-browser/chromium/cef3_280796.bb
> >> @@ -14,6 +14,7 @@ SRC_URI =3D "http://people.linaro.org/~zoltan.kuscsi=
k/chromium-browser/chromium_re
> >>             git://github.com/kuscsik/ozone-egl.git;protocol=3Dhttps;de=
stsuffix=3Dsrc/ui/ozone/platform/egl;branch=3Dmaster;name=3Degl \
> >>             git://chromium.googlesource.com/chromium/tools/depot_tools=
=2Egit;protocol=3Dhttps;destsuffix=3Ddepot_tools;branch=3Dmaster;name=3Dtoo=
ls \
> >>             file://01_get_svn_version_from_LASTCHANGE.patch \
> >> +        file://cef-simple \
> >>         "
> >>  SRC_URI[md5sum] =3D "9efbb50283b731042e62b9bd5e312b2f"
> >>  SRC_URI[sha256sum] =3D "f608e97dadf6ea4d885b24fd876896d46840fa39bf743=
ea2025075aee9fb348d"
> >> diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/c=
hromium/chromium.inc
> >> index 72a649d..377e685 100644
> >> --- a/recipes-browser/chromium/chromium.inc
> >> +++ b/recipes-browser/chromium/chromium.inc
> >> @@ -34,20 +34,23 @@ do_install() {
> >>       if [ -f "${WORKDIR}/google-chrome" ]; then
> >>               install -Dm 0755 ${WORKDIR}/google-chrome ${D}${bindir}/=
google-chrome
> >>       fi
> >> +     if [ -f "${WORKDIR}/cef-simple" ]; then
> >> +             install -Dm 0755 ${WORKDIR}/cef-simple ${D}${bindir}/cef=
-simple
> >> +     fi
> >>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_sandbox" ]; then
> >>               install -Dm 4755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome_=
sandbox ${D}${sbindir}/chrome-devel-sandbox
> >>       fi
> >>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimple" ]; then
> >> -             install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimp=
le ${D}${bindir}/cefsimple
> >> +             install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/cefsimp=
le ${D}${bindir}/${BPN}/cefsimple
> >>       fi
> >>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/lib/libcef.so" ]; then
> >>               install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/lib=
cef.so ${D}${bindir}/lib/libcef.so
> >>       fi
> >>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/chrome" ]; then
> >> -             install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome =
${D}${bindir}/chrome/chrome
> >> +             install -Dm 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/chrome =
${D}${bindir}/${BPN}/chrome
> >>       fi
> >>       if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.dat" ]; then
> >> -             install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.=
dat ${D}${bindir}/chrome/icudtl.dat
> >> +             install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}/icudtl.=
dat ${D}${bindir}/${BPN}/icudtl.dat
> >>       fi
> >>       if [ -f "${WORKDIR}/google-chrome.desktop" ]; then
> >>               install -Dm 0644 ${WORKDIR}/google-chrome.desktop ${D}${=
datadir}/applications/google-chrome.desktop
> >> @@ -55,7 +58,7 @@ do_install() {
> >>       #Chromium plugins libs
> >>       for f in libpdf.so libosmesa.so libffmpegsumo.so; do
> >>               if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
> >> -                     install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}=
/$f ${D}${libdir}/chrome/$f
> >> +                     install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}=
/$f ${D}${libdir}/${BPN}/$f
> >>               fi
> >>       done
> >>
> >> @@ -64,7 +67,7 @@ do_install() {
> >>                cef_100_percent.pak cef_200_percent.pak cef_resources.p=
ak cef.pak \
> >>                locales/en-US.pak; do
> >>               if [ -f "${B}/out/${CHROMIUM_BUILD_TYPE}/$f" ]; then
> >> -                     install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}=
/$f ${D}${bindir}/chrome/$f
> >> +                     install -Dm 0644 ${B}/out/${CHROMIUM_BUILD_TYPE}=
/$f ${D}${bindir}/${BPN}/$f
> >>               fi
> >>       done
> >>
> >> @@ -72,19 +75,18 @@ do_install() {
> >>
> >>  PACKAGES =3D+ "${PN}-codecs-ffmpeg ${PN}-plugin-pdf"
> >>
> >> -FILES_${PN}-codecs-ffmpeg =3D "${libdir}/chrome/libffmpegsumo.so"
> >> -FILES_${PN}-plugin-pdf =3D "${libdir}/chrome/libpdf.so"
> >> +FILES_${PN}-codecs-ffmpeg =3D "${libdir}/${BPN}/libffmpegsumo.so"
> >> +FILES_${PN}-plugin-pdf =3D "${libdir}/${BPN}/libpdf.so"
> >> +
> >> +FILES_${PN} =3D "${bindir}/${BPN} ${datadir}/applications ${sbindir}/=
 ${libdir}/${BPN}/"
> >> +FILES_${PN} +=3D "${bindir} ${libdir}"
> >> +FILES_${PN} +=3D "${bindir}/${BPN}/*.pak"
> >> +FILES_${PN} +=3D "${bindir}/${BPN}/locales/*.pak"
> >>
> >> -FILES_${PN} =3D "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}=
/applications ${sbindir}/ ${libdir}/chrome/"
> >> -FILES_${PN}-dbg +=3D "${bindir}/chrome/.debug/ ${libdir}/chrome/.debu=
g/"
> >> +FILES_${PN}-dbg +=3D "${bindir}/${BPN}/.debug/ ${libdir}/${BPN}/.debu=
g/ ${libdir}/.debug/"
> >>
> >>  PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> >>
> >>  INSANE_SKIP_${PN} =3D "ldflags"
> >>  SOLIBS =3D ".so"
> >>  FILES_SOLIBSDEV =3D ""
> >> -FILES_${PN} +=3D "${bindir} ${bindir}/chrome/ ${libdir}"
> >> -FILES_${PN} +=3D "${bindir}/chrome/*.pak"
> >> -FILES_${PN} +=3D "${bindir}/chrome/locales/*.pak"
> >> -FILES_${PN}-dbg +=3D "${bindir}/chrome/.debug/ ${libdir}/.debug/"
> >> -
> >> diff --git a/recipes-browser/chromium/chromium/google-chrome b/recipes=
-browser/chromium/chromium/google-chrome
> >> index 78f4a29..b1ec288 100644
> >> --- a/recipes-browser/chromium/chromium/google-chrome
> >> +++ b/recipes-browser/chromium/chromium/google-chrome
> >> @@ -1,11 +1,11 @@
> >>  #!/bin/sh
> >>
> >>  export CHROME_DEVEL_SANDBOX=3D/usr/sbin/chrome-devel-sandbox
> >> -export LD_LIBRARY_PATH=3D/usr/lib/chrome
> >> +export LD_LIBRARY_PATH=3D/usr/lib/chromium
> >>
> >>  CHROME_EXTRA_ARGS=3D""
> >>  if [ "${USER}" =3D "root" ] ; then
> >>       CHROME_EXTRA_ARGS=3D"${CHROME_EXTRA_ARGS} --user-data-dir=3D${HO=
ME}/.chromium/"
> >>  fi
> >>
> >> -/usr/bin/chrome/chrome ${CHROME_EXTRA_ARGS} $@
> >> +/usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
> >> diff --git a/recipes-browser/chromium/chromium/google-chrome.desktop b=
/recipes-browser/chromium/chromium/google-chrome.desktop
> >> index 76a2533..094bd82 100644
> >> --- a/recipes-browser/chromium/chromium/google-chrome.desktop
> >> +++ b/recipes-browser/chromium/chromium/google-chrome.desktop
> >> @@ -107,7 +107,7 @@ Comment[zh_HK]=3D???????
> >>  Comment[zh_TW]=3D???????
> >>  Exec=3D/usr/bin/google-chrome %U
> >>  Terminal=3Dfalse
> >> -Icon=3D/usr/bin/chrome/product_logo_48.png
> >> +Icon=3D/usr/bin/chromium/product_logo_48.png
> >>  Type=3DApplication
> >>  Categories=3DNetwork;WebBrowser;
> >>  MimeType=3Dtext/html;text/xml;application/xhtml_xml;x-scheme-handler/=
http;x-scheme-handler/https;x-scheme-handler/ftp;
> >> diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recip=
es-browser/chromium/chromium_40.0.2214.91.bb
> >> index 53af755..0a73f1e 100644
> >> --- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
> >> +++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
> >> @@ -189,8 +189,8 @@ do_install_append() {
> >>
> >>       # Always adding this libdir (not just with component builds), be=
cause the
> >>          # LD_LIBRARY_PATH line in the google-chromium script refers t=
o it
> >> -        install -d ${D}${libdir}/chrome/
> >> +        install -d ${D}${libdir}/${BPN}/
> >>          if [ -n "${@bb.utils.contains('PACKAGECONFIG', 'component-bui=
ld', 'component-build', '', d)}" ]; then
> >> -                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*=
=2Eso ${D}${libdir}/chrome/
> >> +                install -m 0755 ${B}/out/${CHROMIUM_BUILD_TYPE}/lib/*=
=2Eso ${D}${libdir}/${BPN}/
> >>          fi
> >>  }
> >> --
> >> 2.1.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

