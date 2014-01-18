Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id A47F06B9DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 10:03:09 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so4267151lab.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2014 02:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YSZsudT0NjE+MgyAYIxIdubUXGuBZsMxqUC42OCUau8=;
	b=alLEqOaZap/mg+Pa+0NabQ9ZQtNPae7sBxaiCOpHP/d9YFhYQnLLDpFxXpXvN849wD
	LF6EP2PEpiuMeXjvs+HxmzbIJqfbGOOLnfMoY349M+ZarWDuYtxZt1ENgLHNNXqFFC2j
	3RRW30PDJsISIxVIkuxg70qHxC3X7SaW4VThm8cub4oamGp4r1ZqdcOtWzPI5PvwItQk
	9ciFmY7N1YcFVsFmEBTL0NOXpIeqHNlRvzimzQmJGXAdwIkHoXjrFkzM0leMSI5t+l45
	r/8Q7HUJeyzxqV/Lv6lsoX1sUpQjARHJSzwvOp383095FXTRcSHir5ougwR7uQG7uzjy
	WeXQ==
MIME-Version: 1.0
X-Received: by 10.152.170.199 with SMTP id ao7mr514882lac.40.1390039389587;
	Sat, 18 Jan 2014 02:03:09 -0800 (PST)
Received: by 10.112.145.6 with HTTP; Sat, 18 Jan 2014 02:03:09 -0800 (PST)
In-Reply-To: <alpine.LFD.2.11.1401140055500.20049@localhost.localdomain>
References: <CAPbeDCnrC84D8tqjT-A29YLO_hn2K1wQ5a_cK85uMVfGEzbrhQ@mail.gmail.com>
	<20140113101147.GI16995@jama>
	<alpine.LFD.2.11.1401140055500.20049@localhost.localdomain>
Date: Sat, 18 Jan 2014 11:03:09 +0100
Message-ID: <CAPbeDCkCM3U=qXv-sUKDNxH1zGyC76m2_fsz_DZLouJovCCceA@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][jansa/qt5-5.2.0] libQt5*.la references OE build directories
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
X-List-Received-Date: Sat, 18 Jan 2014 10:03:10 -0000
X-Groupsio-MsgNum: 47809
Content-Type: multipart/mixed; boundary=089e01176b290add1104f03bc4c1

--089e01176b290add1104f03bc4c1
Content-Type: text/plain; charset=ISO-8859-1

Hi Andreas and Martin,

On Tue, Jan 14, 2014 at 1:03 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

>
> On Mon, 13 Jan 2014, Martin Jansa wrote:
>
>  On Mon, Jan 13, 2014 at 01:58:25AM +0100, Jacob Kroon wrote:
>>
>>> Hi,
>>>
>>> I'm seeing what I believe is a problem with the *.la files in the Qt5
>>> dev-packages.
>>> The files references paths in my OE build environment, like so:
>>>
>>> ...
>>> # Libraries that this one depends upon.
>>> dependency_libs='-lQt5Gui
>>> -L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/
>>> sysroots/wandboard-solo/usr/lib
>>> -lQt5Core -lpthread '
>>> ...
>>> # Directory that this library needs to be installed in:
>>> libdir='/home/jkroon/Projects/oe-devel/build/tmp-eglibc/
>>> sysroots/wandboard-solo/usr'
>>> ...
>>>
>>> I noticed this since my Qt5 autotools project wouldn't link properly when
>>> using the SDK, unless I first removed all libQt5*.la files.
>>>
>>> I'm not quite sure where to look for the problem so any pointers would be
>>> appreciated.
>>>
>>
>> Probably bad rebase on my side, please compare
>>
>> mkspecs/features/qt_module.prf in 5.1.1 and 5.2.0
>>
>> changed in:
>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-
>> qt/qt5/qtbase-5.1.1/0008-qt_module-Fix-pkgconfig-replacement.patch
>> and
>> https://github.com/meta-qt5/meta-qt5/blob/jansa/qt5-5.2.0/
>> recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
>>
>> Or better in meta-qt5's qtbase repo:
>> https://github.com/meta-qt5/qtbase/blob/b5.1.1/mkspecs/
>> features/qt_module.prf
>> https://github.com/meta-qt5/qtbase/blob/b5.2.0/mkspecs/
>> features/qt_module.prf
>>
>>
> I tried building Qt 5.1.1 from master again, the .la-files do look better,
> "libdir" looks correct (taken from libQt5Svg.la):
>
> <snip>
>
> # Directory that this library needs to be installed in:
> libdir='/usr/lib'
> </snip>
>
> however
>
> <snip>
>
> dependency_libs='-lQt5Gui -L/home/jkroon/Projects/oe-
> devel/build/tmp-eglibc/sysroots/wandboard-solo/usr/lib -lQt5Core
> -lpthread '
> </snip>
>
> Dunno wether this is a problem or not, I never tried building the project
> with 5.1.1 using the SDK.
>
> Will hopefully have some time tomorrow to look at the links you sent.
>
> Thanks,
>
> Jacob
>

I'm trying to get the .la-files for Qt5 dev-packages correct.

What I've come up with so far is attached in the patch (to be applied in
top of "jansa-qt5-5.2.0", b8a236df79c25802c1f2eb2525e8a534e73e608e)

With the patch applied I can still build both an image and an SDK, and also
the resulting SDK can be used to build my QT5 autotools projects. But I get
these warnings when building for instance "qtxmlpatterns":

WARNING: QA Issue: qtxmlpatterns: The compile log indicates that host
include and/or library paths were used.

With my patch applied,
recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch looks
like this:

--- qtbase-opensource-src-5.2.0.orig/mkspecs/features/qt_module.prf
+++ qtbase-opensource-src-5.2.0/mkspecs/features/qt_module.prf
@@ -135,30 +135,36 @@ load(qt_installs)
     rplbase = $$dirname(_QMAKE_SUPER_CACHE_)/[^/][^/]*
 else: \
     rplbase = $$MODULE_BASE_OUTDIR
-include_replace.match = $$rplbase/include
-include_replace.replace = $$[QT_INSTALL_HEADERS/raw]
-include_replace.CONFIG = path
+pkgconfig_include_replace.match = $$rplbase/include
+pkgconfig_include_replace.replace = "\$$\\{includedir}"
+pkgconfig_include_replace.CONFIG = path
+pkgconfig_lib_replace.match = $$rplbase/lib
+pkgconfig_lib_replace.replace = "\$$\\{libdir}"
+pkgconfig_lib_replace.CONFIG = path
 lib_replace.match = $$rplbase/lib
 host_build: \
     lib_replace.replace = $$[QT_HOST_LIBS]
 else: \
     lib_replace.replace = $$[QT_INSTALL_LIBS/raw]
 lib_replace.CONFIG = path
-QMAKE_PRL_INSTALL_REPLACE += include_replace lib_replace
+QMAKE_PRL_INSTALL_REPLACE += lib_replace

 unix|win32-g++* {
    CONFIG += create_pc
    QMAKE_PKGCONFIG_LIBDIR = $$lib_replace.replace
-   QMAKE_PKGCONFIG_INCDIR = $$include_replace.replace
+   QMAKE_PKGCONFIG_INCDIR = $$[QT_INSTALL_HEADERS/raw]
    QMAKE_PKGCONFIG_CFLAGS = -I${includedir}/$$MODULE_INCNAME
    QMAKE_PKGCONFIG_DESTDIR = pkgconfig
-   QMAKE_PKGCONFIG_INSTALL_REPLACE += include_replace lib_replace
+   QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
pkgconfig_lib_replace
 }

 unix {
+   lafile_replace.match = "-L$$[QT_INSTALL_LIBS/raw]"
+   lafile_replace.replace = ""
+   lafile_replace.CONFIG = path
    CONFIG += create_libtool explicitlib
    QMAKE_LIBTOOL_LIBDIR = $$lib_replace.replace
-   QMAKE_LIBTOOL_INSTALL_REPLACE += include_replace lib_replace
+   QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace lafile_replace
 }

The lafile_replace does the substitution "-L/usr/lib" -> "". Maybe this is
needed for the .prl-files aswell ? Is the QMAKE_PRL_BUILD_DIR needed at all
? With all the sed:ing going on, that path looks phony to me...

From native "sysroots/x86_64-linux/usr/lib/libQt5Xml.prl":
QMAKE_PRL_BUILD_DIR =
/home/jkroon/Projects/oe-devel/build/tmp-eglibc/work/x86_64-linux/qtbase-native/5.2.0-r0/build/src/xml
QMAKE_PRL_LIBS =
-L/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib
-lQt5Core -lpthread

From native "sysroots/x86_64-linux/usr/lib/libQt5Xml.la":
dependency_libs=' -lQt5Core -lpthread '
libdir='/home/jkroon/Projects/oe-devel/build/tmp-eglibc/sysroots/x86_64-linux/usr/lib'

From target "sysroots/wandboard-solo/usr/lib/libQt5Xml.prl":
QMAKE_PRL_BUILD_DIR =
/home/jkroon/Projects/oe-devel/build/tmp-eglibc/work/cortexa9hf-vfp-neon-mx6-oe-linux-gnueabi/qtbase/5.2.0-r0/build/src/xml
QMAKE_PRL_LIBS = -L/usr/lib -lQt5Core -lpthread

From target "sysroots/wandboard-solo/usr/lib/libQt5Xml.la":
dependency_libs=' -lQt5Core -lpthread '
libdir='/usr/lib'

  -- Jacob (very confused)

--089e01176b290add1104f03bc4c1
Content-Type: text/x-patch; charset=UTF-8; name="fix-la-files.patch"
Content-Disposition: attachment; filename="fix-la-files.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hqkoki5e0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMtcXQvcXQ1L3F0YmFzZS8wMDA1LXF0X21vZHVsZS1GaXgtcGtn
Y29uZmlnLXJlcGxhY2VtZW50LnBhdGNoIGIvcmVjaXBlcy1xdC9xdDUvcXRiYXNlLzAwMDUtcXRf
bW9kdWxlLUZpeC1wa2djb25maWctcmVwbGFjZW1lbnQucGF0Y2gKaW5kZXggZjg1ZmIzMy4uNTUw
M2UxYSAxMDA2NDQKLS0tIGEvcmVjaXBlcy1xdC9xdDUvcXRiYXNlLzAwMDUtcXRfbW9kdWxlLUZp
eC1wa2djb25maWctcmVwbGFjZW1lbnQucGF0Y2gKKysrIGIvcmVjaXBlcy1xdC9xdDUvcXRiYXNl
LzAwMDUtcXRfbW9kdWxlLUZpeC1wa2djb25maWctcmVwbGFjZW1lbnQucGF0Y2gKQEAgLTQ2LDU3
ICs0NiwzNiBAQCBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRvbnlA
Z29vZ2xlbWFpbC5jb20+CiAgbWtzcGVjcy9mZWF0dXJlcy9xdF9tb2R1bGUucHJmIHwgNDMgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAgMSBmaWxlIGNoYW5nZWQs
IDMxIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQogCi1kaWZmIC0tZ2l0IGEvbWtzcGVj
cy9mZWF0dXJlcy9xdF9tb2R1bGUucHJmIGIvbWtzcGVjcy9mZWF0dXJlcy9xdF9tb2R1bGUucHJm
Ci1pbmRleCAxMTUwOWVlLi4yZjk1Njg0IDEwMDY0NAotLS0tIGEvbWtzcGVjcy9mZWF0dXJlcy9x
dF9tb2R1bGUucHJmCi0rKysgYi9ta3NwZWNzL2ZlYXR1cmVzL3F0X21vZHVsZS5wcmYKLUBAIC0x
MzUsMzAgKzEzNSw0OSBAQCBsb2FkKHF0X2luc3RhbGxzKQorSW5kZXg6IHF0YmFzZS1vcGVuc291
cmNlLXNyYy01LjIuMC9ta3NwZWNzL2ZlYXR1cmVzL3F0X21vZHVsZS5wcmYKKz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
Ky0tLSBxdGJhc2Utb3BlbnNvdXJjZS1zcmMtNS4yLjAub3JpZy9ta3NwZWNzL2ZlYXR1cmVzL3F0
X21vZHVsZS5wcmYKKysrKyBxdGJhc2Utb3BlbnNvdXJjZS1zcmMtNS4yLjAvbWtzcGVjcy9mZWF0
dXJlcy9xdF9tb2R1bGUucHJmCitAQCAtMTM1LDMwICsxMzUsMzYgQEAgbG9hZChxdF9pbnN0YWxs
cykKICAgICAgcnBsYmFzZSA9ICQkZGlybmFtZShfUU1BS0VfU1VQRVJfQ0FDSEVfKS9bXi9dW14v
XSoKICBlbHNlOiBcCiAgICAgIHJwbGJhc2UgPSAkJE1PRFVMRV9CQVNFX09VVERJUgogLWluY2x1
ZGVfcmVwbGFjZS5tYXRjaCA9ICQkcnBsYmFzZS9pbmNsdWRlCiAtaW5jbHVkZV9yZXBsYWNlLnJl
cGxhY2UgPSAkJFtRVF9JTlNUQUxMX0hFQURFUlMvcmF3XQogLWluY2x1ZGVfcmVwbGFjZS5DT05G
SUcgPSBwYXRoCi0tbGliX3JlcGxhY2UubWF0Y2ggPSAkJHJwbGJhc2UvbGliCi0taG9zdF9idWls
ZDogXAotLSAgICBsaWJfcmVwbGFjZS5yZXBsYWNlID0gJCRbUVRfSE9TVF9MSUJTXQotLWVsc2U6
IFwKICtwa2djb25maWdfaW5jbHVkZV9yZXBsYWNlLm1hdGNoID0gJCRycGxiYXNlL2luY2x1ZGUK
ICtwa2djb25maWdfaW5jbHVkZV9yZXBsYWNlLnJlcGxhY2UgPSAiXCQkXFx7aW5jbHVkZWRpcn0i
CisrcGtnY29uZmlnX2luY2x1ZGVfcmVwbGFjZS5DT05GSUcgPSBwYXRoCiArcGtnY29uZmlnX2xp
Yl9yZXBsYWNlLm1hdGNoID0gJCRycGxiYXNlL2xpYgogK3BrZ2NvbmZpZ19saWJfcmVwbGFjZS5y
ZXBsYWNlID0gIlwkJFxce2xpYmRpcn0iCi0rIWV4aXN0cygkJFtRVF9TWVNST09UXSkgewotKyAg
ICBpbmNsdWRlX3JlcGxhY2UubWF0Y2ggPSAkJHJwbGJhc2UvaW5jbHVkZQotKyAgICBpbmNsdWRl
X3JlcGxhY2UucmVwbGFjZSA9ICQkW1FUX0lOU1RBTExfSEVBREVSUy9yYXddCi0rICAgIGluY2x1
ZGVfcmVwbGFjZS5DT05GSUcgPSBwYXRoCi0rICAgIGxpYl9yZXBsYWNlLm1hdGNoID0gJCRycGxi
YXNlL2xpYgorK3BrZ2NvbmZpZ19saWJfcmVwbGFjZS5DT05GSUcgPSBwYXRoCisgbGliX3JlcGxh
Y2UubWF0Y2ggPSAkJHJwbGJhc2UvbGliCisgaG9zdF9idWlsZDogXAorICAgICBsaWJfcmVwbGFj
ZS5yZXBsYWNlID0gJCRbUVRfSE9TVF9MSUJTXQorIGVsc2U6IFwKICAgICAgbGliX3JlcGxhY2Uu
cmVwbGFjZSA9ICQkW1FUX0lOU1RBTExfTElCUy9yYXddCi0tbGliX3JlcGxhY2UuQ09ORklHID0g
cGF0aAotKyAgICBsaWJfcmVwbGFjZS5DT05GSUcgPSBwYXRoCi0rICAgIGxhZmlsZV9yZXBsYWNl
Lm1hdGNoID0gJCRycGxiYXNlCi0rICAgIGxhZmlsZV9yZXBsYWNlLnJlcGxhY2UgPSAiJCRbUVRf
SU5TVEFMTF9QUkVGSVgvcmF3XSIKLSt9IGVsc2UgewotKyAgICAjIGluY2x1ZGVfcmVwbGFjZSBh
bmQgbGliX3JlcGxhY2UgYXJlIGR1cGxpY2F0ZSwgYnV0IHdlIGRvbid0IHdhbnQgdG8KLSsgICAg
IyBtYWtlIFFNQUtFX1BLR0NPTkZJR19JTlNUQUxMX1JFUExBQ0UsIFFNQUtFX1BSTF9JTlNUQUxM
X1JFUExBQ0UgY29uZGl0aW9uYWwKLSsgICAgaW5jbHVkZV9yZXBsYWNlLm1hdGNoID0gJCRycGxi
YXNlCi0rICAgIGluY2x1ZGVfcmVwbGFjZS5yZXBsYWNlID0gJCRbUVRfU1lTUk9PVF0kJFtRVF9J
TlNUQUxMX1BSRUZJWC9yYXddCi0rICAgIGluY2x1ZGVfcmVwbGFjZS5DT05GSUcgPSBwYXRoCi0r
ICAgIGxpYl9yZXBsYWNlLm1hdGNoID0gJCRycGxiYXNlCi0rICAgIGxpYl9yZXBsYWNlLnJlcGxh
Y2UgPSAkJFtRVF9TWVNST09UXSQkW1FUX0lOU1RBTExfUFJFRklYL3Jhd10KLSsgICAgbGliX3Jl
cGxhY2UuQ09ORklHID0gcGF0aAotKyAgICBsYWZpbGVfcmVwbGFjZS5tYXRjaCA9ICQkcnBsYmFz
ZQotKyAgICBsYWZpbGVfcmVwbGFjZS5yZXBsYWNlID0gIj0kJFtRVF9JTlNUQUxMX1BSRUZJWC9y
YXddIgotK30KLSBRTUFLRV9QUkxfSU5TVEFMTF9SRVBMQUNFICs9IGluY2x1ZGVfcmVwbGFjZSBs
aWJfcmVwbGFjZQorIGxpYl9yZXBsYWNlLkNPTkZJRyA9IHBhdGgKKy1RTUFLRV9QUkxfSU5TVEFM
TF9SRVBMQUNFICs9IGluY2x1ZGVfcmVwbGFjZSBsaWJfcmVwbGFjZQorK1FNQUtFX1BSTF9JTlNU
QUxMX1JFUExBQ0UgKz0gbGliX3JlcGxhY2UKICAKICB1bml4fHdpbjMyLWcrKyogewogICAgIENP
TkZJRyArPSBjcmVhdGVfcGMKLS0gICBRTUFLRV9QS0dDT05GSUdfTElCRElSID0gJCRsaWJfcmVw
bGFjZS5yZXBsYWNlCisgICAgUU1BS0VfUEtHQ09ORklHX0xJQkRJUiA9ICQkbGliX3JlcGxhY2Uu
cmVwbGFjZQogLSAgIFFNQUtFX1BLR0NPTkZJR19JTkNESVIgPSAkJGluY2x1ZGVfcmVwbGFjZS5y
ZXBsYWNlCi0rICAgaG9zdF9idWlsZDogXAotKyAgICAgICBRTUFLRV9QS0dDT05GSUdfTElCRElS
ID0gJCRbUVRfSE9TVF9MSUJTXQotKyAgIGVsc2U6IFwKLSsgICAgICAgUU1BS0VfUEtHQ09ORklH
X0xJQkRJUiA9ICQkW1FUX0lOU1RBTExfTElCUy9yYXddCiArICAgUU1BS0VfUEtHQ09ORklHX0lO
Q0RJUiA9ICQkW1FUX0lOU1RBTExfSEVBREVSUy9yYXddCiAgICAgUU1BS0VfUEtHQ09ORklHX0NG
TEFHUyA9IC1JJHtpbmNsdWRlZGlyfS8kJE1PRFVMRV9JTkNOQU1FCiAgICAgUU1BS0VfUEtHQ09O
RklHX0RFU1RESVIgPSBwa2djb25maWcKQEAgLTEwNSwxMyArODQsMTMgQEAgaW5kZXggMTE1MDll
ZS4uMmY5NTY4NCAxMDA2NDQKICB9CiAgCiAgdW5peCB7CisrICAgbGFmaWxlX3JlcGxhY2UubWF0
Y2ggPSAiLUwkJFtRVF9JTlNUQUxMX0xJQlMvcmF3XSIKKysgICBsYWZpbGVfcmVwbGFjZS5yZXBs
YWNlID0gIiIKKysgICBsYWZpbGVfcmVwbGFjZS5DT05GSUcgPSBwYXRoCiAgICAgQ09ORklHICs9
IGNyZWF0ZV9saWJ0b29sIGV4cGxpY2l0bGliCiAgICAgUU1BS0VfTElCVE9PTF9MSUJESVIgPSAk
JGxpYl9yZXBsYWNlLnJlcGxhY2UKIC0gICBRTUFLRV9MSUJUT09MX0lOU1RBTExfUkVQTEFDRSAr
PSBpbmNsdWRlX3JlcGxhY2UgbGliX3JlcGxhY2UKLSsgICBRTUFLRV9MSUJUT09MX0lOU1RBTExf
UkVQTEFDRSArPSBpbmNsdWRlX3JlcGxhY2UgbGliX3JlcGxhY2UgbGFmaWxlX3JlcGxhY2UKKysg
ICBRTUFLRV9MSUJUT09MX0lOU1RBTExfUkVQTEFDRSArPSBsaWJfcmVwbGFjZSBsYWZpbGVfcmVw
bGFjZQogIH0KICAKICB1bml4fHdpbjMyLWcrKyogewotLS0gCi0xLjguNS4yCi0K

--089e01176b290add1104f03bc4c1--
