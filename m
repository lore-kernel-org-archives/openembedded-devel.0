Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCF7C4332F
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.36240.1640677121478787076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MA5Lnf4E;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7UHkt017574
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=CZYOe5PhB5gxebkHUQAH3g3nmYA5mJbk+CQWw3mf70I=;
 b=MA5Lnf4Enn1UBlCDc7OFLRJxhzgVZeh/DarUWiA6CXu/dKAa7z0OG24Q3+lI0qtAULsh
 l1tEkjLwSPRZcgvp5GTRiYjCoXX0EuaaHODkTv1QerwD66L1hZGhDW2Y3fn1QRz6VuPy
 EoRNwRXRLYAfBvdkiZrHtmdAbrqSsdYhM/O0mHyIcyiEl2LwFNUPzzMjdWNm+Q56KlKT
 oZIi+AEYQGgrLZ2pNmCPDVFSgUrm3CjPFgAJ17iCGUKCXgWqk/vzDZUTZZjW9giR/Sv2
 CKsnh43O9zvYmV3/Ik5KpcZBSD13suzZL6UsmPHHSZ+CJWxM5KJabKby3KKPdIcFUbaH aw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:41 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7ceZ6001369
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:40 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7kpw88nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Dec 2021 23:38:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sb3Hc8WTvXaeivi9a9VbAng3TNLyhzqozQgMFPLnMaahme8FuYEmHbLhA/pbeJDm1ERYh8iAXruW/XjCqtg6dTYXubuIjE+hFRZiZmN9mnQtQGBQJ6GqNfeQv7EK1220cEiDPiMHExTzhZP0U+4Zly0s8dC/AQrcAo+zfkB/ykM8o2icIVeJ3rJKYBeCSgnEIBdkbhVKyWRF98mboKIFXg64MLHg7Drl/DH2GbdjxborOQr5uXoRPj6UIaZNFvTytfaCbpiwtb0p1pX2cWq9OPF+WfQ/g/iOZW82vbmaaUgIXFgFl0RGUAdVRSZg+yJnTEIm9G++2efxXH8M5HnVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZYOe5PhB5gxebkHUQAH3g3nmYA5mJbk+CQWw3mf70I=;
 b=TiE+J2kQtGOxZkSLYraG9e0vn9UHdGXg6JD8YUgKBH/Ko7ZtJCZEL9iQ7KAQUWtgUgYdpT1f7mQif1j8YXY0cb3fTYA6HmIXCENHvAQKbHNqcosHi9tQEsgEKVJ5h6QDyiLt7H9wXpNJNcm0hbxeiVIHXkeqG/ZjUuU4zgHQpGJ8wXiYqlJInju3sNEJ4fv2y39eMnXwpJiiGRGNN+FU+uvZFjWOI5oRj6u2wgJhCug6CllpqmJUa2UPKEMwk1Ro+i1KaDtA77wA+Sw6MKkFPLKjmtJsaC0z3yR3qihJDWPHaPdLpDF9+Je4qYS46E5DiAU/rdRoRuRnl2OzUzQy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:39 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 16/19] samba: upgrade 4.14.8 ->
 4.14.10
Date: Tue, 28 Dec 2021 15:38:03 +0800
Message-Id: <20211228073806.868759-17-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de6eceb3-be45-46d4-9c43-08d9c9d510b7
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1584CACB7DBF6FEB310C46EBF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YRxPeXqo71NSJqzVjZMrSssVS1xNMLNaP+5D3fX2sqtuOgnCV9AyAGXfQJoRUArTWuG/+gLVTseDrDmqb5RViJWL/I0iVxtsBLZg3vzX8onVHnGD9x1qFPIgEYehibf2W/8lb20sO3kFGAODCnMXbukE2Yf+ArDZyQ8sKK3hUJV1uEHsAIodnQbg8QTCSCx8It6NFE+4qB3wawqRdmCW8UTT3K8xxYMgCSk1J2jvxVWXnkXyyQ9V4cyY/Me8U5LYScH+4n3sVz+MITTkP5nG8uBX+M3W8BL2psap75jMwcFgUJp1ULW7yjiekgt0cxwIVFeSoc4GhZyiVxhEysaBW0OSOPQ/lXYWsKs9tA2pUQrB3uOPs57quSg5KKf/fxkzAl+SmZyEzo5YsekL4Hz9RJ/vrpYG/u9D0KzI4ccJToZYo1FHvmwmKiJT3I90n58B6l2Mzz7KN59XurnjJ6ZFblrzENl+QNlvql/g0fEzGA9TL8B2Lj5jQ0dW45X+Pk/dFbAEx4t0yDVAnQSKX0ILhAyQPW9fihUW0KGPcXHbm0k8+yrHv2f4g583RSQSMD6GJWfB1sskWlc8RNFdiIjRliUiKlOxl3VYZEk86rPhHirhAMPdVSbbh+JhX4YtOWUPszvgd31kYhAbLRdXhXn8bL3zhBit7HGlpZeMYT7dOfZAeA+/SKK3rqTTOQ5A/AmwtCjGQIVLsfqFBzag8eZ1oliptGI1ylTVomesqM+oJCYDS7tSysIOuEoMbXuVJLiVk0UgKwR9wTMc+VpR6tDwvlg5nDeFU399PJZpq7hloUMmhlnhiDihhxDofqeriLWJhPJRBhcSIDUDzQGTdGafiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(966005)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gU1W4wxJJw91/pkFypVO7VpqZgkrF5x32FAAChxcq3Vuv6wIvGUNxHZZMdYd?=
 =?us-ascii?Q?SueajaaUm5bJboeimvJnU91nBH8yU94/bYG7UODk08OcEWXTK55qgO3m7g0a?=
 =?us-ascii?Q?EBCQ/2sP/SQ2rRhTi23QbfrbpKu4ctafPtIs27lqInqHxDt2ceBOo6wE+Ump?=
 =?us-ascii?Q?nLzPX4cX8uGSTRjH29LVRJqMQG6t2xC3QXG8i3+t+c9Ydie+vOUU/Lw4EzoF?=
 =?us-ascii?Q?moUytoiffZaBOufBPaiHImS2RNyOiMUJsVo60KHBAP7PAic2he9ceVOYTtA2?=
 =?us-ascii?Q?wOMwqvw13czhVZSI4kMg+UCpf/qHJ16SbwK+1il+TGKrkOdPaHRnq8XdOxN7?=
 =?us-ascii?Q?jNDzIBywQC5RZW/dKZcVuKJ5ztvq3E5TnB5NXUkT7tLQtJ6CYXeyqtO9tEE6?=
 =?us-ascii?Q?Lhs2m1dXpuOk7cPk9ZfnGD1fI95erDT5UaycgNERp5z1AS1Qd97wkwgzenR4?=
 =?us-ascii?Q?lqmZbSbhyz/Drb0nERNrcCBcfq5pQYM6UjvPYB/fv+hDv+ZgUTsZpPZADg1t?=
 =?us-ascii?Q?MRlSMkaEEhx23YysCZDwLYHRLz5VF1Y+U6xoxoZU0VAnR4P4rrjKgwR134oJ?=
 =?us-ascii?Q?GVh50dwmyy8hos6UzWi5Lk2/4mcSl+58PmHt8RiM1JWd9AOhoZwIO5iJuzdW?=
 =?us-ascii?Q?BEta1uHO69hsZxsDseP6dmqh9hF9IzQgkKXNYFO1b4fmIRuLWCCPl/D8tqi+?=
 =?us-ascii?Q?PvMwHmAuZ1wC0HJX5mxJwx4m9LJ/wtJpQ2am3pwsm/r0iMoJ0OTOXmFpXztf?=
 =?us-ascii?Q?N1yN+bnZxh5peGM4aID7ztF8a3o3qbpuaBMFLJuaYQ24Td5jqhCv2ZMTd7Il?=
 =?us-ascii?Q?/xWIhZXvCoW8U5jFs4a/CjUdrUDNCdUqiWFdFbmYG4NSqfBpvdovGiubEZc4?=
 =?us-ascii?Q?XCS452Y3YHa39Dheie5blhBMP3QmZQNfK/LmmjjPrzZEo4lFYhLfpXHTxf1I?=
 =?us-ascii?Q?gVgEsZLRZ11794j1ygQgbBNWEBMF2s1l6cRQ9Chbyjsvys4hO0Ttff131HBV?=
 =?us-ascii?Q?O9ITNbFYhch37cDn2BP7prJykKw+bZtQ0s8pJPJ4uOor8zMcOzEImVz8hiDY?=
 =?us-ascii?Q?BUc8tiWoHeODqGPyMlH/zlt9WKAgmobTbILeZd8+49B0oqTEj5IHR9dA32UI?=
 =?us-ascii?Q?jxFlAhy/VBiylcDaxvdSGt/5FGqC7z9tWae00fHwyQodrt+n2Rtbp3Eu8Zp1?=
 =?us-ascii?Q?nUl5dDVsBYgIqYFMHU+HqgdheoOqXeoTJ5sRYW1HLjzcEe/ZxH5cqGdz1Z4O?=
 =?us-ascii?Q?1rblGRcgO0vmLf9QiAKMRPFatYGTF32Acns8ZPjGiPhtSc45We0qCum7pw7K?=
 =?us-ascii?Q?6xV8a5t0mDTzZ16NG5gysX56Y+IIINKUBKKhpQ0VgVL4omd2TSy0RqfG7jv+?=
 =?us-ascii?Q?LuJKAIaTs0GCMhAd1t4XzoNVk/F99opKsr9ZJj3lKNDcWZj6mVSnTwT8LqQI?=
 =?us-ascii?Q?G7+KD5E4TJa5uaIUlZ8Jg/eYhBnms9LtNIuIPkAbrqI6W6QIOduM3TsHuJx6?=
 =?us-ascii?Q?p2wHS9PFXm1dGJnrwFUrFpQVAnLJZB2qb+eB4YnBkN8HF5jcp7MDaBxVB2oy?=
 =?us-ascii?Q?wBRGUXRNgIxCtmA0Hhqd5St48IjqJidOaxlmRpxFb9lWB2GbBkNnRndNYxbb?=
 =?us-ascii?Q?BxreEyt0cweUAPaqLA2DhnQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de6eceb3-be45-46d4-9c43-08d9c9d510b7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:39.7004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kt9BKV/gLxJiYmQQmoQOyQCsGUZRtJZF2hgdJdTUh8Kp982FreBFX4o2McnASnCriS95rHC4jCaOhAsmS9Q7RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: 1awwqsTzCIEsSYi_dUOEb8BOVp_VBEv7
X-Proofpoint-GUID: TUMfhreZGvXFUx0ikP5fkcLJ9ukZPkK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94542

This is a security release in order to address the following defects:

CVE-2016-2124:  SMB1 client connections can be downgraded to plaintext
                authentication.
                https://www.samba.org/samba/security/CVE-2016-2124.html

CVE-2020-25717: A user on the domain can become root on domain members.
                https://www.samba.org/samba/security/CVE-2020-25717.html

CVE-2020-25718: Samba AD DC did not correctly sandbox Kerberos tickets
                issued by an RODC.
	        https://www.samba.org/samba/security/CVE-2020-25718.html

CVE-2020-25719: Samba AD DC did not always rely on the SID and PAC in
                Kerberos tickets.
	        https://www.samba.org/samba/security/CVE-2020-25719.html

CVE-2020-25721: Kerberos acceptors need easy access to stable AD
                identifiers (eg objectSid).
                https://www.samba.org/samba/security/CVE-2020-25721.html

CVE-2020-25722: Samba AD DC did not do suffienct access and conformance
                checking of data stored.
                https://www.samba.org/samba/security/CVE-2020-25722.html

CVE-2021-3738:  Use after free in Samba AD DC RPC server.
                https://www.samba.org/samba/security/CVE-2021-3738.html

CVE-2021-23192: Subsequent DCE/RPC fragment injection vulnerability.
                https://www.samba.org/samba/security/CVE-2021-23192.html

See: https://www.samba.org/samba/history/samba-4.14.10.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.8.bb => samba_4.14.10.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.8.bb => samba_4.14.10.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
index 1c599ac0e..6b69c925e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
@@ -34,8 +34,8 @@ SRC_URI_append_libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "5c6636b34a322de0eb917ee0403be322"
-SRC_URI[sha256sum] = "c936b782c2aced8cd7299c13bec67c495fd4affdb217a6ed6150f4fd6d770fde"
+SRC_URI[md5sum] = "02a3ae53a9c3feb2f3c5b97141b7a8cc"
+SRC_URI[sha256sum] = "107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


