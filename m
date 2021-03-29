Received: from outbound-ip24a.ess.barracuda.com (outbound-ip24a.ess.barracuda.com [209.222.82.206])
 by mx.groups.io with SMTP id smtpd.web12.17227.1616990795664107475
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Mar 2021 21:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=ZOGpeqBG;
 spf=pass (domain: digi.com, ip: 209.222.82.206, mailfrom: ben.gampe@digi.com)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109]) by mx-outbound8-202.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Mar 2021 04:06:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXB02nuJxQKEIHRPtYzbZ9TXK6gSeyae097AmM7XofAKsE836bZJg6agIgjF2ZHhFaZJR5Q37KVZR6soxC66ybLJvnotiXF5j+W7gQZLcSNKuydRkQ9jvgjP7il75IwuORcENA5wznbIzZC1VSm016z8cBPL1SKOb0X+3ldMkyscIBlHJO8+B8EdJlZu060FdkB+GUGXWzLGGyZAqWNPJ5Uid8lcI0XiXQsqVYhhdkxenCIpvEPe9Ag96Z7vvjcyEtfPfDjWUVieQb2VyQTO1S1lHouK5PbkUE/jf3kV3so2fQTt3q4babTLj/g5JZY58udXMvjXlEh2glz4+x08TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGf58+s3lV0sM/5G0R2txRcZ0+yPHkFpAPJ3755jawI=;
 b=loySQKlxUu3B18uWAUJtt5cFPhFVa0DE1M7vSTF2AUzqmpGxqJ+MP3K+V9hg8WL2tSNu344gwFPla7Q13UiH1gNCX00OqKxpi/d0Y8qEP78l/6XEANAaw0rrgkdHLxsyFWamXOh70g6SAO5Y384ZrEwojjbr0VfvWNaHCh2g/c8IePiI+Ldds/FGBSjouDnHBOQDZeXhp/DzlRmUOiElE0QeYYTAyHCcvlWs9NPFhjkB2S7AEQX9g8pKWf98dNJRc/cFkXciPNOwW2at7Smb4xWwWo8V6WSGVIFtgdKs/8BhhIlLJinyipoBaWR8zdG1MRNAEsJNJydLsGbm9A4hmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGf58+s3lV0sM/5G0R2txRcZ0+yPHkFpAPJ3755jawI=;
 b=ZOGpeqBGoMe1oJKW5UiUCkT6hAeq296o9f62rLCeTWSZVQGOlCxPzcX/1oWVb1+hc1fXHRma5KgFJcoUzLavfEF7PKZvD7OZFLczHB5QS2LX+8i/Kn1sGbe9SeKoyml5jFNI65NR3Q2uNHelIbKQOKkdPZxo0GE9VBVXdQphejM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=digi.com;
Received: from BYAPR10MB3320.namprd10.prod.outlook.com (2603:10b6:a03:15b::21)
 by SJ0PR10MB4543.namprd10.prod.outlook.com (2603:10b6:a03:2d9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.33; Mon, 29 Mar
 2021 04:06:05 +0000
Received: from BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc]) by BYAPR10MB3320.namprd10.prod.outlook.com
 ([fe80::3cd7:c100:494e:cecc%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 04:06:05 +0000
From: "Ben Gampe" <bgampe@digi.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ben Gampe <bgampe@digi.com>
Subject: [meta-python][PATCH v3 3/5] python3-uvloop: new package
Date: Mon, 29 Mar 2021 14:04:37 +1000
Message-Id: <20210329040439.2600056-3-bgampe@digi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329040439.2600056-1-bgampe@digi.com>
References: <20210329040439.2600056-1-bgampe@digi.com>
X-Originating-IP: [49.197.127.171]
X-ClientProxiedBy: SY6PR01CA0005.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::10) To BYAPR10MB3320.namprd10.prod.outlook.com
 (2603:10b6:a03:15b::21)
Return-Path: bgampe@digi.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from beng-dev-laptop.beng.bne.opengear.com (49.197.127.171) by SY6PR01CA0005.ausprd01.prod.outlook.com (2603:10c6:10:e8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Mon, 29 Mar 2021 04:06:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e29b0eb-f6b7-4591-db27-08d8f267f986
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4543:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR10MB454384DE7C1F8AEB94F9D6238F7E9@SJ0PR10MB4543.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kdcVsew8HZ4nXDX2h5AFAkAo2cWEGqJyPQ1LAYLi4zq7xWO9gXyWckZcmagBE6FRXQ45kLhD8PvaHMyscX2ZfoeYeqeorZLHm4WM7sCEVBG+mPM6hjH0sibppdzYsmtSgePtIZmn3ptNutm+Ld3udVoz3WTiY/D2XPaLOoMmdk41lNnTaXhPlKIRacfYVveL4nruseD3EWY6hz02w0qOEroEJMOBKyoWWeW6shK79uQ9w2IL7Sv1O8kiAxCEo9rEgNabdmcjJhfM/BEL9sC1o+X2bQZuglfFOLTmP0GcxOp0aMjo5AdWcYz57aPJ7wQGwFhENC9WdibOi5roLBXWExrIjchxNE6Hp8gDAL2JH5YYQZEcybC/7MDcr6XT4UpD/d6J+w/b7ZVEdNo8XxwuwN9JhVhe410FHnvLofICFsJ23HRmUzoCKvxeG+rvwoPuEppVl8eTObiuIs2uljgfeQIQniH3uIFTkNLk/ax+k+kmQbhdzwdQ2Tp9paB2rdSyu3p0wZNA1/2v09GXn1EfuUqc3pmnQdNkWRYjRBV3PMETB1N+GPG1qUPYVMa8mvY47c9tyEMDICWfwoYqRzqd6h/dpgosP+SPaGich5NpounKFDTIFkFOnV3IOCyjWECip4HeOEK7iMdPlm2K/iQb80KoOjP3l2zkmorN83cPJIgIpQ+5Ui4wsjz5QcQBN9kV3RWHLOJDEArrTcYDW6HXPgtj7TRSYeqKTCBn6WiULb4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3320.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(136003)(366004)(39840400004)(66476007)(16526019)(186003)(66946007)(66556008)(4326008)(38100700001)(26005)(1076003)(36756003)(2906002)(8676002)(6666004)(478600001)(5660300002)(8936002)(6916009)(6486002)(52116002)(107886003)(316002)(6506007)(2616005)(956004)(6512007)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?DUz2VBW5sMkLa8m4VFdD8nwwLcyEoW3+Fr02gm4vBb7mvQ8K79eiFU8XVncE?=
 =?us-ascii?Q?JeXAbUyhzQ76ZlKZ+rbD37Fr1QgHheU9jDn1S88RygbX0lP5wXGaWBLBhfAU?=
 =?us-ascii?Q?QWkLWOIJy9W+8ZC+z9EtfRgEVBC+FNQ8uLTSSqeUxrOd2R1Tb1izqAEOTyb3?=
 =?us-ascii?Q?LwWuHw9hUCTLwdrjtNWNvP/DCCRXv6EmEeu7NLuhzEXewofr2bUvHBm/0Dm8?=
 =?us-ascii?Q?oBH8+M/DSxNVbUSWepMrk5JFs3K+kQ0+Z6m781sDTFm2psr2MDuZHImXqwxs?=
 =?us-ascii?Q?SD4wDCwORDvgL2T5ri9Bwq5apYLj20VUGjfmOx9ZnPzza/81Dgmo2pAhF6TN?=
 =?us-ascii?Q?putsyUsYTQp62+1sbF+k+suYkV8lhStNHOGF8xg/vDjlEvlss1HrXkuPfNtd?=
 =?us-ascii?Q?NPSPQ5l+v6NdQsPwanjw6QTN1+aYLWxHl+N3arL7f4cxpdUoi8eNWYv4RMbS?=
 =?us-ascii?Q?j0zjSt4HcvF1NoJy1ZLg/tl1Q3II8jeV9JAQ8Ma7J76lbYQiNQ9JGwdrWkyF?=
 =?us-ascii?Q?LgD6Uj4YiS1YozqlXtA2aMo+gNSD4NRS577GPiZRDZO43GLJpLR/JDRYcAaf?=
 =?us-ascii?Q?1dZeqi5/7ZKq32yruHfyLttHVlSZxUw1hy+VDZomnd8qF2seitwcU/EZ0FO4?=
 =?us-ascii?Q?VTRgQ/VTHvxc1Dq6v61RUE3cc3GuJ5cGvWUlgp1OZ+Imc9R9jLG8HA4ZZv3V?=
 =?us-ascii?Q?uo9jrDnioNHf7XmjRFY1Qt5jfQyifZin3wbbJcGVGR++IJI5wQ6Rn615ubMw?=
 =?us-ascii?Q?sZKwOQu94WS5baqkg8if+p4posWFb1WxcXHYanbpvF6adbwwroxFBDAKu0nd?=
 =?us-ascii?Q?NmI48OAWcU1Lu207x41iXTQzPwMTNx5QDNnZGg7xQAUGRXKLAWm78C5FiIu3?=
 =?us-ascii?Q?wRtg7CeL3ue98W0W7oGZVBoAiCdczSAEHCoqyeCxd9dPbrV2tB3nnZYjKjNj?=
 =?us-ascii?Q?6dcKUXYn6iclSU0EwCXDOf75iy6m3sxAtDk4usDLSLObIBfssK7tlTFI1GjM?=
 =?us-ascii?Q?toe4VSt1QLiQrKokcbhbp0UPx96ElmQw2n/h/aUFhQImfNo3cfiR/hLI/RWl?=
 =?us-ascii?Q?iWKLCQ8Bgu5Qdaph33YmWyWhdW6tz5SJ/Mk8cNYijB98azB7DFrtkTfchLhu?=
 =?us-ascii?Q?8Uhdrx4+CIdVnJu1WuwLRenRkApQnHNA+dBU6w0/YQQbTqK5gpJL3c36m+ut?=
 =?us-ascii?Q?eM/o95iIzoE2x9JiVDOx9vrP4siffqdh1CEy+RFMAebZ7YfU57elPBrhkZ+x?=
 =?us-ascii?Q?DNHdIhfwV6z9He1gbKOuWq+pVxMYdkbGHnGQXtY+xCT+Payb0DeOgXrv+06Y?=
 =?us-ascii?Q?fUv1Z5gfui70QhtHtBepYs0t?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e29b0eb-f6b7-4591-db27-08d8f267f986
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3320.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 04:06:05.6342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvoyxurEwqPAApnJGc96CXdbIIPlRuZkNdOVGLgQp77qwfzAlKqMBTWqRYb8fjna
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4543
X-BESS-ID: 1616990750-102250-5772-63330-3
X-BESS-VER: 2019.1_20210325.2126
X-BESS-Apparent-Source-IP: 104.47.70.109
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.231167 [from 
	cloudscan22-232.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 MSGID_FROM_MTA_HEADER  META: Message-Id was added by a relay 
	0.50 BSF_RULE7568M          META: Custom Rule 7568M 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 NO_REAL_NAME           HEADER: From: does not include a real name 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=MSGID_FROM_MTA_HEADER, BSF_RULE7568M, BSF_BESS_OUTBOUND, NO_REAL_NAME
X-BESS-BRTS-Status: 1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ben Gampe <bgampe@digi.com>

Add a recipe for python3-uvloop: a fast implementation of asyncio
event loop on top of libuv

Signed-off-by: Ben Gampe <bgampe@digi.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-uvloop_0.15.2.bb           | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 30e90dcd7..5440bf571 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -427,6 +427,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-unidiff \
     python3-uritemplate \
     python3-urllib3 \
+    python3-uvloop \
     python3-vcversioner \
     python3-versiontools \
     python3-visitor \
diff --git a/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb b/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb
new file mode 100644
index 000000000..4fa151e6a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-uvloop_0.15.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Fast implementation of asyncio event loop on top of libuv"
+HOMEPAGE = "http://github.com/MagicStack/uvloop"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=3bd0b2e751776b370b2151ac508af939"
+
+inherit setuptools3
+inherit pypi
+
+SRCNAME = "uvloop"
+
+DEPENDS = "${PYTHON_PN}-cython-native"
+
+BBCLASSEXTEND = "native"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+do_compile_prepend() {
+    export LIBUV_CONFIGURE_HOST=${HOST_SYS}
+}
+
+do_install_prepend() {
+    export LIBUV_CONFIGURE_HOST=${HOST_SYS}
+}
+
+SRC_URI[sha256sum] = "2bb0624a8a70834e54dde8feed62ed63b50bad7a1265c40d6403a2ac447bce01"
-- 
2.25.1

