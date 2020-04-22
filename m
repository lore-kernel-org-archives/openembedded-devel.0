Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.79])
 by mx.groups.io with SMTP id smtpd.web11.5996.1587573351207246791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2020 09:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=QtgEqM1L;
 spf=pass (domain: vaisala.com, ip: 40.107.22.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFeKst6/cXCDAX3/u5sYAyGGCFSlxGTPf+RnaPEkkMdZm38ZuxADH6J/yHgnfR8l8jG3Ydk0w7+nSXpRHmZNDMtykQnmoQyQyo7VHEY14fuUJPx130TLp35is10JJxr0sWkzEtPCYuV1IeK9dH55uXHVS3L/RXQUjXHUU9wS77XQmYuIDh1c1L/Z9Tmew5UQ0lC6hjgFPhk/MlSiH64K7V098CxmqwxbiGf4Ggt+4ASvDtwgGdTQSbKDQ9Wj4uYSA83MDMdkWl7bPN14T+XJsUqKcvOeDF1949R+HJMRD1GNbt1XjdOB94KxPzZNjZ5WIrw9F5kTgmXT86lELTG5wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4hRmRsDUy97jKMmEELpnhD3tQ7UkwcMgMTmJiecJtA=;
 b=WIFpvgWD6FK3vwFDWiteXI2Jj0wRfdosAQS/gyt+p/oBtN8+fAtKXoPjLRQO2A/apsb1ESuFX5yWaSJwQhyxpkuZjbfJk3vonWd/Mt62LvwgY2n2ZreqtHROeNP3NKia1tyvh02NMzdAbRQE8hV9k/KmnbLgBDtB7SWvQxLeGGyFCvDDDPldXtd66a8joIlpRYw5WvlJQJqHXY2hoqnqqFK9MQhg3Tex+dr3gbHhUnWDCLIuXi8RRQztLdBGJwTab2Z72Xs9kk4WIGxuERdfmDzCiGTKUjMwgndeHkSM0J5XY67jKFhMA+XvEW3B1zEmcb69lk3LYCfMGFgptNn2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4hRmRsDUy97jKMmEELpnhD3tQ7UkwcMgMTmJiecJtA=;
 b=QtgEqM1L08eMSOxWgLo7BpZKO7bVFmUSaPsDIDoxGFgYXb+i7PgnUGJpeNKioZsmqG83x9sKb2FpeVv2bdjiYEZtH/W63y/PWAI1VmltDX3E8BHY5GdlqKGqo91VSqvR3IJ9opJOCy6S9OXzH6ZB7oeVpHfhTrG9TgIJ40DIhXA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com (2603:10a6:20b:ff::26)
 by AM6PR06MB5222.eurprd06.prod.outlook.com (2603:10a6:20b:8d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Wed, 22 Apr
 2020 16:35:48 +0000
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d]) by AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d%5]) with mapi id 15.20.2921.030; Wed, 22 Apr 2020
 16:35:48 +0000
From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] zeromq: Fix host-specific path issue with libsodium
Date: Wed, 22 Apr 2020 16:35:28 +0000
Message-ID: <20200422163528.85683-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To AM6PR06MB6198.eurprd06.prod.outlook.com (2603:10a6:20b:ff::26)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Wed, 22 Apr 2020 16:35:48 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c612c21-9e4a-4ef4-bcff-08d7e6db36b0
X-MS-TrafficTypeDiagnostic: AM6PR06MB5222:|AM6PR06MB5222:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR06MB522224A568C8DEB636FDEBFB81D20@AM6PR06MB5222.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 03818C953D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB6198.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(39850400004)(136003)(366004)(376002)(346002)(316002)(478600001)(8936002)(5660300002)(2906002)(36756003)(186003)(4326008)(86362001)(6916009)(26005)(52116002)(7696005)(956004)(1076003)(2616005)(8676002)(6486002)(66476007)(81156014)(66556008)(6666004)(107886003)(44832011)(16526019)(66946007);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TQLfuP/OoFh5FUoZyK6Xjdr1du8B0GShBQEHAPpXdaeMpElAdW3ENzQJBnBxfUtulJao6LEPJufRvvjv5ZjS7tlA/v/gT0k5hmbn/l5kF+8ITQCVTzEugADfs+ckX+1wO4l3tcGOZCR8zZ0cwkaKvHz6T4yYRo+EQ1hET39Y6ujmAfHGWEO1xe/4NMb38fLxoREZzpIUPnC+GxYD41559vAHAJLLXS9Tx2wFXVfUCKUJyYWn1RjbD07lNaRNBD6J+X3zlvrK1LDdMcxbQubQekJxG7FMDBZ5GJVcU1jrvliTEhebfo0WTLXfWiIyHJdFgZhr9NRR9YGa2MhFAg5U+l6ddWyanIgiC4JiOvA5OmqwJYKurso1WI3sBncZAhcNl08szZN+81euYr1bna0Bem5Rh5rDBcOOrizCnw9qpqSxaRYaoNB7+jqoDfT71FLioyhNmPxPZa8vaEUTnQhEFYjRfjCDyxB54YIdX/034ygjivknnGee0aCHgTI7vmJ1wPwdHbiKs/0DJ82inMGI2A==
X-MS-Exchange-AntiSpam-MessageData: 
	zIpxYpVA/mbqlLY2zt9PGFBz/8sxmMot2UZFRUQqKZxIYnZnE2GujugpTGh2wh80F7auJ0oHc5sJDyibzqxw5jzne2WSBYxpaY7wHQMuHAMgu8sOHx0eJW9U+D+bOrJtmDSKEsIqNDPuwd59B/OTPuNrnu4oGcQocMLJg4xR/XKyj7Zvp+5xvsBBH0WGdE31raM5MtamczJ2VjDD3+IHkB+fM8nquI6QXRr3MY0YmfqICFC6vuW60c9sCVm13NNTd5TV5wn6ddRzO0jPkf1cTsIgh3vKccphu+A1pKvDHst++oQfbL1WTJvz72a2OncjRMTQcP6j9KgGdMpSRXUrYhreg+BOTGbXfQuu8X1+uZbwbO0yFBvkyg7bZ/ZpM0e0V1ifLt8AZJ58Ad9a5AB1u64+CMCO6yG9CUF2yZOWwuDRep0I0xkpfPav04DoAtXITZkpbPbUstRgXJiz+O4CWd/GUYIrtnmjiLIEdLrnu9wL4L1hsGQ/P2IqT8TBLKc6UZ+WZYg7ELtKEwNBudSQrgD/HvYbSnKjJefXP6RoqvYle6cH7Y3Mk5ywGJFawqsMNz4KgcmkKNdxOKEgpD7J/TPhMn44QGJH80mHxZMnQfe63ebNK6rDwfYY+G+AILPOj3zTwckQfK93pydy4m+tA+K+JGez2OSUfdZNTrkoZV2FKs7u4bKTNYdmIP815WEPUgH0pB8rIFRa6un+bI3yJ4YZedh1fDEqb3BeIpLJ3i5LILq7U/txzo8S3Qz++XC+fBh1ZoJUQLWmJQI546ud4PeRObosuFK0rR+hb9iEVLbmTGBpDgawVqm+3+KL6v6i
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c612c21-9e4a-4ef4-bcff-08d7e6db36b0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2020 16:35:48.8321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l61SWVsU8yXaoO6QcvrME8/elN2rDZSl5s6v6lQDKxinIlut48l1uWbBvGXJW1mxTWc9YIrNpYnJiyvlnN3nxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB5222
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Avoid propagation of full build host specific path into
WORKDIR/sysroot-destdir/usr/share/cmake/ZeroMQ/ZeroMQTargets.cmake
when building the recipe as this causes following-like breakage on
sstate cache consumer hosts (with different build host specific path,
than the host that populated sstate cache)

  ninja: error: '/build/host/specific/path/to/zeromq/4.3.2-r0/recipe-sysroo=
t/usr/lib/libsodium.so', needed by 'src/FooBar', missing and no known rule =
to make it

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...void-host-specific-path-to-libsodium.patch | 39 +++++++++++++++++++
 .../zeromq/zeromq_4.3.2.bb                    |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLis=
ts-txt-Avoid-host-specific-path-to-libsodium.patch

diff --git a/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-=
Avoid-host-specific-path-to-libsodium.patch b/meta-oe/recipes-connectivity/=
zeromq/files/0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patc=
h
new file mode 100644
index 000000000..eb3dee4d3
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zeromq/files/0001-CMakeLists-txt-Avoid-h=
ost-specific-path-to-libsodium.patch
@@ -0,0 +1,39 @@
+From: Niko Mauno <niko.mauno@vaisala.com>
+Date: Wed Apr 22 09:00:00 2020 +0300
+Subject: CMakeLists.txt: Avoid host-specific path to libsodium
+
+Avoid propagating full build host specific path to generated
+ZeroMQTargets.cmake when building with libsodium, which changes the
+content in generated ZeroMQTargets.cmake files followingly:
+
+  -INTERFACE_LINK_LIBRARIES "-lpthread;/build/host/specific/path/to/zeromq=
/4.3.2-r0/recipe-sysroot/usr/lib/libsodium.so;-lrt"
+  +INTERFACE_LINK_LIBRARIES "-lpthread;-lsodium;-lrt"
+
+This change mitigates an issue stemming from reuse of build artifacts
+where the path to libsodium.so does not match exactly between two
+different build hosts.
+
+Upstream-Status: Pending
+
+Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1210,7 +1210,7 @@
+   target_link_libraries(libzmq ${OPTIONAL_LIBRARIES} ${CMAKE_THREAD_LIBS_=
INIT})
+=20
+   if(SODIUM_FOUND)
+-    target_link_libraries(libzmq ${SODIUM_LIBRARIES})
++    target_link_libraries(libzmq -lsodium)
+     # On Solaris, libsodium depends on libssp
+     if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
+       target_link_libraries(libzmq ssp)
+@@ -1240,7 +1240,7 @@
+   target_link_libraries(libzmq-static ${OPTIONAL_LIBRARIES} ${CMAKE_THREA=
D_LIBS_INIT})
+=20
+   if(SODIUM_FOUND)
+-    target_link_libraries(libzmq-static ${SODIUM_LIBRARIES})
++    target_link_libraries(libzmq-static -lsodium)
+     # On Solaris, libsodium depends on libssp
+     if(${CMAKE_SYSTEM_NAME} MATCHES "SunOS")
+       target_link_libraries(libzmq-static ssp)
diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb b/meta-oe/=
recipes-connectivity/zeromq/zeromq_4.3.2.bb
index 49215f2cb..02a4c04fd 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.2.bb
@@ -7,6 +7,7 @@ PACKAGECONFIG ??=3D "libsodium"
 PACKAGECONFIG[libsodium] =3D "-DWITH_LIBSODIUM=3DON,-DWITH_LIBSODIUM=3DOFF=
, libsodium"
=20
 SRC_URI =3D "http://github.com/zeromq/libzmq/releases/download/v${PV}/zero=
mq-${PV}.tar.gz \
+    file://0001-CMakeLists-txt-Avoid-host-specific-path-to-libsodium.patch=
 \
     file://run-ptest \
 "
 SRC_URI[md5sum] =3D "2047e917c2cc93505e2579bcba67a573"
--=20
2.20.1

