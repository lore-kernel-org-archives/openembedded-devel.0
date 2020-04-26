Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web10.6406.1587877392462635489
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Apr 2020 22:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=HDn7RIon;
 spf=pass (domain: vaisala.com, ip: 40.107.8.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SmvxwSikI8RS/ts3thn1v+yy+xWb0QXqNEKhMRNKgOgCWwHWkal145PsLbWOvqF644Dr56e6Mi/bYNfjA939lgN7OX/5u5aM9YbkL3NYwHlH8FEt61i3/JjqI+L4tDAwjCqz9Azdwi4DtDNHKlnvqNu8WDF/JIU1Fp3+i4iUbdvN/80jvuNQOOLpVjkbjJNODbwRWQB+aIPyBxDtLKz7iNT3PojnLRg5u7Lx81mesl+lQ8ThXknxCeiUWN7/MuotYnOKOqGr327kKYwFQ0HSkDPthKwTR4XFXCTuzMIbw8CFOp6YQQ3MbwPOPFbS/v+U9ufaqKJoFGA4KW+yMB9kJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYm4qr7SR2P76uHUB5Y8fDcmtTP79dhjAcFm4h4x6yc=;
 b=IPE5aE83yaS0uxA9cE3alZjJl3QEFQgKL4diu9J9Zr6dC60bk8OwZKWhwWtAp0toIeubqoWyjRGgjswNPTQXReYc5GfR90W86HVZkIAo1tviLpVk1dP/ebpxNY2jVA1pb+s4tr0OZnIvHTdo1Cg7pqjVq9w4P82ktXojVaWPih5Sl8QKZYKS92Pty563jVMW4nVMnAh+Djn1qmaGiH/P1MwA0pAbaFnNR/0Zs3Qxdny9+X0SqZBn7E/Zoyhu9uuzImLhfj5dGBa4TbKRRBH8geuI4DJJCJXihGTym2e3RqFbR87ogMfaZeFZSdjC8ezvys+nX3PDynsTbWuKrauZqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYm4qr7SR2P76uHUB5Y8fDcmtTP79dhjAcFm4h4x6yc=;
 b=HDn7RIon5Cyljv9jq3F0k4OlnefK3emPdi2MAUo/bjzDPHQTSQ3D6UQWcW9HHQnmpVO1QFnwQGZorTkRsHOAemmsfYIeCpq29/Z1vjueJXpBXDq36pxRxawpvcfbU0Vmtvp99zFaoBQZYpdSz6jNuTj2dDKNwNLbyX2k3YlGh7E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com (20.179.247.154) by
 AM6PR06MB4647.eurprd06.prod.outlook.com (20.177.196.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2937.22; Sun, 26 Apr 2020 05:03:09 +0000
Received: from AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d]) by AM6PR06MB6198.eurprd06.prod.outlook.com
 ([fe80::a1db:6da:abd2:860d%5]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 05:03:09 +0000
From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][zeus][PATCH] zeromq: Fix host-specific path issue with libsodium
Date: Sun, 26 Apr 2020 05:02:20 +0000
Message-ID: <20200426050220.121532-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM3PR07CA0135.eurprd07.prod.outlook.com
 (2603:10a6:207:8::21) To AM6PR06MB6198.eurprd06.prod.outlook.com
 (2603:10a6:20b:ff::26)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by AM3PR07CA0135.eurprd07.prod.outlook.com (2603:10a6:207:8::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.7 via Frontend Transport; Sun, 26 Apr 2020 05:03:09 +0000
X-Mailer: git-send-email 2.20.1
X-Originating-IP: [193.143.230.131]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6f77fdf-1a50-4bdf-9a35-08d7e99f1d41
X-MS-TrafficTypeDiagnostic: AM6PR06MB4647:|AM6PR06MB4647:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR06MB4647799829D652E6D2A9A7A881AE0@AM6PR06MB4647.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-Forefront-PRVS: 03853D523D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR06MB6198.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(346002)(376002)(39850400004)(136003)(7696005)(5660300002)(16526019)(186003)(26005)(36756003)(52116002)(1076003)(44832011)(316002)(2616005)(956004)(6666004)(2906002)(54906003)(6916009)(6486002)(8936002)(81156014)(8676002)(86362001)(478600001)(66556008)(66476007)(66946007)(4326008);DIR:OUT;SFP:1101;
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	F/3Ccd1RxwCBdYX/ZGpomDsH0wVvMSX32+B5bgta8vaZwY2FCTaw4ZeAHw1AZmMCyAClfxRJd3pa/j8nepLdZ8vJLPuVDuLMxQE+YeEy+Th8G0zHZ+xtj5y1vmr9Xnyz0i/Ad+gP9SOKaAH1BUVOIya1+J/lCdMGJsjnJttfunG1KtfNQb0tGB1anyUkwqS+UFOYBUusSkshLaH/RMPmQqaJIx55oJVFKH9flFRSlE0SKLjpEs/80VCFyYowDR5gNXxmWOG/XYQ2K2lYSxXsTml7v6kZbQp+BHsl8lWXqWl0qJvjh4bjq2wnEAOSq9vxsu12jE/New/V5SEKn7/FsUEDA1UwmWF5NHerX4e1j4J9y1G9nt/tjcKkV+lV9K04K0xzjZkyiNyccWjVmS+kdtO0gCnPiVFknspJJDofetanuewVhZ1Iyn8xs3axlnkvkzvnZlXAWOccKD2QBKSXlbMv6tTKIC7P1/VQ19T5mwiP8fxd+DRSAOWk+hUWHEvldSAcfJgkuO+GdTC21BCH5Q==
X-MS-Exchange-AntiSpam-MessageData: 
	tXp0FooWfIT5HnVYL2OhS4mXVkY6oHADH+r/XF9CtSim+RerPEySx4zIqde6gpl8YkMhUlErlVTlZif3MqedGgh/IK6GxCyzF877VvJdfDzhuwipUtXVTDh5iZk6L0rz4DKFecTlSMXrZUPrkdA42CfIc0meSCK50wuaenotBeqXyVXwH/65fs/ggs00sA2pxVlGbmHt5c9WcZwQy93z4vAhKHPDeeVl8R5U6QTyNCRs2eGi935P3lXmN1TwdlBligGpYIofYSfizaV04AJY/f8d0m53mbrNMlfoMYo7MiG/7KOGI0581rT35rAX2fy3rKnCfiQPI8+rf9LK0MK/odAmOzq9Upjq8PgqjEXDIBOPWes+RtWv1guyflx1CV8Cb1CAEnuGLz8iZ31DLgSWTdKXsrfbTHDS2nr2jEOZgKPmb3wTar2eLJ+HmyI5snMgVzvAieOpJAT/lllOHg76UEurtccxxXaI2uCSSeQDKlU73W7MMpqUlwMxZCxfbcDkysnwwU3HkHWhlQS4RhT8oOOomsbcSUNi62pxTlNWVuvsaLd96ZVp4Vo9nM5ktz+47PmbTn9DQa0xDqHFBn75N05CM3G6QwN/Crm30bBnm7P+vgXmGNah0RD2e4Kvdp5+45zD5V0MmQ7FVSO7ANRDSyST4kxONeWTyNwpleqzm008cg3a+jK+mW8DZYVzLztMNF9rPIJZekaDVa8nola1B+HFzamJwflb16YjY/T+nkjIqNYXJDlDHy5KjiMe9XfL3SEByAi44Ro52xP2amBFzG9ILFDXWPMZMH6gXkkni9VIfsWlqBpT/1kEbzGo4Ktr
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f77fdf-1a50-4bdf-9a35-08d7e99f1d41
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 05:03:09.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qpsruOvpEerwU+UVbcobPBtqTrjUbXJFGG3bo2XBNZyLLr6+qDt51n3+xuXY1YY4hp3uuWwx7mtzr2Ro9Lgc6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR06MB4647
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

Avoid propagation of full build host specific path into
WORKDIR/sysroot-destdir/usr/share/cmake/ZeroMQ/ZeroMQTargets.cmake
when building the recipe as this causes following-like breakage on
sstate cache consumer hosts (with different build host specific path,
than the host that populated sstate cache)

  ninja: error: '/build/host/specific/path/to/zeromq/4.3.2-r0/recipe-sysroo=
t/usr/lib/libsodium.so', needed by 'src/FooBar', missing and no known rule =
to make it

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
index adf2c7ba5..fc8a987f2 100644
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

