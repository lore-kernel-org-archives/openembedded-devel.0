Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web11.1996.1615931755173184749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 14:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=gmbDD4bu;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: devon.pringle@digi.com)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170]) by mx-outbound40-78.us-east-2c.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 16 Mar 2021 21:55:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1I60LlAEaaB179vlIkoMi4CF3Vdl5mLsogn990MTJgNShkr3Mjt7N7HsNB+t3Wal6ueLo890X0yRX7S2cSRQh+Fm2LllYj5imNQZLLIOfPOFxVhFp+sksCv0Zy2nr9e/EY/SvUBY/BCD956CTjIbwOZo//XTV7zB3ljXsuum7vXSswDsLK7ic/b6jWmZmuMaKfq42gMR6R3cOBGuY6SZxnjekrfyKjssUTc+xGpnfafRHZWnQ0J4JLDOCue11sdY+ZIfiU/Hhn/v4XG0e8wj38r+mdGunRC2WZtZjwzL1ycHGGy+oVmN9QvtBlM0wWPpBH9aLI5RiS2w7IXV/+Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9NqUHzaqG10fqZVnsuswYn2w/s0keXPfjWULkA34Es=;
 b=kNmZCVgZdSmkRsQdvU3Pcmrcx3ASCR8SCkrVpvEb1RbG4vGw2UW7IIl/uxz39jzrQtaTnfTgjNpQn605NhcGcijKJaWf+W1qII4yBd5Su3wV3S6tJRtodUTPg7CV3Px40sV45SD0ZYXNfDi7qKHjJrL7hJQguDpNJ2a636xN10HqAGyfAXKQLcjKim5wvq9PpItLxAfLyatcyoVrnUz4k6Axpb224Tr5qtcPWUA8zxJWp+CLUGxD82rtzrGygrvl6CHo5fz0sfUrorDjs3M76UrlJ0trQ7WDLFCve1JB6f0s2KiTBGRZLAjs2gY2i4TbQGxP5dsPqV8rYcWphXF/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9NqUHzaqG10fqZVnsuswYn2w/s0keXPfjWULkA34Es=;
 b=gmbDD4buMYj3WN9JkXojjrbIWp8pIcG6tzTIuefUcXYrlNCV1Ul+YB0RXd2FcixM38UR65Hg8jf3qqkPFS43qoKQli8WLBIcuArLv6fhXo8AJGSB9tcKlxkOKRPb2lrC/dhQ0eLCmO2etL2+zPQoX8QuJcvvZ70wA55Dgy5/mUM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB2838.namprd10.prod.outlook.com (2603:10b6:a03:8f::16)
 by BY5PR10MB4228.namprd10.prod.outlook.com (2603:10b6:a03:200::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 21:55:47 +0000
Received: from BYAPR10MB2838.namprd10.prod.outlook.com
 ([fe80::d14c:b8d3:7603:f809]) by BYAPR10MB2838.namprd10.prod.outlook.com
 ([fe80::d14c:b8d3:7603:f809%6]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 21:55:47 +0000
From: "Devon Pringle" <DPringle@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devon Pringle <devon.pringle@digi.com>,
	Devon Pringle <devon.pringle@gmail.com>
Subject: [meta-python][PATCH v3] python3-pastedeploy: Add recipe
Date: Wed, 17 Mar 2021 07:55:10 +1000
Message-Id: <20210316215509.1986840-1-DPringle@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316153507.3426404-1-raj.khem@gmail.com>
References: <20210316153507.3426404-1-raj.khem@gmail.com>
X-Originating-IP: [60.241.24.90]
X-ClientProxiedBy: SYXPR01CA0095.ausprd01.prod.outlook.com
 (2603:10c6:0:2e::28) To BYAPR10MB2838.namprd10.prod.outlook.com
 (2603:10b6:a03:8f::16)
Return-Path: DPringle@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from devonp.devonp.bne.opengear.com (60.241.24.90) by SYXPR01CA0095.ausprd01.prod.outlook.com (2603:10c6:0:2e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 16 Mar 2021 21:55:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b742c888-0104-4bb7-8d9d-08d8e8c64150
X-MS-TrafficTypeDiagnostic: BY5PR10MB4228:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BY5PR10MB422855BAB3D0F84F0CCE9310856B9@BY5PR10MB4228.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CjCDZC3WFsbcxPBsE4aG5lyS2Oe4vmJxC46lwxbASGKWMa9/++SUGWmelXXiVDCbDNRfuCNoZbEHLdj2dA+EUWEJGEt9+FV29Yki/52mGbY74D8rT5eMNS8Bk+gcV8lJpLjnNbfOKAN94FOK1Wcl4LjeruM3ItegYRM8pYzidG7f4I7+cjuEGMc+joKNpt/axRtfVrMCV4RFbz5X85hx/OWPtffLbEeM13zTJkswiOSoKccNlZ6gio7LqBu3j5hd1nlwvV0UMg6SZr7+mzGvqjNOYMgLBFLxQmtk/7B8b0b1EFAbffSkccFL0Hn7ajLWwd02yFG9qGatTUqO4yOnsBvV2lJ+TiLO0XcXN1MwNT8qjD+vqYIutEKKtACVcKCZLWmNgri8zSbsrh6nfTXjM6ml8GhZLXmS2Zwp/PNoeIR10PAzzZiYrOeuMMA6QqBEGaDMqkk0JMflj3vSwo2qvVmb+7kSyYjHPG38WxHWc8a/ts2LkqoEH6FmGLcOq63qOplRNXhnA6D201Zz2aTZ9EilWRHKz49uEn6YxOWLHE2owzCQDPpSEVlPzOVfKrf732Q4FD00awew/p7UjY9c3lvh25flx2P1kzw0lalsIW4Kg4Pqh3DjMSJ4dS/xeZ7I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2838.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(36756003)(66946007)(8936002)(54906003)(6512007)(1076003)(5660300002)(2906002)(26005)(52116002)(6916009)(16526019)(8676002)(6666004)(478600001)(316002)(186003)(66556008)(66476007)(4326008)(2616005)(956004)(83380400001)(6506007)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?4KMF3JwGqvZYQY0ElGMp2KFyaJYLfNCgyjvJIiNbWVLmP1Z7uAjA+uH0kcME?=
 =?us-ascii?Q?MHivUh5dSKdPG+oj5mz9CO9A3gAUaQ62Ub5w6uQfLJbDrlCx1mLNQLarMUsq?=
 =?us-ascii?Q?nav9NiP4DBt28ri4gsefPGryZ8jLcKes8iu6ovDy8fIdez5ebIzZ5FJko3mr?=
 =?us-ascii?Q?QlGI075RqP6492jyfzz4IT0h5jyxR/fGuXrBK97ZkPUci0KwDpEkZ7M3yBkk?=
 =?us-ascii?Q?+vh4KfCVvG8R0JL2xOujOrOIcMQvxtkbAa9AMBrvmvOD8+8BVccC3W2NgKRB?=
 =?us-ascii?Q?1s/gPS5VzVlrPtgW3bXlqPbwdZfOsQ0nyNBCWBcu0ZBFB3bao/+DTUJu6V9h?=
 =?us-ascii?Q?jEX6MUumuYo3zZncpdwleC4v7E+wOdmlI0Bhez3kUqMroEUwXdjBbpadGt4p?=
 =?us-ascii?Q?UrKJIiINgLuHOJKzffWl1XBJ0oJ/+dxaqeHdqSxZvINpJQRsy8YjHj0QTERl?=
 =?us-ascii?Q?ZUFc5CuLQFSbq0LK9aWO/DDXXQI4z7AL76EM+57t+dmyMvQguebls4ieTBKt?=
 =?us-ascii?Q?w3gJzfvsSy9snIUH55WMsdM54lv1DggjYaPOMifbDHLuhTxesPXaBNDA0oCn?=
 =?us-ascii?Q?lWJfs/FOjKD+3NkSpKC6EvNX2qgHCcVJuGd8JKLO3lIAiXF+NniENlKWK71Q?=
 =?us-ascii?Q?QCQ6dKnMKYY2G06+l41JfuprUW1qc2/+XZK210wUrJgk1/Qy8mpwEBFPxf/y?=
 =?us-ascii?Q?2fXYq0uIZGIyPSMqkRNgD/VHRzcOEsNfnafiMzQFeETlBj3jHxvQC0Wbllhd?=
 =?us-ascii?Q?rlKF+C0upFQR4627Grvu7W31P9pBdFzr0QgTP+yCzxWet/IDDKORocY0pvVj?=
 =?us-ascii?Q?3JpHII84Lh6JrmAV0bJY8hjW+sDq+rd4gZHxxUIQ/HeEBUw+fVJx8xnpr9am?=
 =?us-ascii?Q?uQeUjdcxbc0wFBUWj/7VcHGH4KN9NtqjTR26QJZT1qhEYmZc8JCQHJOAl6+1?=
 =?us-ascii?Q?wzE5OzGZxg11Kei6XFMLctzS7qBaqAMTfaDdGZ55MLEyZ0oj7+LRplqq8pur?=
 =?us-ascii?Q?OesvBl8JxyD6yVrQ6fCvXZStrUljexRvFcmiATMTRke3bWkWm20P/Q4OVkJG?=
 =?us-ascii?Q?Pun8mwHyxgaaYqsOP5IKbV1UlgwD3A2cUFMfi13w4S6/wWFwDRaTJucefB8X?=
 =?us-ascii?Q?HR5/qhX/PLH84QHLZIcjjEMoBHcrG7b1t+BchcyZGV9GKEZwzinuyNtqDaHR?=
 =?us-ascii?Q?7DypZuzzPGetU6QhYj/RPpaGr0PYFlhATZwv9EFgVqWqFKbYSJFtL5D9CUAn?=
 =?us-ascii?Q?uscvQoqqF5s64TaHg97KMdvIbpemEe4vKeCa8lyZU2muoGMJatHGXsAg6srD?=
 =?us-ascii?Q?0a+hp8wkW8ErTkLJg0rO9VMQ?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b742c888-0104-4bb7-8d9d-08d8e8c64150
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2838.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 21:55:47.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KqXiVs5rGKs1GG/U87oHl+iA4w9iX0dLEr6g1mNTJ2a//M34aVJHiMNOUwqju2mUUi7Auiz4VuBV98/oVmBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4228
X-BESS-ID: 1615931748-110318-22906-62106-1
X-BESS-VER: 2019.1_20210312.2105
X-BESS-Apparent-Source-IP: 104.47.59.170
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.230888 [from 
	cloudscan21-150.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Devon Pringle <devon.pringle@digi.com>

Signed-off-by: Devon Pringle <devon.pringle@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-pastedeploy_2.0.1.bb       | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 4512f839f..9530c7201 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -251,6 +251,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-parse-type \
     python3-parso \
     python3-passlib \
+    python3-pastedeploy \
     python3-pathtools3 \
     python3-pep8 \
     python3-periphery \
diff --git a/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
new file mode 100644
index 000000000..b7c8c61d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pastedeploy_2.0.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Load, configure, and compose WSGI applications and servers"
+HOMEPAGE = "https://pylonsproject.org/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=1798f29d55080c60365e6283cb49779c"
+
+inherit pypi
+PYPI_PACKAGE = "PasteDeploy"
+SRC_URI[md5sum] = "6193afccc0982abedb9b7711d0d6adb0"
+SRC_URI[sha256sum] = "d423fb9d51fdcf853aa4ff43ac7ec469b643ea19590f67488122d6d0d772350a"
+SRC_URI[PasteDeploy-license.txt.md5sum] = "1798f29d55080c60365e6283cb49779c"
+
+S = "${WORKDIR}/PasteDeploy-${PV}"
+
+inherit setuptools3
+
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "paste docs"
+PACKAGECONFIG[paste] = ",,,python3-paste"
+PACKAGECONFIG[docs] = ",,,python3-sphinx python3-pylons-sphinx-themes"
+
+DEPENDS= "python3 python3-setuptools-scm-native python3-pytest-runner-native"
+RDEPENDS_${PN} += "python3-core  python3-misc python3-netclient python3-pkgutil python3-setuptools python3-threading python3-core"
+
+# PyPI tarball is missing license.txt
+# We will need to keep retrieving this from the online repository until version 2.1.0
+SRC_URI += "https://raw.githubusercontent.com/Pylons/pastedeploy/2.0.1/license.txt;name=PasteDeploy-license.txt;downloadfilename=PasteDeploy-license.txt"
\ No newline at end of file
-- 
2.25.1

