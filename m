Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4515C52D7C
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 09:06:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15784.1724231157683880965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Aug 2024 02:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8963eb4839=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47L4OTPh001709
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 09:05:57 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6uxca-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 09:05:56 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 02:05:53 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] poppler: CVE-2024-6239
Date: Wed, 21 Aug 2024 09:05:35 +0000
Message-ID: <20240821090535.1702393-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: _y9M0F4So4FsxOXcOz0lmp1i3vru6n3x
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c5adf4 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8
 a=3fyaaF4VAAAA:8 a=69EAbJreAAAA:8 a=1Xalw8JdAAAA:8 a=c5qZ5hseAAAA:8 a=adCLzVSxAAAA:8 a=DTMSSxG-jYXJ2uFPd_AA:9 a=UUvlH2NyNM_xwBqZ:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=96-UuAdfYG6OSYlHWuPe:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=jOuFdahVONy5WApiBME_:22 a=SFmCVs0O3PHrPH4T2K5Z:22 a=xPetBifu163DGidV9dIZ:22 a=DQGzAmq_EYDXIBPpOZAu:22
X-Proofpoint-GUID: _y9M0F4So4FsxOXcOz0lmp1i3vru6n3x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_07,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408210065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 47L4OTPh001709
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Aug 2024 09:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111882

From: Yogita Urade <yogita.urade@windriver.com>

A flaw was found in the Poppler's Pdfinfo utility. This issue
occurs when using -dests parameter with pdfinfo utility. By
using certain malformed input files, an attacker could cause
the utility to crash, leading to a denial of service.

CVE-2024-6239-0002 is the CVE fix and CVE-2024-6239-0001 is
dependent commit to fix the CVE.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-6239

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/0554731052d1a9774=
5cb179ab0d45620589dd9c4
https://gitlab.freedesktop.org/poppler/poppler/-/commit/fc1c711cb5f769546=
c6b31cc688bf0ee7f0c1dbc

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2024-6239-0001.patch  | 1275 +++++++++++++++++
 .../poppler/poppler/CVE-2024-6239-0002.patch  |  111 ++
 .../poppler/poppler_23.04.0.bb                |    2 +
 3 files changed, 1388 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2024-6239=
-0001.patch
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2024-6239=
-0002.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.p=
atch b/meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.patch
new file mode 100644
index 000000000..9994ce785
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0001.patch
@@ -0,0 +1,1275 @@
+From fc1c711cb5f769546c6b31cc688bf0ee7f0c1dbc Mon Sep 17 00:00:00 2001
+From: Sune Vuorela <sune@vuorela.dk>
+Date: Thu, 1 Feb 2024 19:11:03 +0000
+Subject: [PATCH] More unicode vectors; fewer raw pointers
+
+CVE: CVE-2024-6239
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/popple=
r/-/commit/fc1c711cb5f769546c6b31cc688bf0ee7f0c1dbc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ cpp/poppler-toc.cpp                  |   5 +-
+ glib/poppler-document.cc             |   3 +-
+ poppler/CharCodeToUnicode.cc         | 113 +++++++++------------------
+ poppler/CharCodeToUnicode.h          |  12 ++-
+ poppler/DateInfo.cc                  |  10 +--
+ poppler/JSInfo.cc                    |   9 +--
+ poppler/Outline.cc                   |  12 +--
+ poppler/Outline.h                    |   7 +-
+ poppler/TextOutputDev.cc             |   8 +-
+ poppler/UTF.cc                       |  78 ++++++++----------
+ poppler/UTF.h                        |  11 ++-
+ qt5/src/poppler-outline.cc           |   2 +-
+ qt5/src/poppler-private.cc           |  13 ++-
+ qt5/src/poppler-private.h            |   1 +
+ qt5/tests/check_internal_outline.cpp |   6 +-
+ qt5/tests/check_utf_conversion.cpp   |  24 +++---
+ qt6/src/poppler-outline.cc           |   2 +-
+ qt6/src/poppler-private.cc           |   5 ++
+ qt6/src/poppler-private.h            |   1 +
+ qt6/tests/check_internal_outline.cpp |   6 +-
+ qt6/tests/check_utf_conversion.cpp   |  24 +++---
+ utils/HtmlFonts.cc                   |   4 +-
+ utils/HtmlFonts.h                    |   2 +-
+ utils/HtmlOutputDev.cc               |  38 ++++-----
+ utils/HtmlOutputDev.h                |   2 +-
+ utils/pdfinfo.cc                     |   8 +-
+ utils/pdfsig.cc                      |   8 +-
+ utils/pdftohtml.cc                   |  25 +++---
+ 28 files changed, 183 insertions(+), 256 deletions(-)
+
+diff --git a/cpp/poppler-toc.cpp b/cpp/poppler-toc.cpp
+index c79abde..ed3a983 100644
+--- a/cpp/poppler-toc.cpp
++++ b/cpp/poppler-toc.cpp
+@@ -61,9 +61,8 @@ toc_item_private::~toc_item_private()
+=20
+ void toc_item_private::load(const OutlineItem *item)
+ {
+-    const Unicode *title_unicode =3D item->getTitle();
+-    const int title_length =3D item->getTitleLength();
+-    title =3D detail::unicode_to_ustring(title_unicode, title_length);
++    const std::vector<Unicode> &title_unicode =3D item->getTitle();
++    title =3D detail::unicode_to_ustring(title_unicode.data(), title_un=
icode.size());
+     is_open =3D item->isOpen();
+ }
+=20
+diff --git a/glib/poppler-document.cc b/glib/poppler-document.cc
+index 7505a6f..fdfefdc 100644
+--- a/glib/poppler-document.cc
++++ b/glib/poppler-document.cc
+@@ -2772,7 +2772,8 @@ PopplerAction *poppler_index_iter_get_action(Poppl=
erIndexIter *iter)
+     item =3D (*iter->items)[iter->index];
+     link_action =3D item->getAction();
+=20
+-    title =3D unicode_to_char(item->getTitle(), item->getTitleLength())=
;
++    const std::vector<Unicode> &itemTitle =3D item->getTitle();
++    title =3D unicode_to_char(itemTitle.data(), itemTitle.size());
+=20
+     action =3D _poppler_action_new(iter->document, link_action, title);
+     g_free(title);
+diff --git a/poppler/CharCodeToUnicode.cc b/poppler/CharCodeToUnicode.cc
+index cd00937..d9ef019 100644
+--- a/poppler/CharCodeToUnicode.cc
++++ b/poppler/CharCodeToUnicode.cc
+@@ -38,6 +38,7 @@
+=20
+ #include <cstdio>
+ #include <cstring>
++#include <functional>
+ #include "goo/glibc.h"
+ #include "goo/gmem.h"
+ #include "goo/gfile.h"
+@@ -51,13 +52,6 @@
+=20
+ //---------------------------------------------------------------------=
---
+=20
+-struct CharCodeToUnicodeString
+-{
+-    CharCode c;
+-    Unicode *u;
+-    int len;
+-};
+-
+ //---------------------------------------------------------------------=
---
+=20
+ static int getCharFromString(void *data)
+@@ -162,7 +156,7 @@ CharCodeToUnicode *CharCodeToUnicode::parseCIDToUnic=
ode(const char *fileName, co
+     }
+     fclose(f);
+=20
+-    ctu =3D new CharCodeToUnicode(collection->toStr(), mapA, mapLenA, t=
rue, nullptr, 0, 0);
++    ctu =3D new CharCodeToUnicode(collection->toStr(), mapA, mapLenA, t=
rue, {});
+     gfree(mapA);
+     return ctu;
+ }
+@@ -171,8 +165,7 @@ CharCodeToUnicode *CharCodeToUnicode::parseUnicodeTo=
Unicode(const GooString *fil
+ {
+     FILE *f;
+     Unicode *mapA;
+-    CharCodeToUnicodeString *sMapA;
+-    CharCode size, oldSize, len, sMapSizeA, sMapLenA;
++    CharCode size, oldSize, len;
+     char buf[256];
+     char *tok;
+     Unicode u0;
+@@ -192,8 +185,7 @@ CharCodeToUnicode *CharCodeToUnicode::parseUnicodeTo=
Unicode(const GooString *fil
+     mapA =3D (Unicode *)gmallocn(size, sizeof(Unicode));
+     memset(mapA, 0, size * sizeof(Unicode));
+     len =3D 0;
+-    sMapA =3D nullptr;
+-    sMapSizeA =3D sMapLenA =3D 0;
++    std::vector<CharCodeToUnicodeString> sMapA;
+=20
+     line =3D 0;
+     while (getLine(buf, sizeof(buf), f)) {
+@@ -230,17 +222,12 @@ CharCodeToUnicode *CharCodeToUnicode::parseUnicode=
ToUnicode(const GooString *fil
+             mapA[u0] =3D uBuf[0];
+         } else {
+             mapA[u0] =3D 0;
+-            if (sMapLenA =3D=3D sMapSizeA) {
+-                sMapSizeA +=3D 16;
+-                sMapA =3D (CharCodeToUnicodeString *)greallocn(sMapA, s=
MapSizeA, sizeof(CharCodeToUnicodeString));
+-            }
+-            sMapA[sMapLenA].c =3D u0;
+-            sMapA[sMapLenA].u =3D (Unicode *)gmallocn(n, sizeof(Unicode=
));
++            std::vector<Unicode> u;
++            u.reserve(n);
+             for (i =3D 0; i < n; ++i) {
+-                sMapA[sMapLenA].u[i] =3D uBuf[i];
++                u.push_back(uBuf[i]);
+             }
+-            sMapA[sMapLenA].len =3D n;
+-            ++sMapLenA;
++            sMapA.push_back({ u0, std::move(u) });
+         }
+         if (u0 >=3D len) {
+             len =3D u0 + 1;
+@@ -248,7 +235,7 @@ CharCodeToUnicode *CharCodeToUnicode::parseUnicodeTo=
Unicode(const GooString *fil
+     }
+     fclose(f);
+=20
+-    ctu =3D new CharCodeToUnicode(fileName->toStr(), mapA, len, true, s=
MapA, sMapLenA, sMapSizeA);
++    ctu =3D new CharCodeToUnicode(fileName->toStr(), mapA, len, true, s=
td::move(sMapA));
+     gfree(mapA);
+     gfree(uBuf);
+     return ctu;
+@@ -256,7 +243,7 @@ CharCodeToUnicode *CharCodeToUnicode::parseUnicodeTo=
Unicode(const GooString *fil
+=20
+ CharCodeToUnicode *CharCodeToUnicode::make8BitToUnicode(Unicode *toUnic=
ode)
+ {
+-    return new CharCodeToUnicode({}, toUnicode, 256, true, nullptr, 0, =
0);
++    return new CharCodeToUnicode({}, toUnicode, 256, true, {});
+ }
+=20
+ CharCodeToUnicode *CharCodeToUnicode::parseCMap(const GooString *buf, i=
nt nBits)
+@@ -512,25 +499,18 @@ void CharCodeToUnicode::addMapping(CharCode code, =
char *uStr, int n, int offset)
+             map[code] =3D 0xfffd;
+         }
+     } else {
+-        if (sMapLen >=3D sMapSize) {
+-            sMapSize =3D sMapSize + 16;
+-            sMap =3D (CharCodeToUnicodeString *)greallocn(sMap, sMapSiz=
e, sizeof(CharCodeToUnicodeString));
+-        }
+         map[code] =3D 0;
+-        sMap[sMapLen].c =3D code;
+         int utf16Len =3D n / 4;
+-        Unicode *utf16 =3D (Unicode *)gmallocn(utf16Len, sizeof(Unicode=
));
++        std::vector<Unicode> utf16(utf16Len);
++        utf16.resize(utf16Len);
+         for (j =3D 0; j < utf16Len; ++j) {
+             if (!parseHex(uStr + j * 4, 4, &utf16[j])) {
+-                gfree(utf16);
+                 error(errSyntaxWarning, -1, "Illegal entry in ToUnicode=
 CMap");
+                 return;
+             }
+         }
+         utf16[utf16Len - 1] +=3D offset;
+-        sMap[sMapLen].len =3D UTF16toUCS4(utf16, utf16Len, &sMap[sMapLe=
n].u);
+-        gfree(utf16);
+-        ++sMapLen;
++        sMap.push_back({ code, UTF16toUCS4(utf16.data(), utf16.size()) =
});
+     }
+ }
+=20
+@@ -561,8 +541,6 @@ CharCodeToUnicode::CharCodeToUnicode()
+ {
+     map =3D nullptr;
+     mapLen =3D 0;
+-    sMap =3D nullptr;
+-    sMapLen =3D sMapSize =3D 0;
+     refCnt =3D 1;
+     isIdentity =3D false;
+ }
+@@ -576,13 +554,11 @@ CharCodeToUnicode::CharCodeToUnicode(const std::op=
tional<std::string> &tagA) : t
+     for (i =3D 0; i < mapLen; ++i) {
+         map[i] =3D 0;
+     }
+-    sMap =3D nullptr;
+-    sMapLen =3D sMapSize =3D 0;
+     refCnt =3D 1;
+     isIdentity =3D false;
+ }
+=20
+-CharCodeToUnicode::CharCodeToUnicode(const std::optional<std::string> &=
tagA, Unicode *mapA, CharCode mapLenA, bool copyMap, CharCodeToUnicodeStr=
ing *sMapA, int sMapLenA, int sMapSizeA) : tag(tagA)
++CharCodeToUnicode::CharCodeToUnicode(const std::optional<std::string> &=
tagA, Unicode *mapA, CharCode mapLenA, bool copyMap, std::vector<CharCode=
ToUnicodeString> &&sMapA) : tag(tagA)
+ {
+     mapLen =3D mapLenA;
+     if (copyMap) {
+@@ -591,9 +567,7 @@ CharCodeToUnicode::CharCodeToUnicode(const std::opti=
onal<std::string> &tagA, Uni
+     } else {
+         map =3D mapA;
+     }
+-    sMap =3D sMapA;
+-    sMapLen =3D sMapLenA;
+-    sMapSize =3D sMapSizeA;
++    sMap =3D std::move(sMapA);
+     refCnt =3D 1;
+     isIdentity =3D false;
+ }
+@@ -601,12 +575,6 @@ CharCodeToUnicode::CharCodeToUnicode(const std::opt=
ional<std::string> &tagA, Uni
+ CharCodeToUnicode::~CharCodeToUnicode()
+ {
+     gfree(map);
+-    if (sMap) {
+-        for (int i =3D 0; i < sMapLen; ++i) {
+-            gfree(sMap[i].u);
+-        }
+-        gfree(sMap);
+-    }
+ }
+=20
+ void CharCodeToUnicode::incRefCnt()
+@@ -628,7 +596,8 @@ bool CharCodeToUnicode::match(const GooString *tagA)
+=20
+ void CharCodeToUnicode::setMapping(CharCode c, Unicode *u, int len)
+ {
+-    int i, j;
++    size_t i;
++    int j;
+=20
+     if (!map || isIdentity) {
+         return;
+@@ -636,28 +605,26 @@ void CharCodeToUnicode::setMapping(CharCode c, Uni=
code *u, int len)
+     if (len =3D=3D 1) {
+         map[c] =3D u[0];
+     } else {
+-        for (i =3D 0; i < sMapLen; ++i) {
++        std::optional<std::reference_wrapper<CharCodeToUnicodeString>> =
element;
++        for (i =3D 0; i < sMap.size(); ++i) {
+             if (sMap[i].c =3D=3D c) {
+-                gfree(sMap[i].u);
++                sMap[i].u.clear();
++                element =3D std::ref(sMap[i]);
+                 break;
+             }
+         }
+-        if (i =3D=3D sMapLen) {
+-            if (sMapLen =3D=3D sMapSize) {
+-                sMapSize +=3D 8;
+-                sMap =3D (CharCodeToUnicodeString *)greallocn(sMap, sMa=
pSize, sizeof(CharCodeToUnicodeString));
+-            }
+-            ++sMapLen;
++        if (!element) {
++            sMap.emplace_back(CharCodeToUnicodeString { c, {} });
++            element =3D std::ref(sMap.back());
+         }
+         map[c] =3D 0;
+-        sMap[i].c =3D c;
+-        sMap[i].len =3D len;
+-        sMap[i].u =3D (Unicode *)gmallocn(len, sizeof(Unicode));
++        element->get().c =3D c;
++        element->get().u.reserve(len);
+         for (j =3D 0; j < len; ++j) {
+             if (UnicodeIsValid(u[j])) {
+-                sMap[i].u[j] =3D u[j];
++                element->get().u.push_back(u[j]);
+             } else {
+-                sMap[i].u[j] =3D 0xfffd;
++                element->get().u.push_back(0xfffd);
+             }
+         }
+     }
+@@ -665,8 +632,6 @@ void CharCodeToUnicode::setMapping(CharCode c, Unico=
de *u, int len)
+=20
+ int CharCodeToUnicode::mapToUnicode(CharCode c, Unicode const **u) cons=
t
+ {
+-    int i;
+-
+     if (isIdentity) {
+         map[0] =3D (Unicode)c;
+         *u =3D map;
+@@ -679,10 +644,10 @@ int CharCodeToUnicode::mapToUnicode(CharCode c, Un=
icode const **u) const
+         *u =3D &map[c];
+         return 1;
+     }
+-    for (i =3D sMapLen - 1; i >=3D 0; --i) { // in reverse so CMap take=
s precedence
+-        if (sMap[i].c =3D=3D c) {
+-            *u =3D sMap[i].u;
+-            return sMap[i].len;
++    for (auto i =3D sMap.size(); i > 0; --i) { // in reverse so CMap ta=
kes precedence
++        if (sMap[i - 1].c =3D=3D c) {
++            *u =3D sMap[i - 1].u.data();
++            return sMap[i - 1].u.size();
+         }
+     }
+     return 0;
+@@ -704,24 +669,24 @@ int CharCodeToUnicode::mapToCharCode(const Unicode=
 *u, CharCode *c, int usize) c
+         }
+         *c =3D 'x';
+     } else {
+-        int i, j;
++        size_t j;
+         // for each entry in the sMap
+-        for (i =3D 0; i < sMapLen; i++) {
++        for (const auto &element : sMap) {
+             // if the entry's unicode length isn't the same are usize, =
the strings
+             // are obviously different
+-            if (sMap[i].len !=3D usize) {
++            if (element.u.size() !=3D size_t(usize)) {
+                 continue;
+             }
+             // compare the string char by char
+-            for (j =3D 0; j < sMap[i].len; j++) {
+-                if (sMap[i].u[j] !=3D u[j]) {
++            for (j =3D 0; j < element.u.size(); j++) {
++                if (element.u[j] !=3D u[j]) {
+                     break;
+                 }
+             }
+=20
+             // we have the same strings
+-            if (j =3D=3D sMap[i].len) {
+-                *c =3D sMap[i].c;
++            if (j =3D=3D element.u.size()) {
++                *c =3D element.c;
+                 return 1;
+             }
+         }
+diff --git a/poppler/CharCodeToUnicode.h b/poppler/CharCodeToUnicode.h
+index 596d44d..9aa2571 100644
+--- a/poppler/CharCodeToUnicode.h
++++ b/poppler/CharCodeToUnicode.h
+@@ -33,11 +33,11 @@
+=20
+ #include <atomic>
+ #include <optional>
++#include <vector>
+=20
+ #include "poppler-config.h"
+ #include "CharTypes.h"
+=20
+-struct CharCodeToUnicodeString;
+ class GooString;
+=20
+ //---------------------------------------------------------------------=
---
+@@ -100,18 +100,22 @@ public:
+     CharCode getLength() const { return mapLen; }
+=20
+ private:
++    struct CharCodeToUnicodeString
++    {
++        CharCode c;
++        std::vector<Unicode> u;
++    };
+     bool parseCMap1(int (*getCharFunc)(void *), void *data, int nBits);
+     void addMapping(CharCode code, char *uStr, int n, int offset);
+     void addMappingInt(CharCode code, Unicode u);
+     CharCodeToUnicode();
+     explicit CharCodeToUnicode(const std::optional<std::string> &tagA);
+-    CharCodeToUnicode(const std::optional<std::string> &tagA, Unicode *=
mapA, CharCode mapLenA, bool copyMap, CharCodeToUnicodeString *sMapA, int=
 sMapLenA, int sMapSizeA);
++    CharCodeToUnicode(const std::optional<std::string> &tagA, Unicode *=
mapA, CharCode mapLenA, bool copyMap, std::vector<CharCodeToUnicodeString=
> &&sMapA);
+=20
+     const std::optional<std::string> tag;
+     Unicode *map;
+     CharCode mapLen;
+-    CharCodeToUnicodeString *sMap;
+-    int sMapLen, sMapSize;
++    std::vector<CharCodeToUnicodeString> sMap;
+     std::atomic_int refCnt;
+     bool isIdentity;
+ };
+diff --git a/poppler/DateInfo.cc b/poppler/DateInfo.cc
+index cdba4ab..28474de 100644
+--- a/poppler/DateInfo.cc
++++ b/poppler/DateInfo.cc
+@@ -36,16 +36,14 @@
+ /* See PDF Reference 1.3, Section 3.8.2 for PDF Date representation */
+ bool parseDateString(const GooString *date, int *year, int *month, int =
*day, int *hour, int *minute, int *second, char *tz, int *tzHour, int *tz=
Minute)
+ {
+-    Unicode *u;
+-    int len =3D TextStringToUCS4(date->toStr(), &u);
++    std::vector<Unicode> u =3D TextStringToUCS4(date->toStr());
+     GooString s;
+-    for (int i =3D 0; i < len; i++) {
++    for (auto &c : u) {
+         // Ignore any non ASCII characters
+-        if (u[i] < 128) {
+-            s.append(u[i]);
++        if (c < 128) {
++            s.append(c);
+         }
+     }
+-    gfree(u);
+     const char *dateString =3D s.c_str();
+=20
+     if (strlen(dateString) < 2) {
+diff --git a/poppler/JSInfo.cc b/poppler/JSInfo.cc
+index 29fa707..eaef33e 100644
+--- a/poppler/JSInfo.cc
++++ b/poppler/JSInfo.cc
+@@ -38,20 +38,17 @@ JSInfo::~JSInfo() { }
+=20
+ void JSInfo::printJS(const GooString *js)
+ {
+-    Unicode *u =3D nullptr;
+     char buf[8];
+-    int i, n, len;
+=20
+     if (!js || !js->c_str()) {
+         return;
+     }
+=20
+-    len =3D TextStringToUCS4(js->toStr(), &u);
+-    for (i =3D 0; i < len; i++) {
+-        n =3D uniMap->mapUnicode(u[i], buf, sizeof(buf));
++    std::vector<Unicode> u =3D TextStringToUCS4(js->toStr());
++    for (auto &c : u) {
++        int n =3D uniMap->mapUnicode(c, buf, sizeof(buf));
+         fwrite(buf, 1, n, file);
+     }
+-    gfree(u);
+ }
+=20
+ void JSInfo::scanLinkAction(LinkAction *link, const char *action)
+diff --git a/poppler/Outline.cc b/poppler/Outline.cc
+index 4c68be9..086c104 100644
+--- a/poppler/Outline.cc
++++ b/poppler/Outline.cc
+@@ -407,15 +407,12 @@ OutlineItem::OutlineItem(const Dict *dict, Ref ref=
A, OutlineItem *parentA, XRef
+     parent =3D parentA;
+     xref =3D xrefA;
+     doc =3D docA;
+-    title =3D nullptr;
+     kids =3D nullptr;
+=20
+     obj1 =3D dict->lookup("Title");
+     if (obj1.isString()) {
+         const GooString *s =3D obj1.getString();
+-        titleLen =3D TextStringToUCS4(s->toStr(), &title);
+-    } else {
+-        titleLen =3D 0;
++        title =3D TextStringToUCS4(s->toStr());
+     }
+=20
+     obj1 =3D dict->lookup("Dest");
+@@ -446,9 +443,6 @@ OutlineItem::~OutlineItem()
+         delete kids;
+         kids =3D nullptr;
+     }
+-    if (title) {
+-        gfree(title);
+-    }
+ }
+=20
+ std::vector<OutlineItem *> *OutlineItem::readItemList(OutlineItem *pare=
nt, const Object *firstItemRef, XRef *xrefA, PDFDoc *docA)
+@@ -494,11 +488,9 @@ void OutlineItem::open()
+=20
+ void OutlineItem::setTitle(const std::string &titleA)
+ {
+-    gfree(title);
+-
+     Object dict =3D xref->fetch(ref);
+     GooString *g =3D new GooString(titleA);
+-    titleLen =3D TextStringToUCS4(g->toStr(), &title);
++    title =3D TextStringToUCS4(g->toStr());
+     dict.dictSet("Title", Object(g));
+     xref->setModifiedObject(&dict, ref);
+ }
+diff --git a/poppler/Outline.h b/poppler/Outline.h
+index a301604..af431f6 100644
+--- a/poppler/Outline.h
++++ b/poppler/Outline.h
+@@ -27,6 +27,7 @@
+ #define OUTLINE_H
+=20
+ #include <memory>
++#include <vector>
+ #include "Object.h"
+ #include "CharTypes.h"
+ #include "poppler_private_export.h"
+@@ -91,9 +92,8 @@ public:
+     OutlineItem(const OutlineItem &) =3D delete;
+     OutlineItem &operator=3D(const OutlineItem &) =3D delete;
+     static std::vector<OutlineItem *> *readItemList(OutlineItem *parent=
, const Object *firstItemRef, XRef *xrefA, PDFDoc *docA);
+-    const Unicode *getTitle() const { return title; }
++    const std::vector<Unicode> &getTitle() const { return title; }
+     void setTitle(const std::string &titleA);
+-    int getTitleLength() const { return titleLen; }
+     bool setPageDest(int i);
+     // OutlineItem keeps the ownership of the action
+     const LinkAction *getAction() const { return action.get(); }
+@@ -112,8 +112,7 @@ private:
+     OutlineItem *parent;
+     PDFDoc *doc;
+     XRef *xref;
+-    Unicode *title;
+-    int titleLen;
++    std::vector<Unicode> title;
+     std::unique_ptr<LinkAction> action;
+     bool startsOpen;
+     std::vector<OutlineItem *> *kids; // nullptr if this item is closed=
 or has no kids
+diff --git a/poppler/TextOutputDev.cc b/poppler/TextOutputDev.cc
+index 06fc307..ee11fcb 100644
+--- a/poppler/TextOutputDev.cc
++++ b/poppler/TextOutputDev.cc
+@@ -5668,15 +5668,11 @@ void ActualText::end(const GfxState *state)
+     // extents of all the glyphs inside the span
+=20
+     if (actualTextNBytes) {
+-        Unicode *uni =3D nullptr;
+-        int length;
+-
+         // now that we have the position info for all of the text insid=
e
+         // the marked content span, we feed the "ActualText" back throu=
gh
+         // text->addChar()
+-        length =3D TextStringToUCS4(actualText->toStr(), &uni);
+-        text->addChar(state, actualTextX0, actualTextY0, actualTextX1 -=
 actualTextX0, actualTextY1 - actualTextY0, 0, actualTextNBytes, uni, len=
gth);
+-        gfree(uni);
++        std::vector<Unicode> uni =3D TextStringToUCS4(actualText->toStr=
());
++        text->addChar(state, actualTextX0, actualTextY0, actualTextX1 -=
 actualTextX0, actualTextY1 - actualTextY0, 0, actualTextNBytes, uni.data=
(), uni.size());
+     }
+=20
+     delete actualText;
+diff --git a/poppler/UTF.cc b/poppler/UTF.cc
+index 9b1bf95..eb542eb 100644
+--- a/poppler/UTF.cc
++++ b/poppler/UTF.cc
+@@ -42,65 +42,52 @@ bool UnicodeIsValid(Unicode ucs4)
+     return (ucs4 < 0x110000) && ((ucs4 & 0xfffff800) !=3D 0xd800) && (u=
cs4 < 0xfdd0 || ucs4 > 0xfdef) && ((ucs4 & 0xfffe) !=3D 0xfffe);
+ }
+=20
+-int UTF16toUCS4(const Unicode *utf16, int utf16Len, Unicode **ucs4_out)
++std::vector<Unicode> UTF16toUCS4(const Unicode *utf16, int utf16Len)
+ {
+-    int i, n, len;
+-    Unicode *u;
+-
+     // count characters
+-    len =3D 0;
+-    for (i =3D 0; i < utf16Len; i++) {
++    int len =3D 0;
++    for (int i =3D 0; i < utf16Len; i++) {
+         if (utf16[i] >=3D 0xd800 && utf16[i] < 0xdc00 && i + 1 < utf16L=
en && utf16[i + 1] >=3D 0xdc00 && utf16[i + 1] < 0xe000) {
+             i++; /* surrogate pair */
+         }
+         len++;
+     }
+-    if (ucs4_out =3D=3D nullptr) {
+-        return len;
+-    }
+-
+-    u =3D (Unicode *)gmallocn(len, sizeof(Unicode));
+-    n =3D 0;
++    std::vector<Unicode> u;
++    u.reserve(len);
+     // convert string
+-    for (i =3D 0; i < utf16Len; i++) {
++    for (int i =3D 0; i < utf16Len; i++) {
+         if (utf16[i] >=3D 0xd800 && utf16[i] < 0xdc00) { /* surrogate p=
air */
+             if (i + 1 < utf16Len && utf16[i + 1] >=3D 0xdc00 && utf16[i=
 + 1] < 0xe000) {
+                 /* next code is a low surrogate */
+-                u[n] =3D (((utf16[i] & 0x3ff) << 10) | (utf16[i + 1] & =
0x3ff)) + 0x10000;
++                u.push_back((((utf16[i] & 0x3ff) << 10) | (utf16[i + 1]=
 & 0x3ff)) + 0x10000);
+                 ++i;
+             } else {
+                 /* missing low surrogate
+                    replace it with REPLACEMENT CHARACTER (U+FFFD) */
+-                u[n] =3D 0xfffd;
++                u.push_back(0xfffd);
+             }
+         } else if (utf16[i] >=3D 0xdc00 && utf16[i] < 0xe000) {
+             /* invalid low surrogate
+                replace it with REPLACEMENT CHARACTER (U+FFFD) */
+-            u[n] =3D 0xfffd;
++            u.push_back(0xfffd);
+         } else {
+-            u[n] =3D utf16[i];
++            u.push_back(utf16[i]);
+         }
+-        if (!UnicodeIsValid(u[n])) {
+-            u[n] =3D 0xfffd;
++        if (!UnicodeIsValid(u.back())) {
++            u.back() =3D 0xfffd;
+         }
+-        n++;
+     }
+-    *ucs4_out =3D u;
+-    return len;
++    return u;
+ }
+=20
+-int TextStringToUCS4(const std::string &textStr, Unicode **ucs4)
++std::vector<Unicode> TextStringToUCS4(const std::string &textStr)
+ {
+-    int i, len;
+-    const char *s;
+-    Unicode *u;
+     bool isUnicode, isUnicodeLE;
+=20
+-    len =3D textStr.size();
+-    s =3D textStr.c_str();
++    int len =3D textStr.size();
++    const std::string &s =3D textStr;
+     if (len =3D=3D 0) {
+-        *ucs4 =3D nullptr;
+-        return 0;
++        return {};
+     }
+=20
+     if (GooString::hasUnicodeMarker(textStr)) {
+@@ -115,30 +102,30 @@ int TextStringToUCS4(const std::string &textStr, U=
nicode **ucs4)
+     }
+=20
+     if (isUnicode || isUnicodeLE) {
+-        Unicode *utf16;
+         len =3D len / 2 - 1;
+         if (len > 0) {
+-            utf16 =3D new Unicode[len];
+-            for (i =3D 0; i < len; i++) {
++            std::vector<Unicode> utf16;
++            utf16.reserve(len);
++            for (int i =3D 0; i < len; i++) {
+                 if (isUnicode) {
+-                    utf16[i] =3D (s[2 + i * 2] & 0xff) << 8 | (s[3 + i =
* 2] & 0xff);
++                    utf16.push_back((s[2 + i * 2] & 0xff) << 8 | (s[3 +=
 i * 2] & 0xff));
+                 } else { // UnicodeLE
+-                    utf16[i] =3D (s[3 + i * 2] & 0xff) << 8 | (s[2 + i =
* 2] & 0xff);
++                    utf16.push_back((s[3 + i * 2] & 0xff) << 8 | (s[2 +=
 i * 2] & 0xff));
+                 }
+             }
+-            len =3D UTF16toUCS4(utf16, len, &u);
+-            delete[] utf16;
++            return UTF16toUCS4(utf16.data(), utf16.size());
++
+         } else {
+-            u =3D nullptr;
++            return {};
+         }
+     } else {
+-        u =3D (Unicode *)gmallocn(len, sizeof(Unicode));
+-        for (i =3D 0; i < len; i++) {
+-            u[i] =3D pdfDocEncoding[s[i] & 0xff];
++        std::vector<Unicode> u;
++        u.reserve(len);
++        for (int i =3D 0; i < len; i++) {
++            u.push_back(pdfDocEncoding[s[i] & 0xff]);
+         }
++        return u;
+     }
+-    *ucs4 =3D u;
+-    return len;
+ }
+=20
+ bool UnicodeIsWhitespace(Unicode ucs4)
+@@ -549,7 +536,10 @@ void unicodeToAscii7(const Unicode *in, int len, Un=
icode **ucs4_out, int *out_le
+         }
+     }
+=20
+-    *out_len =3D TextStringToUCS4(str, ucs4_out);
++    std::vector<Unicode> ucs4 =3D TextStringToUCS4(str);
++    *out_len =3D ucs4.size();
++    *ucs4_out =3D (Unicode *)gmallocn(ucs4.size(), sizeof(Unicode));
++    memcpy(*ucs4_out, ucs4.data(), ucs4.size() * sizeof(Unicode));
+=20
+     if (indices) {
+         idx[k] =3D in_idx[len];
+diff --git a/poppler/UTF.h b/poppler/UTF.h
+index 626c686..bfc5f65 100644
+--- a/poppler/UTF.h
++++ b/poppler/UTF.h
+@@ -19,6 +19,7 @@
+ #include <cstdint>
+ #include <climits>
+ #include <memory>
++#include <vector>
+=20
+ #include "goo/GooString.h"
+ #include "CharTypes.h"
+@@ -27,16 +28,14 @@
+ // Convert a UTF-16 string to a UCS-4
+ //   utf16      - utf16 bytes
+ //   utf16_len  - number of UTF-16 characters
+-//   ucs4_out   - if not NULL, allocates and returns UCS-4 string. Free=
 with gfree.
+ //   returns number of UCS-4 characters
+-int UTF16toUCS4(const Unicode *utf16, int utf16Len, Unicode **ucs4_out)=
;
++std::vector<Unicode> UTF16toUCS4(const Unicode *utf16, int utf16Len);
+=20
+ // Convert a PDF Text String to UCS-4
+ //   s          - PDF text string
+-//   ucs4       - if the number of UCS-4 characters is > 0, allocates a=
nd
+-//                returns UCS-4 string. Free with gfree.
+-//   returns number of UCS-4 characters
+-int POPPLER_PRIVATE_EXPORT TextStringToUCS4(const std::string &textStr,=
 Unicode **ucs4);
++//   returns UCS-4 characters
++// Convert a PDF text string to UCS-4
++std::vector<Unicode> POPPLER_PRIVATE_EXPORT TextStringToUCS4(const std:=
:string &textStr);
+=20
+ // check if UCS-4 character is valid
+ bool UnicodeIsValid(Unicode ucs4);
+diff --git a/qt5/src/poppler-outline.cc b/qt5/src/poppler-outline.cc
+index 5ff7e37..2f6ef2d 100644
+--- a/qt5/src/poppler-outline.cc
++++ b/qt5/src/poppler-outline.cc
+@@ -78,7 +78,7 @@ QString OutlineItem::name() const
+=20
+     if (name.isEmpty()) {
+         if (const ::OutlineItem *data =3D m_data->data) {
+-            name =3D unicodeToQString(data->getTitle(), data->getTitleL=
ength());
++            name =3D unicodeToQString(data->getTitle());
+         }
+     }
+=20
+diff --git a/qt5/src/poppler-private.cc b/qt5/src/poppler-private.cc
+index 228d8e8..54df79f 100644
+--- a/qt5/src/poppler-private.cc
++++ b/qt5/src/poppler-private.cc
+@@ -94,6 +94,11 @@ QString unicodeToQString(const Unicode *u, int len)
+     return QString::fromUtf8(convertedStr.c_str(), convertedStr.getLeng=
th());
+ }
+=20
++QString unicodeToQString(const std::vector<Unicode> &u)
++{
++    return unicodeToQString(u.data(), u.size());
++}
++
+ QString UnicodeParsedString(const GooString *s1)
+ {
+     return (s1) ? UnicodeParsedString(s1->toStr()) : QString();
+@@ -266,13 +271,7 @@ void DocumentData::addTocChildren(QDomDocument *doc=
Syn, QDomNode *parent, const
+         // iterate over every object in 'items'
+=20
+         // 1. create element using outlineItem's title as tagName
+-        QString name;
+-        const Unicode *uniChar =3D outlineItem->getTitle();
+-        int titleLength =3D outlineItem->getTitleLength();
+-        name =3D unicodeToQString(uniChar, titleLength);
+-        if (name.isEmpty()) {
+-            continue;
+-        }
++        QString name =3D unicodeToQString(outlineItem->getTitle());
+=20
+         QDomElement item =3D docSyn->createElement(name);
+         parent->appendChild(item);
+diff --git a/qt5/src/poppler-private.h b/qt5/src/poppler-private.h
+index 39dfb6b..bba5bd7 100644
+--- a/qt5/src/poppler-private.h
++++ b/qt5/src/poppler-private.h
+@@ -73,6 +73,7 @@ namespace Poppler {
+=20
+ /* borrowed from kpdf */
+ POPPLER_QT5_EXPORT QString unicodeToQString(const Unicode *u, int len);
++POPPLER_QT5_EXPORT QString unicodeToQString(const std::vector<Unicode> =
&u);
+=20
+ POPPLER_QT5_EXPORT QString UnicodeParsedString(const GooString *s1);
+=20
+diff --git a/qt5/tests/check_internal_outline.cpp b/qt5/tests/check_inte=
rnal_outline.cpp
+index c12b604..5db6bf4 100644
+--- a/qt5/tests/check_internal_outline.cpp
++++ b/qt5/tests/check_internal_outline.cpp
+@@ -56,10 +56,10 @@ void TestInternalOutline::testCreateOutline()
+=20
+ static std::string getTitle(const OutlineItem *item)
+ {
+-    const Unicode *u =3D item->getTitle();
++    std::vector<Unicode> u =3D item->getTitle();
+     std::string s;
+-    for (int i =3D 0; i < item->getTitleLength(); i++) {
+-        s.append(1, (char)u[i]);
++    for (auto &c : u) {
++        s.append(1, (char)(c));
+     }
+     return s;
+ }
+diff --git a/qt5/tests/check_utf_conversion.cpp b/qt5/tests/check_utf_co=
nversion.cpp
+index 73c684e..b00f080 100644
+--- a/qt5/tests/check_utf_conversion.cpp
++++ b/qt5/tests/check_utf_conversion.cpp
+@@ -133,16 +133,13 @@ void TestUTFConversion::testUnicodeToAscii7()
+     // malloc() always returns 8-byte aligned memory addresses.
+     GooString *goo =3D Poppler::QStringToUnicodeGooString(QString::from=
Utf8("=C2=AE=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=
=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9")); // clazy:ex=
clude=3Dqstring-allocations
+=20
+-    Unicode *in;
+-    const int in_len =3D TextStringToUCS4(goo->toStr(), &in);
++    const std::vector<Unicode> in =3D TextStringToUCS4(goo->toStr());
+=20
+     delete goo;
+=20
+     int in_norm_len;
+     int *in_norm_idx;
+-    Unicode *in_norm =3D unicodeNormalizeNFKC(in, in_len, &in_norm_len,=
 &in_norm_idx, true);
+-
+-    free(in);
++    Unicode *in_norm =3D unicodeNormalizeNFKC(in.data(), in.size(), &in=
_norm_len, &in_norm_idx, true);
+=20
+     Unicode *out;
+     int out_len;
+@@ -174,25 +171,24 @@ void TestUTFConversion::testUnicodeLittleEndian()
+     // Let's assert both GooString's are different
+     QVERIFY(GooUTF16LE !=3D GooUTF16BE);
+=20
+-    Unicode *UCS4fromLE, *UCS4fromBE;
+-    const int len1 =3D TextStringToUCS4(GooUTF16LE, &UCS4fromLE);
+-    const int len2 =3D TextStringToUCS4(GooUTF16BE, &UCS4fromBE);
++    const std::vector<Unicode> UCS4fromLE =3D TextStringToUCS4(GooUTF16=
LE);
++    const std::vector<Unicode> UCS4fromBE =3D TextStringToUCS4(GooUTF16=
BE);
+=20
+     // len is 4 because TextStringToUCS4() removes the two leading Byte=
 Order Mark (BOM) code points
+-    QCOMPARE(len1, len2);
+-    QCOMPARE(len1, 4);
++    QCOMPARE(UCS4fromLE.size(), UCS4fromBE.size());
++    QCOMPARE(UCS4fromLE.size(), 4);
+=20
+     // Check that now after conversion, UCS4fromLE and UCS4fromBE are n=
ow the same
+-    for (int i =3D 0; i < len1; i++) {
++    for (size_t i =3D 0; i < UCS4fromLE.size(); i++) {
+         QCOMPARE(UCS4fromLE[i], UCS4fromBE[i]);
+     }
+=20
+     const QString expected =3D QString::fromUtf8("HI!=E2=98=91"); // cl=
azy:exclude=3Dqstring-allocations
+=20
+     // Do some final verifications, checking the strings to be "HI!"
+-    QVERIFY(*UCS4fromLE =3D=3D *UCS4fromBE);
+-    QVERIFY(compare(UCS4fromLE, expected.utf16(), len1));
+-    QVERIFY(compare(UCS4fromBE, expected.utf16(), len1));
++    QVERIFY(UCS4fromLE =3D=3D UCS4fromBE);
++    QVERIFY(compare(UCS4fromLE.data(), expected.utf16(), UCS4fromLE.siz=
e()));
++    QVERIFY(compare(UCS4fromBE.data(), expected.utf16(), UCS4fromLE.siz=
e()));
+ }
+=20
+ QTEST_GUILESS_MAIN(TestUTFConversion)
+diff --git a/qt6/src/poppler-outline.cc b/qt6/src/poppler-outline.cc
+index f5ba2a9..2bc0d30 100644
+--- a/qt6/src/poppler-outline.cc
++++ b/qt6/src/poppler-outline.cc
+@@ -78,7 +78,7 @@ QString OutlineItem::name() const
+=20
+     if (name.isEmpty()) {
+         if (const ::OutlineItem *data =3D m_data->data) {
+-            name =3D unicodeToQString(data->getTitle(), data->getTitleL=
ength());
++            name =3D unicodeToQString(data->getTitle());
+         }
+     }
+=20
+diff --git a/qt6/src/poppler-private.cc b/qt6/src/poppler-private.cc
+index 91d1725..2cb2396 100644
+--- a/qt6/src/poppler-private.cc
++++ b/qt6/src/poppler-private.cc
+@@ -94,6 +94,11 @@ QString unicodeToQString(const Unicode *u, int len)
+     return QString::fromUtf8(convertedStr.c_str(), convertedStr.getLeng=
th());
+ }
+=20
++QString unicodeToQString(const std::vector<Unicode> &u)
++{
++    return unicodeToQString(u.data(), u.size());
++}
++
+ QString UnicodeParsedString(const GooString *s1)
+ {
+     return (s1) ? UnicodeParsedString(s1->toStr()) : QString();
+diff --git a/qt6/src/poppler-private.h b/qt6/src/poppler-private.h
+index d1f7335..a3117a6 100644
+--- a/qt6/src/poppler-private.h
++++ b/qt6/src/poppler-private.h
+@@ -72,6 +72,7 @@ namespace Poppler {
+=20
+ /* borrowed from kpdf */
+ POPPLER_QT6_EXPORT QString unicodeToQString(const Unicode *u, int len);
++POPPLER_QT6_EXPORT QString unicodeToQString(const std::vector<Unicode> =
&u);
+=20
+ POPPLER_QT6_EXPORT QString UnicodeParsedString(const GooString *s1);
+=20
+diff --git a/qt6/tests/check_internal_outline.cpp b/qt6/tests/check_inte=
rnal_outline.cpp
+index c12b604..d23e773 100644
+--- a/qt6/tests/check_internal_outline.cpp
++++ b/qt6/tests/check_internal_outline.cpp
+@@ -56,10 +56,10 @@ void TestInternalOutline::testCreateOutline()
+=20
+ static std::string getTitle(const OutlineItem *item)
+ {
+-    const Unicode *u =3D item->getTitle();
++    const std::vector<Unicode> &u =3D item->getTitle();
+     std::string s;
+-    for (int i =3D 0; i < item->getTitleLength(); i++) {
+-        s.append(1, (char)u[i]);
++    for (const auto &c : u) {
++        s.append(1, (char)(c));
+     }
+     return s;
+ }
+diff --git a/qt6/tests/check_utf_conversion.cpp b/qt6/tests/check_utf_co=
nversion.cpp
+index 2cac758..e7f35ea 100644
+--- a/qt6/tests/check_utf_conversion.cpp
++++ b/qt6/tests/check_utf_conversion.cpp
+@@ -131,16 +131,13 @@ void TestUTFConversion::testUnicodeToAscii7()
+     // malloc() always returns 8-byte aligned memory addresses.
+     GooString *goo =3D Poppler::QStringToUnicodeGooString(QString::from=
Utf8("=C2=AE=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=
=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9=C2=A9")); // clazy:ex=
clude=3Dqstring-allocations
+=20
+-    Unicode *in;
+-    const int in_len =3D TextStringToUCS4(goo->toStr(), &in);
++    const std::vector<Unicode> in =3D TextStringToUCS4(goo->toStr());
+=20
+     delete goo;
+=20
+     int in_norm_len;
+     int *in_norm_idx;
+-    Unicode *in_norm =3D unicodeNormalizeNFKC(in, in_len, &in_norm_len,=
 &in_norm_idx, true);
+-
+-    free(in);
++    Unicode *in_norm =3D unicodeNormalizeNFKC(in.data(), in.size(), &in=
_norm_len, &in_norm_idx, true);
+=20
+     Unicode *out;
+     int out_len;
+@@ -172,25 +169,24 @@ void TestUTFConversion::testUnicodeLittleEndian()
+     // Let's assert both GooString's are different
+     QVERIFY(GooUTF16LE !=3D GooUTF16BE);
+=20
+-    Unicode *UCS4fromLE, *UCS4fromBE;
+-    const int len1 =3D TextStringToUCS4(GooUTF16LE, &UCS4fromLE);
+-    const int len2 =3D TextStringToUCS4(GooUTF16BE, &UCS4fromBE);
++    const std::vector<Unicode> UCS4fromLE =3D TextStringToUCS4(GooUTF16=
LE);
++    const std::vector<Unicode> UCS4fromBE =3D TextStringToUCS4(GooUTF16=
BE);
+=20
+     // len is 4 because TextStringToUCS4() removes the two leading Byte=
 Order Mark (BOM) code points
+-    QCOMPARE(len1, len2);
+-    QCOMPARE(len1, 4);
++    QCOMPARE(UCS4fromLE.size(), UCS4fromBE.size());
++    QCOMPARE(UCS4fromLE.size(), 4);
+=20
+     // Check that now after conversion, UCS4fromLE and UCS4fromBE are n=
ow the same
+-    for (int i =3D 0; i < len1; i++) {
++    for (size_t i =3D 0; i < UCS4fromLE.size(); i++) {
+         QCOMPARE(UCS4fromLE[i], UCS4fromBE[i]);
+     }
+=20
+     const QString expected =3D QStringLiteral("HI!=E2=98=91");
+=20
+     // Do some final verifications, checking the strings to be "HI!"
+-    QVERIFY(*UCS4fromLE =3D=3D *UCS4fromBE);
+-    QVERIFY(compare(UCS4fromLE, expected.utf16(), len1));
+-    QVERIFY(compare(UCS4fromBE, expected.utf16(), len1));
++    QVERIFY(UCS4fromLE =3D=3D UCS4fromBE);
++    QVERIFY(compare(UCS4fromLE.data(), expected.utf16(), UCS4fromLE.siz=
e()));
++    QVERIFY(compare(UCS4fromBE.data(), expected.utf16(), UCS4fromBE.siz=
e()));
+ }
+=20
+ QTEST_GUILESS_MAIN(TestUTFConversion)
+diff --git a/utils/HtmlFonts.cc b/utils/HtmlFonts.cc
+index ca7d4a4..9f25621 100644
+--- a/utils/HtmlFonts.cc
++++ b/utils/HtmlFonts.cc
+@@ -230,9 +230,9 @@ GooString *HtmlFont::getFullName()
+ }
+=20
+ // this method if plain wrong todo
+-GooString *HtmlFont::HtmlFilter(const Unicode *u, int uLen)
++std::unique_ptr<GooString> HtmlFont::HtmlFilter(const Unicode *u, int u=
Len)
+ {
+-    GooString *tmp =3D new GooString();
++    auto tmp =3D std::make_unique<GooString>();
+     const UnicodeMap *uMap;
+     char buf[8];
+     int n;
+diff --git a/utils/HtmlFonts.h b/utils/HtmlFonts.h
+index ca4ae54..74cdca0 100644
+--- a/utils/HtmlFonts.h
++++ b/utils/HtmlFonts.h
+@@ -104,7 +104,7 @@ public:
+     }
+     const double *getRotMat() const { return rotSkewMat; }
+     GooString *getFontName();
+-    static GooString *HtmlFilter(const Unicode *u, int uLen); // char* =
s);
++    static std::unique_ptr<GooString> HtmlFilter(const Unicode *u, int =
uLen); // char* s);
+     bool isEqual(const HtmlFont &x) const;
+     bool isEqualIgnoreBold(const HtmlFont &x) const;
+     void print() const { printf("font: %s (%s) %d %s%s\n", FontName->c_=
str(), familyName.c_str(), size, bold ? "bold " : "", italic ? "italic " =
: ""); };
+diff --git a/utils/HtmlOutputDev.cc b/utils/HtmlOutputDev.cc
+index 2611e06..b45a5ff 100644
+--- a/utils/HtmlOutputDev.cc
++++ b/utils/HtmlOutputDev.cc
+@@ -124,11 +124,11 @@ static bool debug =3D false;
+=20
+ #if 0
+ static GooString* Dirname(GooString* str){
+- =20
++
+   char *p=3Dstr->c_str();
+   int len=3Dstr->getLength();
+   for (int i=3Dlen-1;i>=3D0;i--)
+-    if (*(p+i)=3D=3DSLASH)=20
++    if (*(p+i)=3D=3DSLASH)
+       return new GooString(p,i+1);
+   return new GooString();
+ }
+@@ -219,14 +219,13 @@ HtmlString::HtmlString(GfxState *state, double fon=
tSize, HtmlFontAccu *_fonts) :
+     len =3D size =3D 0;
+     yxNext =3D nullptr;
+     xyNext =3D nullptr;
+-    htext =3D new GooString();
++    htext =3D std::make_unique<GooString>();
+     dir =3D textDirUnknown;
+ }
+=20
+ HtmlString::~HtmlString()
+ {
+     gfree(text);
+-    delete htext;
+     gfree(xRight);
+ }
+=20
+@@ -345,7 +344,6 @@ void HtmlPage::beginString(GfxState *state, const Go=
oString *s)
+ void HtmlPage::conv()
+ {
+     for (HtmlString *tmp =3D yxStrings; tmp; tmp =3D tmp->yxNext) {
+-        delete tmp->htext;
+         tmp->htext =3D HtmlFont::HtmlFilter(tmp->text, tmp->len);
+=20
+         size_t linkIndex =3D 0;
+@@ -641,7 +639,7 @@ void HtmlPage::coalesce()
+             bool finish_a =3D switch_links && hlink1 !=3D nullptr;
+             bool finish_italic =3D hfont1->isItalic() && (!hfont2->isIt=
alic() || finish_a);
+             bool finish_bold =3D hfont1->isBold() && (!hfont2->isBold()=
 || finish_a || finish_italic);
+-            CloseTags(str1->htext, finish_a, finish_italic, finish_bold=
);
++            CloseTags(str1->htext.get(), finish_a, finish_italic, finis=
h_bold);
+             if (switch_links && hlink2 !=3D nullptr) {
+                 GooString *ls =3D hlink2->getLinkStart();
+                 str1->htext->append(ls);
+@@ -654,7 +652,7 @@ void HtmlPage::coalesce()
+                 str1->htext->append("<b>", 3);
+             }
+=20
+-            str1->htext->append(str2->htext);
++            str1->htext->append(str2->htext.get());
+             // str1 now contains href for link of str2 (if it is define=
d)
+             str1->link =3D str2->link;
+             hfont1 =3D hfont2;
+@@ -671,7 +669,7 @@ void HtmlPage::coalesce()
+             bool finish_a =3D str1->getLink() !=3D nullptr;
+             bool finish_bold =3D hfont1->isBold();
+             bool finish_italic =3D hfont1->isItalic();
+-            CloseTags(str1->htext, finish_a, finish_italic, finish_bold=
);
++            CloseTags(str1->htext.get(), finish_a, finish_italic, finis=
h_bold);
+=20
+             str1->xMin =3D curX;
+             str1->yMin =3D curY;
+@@ -698,14 +696,14 @@ void HtmlPage::coalesce()
+     bool finish_bold =3D hfont1->isBold();
+     bool finish_italic =3D hfont1->isItalic();
+     bool finish_a =3D str1->getLink() !=3D nullptr;
+-    CloseTags(str1->htext, finish_a, finish_italic, finish_bold);
++    CloseTags(str1->htext.get(), finish_a, finish_italic, finish_bold);
+=20
+ #if 0 //~ for debugging
+   for (str1 =3D yxStrings; str1; str1 =3D str1->yxNext) {
+     printf("x=3D%3d..%3d  y=3D%3d..%3d  size=3D%2d ",
+ 	   (int)str1->xMin, (int)str1->xMax, (int)str1->yMin, (int)str1->yMax,
+ 	   (int)(str1->yMax - str1->yMin));
+-    printf("'%s'\n", str1->htext->c_str()); =20
++    printf("'%s'\n", str1->htext->c_str());
+   }
+   printf("\n-----------------------------------------------------------=
-\n\n");
+ #endif
+@@ -1225,10 +1223,10 @@ void HtmlOutputDev::startPage(int pageNumA, GfxS=
tate *state, XRef *xref)
+ 	exit(1);
+       }
+       delete fname;
+-    // if(state->getRotation()!=3D0)=20
++    // if(state->getRotation()!=3D0)
+     //  fprintf(tin,"ROTATE=3D%d rotate %d neg %d neg translate\n",stat=
e->getRotation(),state->getX1(),-state->getY1());
+-    // else=20
+-      fprintf(tin,"ROTATE=3D%d neg %d neg translate\n",state->getX1(),s=
tate->getY1()); =20
++    // else
++      fprintf(tin,"ROTATE=3D%d neg %d neg translate\n",state->getX1(),s=
tate->getY1());
+     }
+   }
+ #endif
+@@ -1723,10 +1721,11 @@ bool HtmlOutputDev::newHtmlOutlineLevel(FILE *ou=
tput, const std::vector<OutlineI
+     fputs("<ul>\n", output);
+=20
+     for (OutlineItem *item : *outlines) {
+-        GooString *titleStr =3D HtmlFont::HtmlFilter(item->getTitle(), =
item->getTitleLength());
++        const auto &title =3D item->getTitle();
++        std::unique_ptr<GooString> titleStr =3D HtmlFont::HtmlFilter(ti=
tle.data(), title.size());
+=20
+         GooString *linkName =3D nullptr;
+-        ;
++
+         const int itemPage =3D getOutlinePageNum(item);
+         if (itemPage > 0) {
+             /*		complex		simple
+@@ -1753,12 +1752,13 @@ bool HtmlOutputDev::newHtmlOutlineLevel(FILE *ou=
tput, const std::vector<OutlineI
+         if (linkName) {
+             fprintf(output, "<a href=3D\"%s\">", linkName->c_str());
+         }
+-        fputs(titleStr->c_str(), output);
++        if (titleStr) {
++            fputs(titleStr->c_str(), output);
++        }
+         if (linkName) {
+             fputs("</a>", output);
+             delete linkName;
+         }
+-        delete titleStr;
+         atLeastOne =3D true;
+=20
+         item->open();
+@@ -1778,14 +1778,14 @@ void HtmlOutputDev::newXmlOutlineLevel(FILE *out=
put, const std::vector<OutlineIt
+     fputs("<outline>\n", output);
+=20
+     for (OutlineItem *item : *outlines) {
+-        GooString *titleStr =3D HtmlFont::HtmlFilter(item->getTitle(), =
item->getTitleLength());
++        const std::vector<Unicode> &title =3D item->getTitle();
++        auto titleStr =3D HtmlFont::HtmlFilter(title.data(), title.size=
());
+         const int itemPage =3D getOutlinePageNum(item);
+         if (itemPage > 0) {
+             fprintf(output, "<item page=3D\"%d\">%s</item>\n", itemPage=
, titleStr->c_str());
+         } else {
+             fprintf(output, "<item>%s</item>\n", titleStr->c_str());
+         }
+-        delete titleStr;
+=20
+         item->open();
+         if (item->hasKids() && item->getKids()) {
+diff --git a/utils/HtmlOutputDev.h b/utils/HtmlOutputDev.h
+index c7b08d1..e490eff 100644
+--- a/utils/HtmlOutputDev.h
++++ b/utils/HtmlOutputDev.h
+@@ -95,7 +95,7 @@ private:
+     HtmlString *yxNext; // next string in y-major order
+     HtmlString *xyNext; // next string in x-major order
+     int fontpos;
+-    GooString *htext;
++    std::unique_ptr<GooString> htext;
+     int len; // length of text and xRight
+     int size; // size of text and xRight arrays
+     UnicodeTextDirection dir; // direction (left to right/right to left=
)
+diff --git a/utils/pdfinfo.cc b/utils/pdfinfo.cc
+index 1f4ca79..2057d22 100644
+--- a/utils/pdfinfo.cc
++++ b/utils/pdfinfo.cc
+@@ -114,14 +114,12 @@ static const ArgDesc argDesc[] =3D { { "-f", argIn=
t, &firstPage, 0, "first page to
+=20
+ static void printTextString(const GooString *s, const UnicodeMap *uMap)
+ {
+-    Unicode *u;
+     char buf[8];
+-    int len =3D TextStringToUCS4(s->toStr(), &u);
+-    for (int i =3D 0; i < len; i++) {
+-        int n =3D uMap->mapUnicode(u[i], buf, sizeof(buf));
++    std::vector<Unicode> u =3D TextStringToUCS4(s->toStr());
++    for (const auto &c : u) {
++        int n =3D uMap->mapUnicode(c, buf, sizeof(buf));
+         fwrite(buf, 1, n, stdout);
+     }
+-    gfree(u);
+ }
+=20
+ static void printUCS4String(const Unicode *u, int len, const UnicodeMap=
 *uMap)
+diff --git a/utils/pdfsig.cc b/utils/pdfsig.cc
+index 490795f..e15a360 100644
+--- a/utils/pdfsig.cc
++++ b/utils/pdfsig.cc
+@@ -224,16 +224,14 @@ static std::string TextStringToUTF8(const std::str=
ing &str)
+ {
+     const UnicodeMap *utf8Map =3D globalParams->getUtf8Map();
+=20
+-    Unicode *u;
+-    const int len =3D TextStringToUCS4(str, &u);
++    std::vector<Unicode> u =3D TextStringToUCS4(str);
+=20
+     std::string convertedStr;
+-    for (int i =3D 0; i < len; ++i) {
++    for (auto &c : u) {
+         char buf[8];
+-        const int n =3D utf8Map->mapUnicode(u[i], buf, sizeof(buf));
++        const int n =3D utf8Map->mapUnicode(c, buf, sizeof(buf));
+         convertedStr.append(buf, n);
+     }
+-    gfree(u);
+=20
+     return convertedStr;
+ }
+diff --git a/utils/pdftohtml.cc b/utils/pdftohtml.cc
+index 97b141a..d7c0889 100644
+--- a/utils/pdftohtml.cc
++++ b/utils/pdftohtml.cc
+@@ -99,7 +99,7 @@ static char ownerPassword[33] =3D "";
+ static char userPassword[33] =3D "";
+ static bool printVersion =3D false;
+=20
+-static GooString *getInfoString(Dict *infoDict, const char *key);
++static std::unique_ptr<GooString> getInfoString(Dict *infoDict, const c=
har *key);
+ static GooString *getInfoDate(Dict *infoDict, const char *key);
+=20
+ static char textEncName[128] =3D "";
+@@ -158,8 +158,11 @@ int main(int argc, char *argv[])
+ {
+     std::unique_ptr<PDFDoc> doc;
+     GooString *fileName =3D nullptr;
+-    GooString *docTitle =3D nullptr;
+-    GooString *author =3D nullptr, *keywords =3D nullptr, *subject =3D =
nullptr, *date =3D nullptr;
++    std::unique_ptr<GooString> docTitle;
++    std::unique_ptr<GooString> author;
++    std::unique_ptr<GooString> keywords;
++    std::unique_ptr<GooString> subject;
++    GooString *date =3D nullptr;
+     GooString *htmlFileName =3D nullptr;
+     HtmlOutputDev *htmlOut =3D nullptr;
+     SplashOutputDev *splashOut =3D nullptr;
+@@ -317,7 +320,7 @@ int main(int argc, char *argv[])
+         }
+     }
+     if (!docTitle) {
+-        docTitle =3D new GooString(htmlFileName);
++        docTitle =3D std::make_unique<GooString>(htmlFileName);
+     }
+=20
+     if (!singleHtml) {
+@@ -330,16 +333,6 @@ int main(int argc, char *argv[])
+     // write text file
+     htmlOut =3D new HtmlOutputDev(doc->getCatalog(), htmlFileName->c_st=
r(), docTitle->c_str(), author ? author->c_str() : nullptr, keywords ? ke=
ywords->c_str() : nullptr, subject ? subject->c_str() : nullptr, date ? d=
ate->c_str() : nullptr,
+                                 rawOrder, firstPage, doOutline);
+-    delete docTitle;
+-    if (author) {
+-        delete author;
+-    }
+-    if (keywords) {
+-        delete keywords;
+-    }
+-    if (subject) {
+-        delete subject;
+-    }
+     if (date) {
+         delete date;
+     }
+@@ -397,7 +390,7 @@ error:
+     return exit_status;
+ }
+=20
+-static GooString *getInfoString(Dict *infoDict, const char *key)
++static std::unique_ptr<GooString> getInfoString(Dict *infoDict, const c=
har *key)
+ {
+     Object obj;
+     // Raw value as read from PDF (may be in pdfDocEncoding or UCS2)
+@@ -406,7 +399,7 @@ static GooString *getInfoString(Dict *infoDict, cons=
t char *key)
+     Unicode *unicodeString;
+     int unicodeLength;
+     // Value HTML escaped and converted to desired encoding
+-    GooString *encodedString =3D nullptr;
++    std::unique_ptr<GooString> encodedString;
+     // Is rawString UCS2 (as opposed to pdfDocEncoding)
+     bool isUnicode;
+=20
+--=20
+2.40.0
+
diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.p=
atch b/meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.patch
new file mode 100644
index 000000000..cb9ef4237
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2024-6239-0002.patch
@@ -0,0 +1,111 @@
+From 0554731052d1a97745cb179ab0d45620589dd9c4 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Fri, 17 Jun 2024 00:54:55 +0200
+Subject: [PATCH] pdfinfo: Fix crash in broken documents when using -dest=
s
+
+CVE: CVE-2024-6239
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/popple=
r/-/commit/0554731052d1a97745cb179ab0d45620589dd9c4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ utils/pdfinfo.cc | 35 +++++++++++++++--------------------
+ 1 file changed, 15 insertions(+), 20 deletions(-)
+
+diff --git a/utils/pdfinfo.cc b/utils/pdfinfo.cc
+index 2057d22..5f96b41 100644
+--- a/utils/pdfinfo.cc
++++ b/utils/pdfinfo.cc
+@@ -15,7 +15,7 @@
+ // under GPL version 2 or later
+ //
+ // Copyright (C) 2006 Dom Lachowicz <cinamod@hotmail.com>
+-// Copyright (C) 2007-2010, 2012, 2016-2022 Albert Astals Cid <aacid@kd=
e.org>
++// Copyright (C) 2007-2010, 2012, 2016-2022, 2024 Albert Astals Cid <aa=
cid@kde.org>
+ // Copyright (C) 2010 Hib Eris <hib@hiberis.nl>
+ // Copyright (C) 2011 Vittal Aithal <vittal.aithal@cognidox.com>
+ // Copyright (C) 2012, 2013, 2016-2018, 2021 Adrian Johnson <ajohnson@r=
edneon.com>
+@@ -112,16 +112,21 @@ static const ArgDesc argDesc[] =3D { { "-f", argIn=
t, &firstPage, 0, "first page to
+                                    { "-?", argFlag, &printHelp, 0, "pri=
nt usage information" },
+                                    {} };
+
+-static void printTextString(const GooString *s, const UnicodeMap *uMap)
++static void printStdTextString(const std::string &s, const UnicodeMap *=
uMap)
+ {
+     char buf[8];
+-    std::vector<Unicode> u =3D TextStringToUCS4(s->toStr());
++    const std::vector<Unicode> u =3D TextStringToUCS4(s);
+     for (const auto &c : u) {
+         int n =3D uMap->mapUnicode(c, buf, sizeof(buf));
+         fwrite(buf, 1, n, stdout);
+     }
+ }
+
++static void printTextString(const GooString *s, const UnicodeMap *uMap)
++{
++    printStdTextString(s->toStr(), uMap);
++}
++
+ static void printUCS4String(const Unicode *u, int len, const UnicodeMap=
 *uMap)
+ {
+     char buf[8];
+@@ -293,11 +298,6 @@ static void printStruct(const StructElement *elemen=
t, unsigned indent)
+     }
+ }
+
+-struct GooStringCompare
+-{
+-    bool operator()(GooString *lhs, GooString *rhs) const { return lhs-=
>cmp(const_cast<GooString *>(rhs)) < 0; }
+-};
+-
+ static void printLinkDest(const std::unique_ptr<LinkDest> &dest)
+ {
+     GooString s;
+@@ -368,29 +368,25 @@ static void printLinkDest(const std::unique_ptr<Li=
nkDest> &dest)
+
+ static void printDestinations(PDFDoc *doc, const UnicodeMap *uMap)
+ {
+-    std::map<Ref, std::map<GooString *, std::unique_ptr<LinkDest>, GooS=
tringCompare>> map;
++    std::map<Ref, std::map<std::string, std::unique_ptr<LinkDest>>> map=
;
+
+     int numDests =3D doc->getCatalog()->numDestNameTree();
+     for (int i =3D 0; i < numDests; i++) {
+-        GooString *name =3D new GooString(doc->getCatalog()->getDestNam=
eTreeName(i));
++        const GooString *name =3D doc->getCatalog()->getDestNameTreeNam=
e(i);
+         std::unique_ptr<LinkDest> dest =3D doc->getCatalog()->getDestNa=
meTreeDest(i);
+-        if (dest && dest->isPageRef()) {
++        if (name && dest && dest->isPageRef()) {
+             Ref pageRef =3D dest->getPageRef();
+-            map[pageRef].insert(std::make_pair(name, std::move(dest)));
+-        } else {
+-            delete name;
++            map[pageRef].insert(std::make_pair(name->toStr(), std::move=
(dest)));
+         }
+     }
+
+     numDests =3D doc->getCatalog()->numDests();
+     for (int i =3D 0; i < numDests; i++) {
+-        GooString *name =3D new GooString(doc->getCatalog()->getDestsNa=
me(i));
++        const char *name =3D doc->getCatalog()->getDestsName(i);
+         std::unique_ptr<LinkDest> dest =3D doc->getCatalog()->getDestsD=
est(i);
+-        if (dest && dest->isPageRef()) {
++        if (name && dest && dest->isPageRef()) {
+             Ref pageRef =3D dest->getPageRef();
+             map[pageRef].insert(std::make_pair(name, std::move(dest)));
+-        } else {
+-            delete name;
+         }
+     }
+
+@@ -404,9 +400,8 @@ static void printDestinations(PDFDoc *doc, const Uni=
codeMap *uMap)
+                     printf("%4d ", i);
+                     printLinkDest(it.second);
+                     printf(" \"");
+-                    printTextString(it.first, uMap);
++                    printStdTextString(it.first, uMap);
+                     printf("\"\n");
+-                    delete it.first;
+                 }
+             }
+         }
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe=
/recipes-support/poppler/poppler_23.04.0.bb
index f4411e116..e57760d85 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -9,6 +9,8 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.xz =
\
            file://0001-cmake-Do-not-use-isystem.patch \
            file://jpeg-stdio.patch \
            file://CVE-2023-34872.patch \
+           file://CVE-2024-6239-0001.patch \
+           file://CVE-2024-6239-0002.patch \
            "
 SRC_URI[sha256sum] =3D "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cace=
e0674670693951a1"
=20
--=20
2.40.0


