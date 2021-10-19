Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 247EDC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:50:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5401.1634619006184437334
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=hQpWcw7c;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=592622e463=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J4hhvV012515
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xCN4eRhXSH2xYlAC3KlgNHA5i6HA2CuaA8YxzBMMsrw=;
 b=hQpWcw7cMphJLFgYAZXF1BgmLr6dp/vMpXML3FoWbx7i9sYENzOEmto1Bro9QEKh5pcf
 XsteZalkL40QtsL1N+Jq/zzod275ArKYDwyxz8byZwKGlUU1bvoLdNdJY0MQo16MyTkI
 JWHGIj8p+F850ZadX9Kqy09mG5zAwAojhLhh6C3m05OsDu8LR55YunL7wHkbmQyPnyJ+
 w6Q49HPBl6EwdMk20QKlqtU18vpT54FPK9RGgsK7vfaN0IZdohFufN9lpsaI1LQdpWuw
 /0Q2LF9jzr5GNGEcHu3GLc1Xbo4IovGOlU2BoYZAqsWL1Z7I/hWfR9YIwM8FLU2OMGdm FA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3bs9apgn0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Oct 2021 04:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVm9/+2CSWL/mhS0eFYODesr+kfHFi44+Zdsa97szpMhs/RDt0S6br8G5x2H4tQw8CD/NDsQA+uRstNAiev7z8ACytkA6j/UgqT+ecrhpVmVJRH1rv1pL/CM/nG1KC/uVESjmlUEXGkolLFTK7b6/qPesLPDNqsLsTIhzzyMirzwxqYj1yzt0NHiZ91CqfmGrjO3yOk8uqLC61tAyG/fZEmF649nYKz4fwRnj3jNFL2haAzOsHewqp2JLhPp72KVfDI46oAbvfoHHfvSfbsRT2vA/WssfeXGnzW/vbPf8S8t1G2qvxyb07AHgZjAjRPrTb5CRd971SmLXh4tiT/Msg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCN4eRhXSH2xYlAC3KlgNHA5i6HA2CuaA8YxzBMMsrw=;
 b=LW4cPQtoJGFTwCGb4vAGryFmOQyVNslEJNodaoOTTuQtjnhpQzew1rLzD/5luYjgq1Iz5cEPdrU1Z2TneTTSJKkHpDijG41PyWRgfor5b1GYkegriLGSO+FzplPsx+dwAALs77WV2dTOK1y5Grm/JYR2ZzYJshHe3st8RQhIO+xffhn4KSUYV8DH2CJtGgWpWYrZLQvHViARzsKgmaO3KJ3RW2dGRYhexZKm9QhrPsw6cthUC30JSdYqfzutqO+fUDdTZ+lcksJ5e5e3oxuVs9vF1pWhZ6xavix4QR9l1erpaVOyF22yB0QmbyteskRVCvGENqMeA+CZSPAlmxHdRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1373.namprd11.prod.outlook.com (2603:10b6:300:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Tue, 19 Oct
 2021 04:50:03 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::455e:9cfb:d106:4480%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 04:50:03 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] strongswan: upgrade 5.9.3 -> 5.9.4
Date: Tue, 19 Oct 2021 12:49:51 +0800
Message-Id: <20211019044951.53250-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by
 HK2P15301CA0006.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::16) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.1 via Frontend
 Transport; Tue, 19 Oct 2021 04:50:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1fd39fc-1c2c-47fe-575e-08d992bbe9e6
X-MS-TrafficTypeDiagnostic: MWHPR11MB1373:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1373B069CA9D070F399660A2F9BD9@MWHPR11MB1373.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lWG8+hEzYf7Fq3JZwZPgfP7bJCCYgCHubOmNl7wDgwdzhyATGNLVgEsaX2+npBxfxLQcRgnE/IDKUn7z6DCvKYVIYTlo5miov8pynVdSjFh+Sx8nl2z0MkTSvqwtOd1RKz1vild0Pfe+Bi1blmGzrFmZt+39zolpk8dztsMpRd3LWVgdANlFIOqTj5J+wrOXsPvl4qjKXJiLulVIiAWKjTPJBuLzOoIg25XiwLEnga8u/OTuD726Be7X3uvNuFAaj+13LWs/gQvUnwG3OYudh0tz6b94BWRfa1zBJZLojeRriznQFQxG/uKZZWCBdZRq0OQ+sc0WcKosq6Y+7/ecScQyzXkOTYVAOg9ESZmX4wFOR2UWCaeOSiVXLtIBlcU2c/T4BPvS6SlcgzF/SG8tx6YXL1ApP5zr+VXgWeuGfV947Kt982W3UzbjcXNE7fIrXdHUTEajPbNsXeEivwOP3nRJuHYkSpxBdHEl3L/pReuFnw64uF+Cp8WNFyhsCRC6PVkUZz9p9RCQB6HPuifTLK37lPcpf0RmhVF21ai/9GnQFdPIJCWXVOIDKkGr8JwAbQRnSX/8MIIdN0Xi3MZHySnHsxSHjrgHXMrjISk81XYr/Zxz8urpmdVymO6rwIvZFEWr9m8SyW6LPYDAo41O1HKAXLNH7sE5RGFlfc5ZE6fktaanIVCGV1Vjx+7nL7CZIej8KeHtNDiLT2ZVO9lbx7CRcHIquwy98I/Jr3rCleEo2djV3piErve2n0MHetNy5mJ/gWgZp2JA6B8pheNP1T+2yef7IVWS2jJywYQY6As=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(6512007)(38350700002)(956004)(66946007)(36756003)(83380400001)(2906002)(26005)(5660300002)(44832011)(316002)(8936002)(52116002)(508600001)(86362001)(6486002)(186003)(2616005)(38100700002)(1076003)(6666004)(8676002)(6506007)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G0yQzU+hnK15NeUD2flBZ/UPRfUYxvP8t3WPd487SshLoh7mgc14OebzQaT4?=
 =?us-ascii?Q?RSf5psMA0cejNtbhCpQwvqpbhlMx09N78l576knK1rynjHKwLqFr4JMdhvao?=
 =?us-ascii?Q?kLmODo0DrKLGkkl5Cgdsrb4NyBxx+1GiH9rK9gIxsyf1+ABZpH/r+wVLPw7D?=
 =?us-ascii?Q?o86KGc+CoJolL7QzsBNLR4ZsOpAh17WDxfEty50uvtOu2mtTdzipmsx/wBf1?=
 =?us-ascii?Q?FD/ts4gwlXNDigxNPwQqe0lvnaUth+UjSPVsJSN+iT5bEICVBQU0pbsnSsHd?=
 =?us-ascii?Q?Xak88E+Zl1KLcnrfXmd2gUuKpdDzZffW8Koimum9jiz++PYWAyHNHblwDKKf?=
 =?us-ascii?Q?fA+U0bm/Ix9HuJ753GtKAY2vS23QCOX6tfDAyYv9va8lXj41bfnx89bKU09F?=
 =?us-ascii?Q?vf2ITn/1RBdu6PPgQ3+5NEpMee7NrceSeXejH9BNLH/k+bsq/6l6avpDSrgA?=
 =?us-ascii?Q?J296V8VF6zjC0xTjunqi44k1t/tWwpiNEOPd39p5IdXluJNfext3qkHC4pCw?=
 =?us-ascii?Q?IJgMKB4jDJ+a/OlIfG/NWwjKBK9317CMa3cS4fm1UnPtsGKrziPUlIq627bl?=
 =?us-ascii?Q?ia5yIIYi1CH8DoPk1Yo9iBzLMKlHpYAgkhSH+VCES11J7hAsOzMbm/oDdYdA?=
 =?us-ascii?Q?Drp+l+hCx0z3PkzM4N9TD4yFA2gnmkBGBn5bS1V5LzA4m7GY5H28dPj7WXB2?=
 =?us-ascii?Q?ZulMPCvFnprt4hwfO2RfU7PO23JdpRdorrV9/LfMLGWrJjqT6jQVFSy5sPZW?=
 =?us-ascii?Q?DxHajN0pmweAljtQ0odD3npKklN+f4TuLr1lKUUQ8QeGtDGJAvgUNMj/2e9r?=
 =?us-ascii?Q?2LhVljWMvaBhfRPr1AI5FMvfhDbVwvGL9iyMJnlZGYh+X/1sCJhfR4RVFHIQ?=
 =?us-ascii?Q?v/Iuh3DKFn4Tj5Ed0KN3ZZQdsgMM7Z4sAcwLwChmpa9m5CCaGbWn/GbiO8+q?=
 =?us-ascii?Q?qJB/75+rS4rLWR37RJOCdpeAUboIujcy6FiwcUdJq4EHxodraaQuKEVkdEFr?=
 =?us-ascii?Q?r00rLk/jYL61RnGS5b212/tOKLwmKoF62JauKV8TmSbvpI8hqFKu7KG3mfhg?=
 =?us-ascii?Q?h4M0O2Fw/a5TfscNmFULqJod45IEmlBYwsmQdRmB/7xRp1fzoMbpdsaNxkDV?=
 =?us-ascii?Q?pryl/dJqA/WP9sDmi9im+wSsAsrymugFRnJnkxSBMbRKetAGtzK2oOw7fba5?=
 =?us-ascii?Q?W9eFC0NYcf0HSxaeC6WMEOOG1zIrSKIrb9kh+dx2kycVNmW75u6F+OoNeXA1?=
 =?us-ascii?Q?EYOiIRrIy0onobQFt2CRw00O/7ydxM0S5YuBxaudNLUssHQAeJpVOHXyAZvb?=
 =?us-ascii?Q?axATE4WixXokNLkQRXfmkAQD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1fd39fc-1c2c-47fe-575e-08d992bbe9e6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 04:50:03.2094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 05AsRCR6eCrfOtL+3bhUQo3ADl67aV5DNXJ+KV7ia8qqprcRXvd6A6Wn93PyIvCnJk6ujX9y/2/Cn7a8ePvnUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1373
X-Proofpoint-GUID: VvdEyB0C_U8iRCjTCtaCeXnGFcFpP0p7
X-Proofpoint-ORIG-GUID: VvdEyB0C_U8iRCjTCtaCeXnGFcFpP0p7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_07,2021-10-18_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 mlxlogscore=540 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190027
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Oct 2021 04:50:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93455

Add openssl PACKAGECONFIG back as the openssl 3.0 compatibility issue
has been fixed.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../strongswan/{strongswan_5.9.3.bb => strongswan_5.9.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_5.9.3.bb => strongswan_5.9.4.bb} (97%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
similarity index 97%
rename from meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
rename to meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index e76636af0..cbc263d30 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            "
 
-SRC_URI[sha256sum] = "9325ab56a0a4e97e379401e1d942ce3e0d8b6372291350ab2caae0755862c6f7"
+SRC_URI[sha256sum] = "45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -23,7 +23,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl gmp sqlite3 swanctl \
+PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
-- 
2.25.1


