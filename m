Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE1EC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:05:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38965.1669039511542995914
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Nov 2022 06:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HiIlKPoR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83241b2a1f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALDLbnU008711
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 14:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=slajYKa9DqE5/vaVwM5KGjq4GbrkN+QF6aymuoA3QVA=;
 b=HiIlKPoR1BUTDL9qerER5PwwYrNUU2Jz8m4kXNBhsv2ZEdjGgBz2UvkYRkwxCI+IoGCO
 aHLJzxocdprGsMT3TWsDT51GiebHgloAIz3G2IObm1L541YFxjedUJzkIRfMo3ocrlYr
 7Q8OEG7B3U11Q59osr599kf6oii7EB+J9CUDeyXk+Yxm9ANb89xShfVzFXhLFd8iZ7vu
 qi3S/zXmOfhENzjaPet81cxYmodbD+Gw+aqKZhHMJ1a18OkxBcZTIGqy3ASw/s9OMKOd
 pmGNS/6Lx6Bq34OYxnkia2xEFxfvUWfLeW29PGzjH+KpgthVigBQzY9DV0fH56IFk2B5 zg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2042.outbound.protection.outlook.com [104.47.57.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48hm4y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 14:05:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuhAyxH0U+5ranod7v2gb4QL0Wxw4F+45UJoCwzPczcbB6wqdtomWdA/iyAe1CLv5TMSHSY2q+cHOw3PvMN9U/ODKYuAv8dsC93S6m90UKdsyRaQhqCfjZPnLHxHOnzQ10/A6Ce4F+E5MZMrV70I1CgVTc/t2wBSl0t0sDrtK1GMshWEiBxmWc8PBmxzrpCmwFvE8iZ8z53mm1OBglBeIazboYWuRHrOXF1AnAiT74dUC5IGDPADX0L5JN6VCW1IbOuSiS1iQEwFXQJyZqmdHwKbTvSI95UsH4tl1x9RNZOhrFiulE3FjSIRMMv7tDRET/kliQhJ7uUtUrYVjKrHqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slajYKa9DqE5/vaVwM5KGjq4GbrkN+QF6aymuoA3QVA=;
 b=iQPlmoQkDI2PMTpseGdHFqjM29gTQ18FImEOpflVtGufykbkRZi+C1ULkUNKzjx8oT8yl1KTjAFGQvPZo1GnSFHILgu/UOYI9GNhUreCL6d3v9NasK6uHk1p8BPJJcp0LSgcvNQajcMnwvYgjn4MvqbtcpvOsGSHkVVhuutrqXdk5KGgLR1hgOJ08fSBh3j54zCYgKAJtFyhe/ZEEIHheiDBTSXBLuDzi+2EAh0tjNc5s3xCEAMh4nlM2c+2P0m1grXXTs6wwGLNJNN6aM0vFHWowfcYyT+/F9PRqb8gGOY95LkMOmFknSKdaVqTg32O2UTbVyrnpVsM6rNKKjSsWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 14:05:08 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ebd:1e92:dbb2:1fe5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ebd:1e92:dbb2:1fe5%8]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 14:05:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libpwquality: set correct pam plugin directory
Date: Mon, 21 Nov 2022 22:04:56 +0800
Message-Id: <20221121140457.1377924-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: f215708c-a3b2-4e4d-3658-08dacbc965f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n6nV1EpGsO03QjN0Dm6mPyC5PoCmhA1RwdTDI00kfAR3Y4zL0r5QMLTAo2l0lcMM3crIjBVmktkIWpv49pPeCDTYkbvPeCORTwqUvF9kohXzjjgaK/PsXm38aJ648cPEYubD3t3jhUDtoXRzejQ/atiGTuevkyiUFoa2Gw/MW23DniA/OjM9iV9nHQhy13tKzIZBo/Vihqlzqf2nJsZoTPiNYogG8oZkVoPryoJ33pH+IEjd3Sl7+mOzw9Bht0Qu8fb1BAt09N+sZl7vWFovJAtJkDwXc23ymekbE9L5nsARZxfvc3CLtzvs8/HkQuXfks4q9mG7zcGF7r6PlCfS7ihiNTPvIqP/tIFfEu1Ze0kdPOlSiK7QnA6w10+ovbaEGQxQ+ZKWW89YVo0OAc/aFfImEPhB4qU9Cqqv7ZDn8RHfG7yrxZlCA1VdMDRnOaf13ywv0qGxy25YBYMfMXRq96knelW4GYrbMSsTEQBfA98ha2c9jr+p4tWPkayXCyA/wvyicxNQXpi5+po9rYBsSzFuFFG9SnmC5CkLcEf9J+L6mbpo7FkJarh6zCyG1mbl9YaKnE0DBzTVbeH27fH0dFDg2rjTgskBUT1ppEkHbY9nPeb8tbjyi44yA96N00lN4EH7bPGlXu78qdr3XsS7bsl8vwHRCc/1O+g6sQSHjMnWXgH0uzCzwxsC00LD5znMv5KXfEEZ6wlM0oQyxR5fZw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39840400004)(451199015)(83380400001)(26005)(6512007)(186003)(1076003)(86362001)(38100700002)(2616005)(38350700002)(2906002)(41300700001)(44832011)(8676002)(8936002)(5660300002)(66476007)(52116002)(6916009)(316002)(66556008)(478600001)(66946007)(6506007)(6486002)(36756003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/7jvLQQ6FLQF2MjmyFtgHPQ25BARCLHZQEEOik+aD1Sp2E8bikAuCMXMNkDO?=
 =?us-ascii?Q?TdG7g2QgHD7G3hYMZjNX+dAvFPdO+RkqD0gy9uOx6upK8bPHl/41ZnHhwTyh?=
 =?us-ascii?Q?ihywQda1msNh1P3aGHrr0Prq3P6RgAsSrNS8eliGRwnKyfQbQxo2w9AcehiE?=
 =?us-ascii?Q?ALCY7zVOvwXfEM1gQzq2zdeZDoy4OpbQbMfnaQV/1Rad/i/EzVA7l3eAgmlf?=
 =?us-ascii?Q?kHXjwoNsywbvOZnduJeZRZ/1IL4VV28bwp178UcQf918LS8tIX9qvh05/cuY?=
 =?us-ascii?Q?dEqsBDq9+9xFTc/ercC+xEVfVgPCRFwct4RR4hni5uizf1JDbNfULgyIvNB8?=
 =?us-ascii?Q?XB+LNHR/LA4klWB98Cc3AuPhbrqpTXYaDZGz4RkCX6lyAvF1bwhxlrWr20mL?=
 =?us-ascii?Q?mJ42swwCaxw1HB1PSGq1DLZdDFXyLwkDnbDNObr0umJTKKpQHXVnE4wnBry4?=
 =?us-ascii?Q?alGp6Uy3JR//Cw3BOxESq9Xc1ZyPZ+h8I9U1kpUk+PYll9f1NXMm+NuCBxpc?=
 =?us-ascii?Q?iHEjzdAXFGe4At9XVLuprK7tHFO4PENX5WQXzPXhL7ixLMQtY+ylktWZbhmB?=
 =?us-ascii?Q?urqJIk+suKKy8ZonH0aUZAX4FSGhU3P4YT4OAhNZokWZbZPhsIGU22IXD4bJ?=
 =?us-ascii?Q?eN2ptqEGca5L/wxDBK7rZG6TRby3svZ5eIfB6VLYsLCCUdflmTspEscurZNQ?=
 =?us-ascii?Q?FpSxSjL7AlR2aPPh5WRsqNNhBbZmoGw/3AXEHcLdByvYCSdeMMFZjZNC279K?=
 =?us-ascii?Q?Ko5rpM5UdsaT+ZA9Cf3hVCkM5y2tkhuFkR6u1djVUX3VzGTdeWb5k25YJTAl?=
 =?us-ascii?Q?AINpiwbe4LqDlXbkWKj4J6ratGEWITiINRukWHF+IaVNBNJUduu6jh/zJ5yB?=
 =?us-ascii?Q?dVCMXE4HDA+pSFMzo1i9QDm4ScxD5fBOerfT3+MOUHCKhgQE4Yi8QoGueR2j?=
 =?us-ascii?Q?UmgIS1olzHUyCtxPewL90QHzkX5JShSptKDREHRxVH8JrvlUsp/1ZXRr9QWj?=
 =?us-ascii?Q?cthZx0I6Tmu7RnlMowoU2nvlBI9gM5VEj6B//wk0q3lTKi7V1IgIQqaOjNf0?=
 =?us-ascii?Q?joLHcxraPHfBnHpqvnUV2IhZEgSN5D2lHw3ZE4AQS7gxwzpOuZT4IkfU4m5p?=
 =?us-ascii?Q?C8JJ1MoU+BiKe39c0lHRrUblX2xX4rE7O09D6kY0vB9m9Ot5qPKf3EPOHwR+?=
 =?us-ascii?Q?R3Y0jCp1T0MK9Q44AwxJn/9+fxvIyR4VKP4iu4GOBTIxMOa9tbjnPXX2rWla?=
 =?us-ascii?Q?oyFqGsoP3w/3akZ07/hBU8uYpIPdgC0c3S+L6hgydys1nX/GEWvN6p3WFlNA?=
 =?us-ascii?Q?PKygdw+umR281+Z83xKxaLBnpx51NH80VCI2k9FhbiaXky4KQJyZPJJViBis?=
 =?us-ascii?Q?CcisbQiBGeruN1jKvNJVJEwXEn1RsxKa9fpYV0x+WlhQdD8+q2qL3TV83GUg?=
 =?us-ascii?Q?jGHd/kOE3pd8pXNnp02uUpAiQkpprKxoInyxa/hsldl1z52qleLF2tvacq4s?=
 =?us-ascii?Q?g67vWxUwpZA/oaGfzNaDWc3Jo5s8iNPCNaUxJtO/yKuoZz9kXqd1NHCtwKqH?=
 =?us-ascii?Q?gEVos1yJw8DPUNt89oF1hc2JghdG3JKrKhHXkEYI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f215708c-a3b2-4e4d-3658-08dacbc965f2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 14:05:08.8864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9rm6qxY73Xc7K4TFU+93CucqntQ5DHbeQXAi/TTIa8bEAD5jXO09usiu2/IfNCbH9TurI2aaCZ8/d93xhXe+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
X-Proofpoint-GUID: X4HaKuuWRwRq8KxA40jV-sGpQTvX1fi_
X-Proofpoint-ORIG-GUID: X4HaKuuWRwRq8KxA40jV-sGpQTvX1fi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=810
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210109
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99677

Set pam plugin directory to ${base_libdir}/security as this is the
default setting in pam recipe.

Before the patch:
root@qemux86-64:~# echo "password requisite pam_pwquality.so retry=3" >> /etc/pam.d/common-password
root@qemux86-64:~# passwd
passwd: Module is unknown
passwd: password unchanged

After the patch:
root@qemux86-64:~# echo "password requisite pam_pwquality.so retry=3" >> /etc/pam.d/common-password
root@qemux86-64:~# passwd
New password:
Retype new password:

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-extended/libpwquality/libpwquality_1.4.4.bb  | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
index a6887b086..b50c0f7de 100644
--- a/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
+++ b/meta-oe/recipes-extended/libpwquality/libpwquality_1.4.4.bb
@@ -31,12 +31,13 @@ EXTRA_OECONF += "--with-python-rev=${PYTHON_BASEVERSION} \
                  --with-python-binary=${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} \
                  --with-pythonsitedir=${PYTHON_SITEPACKAGES_DIR} \
                  --libdir=${libdir} \
+                 --with-securedir=${base_libdir}/security \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-pam, --disable-pam, libpam"
 
-FILES:${PN} += "${libdir}/security/pam_pwquality.so"
-FILES:${PN}-dbg += "${libdir}/security/.debug"
-FILES:${PN}-staticdev += "${libdir}/security/pam_pwquality.a"
-FILES:${PN}-dev += "${libdir}/security/pam_pwquality.la"
+FILES:${PN} += "${base_libdir}/security/pam_pwquality.so"
+FILES:${PN}-dbg += "${base_libdir}/security/.debug"
+FILES:${PN}-staticdev += "${base_libdir}/security/pam_pwquality.a"
+FILES:${PN}-dev += "${base_libdir}/security/pam_pwquality.la"
-- 
2.25.1


