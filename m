Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id BBB5577B45
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 20:38:58 +0000 (UTC)
Received: by mail-ua0-f177.google.com with SMTP id j17so62025729uag.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 May 2017 13:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8+stm6bNqa4zAe4HlDeG85GhpiZGoo79l0AdXK7cWIY=;
	b=OeRUyy/OBOmIq4yCI4ZM8lGeFuRYP1g5aXi/w7atCgb/SSESfqzHk5JeFZYpHmPyMD
	4wd1BJKi4hQZ4I+H3TuvGEA5eMhgps7ZqtqEWJJ1EgLxsiXvyKK9lBdvveCx2ZCFyy5q
	sT9HzBkRf3uQ9/ikCIKdtDMk6+IxD2E8Qi6MxWcdz2Np7Z426zxmigSP6u3REnwv649q
	zztQVO1aGX7Lz8VTpfi94gzdZtTCaRuNTdHkOUNt80cxSdosU1PvnW0k8MY7q8h+55O/
	EpeI/oMe4rA/hytnC5eWhYqcA2WblVeTHuo7dJ+F6jDafFGc7waSfac3ZlZortpuxck7
	dLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8+stm6bNqa4zAe4HlDeG85GhpiZGoo79l0AdXK7cWIY=;
	b=udiyX6sKSEckUUQ9HO9s39ptfMcRC3+Kr1rAr01WtPv8P706RNUVwmdRstI8+CAPbd
	35lrHq/tbC6+x1GAatDhJIv8SZlZHdkvfgpsR7IMpfianb7lGL5jzVDhppmRN77Skle3
	IVfn3pe0nO7IpR5rFdthrCkoNYJs3cS5c+w08EV3XrVB6dQtW5MTcFw2GJH5lHEKSeKM
	B7DT75xhrvg4CSrkkG/BdH4OG02iDBYQPtvvxTwY1NCP7/Zw2e5koxhGTJ/Rc+cqRAD1
	06/01p3LTG1u0NlcSKFldu9EymGUYTLSebMo/CXhXUeM7WIHsRhTNdyJP9JYp9UfdsN1
	cVVw==
X-Gm-Message-State: AODbwcA5aZhBqxvwpSBNMJHPOP3FZlVS35P898wSBZKVRMMg5Hkk+maU
	2zPPKEqXabWvvYG95QYYf6UCQ338ng==
X-Received: by 10.176.4.80 with SMTP id 74mr4539302uav.115.1494707939351; Sat,
	13 May 2017 13:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.74.16 with HTTP; Sat, 13 May 2017 13:38:58 -0700 (PDT)
In-Reply-To: <4f006769-0dd7-b0d8-1969-dd1f701e0ba5@balister.org>
References: <1494703489-23588-1-git-send-email-philip@balister.org>
	<1494703489-23588-2-git-send-email-philip@balister.org>
	<CALbNGRRz-K4SG41qKRVbwYaFDP83c3Y8qc55K6uQhxxg0fXL=w@mail.gmail.com>
	<4f006769-0dd7-b0d8-1969-dd1f701e0ba5@balister.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 13 May 2017 22:38:58 +0200
Message-ID: <CALbNGRQuowVU-vtogzF9wvwELw04EkFCS9Nx05khLxdNbCTEpw@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] python-pyqt5: Add recipe.
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
X-List-Received-Date: Sat, 13 May 2017 20:38:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2017 at 10:23 PM, Philip Balister <philip@balister.org> wro=
te:
> On 05/13/2017 04:03 PM, Andreas M=C3=BCller wrote:
>> On Sat, May 13, 2017 at 9:24 PM, Philip Balister <philip@balister.org> w=
rote:
>>>  * Build tested on raspberrypi3
>>>  * I promise to chase the patch upstream.
>>>
>>> Signed-off-by: Philip Balister <philip@balister.org>
>> Hi Philip,
>>
>> I played around with this too - but did not finish and am happy to you
>> put some progress on it.
>>> ---
>>>  recipes-python/pyqt5/files/fix-sm.patch    | 17 ++++++++
>>>  recipes-python/pyqt5/python-pyqt5_5.8.2.bb | 68 ++++++++++++++++++++++=
++++++++
>>>  2 files changed, 85 insertions(+)
>>>  create mode 100644 recipes-python/pyqt5/files/fix-sm.patch
>>>  create mode 100644 recipes-python/pyqt5/python-pyqt5_5.8.2.bb
>>>
>>> diff --git a/recipes-python/pyqt5/files/fix-sm.patch b/recipes-python/p=
yqt5/files/fix-sm.patch
>>> new file mode 100644
>>> index 0000000..f2936a2
>>> --- /dev/null
>>> +++ b/recipes-python/pyqt5/files/fix-sm.patch
>>> @@ -0,0 +1,17 @@
>>> +--- PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip.orig 2017-05-13 13:2=
8:42.523392315 -0400
>>> ++++ PyQt5_gpl-5.8.2/sip/QtGui/qguiapplication.sip      2017-05-13 13:3=
0:08.081207211 -0400
>>> +@@ -270,12 +270,14 @@
>>> + %End
>>> +
>>> + public:
>>> ++%If (PyQt_SessionManager)
>>> + %If (Qt_5_6_0 -)
>>> +     static bool isFallbackSessionManagementEnabled();
>>> + %End
>>> + %If (Qt_5_6_0 -)
>>> +     static void setFallbackSessionManagementEnabled(bool);
>>> + %End
>>> ++%End
>>> +
>>> + signals:
>>> + %If (Qt_5_6_0 -)
>>> diff --git a/recipes-python/pyqt5/python-pyqt5_5.8.2.bb b/recipes-pytho=
n/pyqt5/python-pyqt5_5.8.2.bb
>>> new file mode 100644
>>> index 0000000..b4c0a8d
>>> --- /dev/null
>>> +++ b/recipes-python/pyqt5/python-pyqt5_5.8.2.bb
>>> @@ -0,0 +1,68 @@
>>> +SUMMARY =3D "Python Qt5 Bindings"
>>> +AUTHOR =3D "Phil Thomson @ riverbank.co.uk"
>>> +HOMEPAGE =3D "http://riverbankcomputing.co.uk"
>>> +SECTION =3D "devel/python"
>>> +LICENSE =3D "GPLv3"
>>> +LIC_FILES_CHKSUM =3D "\
>>> +    file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae504 \
>>> +"
>>> +DEPENDS =3D "sip sip-native qtbase python"
>>> +
>>> +SRC_URI =3D "\
>>> +    ${SOURCEFORGE_MIRROR}/pyqt/PyQt5_gpl-${PV}.tar.gz \
>>> +    file://fix-sm.patch \
>>> +"
>>> +SRC_URI[md5sum] =3D "c3048e9d242f3e72fd393630da1d971a"
>>> +SRC_URI[sha256sum] =3D "ebd70515b30bbd6098fee29e6271a6696b1183c5530ee3=
0e6ba9aaab195536e8"
>>> +
>>> +S =3D "${WORKDIR}/PyQt5_gpl-${PV}"
>>> +
>>> +
>>> +inherit qmake5 pythonnative python-dir distro_features_check
>>> +# depends on qt4-x11-free
>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
>>> +
>>> +export BUILD_SYS
>>> +export HOST_SYS
>>> +export STAGING_INCDIR
>>> +export STAGING_LIBDIR
>>> +
>>> +DISABLED_FEATURES =3D "PyQt_Desktop_OpenGL PyQt_Accessibility PyQt_Ses=
sionManager"
>>> +
>>> +DISABLED_FEATURES_append_arm =3D " PyQt_qreal_double"
>>> +
>>> +PYQT_MODULES =3D "QtCore QtGui QtNetwork"
>>> +PYQT_MODULES_aarch64 =3D "QtCore QtGui QtNetwork"
>>> +
>>> +do_configure_prepend() {
>>> +    cd ${S}
>>> +    echo "py_platform =3D linux" > pyqt.cfg
>>> +    echo "py_inc_dir =3D %(sysroot)/$includedir/python%(py_major).%(py=
_minor)" >> pyqt.cfg
>>> +    echo "py_pylib_dir =3D %(sysroot)/${libdir}/python%(py_major).%(py=
_minor)" >> pyqt.cfg
>>> +    echo "py_pylib_lib =3D python%(py_major).%(py_minor)mu" >> pyqt.cf=
g
>>> +    echo "pyqt_module_dir =3D ${D}/${libdir}/python%(py_major).%(py_mi=
nor)/site-packages" >> pyqt.cfg
>>> +    echo "pyqt_bin_dir =3D ${D}/${bindir}" >> pyqt.cfg
>>> +    echo "pyqt_sip_dir =3D ${D}/${datadir}/sip/PyQt5" >> pyqt.cfg
>>> +    echo "pyuic_interpreter =3D ${D}/${bindir}/python%(py_major).%(py_=
minor)" >> pyqt.cfg
>>> +    echo "pyqt_disabled_features =3D ${DISABLED_FEATURES}" >> pyqt.cfg
>>> +    echo "qt_shared =3D True" >> pyqt.cfg
>>> +    echo "[Qt 5.7]" >> pyqt.cfg
>> ^ How about
>>     QT_VERSION=3D`${OE_QMAKE_QMAKE} -query QT_VERSION`
>>     echo "[Qt $QT_VERSION]" >> pyqt.cfg
>> That worked for me
>
> I'll give it a try and resubmit.
>
>
>>> +    echo "pyqt_modules =3D ${PYQT_MODULES}" >> pyqt.cfg
>>> +    echo yes | python configure.py --verbose --qmake  ${STAGING_BINDIR=
_NATIVE}/qt5/qmake --configuration pyqt.cfg --sysroot ${STAGING_DIR_HOST}
>>> +}
>>> +
>>> +do_compile() {
>>> +    cd ${S}
>>> +    oe_runmake
>>> +}
>>> +
>>> +do_install() {
>>> +    cd ${S}
>>> +    oe_runmake install
>>> +}
>>> +
>>> +RDEPENDS_${PN} =3D "python-core python-sip"
>> ^ I don't know your use case but do you think there is a chance to
>> support python3?
>
> I using this to support gnuradio, and one of the next things is get this
> all working with python3. Do we need to support both python2 and 3 for py=
qt?
I think it is not an easy task to support both. My personal preference
would be python3 support only. Python2/3 was the point I started
struggling for python-pyqt5. Would python3 support need python-sip
replacement (causing trouble for meta-qt4)? Don't know how much time
you want to invest - maybe we should start with python2 first...
>
> Thanks,
>
> Philip
>
Andreas

