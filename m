Return-Path: <prvs=4091dbf605=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id E5A5071A2F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2016 18:31:27 +0000 (UTC)
X-AuditID: 0a00029b-f79b86d000002197-bb-57fbde7ea38e
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	E6.02.08599.E7EDBF75; Mon, 10 Oct 2016 13:31:27 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Mon, 10 Oct 2016 13:31:26 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser] Chromium Doesn't build for 32bit targets.
Thread-Index: AQHSIySCYlCMrcFQ30y1F3Nk2vEceg==
Date: Mon, 10 Oct 2016 18:31:26 +0000
Message-ID: <16076428.LW6cBLIOWS@localhost.localdomain>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.1.128]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrGLMWRmVeSWpSXmKPExsWyRiBPQ7f+3u9wg8kPhS0uHl7K7MDocW7j
	CsYAxihum6TEkrLgzPQ8fbsE7oyXvTtYCq72MFbMXSfSwNhd08XIySEhYCJx5NIeVghbTOLC
	vfVsILaQwFFGiQXzdSHsWYwS1/6XgdhsAkYS565vYgSxRQRiJeZtmskEYgsLuEl0XN3DAhH3
	lnjTfwwozgFk60ls3a4OEmYRUJX4+OcIWDmvgLnE0kOL2CHGm0m0PXwJ1soIdML3U2vAapgF
	xCVuPZnPBHGagMSSPeeZIWxRiZeP/0GdLCfR/3AbI0S9jsSC3Z/YIGwriVt9O5khbG2JZQtf
	M0PsFZQ4OfMJywRG0VlIVsxC0j4LSfssJO2zkLQvYGRdxciXa6SXWlxcll+Sqpecn7uJERgb
	XAxMs3cw7pngcIhRgINRiYf3woTf4UKsiWXFlbmHGKU5WJTEea99eBQuJJCeWJKanZpakFoU
	X1Sak1p8iJGJg/MQowQHl5RIcWpeSmpRYmlJRjwoAuOLgTEo1cBYIxnwUriccZ/45N09Upki
	X59t6D3p2K4SJZGyxj7hZe+li3WffzT6rbLL2V+9Zvv6oNVST1hDYpwfxl4NcT/+s02kXSpp
	amvYyafKZecXHkndGh6WsG2aaqXGzp9xl9J7tdsjFncoc6vfDf3os5Ahv/rq9NkV996rtExd
	+jG4ftLCKCX7NQ1KLMUZiYZazEXFiQBPktx5iQIAAA==
Subject: [meta-browser] Chromium Doesn't build for 32bit targets.
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
X-List-Received-Date: Mon, 10 Oct 2016 18:31:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <47C32F0DC7F804469E560FDF77CC5DB4@essvote.com>
Content-Transfer-Encoding: quoted-printable

I had sent an email about this a few months back for Krogoth, but I just up=
dated to master in prep for 2.2 and it is still the case.
Chromium 52 will not build for a 32bit target on a 64bit build OS.  It will=
 build the 64bit version, but it uses the build OS's tool chain which seems=
 incorrect.

As you can see from the log it pulls straight g++ and includes from my Cent=
os 7 build box.

log.do_comple below:

DEBUG: Executing shell function do_compile
ninja: Entering directory `/build/test/tmp/work/core2-32-poky-linux/chromiu=
m/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release'
[1/17943] AR obj/chrome/libsafe_browsing_proto.a
[2/17943] CXX obj/third_party/icu/source/common/icuuc.uresource.o
[3/17943] STAMP obj/chrome/make_file_types_protobuf.actions_depends.stamp
[4/17943] CXX obj.host/third_party/icu/source/common/icuuc.ruleiter.o
FAILED: obj.host/third_party/icu/source/common/icuuc.ruleiter.o=20
g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.ruleiter.o.d -DU=
_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=
=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOS=
ITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_D=
EFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOA=
RD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPE=
R_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDT=
RIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DEN=
ABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THE=
MES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PR=
EVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DE=
NABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1=
 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMM=
ON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEX=
CEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVAL=
GRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/comm=
on -I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dss=
p-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-par=
ameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -W=
no-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function =
-m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fn=
o-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden =
-frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/=
icu/source/common/ruleiter.cpp -o obj.host/third_party/icu/source/common/ic=
uuc.ruleiter.o
In file included from /usr/include/features.h:399:0,
                 from /usr/include/stdint.h:25,
                 from /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint=
.h:9,
                 from ../../third_party/icu/source/common/unicode/ptypes.h:=
66,
                 from ../../third_party/icu/source/common/unicode/umachine.=
h:44,
                 from ../../third_party/icu/source/common/unicode/utypes.h:=
36,
                 from ../../third_party/icu/source/common/unicode/uobject.h=
:20,
                 from ../../third_party/icu/source/common/ruleiter.h:14,
                 from ../../third_party/icu/source/common/ruleiter.cpp:11:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or=
 directory
 # include <gnu/stubs-32.h>
                           ^
compilation terminated.
[5/17943] AR obj/third_party/libvpx/libvpx.a
[6/17943] CXX obj.host/third_party/icu/source/common/icuuc.schriter.o
FAILED: obj.host/third_party/icu/source/common/icuuc.schriter.o=20
g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.schriter.o.d -DU=
_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=
=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOS=
ITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_D=
EFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOA=
RD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPE=
R_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDT=
RIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DEN=
ABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THE=
MES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PR=
EVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DE=
NABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1=
 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMM=
ON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEX=
CEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVAL=
GRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/comm=
on -I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dss=
p-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-par=
ameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -W=
no-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function =
-m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fn=
o-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden =
-frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/=
icu/source/common/schriter.cpp -o obj.host/third_party/icu/source/common/ic=
uuc.schriter.o
In file included from /usr/include/features.h:399:0,
                 from /usr/include/c++/4.8.2/x86_64-redhat-linux/32/bits/os=
_defines.h:39,
                 from /usr/include/c++/4.8.2/x86_64-redhat-linux/32/bits/c+=
+config.h:426,
                 from /usr/include/c++/4.8.2/exception:37,
                 from /usr/include/c++/4.8.2/typeinfo:34,
                 from ../../third_party/icu/source/common/utypeinfo.h:28,
                 from ../../third_party/icu/source/common/schriter.cpp:16:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or=
 directory
 # include <gnu/stubs-32.h>
                           ^
compilation terminated.
[7/17943] CXX obj.host/third_party/icu/source/common/icuuc.servlk.o
FAILED: obj.host/third_party/icu/source/common/icuuc.servlk.o=20
g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servlk.o.d -DU_U=
SING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=3D1=
 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=3D64=
 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOSITOR_=
IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_DEFAUL=
T_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOARD_AU=
RAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPER_CDM=
S -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDTRIAL_=
TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DENABLE_=
PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=
=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVI=
EW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENAB=
LE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -D=
FULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON_=
IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEXCEP=
T=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVALGRI=
ND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/common =
-I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dssp-b=
uffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-parame=
ter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -Wno-=
unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function -m3=
2 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fno-e=
xceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden -fr=
tti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu=
/source/common/servlk.cpp -o obj.host/third_party/icu/source/common/icuuc.s=
ervlk.o
In file included from /usr/include/features.h:399:0,
                 from /usr/include/stdint.h:25,
                 from /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint=
.h:9,
                 from ../../third_party/icu/source/common/unicode/ptypes.h:=
66,
                 from ../../third_party/icu/source/common/unicode/umachine.=
h:44,
                 from ../../third_party/icu/source/common/unicode/utypes.h:=
36,
                 from ../../third_party/icu/source/common/servlk.cpp:9:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or=
 directory
 # include <gnu/stubs-32.h>
                           ^
compilation terminated.
[8/17943] CXX obj.host/third_party/icu/source/common/icuuc.servrbf.o
FAILED: obj.host/third_party/icu/source/common/icuuc.servrbf.o=20
g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servrbf.o.d -DU_=
USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=3D=
1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=3D6=
4 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOSITOR=
_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_DEFAU=
LT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOARD_A=
URAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPER_CD=
MS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDTRIAL=
_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DENABLE=
_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THEMES=
=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PREVI=
EW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DENAB=
LE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1 -D=
FULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMMON_=
IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEXCEP=
T=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVALGRI=
ND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/common =
-I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dssp-b=
uffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-parame=
ter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -Wno-=
unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function -m3=
2 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fno-e=
xceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden -fr=
tti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/icu=
/source/common/servrbf.cpp -o obj.host/third_party/icu/source/common/icuuc.=
servrbf.o
In file included from /usr/include/features.h:399:0,
                 from /usr/include/stdint.h:25,
                 from /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint=
.h:9,
                 from ../../third_party/icu/source/common/unicode/ptypes.h:=
66,
                 from ../../third_party/icu/source/common/unicode/umachine.=
h:44,
                 from ../../third_party/icu/source/common/unicode/utypes.h:=
36,
                 from ../../third_party/icu/source/common/servrbf.cpp:9:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or=
 directory
 # include <gnu/stubs-32.h>
                           ^
compilation terminated.
[9/17943] CXX obj.host/third_party/icu/source/common/icuuc.resource.o
FAILED: obj.host/third_party/icu/source/common/icuuc.resource.o=20
g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.resource.o.d -DU=
_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CONVERSION=
=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSET_BITS=
=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_COMPOS=
ITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -DUSE_D=
EFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_CLIPBOA=
RD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE_PEPPE=
R_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -DFIELDT=
RIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D1 -DEN=
ABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENABLE_THE=
MES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PRINT_PR=
EVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=3D1 -DE=
NABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCOVERY=3D1=
 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL -DU_COMM=
ON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 -DU_NOEX=
CEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBUG -DNVAL=
GRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/source/comm=
on -I../../third_party/icu/source/i18n -Igen -fstack-protector --param=3Dss=
p-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-unused-par=
ameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe -fPIC -W=
no-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-function =
-m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-tables -fn=
o-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines-hidden =
-frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../third_party/=
icu/source/common/resource.cpp -o obj.host/third_party/icu/source/common/ic=
uuc.resource.o
In file included from /usr/include/features.h:399:0,
                 from /usr/include/stdint.h:25,
                 from /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdint=
.h:9,
                 from ../../third_party/icu/source/common/unicode/ptypes.h:=
66,
                 from ../../third_party/icu/source/common/unicode/umachine.=
h:44,
                 from ../../third_party/icu/source/common/unicode/utypes.h:=
36,
                 from ../../third_party/icu/source/common/resource.h:26,
                 from ../../third_party/icu/source/common/resource.cpp:12:
/usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or=
 directory
 # include <gnu/stubs-32.h>
                           ^
compilation terminated.
[10/17943] CXX obj/third_party/icu/source/common/icuuc.uobject.o
[11/17943] CC obj/third_party/icu/source/common/icuuc.ustrfmt.o
[12/17943] CXX obj/third_party/icu/source/common/icuuc.ustack.o
[13/17943] CC obj/third_party/icu/source/common/icuuc.uscript.o
[14/17943] CC obj/third_party/icu/source/common/icuuc.usc_impl.o
[15/17943] CC obj/third_party/icu/source/common/icuuc.utf_impl.o
[16/17943] ACTION Generating download_file_types.pb.
[17/17943] CXX obj/third_party/icu/source/common/icuuc.ustrcase_locale.o
[18/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_titlecase_brk=
iter.o
[19/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_cnv.o
[20/17943] CXX obj/third_party/icu/source/common/icuuc.util.o
[21/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_case_locale.o
[22/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_props.o
[23/17943] CXX obj/third_party/icu/source/common/icuuc.uscript_props.o
[24/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_wcs.o
[25/17943] CXX obj/third_party/icu/source/common/icuuc.unormcmp.o
[26/17943] CXX obj/third_party/icu/source/common/icuuc.uprops.o
[27/17943] CXX obj/third_party/icu/source/common/icuuc.uset_props.o
[28/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_case.o
[29/17943] CXX obj/third_party/icu/source/common/icuuc.ustr_titlecase_brkit=
er.o
[30/17943] CXX obj/third_party/icu/source/common/icuuc.usetiter.o
[31/17943] CXX obj/third_party/icu/source/common/icuuc.unorm.o
[32/17943] CXX obj/third_party/icu/source/common/icuuc.ustring.o
[33/17943] CXX obj/third_party/icu/source/common/icuuc.ushape.o
[34/17943] CXX obj/third_party/icu/source/common/icuuc.uset.o
[35/17943] CXX obj/third_party/icu/source/common/icuuc.unistr_cnv.o
[36/17943] CXX obj/third_party/icu/source/common/icuuc.ustrenum.o
[37/17943] CXX obj/third_party/icu/source/common/icuuc.usprep.o
[38/17943] CXX obj/third_party/icu/source/common/icuuc.ustrcase.o
[39/17943] CXX obj/third_party/icu/source/common/icuuc.ustrtrns.o
[40/17943] CXX obj/third_party/icu/source/common/icuuc.uresdata.o
[41/17943] CXX obj/third_party/icu/source/common/icuuc.utext.o
[42/17943] CXX obj/third_party/icu/source/common/icuuc.unisetspan.o
[43/17943] CXX obj/third_party/icu/source/common/icuuc.uresbund.o
ninja: build stopped: subcommand failed.
WARNING: /build/test/tmp/work/core2-32-poky-linux/chromium/52.0.2743.76-r0/=
temp/run.do_compile.88585:1 exit 1 from 'ninja -C /build/test/tmp/work/core=
2-32-poky-linux/chromium/52.0.2743.76-r0/chromium-52.0.2743.76/out/Release =
-j 40 chrome chrome_sandbox'
ERROR: Function failed: do_compile (log file is located at /build/test/tmp/=
work/core2-32-poky-linux/chromium/52.0.2743.76-r0/temp/log.do_compile.88585=
)


--=20
Michael Davis
Sr. Software Engineer
11128 John Galt Blvd, 3nd floor
Omaha, NE 68137
Telephone:              (402) 938-1374
Fax:                         (402) 970-1275
Toll Free:                 1-800-247-8683

