Return-Path: <prvs=20365e4139=michael.davis@essvote.com>
Received: from m2.essvote.com (m2.essvote.com [66.37.226.14])
	by mail.openembedded.org (Postfix) with ESMTP id BBB0C7326D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:32:51 +0000 (UTC)
X-AuditID: 0a00029b-f79b46d000000dc2-94-57b324125a5e
Received: from ESS-EX01.essvote.corp.local (Unknown_Domain [172.16.110.40])
	by m2.essvote.com (Symantec Messaging Gateway) with SMTP id
	CF.4E.03522.31423B75; Tue, 16 Aug 2016 09:32:51 -0500 (CDT)
Received: from ESS-EX01.essvote.corp.local ([::1]) by
	ESS-EX01.essvote.corp.local ([::1]) with mapi id 14.03.0301.000;
	Tue, 16 Aug 2016 09:32:50 -0500
From: "Davis, Michael" <michael.davis@essvote.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser] Chromium build issue.
Thread-Index: AQHR98sQgIXbVVGYyk2KP8XKXL1f1A==
Date: Tue, 16 Aug 2016 14:32:50 +0000
Message-ID: <12690292.VtMlGpGA8f@localhost.localdomain>
Reply-To: "Davis, Michael" <michael.davis@essvote.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.8.93]
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsWyRiBPQ1dYZXO4wfz7UhbzVk1ktrjw/Q67
	xcXDS5ktulesYHVg8Zix5AWjx7mNKxg9Gvp7GAOYo7htkhJLyoIz0/P07RK4M15sXc1Y0Klb
	sXfDeuYGxlnqXYycHBICJhIf7j9jh7DFJC7cW88GYgsJHGWU2Nzo38XIBWTPYpS4e+IJWIJN
	wEji3PVNjCC2iECsxLxNM5lAipgFWhklbn9axwSSEBbQlZg0vRVoKgdQkZHEzNUOEPV6EkvX
	b2YBsVkEVCWWz70GNpNXwFxi9+xD7BCLzSTaHr4Eq2EEOuj7qTVgI5kFxCVuPZnPBHGogMSS
	PeeZIWxRiZeP/7FC2LIS33ZMYYGo15FYsPsTG4RtJTF38RZGCFtbYtnC18wQewUlTs58wjKB
	UWwWkhWzkLTPQtI+C0n7LCTtCxhZVzHy5RrppRYXl+WXpOol5+duYgRGGhcD0+wdjHsmOBxi
	FOBgVOLhDdDdFC7EmlhWXJl7iFGag0VJnFdFSClcSCA9sSQ1OzW1ILUovqg0J7X4ECMTB+ch
	RgkOLimR4tS8lNSixNKSjHhQdMYXA+NTqoGxIuh9a3yb3pHfy+xMGWZOXhvyrDBTz6jIU5h9
	boDebUfB3Z/Xs4Tx+724uP7+z7hDMf9ufU8VcpEQ4/6fXf/htNoUqbAbAm5/tbpPuLd8cVl8
	SMz/e61U7HanrMus66vcb68M9rZkl1cwD3PdVv3LsXJ/87HjrKbL3d33K3+fatNi15JdLK3E
	UpyRaKjFXFScCABmOrzwsAIAAA==
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"eric@eukrea.com" <eric@eukrea.com>
Subject: [meta-browser] Chromium build issue.
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
X-List-Received-Date: Tue, 16 Aug 2016 14:32:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E91B122402FAAF4EA63A4868AFD32617@essvote.com>
Content-Transfer-Encoding: quoted-printable

I am having a build issue with Chromium ever since the increase to version =
52.  Wanted to check if anyone else was seeing this or if I was just specia=
l like that.
The build system is x86_64 and it is building a x86 Intel target system usi=
ng the HEAD of krogoth branch.
It's strange because it appears to be using my build os gcc and directories=
 not the cross compiler.

| FAILED: g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.servrb=
f.o.d -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CON=
VERSION=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFSE=
T_BITS=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI_=
COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 -=
DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_C=
LIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABLE=
_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -D=
FIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=3D=
1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DENAB=
LE_THEMES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE_PR=
INT_PREVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTION=
=3D1 -DENABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISCO=
VERY=3D1 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL =
-DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0 =
-DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEBU=
G -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/sou=
rce/common -I../../third_party/icu/source/i18n -Igen -fstack-protector --pa=
ram=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-un=
used-parameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe =
-fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-f=
unction -m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-ta=
bles -fno-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inlines=
-hidden -frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../thir=
d_party/icu/source/common/servrbf.cpp -o obj.host/third_party/icu/source/co=
mmon/icuuc.servrbf.o
| In file included from /usr/include/features.h:399:0,
|                  from /usr/include/stdint.h:25,
|                  from /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdi=
nt.h:9,
|                  from ../../third_party/icu/source/common/unicode/ptypes.=
h:66,
|                  from ../../third_party/icu/source/common/unicode/umachin=
e.h:44,
|                  from ../../third_party/icu/source/common/unicode/utypes.=
h:36,
|                  from ../../third_party/icu/source/common/servrbf.cpp:9:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file =
or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| FAILED: g++  -MMD -MF obj.host/third_party/icu/source/common/icuuc.resour=
ce.o.d -DU_USING_ICU_NAMESPACE=3D0 -DHAVE_DLOPEN=3D0 -DUCONFIG_ONLY_HTML_CO=
NVERSION=3D1 -DU_CHARSET_IS_UTF8=3D1 -DV8_DEPRECATION_WARNINGS -D_FILE_OFFS=
ET_BITS=3D64 -DDISABLE_NACL -DU_STATIC_IMPLEMENTATION -DCHROMIUM_BUILD -DUI=
_COMPOSITOR_IMAGE_TRANSPORT -DUSE_AURA=3D1 -DUSE_PANGO=3D1 -DUSE_CAIRO=3D1 =
-DUSE_DEFAULT_RENDER_THEME=3D1 -DUSE_LIBJPEG_TURBO=3D1 -DUSE_X11=3D1 -DUSE_=
CLIPBOARD_AURAX11=3D1 -DENABLE_WEBRTC=3D1 -DENABLE_MEDIA_ROUTER=3D1 -DENABL=
E_PEPPER_CDMS -DENABLE_NOTIFICATIONS -DENABLE_TOPCHROME_MD=3D1 -DUSE_UDEV -=
DFIELDTRIAL_TESTING_ENABLED -DENABLE_TASK_MANAGER=3D1 -DENABLE_EXTENSIONS=
=3D1 -DENABLE_PDF=3D1 -DENABLE_PLUGINS=3D1 -DENABLE_SESSION_SERVICE=3D1 -DE=
NABLE_THEMES=3D1 -DENABLE_PRINTING=3D1 -DENABLE_BASIC_PRINTING=3D1 -DENABLE=
_PRINT_PREVIEW=3D1 -DENABLE_SPELLCHECK=3D1 -DENABLE_CAPTIVE_PORTAL_DETECTIO=
N=3D1 -DENABLE_SUPERVISED_USERS=3D1 -DENABLE_MDNS=3D1 -DENABLE_SERVICE_DISC=
OVERY=3D1 -DFULL_SAFE_BROWSING -DSAFE_BROWSING_CSD -DSAFE_BROWSING_DB_LOCAL=
 -DU_COMMON_IMPLEMENTATION -DU_ICUDATAENTRY_IN_COMMON -DU_ENABLE_DYLOAD=3D0=
 -DU_NOEXCEPT=3D -DUSE_LIBPCI=3D1 -DUSE_GLIB=3D1 -DUSE_NSS_CERTS=3D1 -DNDEB=
UG -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=3D0 -I../../third_party/icu/so=
urce/common -I../../third_party/icu/source/i18n -Igen -fstack-protector --p=
aram=3Dssp-buffer-size=3D4  -pthread -fno-strict-aliasing -Wno-extra -Wno-u=
nused-parameter -Wno-missing-field-initializers -fvisibility=3Dhidden -pipe=
 -fPIC -Wno-unused-local-typedefs -Wno-deprecated-declarations -Wno-unused-=
function -m32 -O2 -fno-ident -fdata-sections -ffunction-sections -funwind-t=
ables -fno-exceptions -fno-rtti -fno-threadsafe-statics -fvisibility-inline=
s-hidden -frtti -Wno-deprecated -std=3Dgnu++11 -Wno-narrowing  -c ../../thi=
rd_party/icu/source/common/resource.cpp -o obj.host/third_party/icu/source/=
common/icuuc.resource.o
| In file included from /usr/include/features.h:399:0,
|                  from /usr/include/stdint.h:25,
|                  from /usr/lib/gcc/x86_64-redhat-linux/4.8.5/include/stdi=
nt.h:9,
|                  from ../../third_party/icu/source/common/unicode/ptypes.=
h:66,
|                  from ../../third_party/icu/source/common/unicode/umachin=
e.h:44,
|                  from ../../third_party/icu/source/common/unicode/utypes.=
h:36,
|                  from ../../third_party/icu/source/common/resource.h:26,
|                  from ../../third_party/icu/source/common/resource.cpp:12=
:
| /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file =
or directory
|  # include <gnu/stubs-32.h>

