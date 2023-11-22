Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE0DC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 00:50:53 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.77])
 by mx.groups.io with SMTP id smtpd.web11.8931.1700614251893269363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 16:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=QIRF5E3/;
 spf=pass (domain: axis.com, ip: 40.107.247.77, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CE0kRwTBsiMIrVbzH7pr1gfQU8PP2hDKhQDS5+6ioIK5dMB72lXYzkoIZXvdn4cwm+XS4HOVUCA8D8j9+F7O0H3PWR0S3wwWhqBgW6qEFAn3n3dwEuPGbb3GIjZ/Ghf6y/F8xLBZYXI+d/BkA9R5peXUSx4VfL9NV7/u5mmxIvS2wmlahGvZt/vDtdE/byZX+CAhKxXN9eKGB7gk9LmcAuW3i347g1St4WA2Jozw1YoQtgxN/y7eBlSThroNVlCzwr6fdMiUwgA8gcnq7FstJV35hAeNX3Yr78XL9wRFVotSBkZsWBZ7HEo7gF4WBlERu3cJgS1wfudMvHNJmrCPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bZfd86i386tRjbP4Uqagz9s4dNKPR6WFhFQ/U5jop8I=;
 b=fE6iATIr5dzU5h70ELBc23/TInofeL6jTc/6PQSWBTGqwM2/tLplmLCwGUiW34HTEN4Tk5G1DQgfoH1bF2TRH2qDKRn3i4h/5rZY0NX7/W4YTrwtTb0lcMWyym0NzjX2Sq2qmy9A3/KIZ7s8MD5U6iyqW3T2q7msHNvWvimL7PUzd/RrnBitP6uyo8fPtLz9+HJQ2XL8RWIu27RR9JuAFd6OZdWQiHWQNiX0A8i9/WUHYFyX9DiSd28/O3424lvUpAZmAMLZzT1bhDR2E3DBVKhuD6jHrJ56nuiXNExA6jT2F9SDm+laZwXSZttaif3ln20qOPoyocL7VFV8kqWGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bZfd86i386tRjbP4Uqagz9s4dNKPR6WFhFQ/U5jop8I=;
 b=QIRF5E3/S7shM83upNYUQL/Btrx84KlRGvRMp3m32fQEjpecQyzaw52XAz0uvERWliN4etTheTo9UQNe7nn6PftxqYAaUZvTmkFEoBxcOjYb7YfW0lys//FKoT9WbOFd6+/uJdn7HtajB0OPEvTTPJqzvTuVWs3opn6KgESeccw=
Received: from AM6P192CA0007.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::20)
 by GV1PR02MB8491.eurprd02.prod.outlook.com (2603:10a6:150:9d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 00:50:46 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:209:83:cafe::f9) by AM6P192CA0007.outlook.office365.com
 (2603:10a6:209:83::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Wed, 22 Nov 2023 00:50:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Wed, 22 Nov 2023 00:50:45 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Nov
 2023 01:50:45 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Nov
 2023 01:50:45 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 22 Nov 2023 01:50:45 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 35D6AE606
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 01:50:45 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3AM0ojdb2445643
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 01:50:45 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3AM0oijV2445640
	for openembedded-devel@lists.openembedded.org; Wed, 22 Nov 2023 01:50:44 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] zeromq: Update to 4.3.5
Date: Wed, 22 Nov 2023 01:50:42 +0100
Message-ID: <20231122005042.2445624-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|GV1PR02MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: e58daf93-28e9-4477-db3a-08dbeaf50fe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4EusmlT1MjNpYtR3rvxJb08hB7Cq238SvQbb93ibrTIar6M38qd65p4G8/wLWJphxuTHAg1bE8BQ1jmv4mDucvxGEUOGnbJpA7xtnMfLbHtBMJp+teHzeudhp0xOVawMo/HmiDe5bgq6irHddPSR18R1Kz5OCJr19Y5G3jpst7teUYzpzF4otA/2L7jktMa5OvdVx+/jvSk4tR/lhQrTLfqYjxVjiLMrkJKrkb6mDOOKLnFo10bWwpr8NrzOr9dTUbxGmJXoYvtBwm4nDQAZbYghOugi3VW1yEPbuAmmfM9Rk9Rf0osT2Hv4Hqfk2dwsOlaHImyblbhDK+GBL0JzosINHzH7tOiCqPuD8OV2kQ1L6gqOUZWMJT73UJhOl5wgBvQ9OOq4WaZWX9lHsab7LcOLJ1CzbmhUsJM0H9LvOgaQDGUs6KQx9Gi7LVoumy7+8dzivPH7kxt9JR9owEYjMEmkc8304/txvIeo6SaxZMIg6BHhrPXNrlyPhxFExOqLgGCIvjxCwTRqLeuI1DnMBVf5GZK+QqarTM9ILfYdN9bbu5g1d0PwqvXUIQxiXpUEmJGu1sSPU7Tuca8IBbIDu5uHlVVpBakc5lcD4+VX0tfGFHa0twdxxgOxaj5SG3VJMghlrvu3sM2Nzi+pnn/VJEDD8r3tAAlH3aWw3bvwnPpuVeuQOX44ZJspwY0SleHajE2GvQ24UVGxyOX4Xdu2qAK+OZM1xuH17yxSvipNgRxWvzOsQZS2EKqTtXQagqhY
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(8936002)(41300700001)(8676002)(5660300002)(15650500001)(316002)(42186006)(6916009)(40460700003)(70586007)(47076005)(36756003)(478600001)(1076003)(26005)(70206006)(2616005)(336012)(426003)(81166007)(356005)(966005)(83380400001)(36860700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 00:50:45.7353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e58daf93-28e9-4477-db3a-08dbeaf50fe5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8491
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 00:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106986

A backported patch has been removed as it is no longer needed.

License-Update: Relicensed as MPL-2.0
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...cator.hpp-define-missing-rebind-type.patch | 64 -------------------
 .../{zeromq_4.3.4.bb =3D> zeromq_4.3.5.bb}      |  8 +--
 2 files changed, 3 insertions(+), 69 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-src-secu=
re_allocator.hpp-define-missing-rebind-type.patch
 rename meta-oe/recipes-connectivity/zeromq/{zeromq_4.3.4.bb =3D> zeromq_4.=
3.5.bb} (71%)

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-src-secure_allo=
cator.hpp-define-missing-rebind-type.patch b/meta-oe/recipes-connectivity/z=
eromq/files/0001-src-secure_allocator.hpp-define-missing-rebind-type.patch
deleted file mode 100644
index d32190818..000000000
--- a/meta-oe/recipes-connectivity/zeromq/files/0001-src-secure_allocator.h=
pp-define-missing-rebind-type.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 66e72389cc90625ed74e8ba1ea3a65234bdb06b5 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyich@gmail.com>
-Date: Tue, 20 Dec 2022 21:45:16 +0000
-Subject: [PATCH] src/secure_allocator.hpp: define missing 'rebind' type
-
-`gcc-13` added an assert to standard headers to make sure custom
-allocators have intended implementation of rebind type instead
-of inherited rebind. gcc change:
-    https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D64c986b49558a7
-
-Without the fix build fails on this week's `gcc-13` as:
-
-    [ 92%] Building CXX object tests/CMakeFiles/test_security_curve.dir/te=
st_security_curve.cpp.o
-    In file included from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc=
_traits.h:34,
-                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_=
uninitialized.h:64,
-                     from /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/memory:69=
,
-                     from tests/../src/secure_allocator.hpp:42,
-                     from tests/../src/curve_client_tools.hpp:49,
-                     from tests/test_security_curve.cpp:53:
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h: In instant=
iation of 'struct std::__allocator_traits_base::__rebind<zmq::secure_alloca=
tor_t<unsigned char>, unsigned char, void>':
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:94:11:   re=
quired by substitution of 'template<class _Alloc, class _Up> using std::__a=
lloc_rebind =3D typename std::__allocator_traits_base::__rebind<_Alloc, _Up=
>::type [with _Alloc =3D zmq::secure_allocator_t<unsigned char>; _Up =3D un=
signed char]'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:228:8:   re=
quired by substitution of 'template<class _Alloc> template<class _Tp> using=
 std::allocator_traits< <template-parameter-1-1> >::rebind_alloc =3D std::_=
_alloc_rebind<_Alloc, _Tp> [with _Tp =3D unsigned char; _Alloc =3D zmq::sec=
ure_allocator_t<unsigned char>]'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/ext/alloc_traits.h:126:65:   re=
quired from 'struct __gnu_cxx::__alloc_traits<zmq::secure_allocator_t<unsig=
ned char>, unsigned char>::rebind<unsigned char>'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:88:21:   requ=
ired from 'struct std::_Vector_base<unsigned char, zmq::secure_allocator_t<=
unsigned char> >'
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/stl_vector.h:423:11:   req=
uired from 'class std::vector<unsigned char, zmq::secure_allocator_t<unsign=
ed char> >'
-    tests/../src/curve_client_tools.hpp:64:76:   required from here
-    /<<NIX>>/gcc-13.0.0/include/c++/13.0.0/bits/alloc_traits.h:70:31: erro=
r: static assertion failed: allocator_traits<A>::rebind_alloc<A::value_type=
> must be A
-       70 |                         _Tp>::value,
-          |                               ^~~~~
-
-The change adds trivial `rebind` definition with expected return type
-and satisfies conversion requirements.
-
-Upstream-Status: Backport [https://github.com/zeromq/libzmq/commit/438d5d8=
8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/secure_allocator.hpp | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/src/secure_allocator.hpp b/src/secure_allocator.hpp
-index 0d37e7ed..5b8de9e2 100644
---- a/src/secure_allocator.hpp
-+++ b/src/secure_allocator.hpp
-@@ -95,6 +95,17 @@ bool operator!=3D (const secure_allocator_t<T> &, const=
 secure_allocator_t<U> &)
- #else
- template <typename T> struct secure_allocator_t : std::allocator<T>
- {
-+    secure_allocator_t () ZMQ_DEFAULT;
-+
-+    template <class U>
-+    secure_allocator_t (const secure_allocator_t<U> &) ZMQ_NOEXCEPT
-+    {
-+    }
-+
-+    template <class U> struct rebind
-+    {
-+        typedef secure_allocator_t<U> other;
-+    };
- };
- #endif
- }
---=20
-2.39.1
-
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb b/meta-oe/=
recipes-connectivity/zeromq/zeromq_4.3.5.bb
similarity index 71%
rename from meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
rename to meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
index cd319b5d3..555458217 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb
@@ -1,18 +1,16 @@
 DESCRIPTION =3D "ZeroMQ looks like an embeddable networking library but ac=
ts like a concurrency framework"
 HOMEPAGE =3D "http://www.zeromq.org"
-LICENSE =3D "LGPL-3.0-with-zeromq-exception"
-LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3Dd5311495d952062e0e4fbba3=
9cbf3de1"
+LICENSE =3D "MPL-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9741c346eef56131163e13b9db1241b=
3"
=20
 PACKAGECONFIG ??=3D "libsodium"
 PACKAGECONFIG[libsodium] =3D "-DWITH_LIBSODIUM=3DON,-DWITH_LIBSODIUM=3DOFF=
, libsodium"
=20
 SRC_URI =3D "http://github.com/zeromq/libzmq/releases/download/v${PV}/zero=
mq-${PV}.tar.gz \
     file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch=
 \
-    file://0001-src-secure_allocator.hpp-define-missing-rebind-type.patch =
\
     file://run-ptest \
 "
-SRC_URI[md5sum] =3D "c897d4005a3f0b8276b00b7921412379"
-SRC_URI[sha256sum] =3D "c593001a89f5a85dd2ddf564805deb860e02471171b3f20494=
4857336295c3e5"
+SRC_URI[sha256sum] =3D "6653ef5910f17954861fe72332e68b03ca6e4d9c7160eb3a8d=
e5a5a913bfab43"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/libzmq/releases"
=20

