Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.49])
 by mx.groups.io with SMTP id smtpd.web08.6391.1615801395718900248
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 02:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=uBkebLyK;
 spf=pass (domain: kpit.com, ip: 40.107.138.49, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DR4G/p1YP9NBFZpZvZCF9iBObYGk+dpYrvJhbLuAN7iy+8SY6z6MLpjutKRCWu/A3LEPUBLp4EcnaF6hp5ubWKGSVyW3GTPesSkCr5FKk/wpai4WlWy4P/eQp83u7nUJ0w7Ww6AJDewzC9hi7YDPf7tqLTEAzZCYGTqv0Gju6RFTamU9x0cQuhtVBjbgehx/LQHYv0i1trFSmicv7a531VCgP29cv1mI7vVCaRzNH8isoysowdWLA0TdFU2GoVZ6p8hiLsoE3AxtWxvOcacSsozeBaVcwOpPlpDugKClu5tS561B2aAIp5IDYElsRFi7HPocAV5hKq1XoeRfYCvHYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOxi/CfhagG3gDNX4e+D53xjRfNoGZutNJd8ZybE1Oc=;
 b=iUJ6CFvGF5buc1gG/9FiFbAp8azgZJ8D0n4fo9u3hDUYU1IVKa/BZJUzM5Mq82qKBhwkx0/f47m3iNYpSiTvDeUGazJKdvfNCUTUHdJ5i4mJJaHC3GCmGMSfx4PG+KS+vGjdSg8+XWqNJKdUR0ibAfrjOKdLmnZ7mfkVtPmm2gqJZK3zUBA9zwIo9H1kvWQnUUNiZsaC84efXEj5zHupfd2JnrnrTNnefLLmNuh2DhvcJ9qQbGDMGCT5UDNrgxzYNYWYdAKgHVvXTkf8xYpJ39lJZzwx2cZDvXFQ6rXa/gAwWdBoAsHUW7FbuLOLiQnlb7Nb+Fqk9k232kDip7HYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FOxi/CfhagG3gDNX4e+D53xjRfNoGZutNJd8ZybE1Oc=;
 b=uBkebLyKqNhigsYnuTipHdfrcJs8ffhU1QEp/tKJC0W+52eb7uoXleXHIhKf8J7KRxdebXAHRZDRmNraD+B//HFUvuoPei1YOOEroOcEJcVAvUfO83Pz3HQc0YPbHqvZ7E86IrffktyH6q7M6qDLhyhIC7NJl7PUKGGU0rE6VPw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB0721.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 09:43:02 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 09:43:02 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Aditya.Tayade" <Aditya.Tayade@kpit.com>
Subject: [meta-oe][dunfell][PATCH] neon: Add ptest
Date: Mon, 15 Mar 2021 15:12:48 +0530
Message-Id: <1615801368-4523-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e08:e196:1de6:446:aaba:25ee]
X-ClientProxiedBy: BMXPR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::18) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e08:e196:1de6:446:aaba:25ee) by BMXPR01CA0032.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:c::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 09:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa3bdc90-e8a1-4f48-5ff6-08d8e796b9c8
X-MS-TrafficTypeDiagnostic: BM1PR01MB0721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB0721B82743C7B32D8A12B0E29F6C9@BM1PR01MB0721.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K3QGfxSd1DCBQmhUblV/d/BxYp6OCXzetQEtO74NABNpqzfuIt/8IV/dL6/8Lj7PvpBwNfRINH1/KWB9hWDDa6Kr4tP43oAKyT9hy4wUnyQEKWvPKscNquITMwqRK6EyOnpz+jfdjlHj6U1DepjHqAL1k67OaewqJ4188HV3AV0YPBzAl9j4StEti9S1T37E9JS8Tpt8HQNpiv1gZJS9ZkcTx+4tyQApZFKpEAmmxlQLeo6dgZA1cn9pjAKlmoWsnF6aR1YlZMQHx6R6/BGFHU4f/lNbaUnBqT6N/PBMex2wWnTvJC7fnCH1CI8kcYXaeOmLtV7Jp90ysKuI+qAdwAFuVjI897QYrdVOFDmfLGll72puDxcWyLIpoEg3ggrob8CJvqYqRir++P9X6Yp3z507OchlLqPVKXD6vZzEEp6rAxSgmuZHRZNITOVPG3u785YSVb8RL4DGbuZ0REfh6eqP68MEbnouofONZ1C8LsFt3EWFHTmeHX0AJVxwjbIU2t+OXEPl7pg7LHF2IPrkin45YhsWiV1emdUIJTpZY3297XFqhsmbVTpUK4bcKZIa6qN2s6utMQKu6jXDHbhuumez2rVfLfCHFgMO1KfOKkTRW3A6lqwrtkmzOOMv+b2o
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39850400004)(136003)(366004)(316002)(478600001)(52116002)(8676002)(6666004)(6512007)(107886003)(6506007)(66946007)(4326008)(186003)(86362001)(16526019)(66556008)(66476007)(2616005)(2906002)(6486002)(66574015)(83380400001)(36756003)(69590400012)(8936002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?h/TWua/kx1ARU8VvSQ9+lglN82LFwbyxCaIa3Rald/KsVzJjT82KLyU6mvcc?=
 =?us-ascii?Q?Sjhw9ez980u/u2v0cm7EkYilrv6D4grxdmR/v2Bi1O5WAnntylGiNygQEt5X?=
 =?us-ascii?Q?rPeiu2hARcGDT8tDROxNYYbc3pwyz6bkYawh63B/uE6Nk7+4Vz4U66fScVI7?=
 =?us-ascii?Q?MLmzhEyWPIQa0edr6iuyfTkyzQo8TP5kHJH7NCZ3G4r4rn28k7X3EKyWtUYB?=
 =?us-ascii?Q?NBvAuuI6LAmK/Z8x8A7ZtGric4JEpizeChB733QcpUq0AQOJ7tWXi2mAEyEe?=
 =?us-ascii?Q?iv8HMeWI/eECW7j+lAjXaldR4a+TotaeGhgOrAUm5UrK26KibLwe/WnkIDBF?=
 =?us-ascii?Q?GjclSHOESdhb/1Izv9bT5XgANSciFdSRZ2MfL9nEb51l9uC7sGd/wkPylZvl?=
 =?us-ascii?Q?x5CKlzAn3cG7e9/ADtsoxqRCzbcxZvh/U7dRpotpT+zaw80BtHfy2yKg6SCI?=
 =?us-ascii?Q?RvLnAQQJ8lI5jnQM8rkMb5Qr6V4tnEyOyZ5nDRI9cLKp5MZJFcunGsI6RBiB?=
 =?us-ascii?Q?GBIt41ZngHjO/HdrwEYjrrvkfBLpplA+lZWDVS5UmCkiUkfysjweVGLa9T+7?=
 =?us-ascii?Q?YwLsxZ8n3qhnOqSOToQkQmxstM4Yo/w/3FyWCyz9udH6Sks73xN4Kq/UgbEc?=
 =?us-ascii?Q?SpELVnJHDaRLlCZuz+sZYrlG2wEACZiAEP6CXV48Jdyx7rwYBydXMsx9PkaQ?=
 =?us-ascii?Q?dH9EJMxPue6feOCWGJiMjWR99BUCI1VBbqiwn/oiMgHc8jOpazwtW4R58l5x?=
 =?us-ascii?Q?JyJuEpb0ViaBYjjHKu6Y9wNvAoI57YqsJz6mdcqw+fWUHfSbLqXGJ4VlXOQK?=
 =?us-ascii?Q?BDIRZHpqCZ+LjAmkdpBHyaCqSE4bma045YBHUHOdfniH2glwv7NjYQPw0syH?=
 =?us-ascii?Q?JR+WLdVqTXXGS5xvKFNY/Y6a7EQGNfINCLQqFpo2/1WV2pMeK0NijmtGCqaY?=
 =?us-ascii?Q?nhrFB63743xcmeq+DFF3HffLbmjUD0ZUahTiR379/LYixcoozjpTfP76d0ST?=
 =?us-ascii?Q?fPhSPWAJYABEeUH3udKaBlXz31ucxZTN4Ss+3Zxht/Y+mDzKs8pZDI3azoWe?=
 =?us-ascii?Q?Y+dml0N0nFIzMRMSuVYiCczBzsPNTz6PVi2x79uNtZiKYSje7UT9VdFoSIy7?=
 =?us-ascii?Q?4b05pCnRJD2Rtg0KxGXEI+bUF5lu2FPbDQ1S0mnASfqUx0KJgpKufyA/riPu?=
 =?us-ascii?Q?L7OpXPqBUiMUYPKAuv8ic5m1ritt6Ejbxq2j9QrutUMgAdQu7kc5Oif2v+TJ?=
 =?us-ascii?Q?Vq3gpeYzt8foWhF5EaXYFWPga3q0Qdj/CuYT/stWVrCtpRfmI74aRy9Gyppe?=
 =?us-ascii?Q?CRffwCbbi9ZmZgRCCEXhMAgJM3cWvpIC8EksIrF6DXG/OFvIJ5OkICboNRDu?=
 =?us-ascii?Q?2GaL3g5u2fasIPrdK5H6Wzids5u4?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3bdc90-e8a1-4f48-5ff6-08d8e796b9c8
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 09:43:02.4880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V9QHKJLNUgyRsSuGxZg7SO35mCWmkDtIfOHOB4YBbm2arI35/I+HtGSJlwJCdkWl4ZtfKhO6j6kKhSqZrIaYMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB0721
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: "Aditya.Tayade" <Aditya.Tayade@kpit.com>

Reused below test suites from neon source package:
BASIC_TESTS:
auth
basic
request
session
socket
string-tests
stubs
uri-tests
util-tests

DAV_TESTS:
acl3744
lock
oldacl
props
xml
xmlreq

Overall execution time of above test suite is approximately 15sec.

Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
---
 meta-oe/recipes-support/neon/neon/run-ptest | 25 +++++++++++++++++++++++++
 meta-oe/recipes-support/neon/neon_0.30.2.bb | 15 ++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/neon/neon/run-ptest

diff --git a/meta-oe/recipes-support/neon/neon/run-ptest b/meta-oe/recipes-=
support/neon/neon/run-ptest
new file mode 100644
index 0000000..602084a
--- /dev/null
+++ b/meta-oe/recipes-support/neon/neon/run-ptest
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+set -eux
+
+rm -f debug.log child.log
+
+ulimit -c unlimited
+ulimit -t 120
+
+cd test
+echo foobar > foobar.txt
+
+BASIC_TESTS=3D"auth basic redirect request session socket string-tests \
+             stubs uri-tests util-tests"
+DAV_TESTS=3D"acl3744 lock oldacl props xml xmlreq"
+for t in $BASIC_TESTS $DAV_TESTS
+do
+    echo "Running $t..."
+    if "./$t"
+    then
+        echo "PASS:$t"
+    else
+        echo "FAIL:$t"
+    fi
+done
diff --git a/meta-oe/recipes-support/neon/neon_0.30.2.bb b/meta-oe/recipes-=
support/neon/neon_0.30.2.bb
index 00b79f6..7feec41 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM =3D "file://src/COPYING.LIB;md5=3Df30a97=
16ef3762e3467a2f62bf790f0a

 SRC_URI =3D "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
+           file://run-ptest \
           "

 SRC_URI[md5sum] =3D "e28d77bf14032d7f5046b3930704ef41"
 SRC_URI[sha256sum] =3D "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d=
1b15d3d967fbca"

-inherit autotools binconfig-disabled lib_package pkgconfig
+inherit autotools binconfig-disabled lib_package pkgconfig ptest

 # Enable gnutls or openssl, not both
 PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib"
@@ -33,6 +34,18 @@ do_compile_append() {
     oe_runmake -C test
 }

+do_install_ptest(){
+    BASIC_TESTS=3D"auth basic redirect request session socket string-tests=
 \
+                 stubs uri-tests util-tests"
+    DAV_TESTS=3D"acl3744 lock oldacl props xml xmlreq"
+    mkdir "${D}${PTEST_PATH}/test"
+    for i in ${BASIC_TESTS} ${DAV_TESTS}
+    do
+        install -m 0755 "${B}/test/${i}" \
+        "${D}${PTEST_PATH}/test"
+    done
+}
+
 BINCONFIG =3D "${bindir}/neon-config"

 BBCLASSEXTEND =3D "native"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
