Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.49])
 by mx.groups.io with SMTP id smtpd.web09.6366.1615801031464605883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 02:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GJQM1r8B;
 spf=pass (domain: kpit.com, ip: 40.107.139.49, mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiwsPldrpcoPhpQIq5xMqx9UrUanv6NqD5Wd5sAJv/sMS4BWBNwCMwqWozp/dvWIbpclkebBqge47KDrQFQPTGcLsWyuqv63mwpvy7/dOU5NQeai5kHL6DLX3TzSOEvJViYhJZTf5a04W8WqOgB08B7ne6pF27Yt/VVZdkhOqmR4uSKymz++89gPyrzrm/v80AiP2ptCZcxSQNwHGnE6joFfsn/Rd5Q+OYFl8l9TERmD/mKND6HzP9GQBPO26QhDWw0nDL3w437f0HlrU/aJ2m/REvZtV7viwYihxJGLErS+d9puSIZtLJbetREdK/jqhyc/gXdB0PDhO1XPzMFCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl27tvSNNof8TX7lozC7MdrouHlO793pqPdMYnQlSOM=;
 b=TJR0tM7KKcYvqoJNteFjCzsa+kH45Iwkj1B39gI+JG5MTdjF9Y6a/8HPMy60rHxiFMnrl8SbKopmO3JdEM5uJ1OXLhL8m1RB+AJCpJS0E5LN9HAuMtlWsEjS/JvkZMaqf/M9LQ4lDgcYfcJCbQytPE7hGK+BidQ2c8gA1chRj1+BgeKCWXjcp7PZ2P285bFvr09f8/sIf/GOBOEr2DaGDUOKxRwZQ3D71HfLaWrCUdF6lldeXjI8q4cpIfdC8kLGUXWbsZYWqEcC3Uu7qCJSOHA5uCzoEHcJW0D0nLimJNNgUHqgt5LbOn/syI1E85RPNSmNpHGuajl8zFGazzaDcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cl27tvSNNof8TX7lozC7MdrouHlO793pqPdMYnQlSOM=;
 b=GJQM1r8BYJkCmhS5eyJoKM+eDp5BBBMfE+7wSwHTuw+r17qOVN0kN2TqP4IXarG/M/tu7cVj1nwCoYxmZ8cpIYtrwhbXgR6aR6G/PUETiQBQLa5fRb8N6bHpU9+jGM9/QdOquGC3qWbiuiWcYz7gCuu7yJ8QEAy2y1HGvS24rIQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:31::19)
 by BM1PR01MB4514.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b01:8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 09:37:00 +0000
Received: from BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108]) by BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a05c:dcaa:1ba4:f108%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 09:37:00 +0000
From: "Neetika.Singh" <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	"Aditya.Tayade" <Aditya.Tayade@kpit.com>
Subject: [meta-oe][master][PATCH] neon: Add ptest
Date: Mon, 15 Mar 2021 15:06:49 +0530
Message-Id: <1615801009-3780-1-git-send-email-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4053:2e08:e196:1de6:446:aaba:25ee]
X-ClientProxiedBy: BM1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::30) To BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:31::19)
Return-Path: Neetika.Singh@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4053:2e08:e196:1de6:446:aaba:25ee) by BM1PR0101CA0020.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 09:36:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f77eaf1-dbb8-4bef-5d54-08d8e795e1b3
X-MS-TrafficTypeDiagnostic: BM1PR01MB4514:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB451405A6F64214A097A475249F6C9@BM1PR01MB4514.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3xphd/Vc7gpFsip98WN8YbCrvnczjfZX+S5IBqQe9JxDffGzG0qTqqdaqUAc/169s6/bSScyztOSb+tkjwKMMbO1ska21o7W3pRy+PaR4e1d56PbG9MxSGN1XJUWkXZdnYte/6fDrpzEbHJjMYqRbgWKPsEF1DBxRyV3bWSWQm7L1j5ETzzHjwKTkxi8dHYsT0/nLi0U53Kqqt3lgW7bNBIGOv6032YTm4+5EGwTUvEbclkeWuHJzkz2GWc0U/VcfzbduvSh5TbfMRelmxeU0gHJWRAb709WR2krGs0u8QtfVhIWStE7SMCMYCcI66rOiorjHcVatSsGFuPjAe1g2pHt7wT9/xqttQVkqcJohwuRaz84wu8QwjWlD2Del12ZCyqpyqTzUMK/Wkr2ufWHvQ5un/aGjcEHXIB7cVpk20XjTEJMtl27YCiNkZ5f1OImzAwT9mA33U5EMME6HCS8qkVg36n2YRs2u2S+qmz1G3djZqB/dW6v5XfrT6qAdZqBvmaZ+HaqgYqUJMLR9RkpXP801wVBjDKjjHOU2uT4JIizm+ABBFhIBi94q4/Cl9IF/vavtUXvDM7ty4VCT3s1a5jXQdodUKYmR7GjFRyDADmwUdk/H1nunSu3u+tu0ZNz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(478600001)(69590400012)(316002)(6512007)(107886003)(66574015)(52116002)(86362001)(5660300002)(6506007)(66556008)(16526019)(36756003)(6666004)(83380400001)(4326008)(8676002)(66946007)(66476007)(2906002)(6486002)(186003)(2616005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?l5FqOS4CJ0T5xTdvEFvB24uAnpI7HTVmGlN+LGssS6fq9DpfioVizweP6XjH?=
 =?us-ascii?Q?tG/RvhwCdJvbomk/YaFHWa7K0UAwbISrqDgl0UQ89X/XSgzvfHnjyWnL2NY/?=
 =?us-ascii?Q?4q3mniCUYbhvN3zjcFBY13ieIV23IKXFlnKzaydtIx+rRYX/w549Hm+m/k7F?=
 =?us-ascii?Q?z1juz9x/cRI47oxGHCdMo+pCLvYzZ4hBb4RydHepNZyEjxJBLMv69NXtALjR?=
 =?us-ascii?Q?FTp4gVRjTk8jWFlmJ6p16Badle7P9dqP9LclIQRWTzdbMnrKB80vM1QJ1M8r?=
 =?us-ascii?Q?yA4od9eAz2kLHz7qzrkLXEY6BkQO6maYkvk56roB2Jo4ETX8yJpAo4FsqIlv?=
 =?us-ascii?Q?fMk7H1qK/Gtb7HQa1NHp6DYrWVGkw8qM3zTFFvx6MWXmNPvZ1nDpJ/yzopjQ?=
 =?us-ascii?Q?HLDEGiOWrJQK8N+iAJN1LWetlWD3PTdhdiaEk/IllqYVayIgvGiPPJoQbR6l?=
 =?us-ascii?Q?SLdRvVcnyYrauGrEu16HpcXK+b0rF2eSrngLoSRmilxHjPNDm9Ad2dhhroPX?=
 =?us-ascii?Q?SvlaHyWyE+pNY1uQj3LWNB2sSB22fcPPzpNaE0X0ERW01cVNilxJPtqGvZv6?=
 =?us-ascii?Q?uQbS5zZ7YAq9xszDJeUpEBaYAZhGMY1F0l24lc4HoL41SV0ARYpVpDrY6/P2?=
 =?us-ascii?Q?xO2K88HFxZBlCwIXxiAo108RrCyM+GJPfn1za4UiVpY0/J666Mj50C7/f0c0?=
 =?us-ascii?Q?KATUhYt6jBzo1WmrS5b+e8njXd+oh9oRmZS00FoTz1VtZpv+Q/vUu2Za6YGN?=
 =?us-ascii?Q?+0d4FEErSE0QrOsuD19SrsfwIStuwX43ET6OX4V2FwsLPmmpJ3tg0K/eBbLl?=
 =?us-ascii?Q?nazbJlAOaeic7AcYu2+2OpLyR5egg0vCJKjAmNSUCdc62y+uDG/gxQA7VXEk?=
 =?us-ascii?Q?3SnhKCQ5/OUsDpJlB1vurbGT0c+KQbMJHveMp0o+0OUfMdD4bIaydXgDKvKc?=
 =?us-ascii?Q?H+m8vCUshLjWCO7xMjXqmQkrgde0Ti7yQtqOT+hUQU6y88BOhP5dUptlZRPs?=
 =?us-ascii?Q?YhockgFI9W4274uWvm0ZSGruFmvJIpNLBAg0TDVO5GPis8gL9wf8uvEIOXC5?=
 =?us-ascii?Q?v38tIsTdfflTx4FOFQs8GZ0qqXqdkYf8n6yyzrR9MfwCvR/TLzR+QQDzHEL9?=
 =?us-ascii?Q?UhIHdQ7PczG00M4NfStwVUICN1M7RJhoz1ml5SRP1Ik9IiSDJk1jdklS+eLL?=
 =?us-ascii?Q?l+1JKy00V6phOOsz4hLGQQZQzrvUTbhxwFtmuUXFLVkXfV1dfyhts7wVL9tO?=
 =?us-ascii?Q?vyQXPh229cg3pvJWo169GA4nMGe2Q6/9yY3Ndmuemxnt0hky+bcRb7cAAuI7?=
 =?us-ascii?Q?npcrM5VpidFy2cdYD9JptvmkFoRlFJ5VIfXAl2g8BjdTw7okPJlR4J6J3faV?=
 =?us-ascii?Q?gZauyX41mSz1ifDtAl8vF8PxgiS4?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f77eaf1-dbb8-4bef-5d54-08d8e795e1b3
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 09:36:59.8555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 614pDNrvdgy6lYow9mevFc89PZkonhCU9WpMAUn2PIK9HtwRCI8blDthqJspkJC956kiQGLXD8+jTn+rShYz+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB4514
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
index 63676a9..2639c92 100644
--- a/meta-oe/recipes-support/neon/neon_0.30.2.bb
+++ b/meta-oe/recipes-support/neon/neon_0.30.2.bb
@@ -8,12 +8,13 @@ LIC_FILES_CHKSUM =3D "file://src/COPYING.LIB;md5=3Df30a97=
16ef3762e3467a2f62bf790f0a
 SRC_URI =3D "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://pkgconfig.patch \
            file://fix-package-check-for-libxml2.patch \
+           file://run-ptest \
           "

 SRC_URI[md5sum] =3D "e28d77bf14032d7f5046b3930704ef41"
 SRC_URI[sha256sum] =3D "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d=
1b15d3d967fbca"

-inherit autotools binconfig-disabled lib_package pkgconfig
+inherit autotools binconfig-disabled lib_package pkgconfig ptest

 # Enable gnutls or openssl, not both
 PACKAGECONFIG ?=3D "expat gnutls libproxy webdav zlib"
@@ -34,6 +35,18 @@ do_compile_append() {
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
