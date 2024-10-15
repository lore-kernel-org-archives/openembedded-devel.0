Return-Path: <javier.viguera@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08EBCFC276
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 09:39:59 +0000 (UTC)
Received: from outbound-ip8b.ess.barracuda.com (outbound-ip8b.ess.barracuda.com [209.222.82.190])
 by mx.groups.io with SMTP id smtpd.web10.9206.1728985190942722861
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Oct 2024 02:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=FTaU8r2c;
 spf=pass (domain: digi.com, ip: 209.222.82.190, mailfrom: javier.viguera@digi.com)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168]) by mx-outbound21-4.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 15 Oct 2024 09:39:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVPEv5wkgjWmfELkw5bygTF6b2JFHAVKBcmate2H9FSr33C8BkLxkVMIsuEaQa1XkQquB6KldRjiSElncrTRgfSgtCRC5z7wJG24H3HYpTV0veoi3+Qfv2J63trmLg0Eqdouy67Q0N8Qb4+sdMu4KZTf8KAOG3a+6ke9GNdALzpJz1JoZOYmz0nD6O+XGjl3TiWX+LtwIOyWuXU/KebIDnb7x+b8ytbxlUKWrSX9dSP5n/dFuR9id0+chCUdkVhKcxGvXkEesHIZVlgm0PLlJXKAZK2OO2tgEce/SpJZ4uPBDn1Vx4hIMjlX9eD+9GNc4ZMZctMJeJOE2StFdOELsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwjfcWh3pn+A6U81HcpM90iMkC3sfD2P/f92GQD0ORk=;
 b=IxN6Sdu3ZrZDEs/OBA6d59My4ltHtB35/GLyKKlkPKwrxLpy5m7I1W/kErOcL2ofcZMTV6veSXMYQ245aiNgQQQfp8WITTyjFLJxEi6uYESP8fm1e8UUmoK8hBTh5XUPuu+uoX3/XOr6Qt3gm2UxvgxYvJMoTGwmll5lwIsxLNcgQJT1qxuDbMKBXwzax9wlCa2HSrRVtq2IsrEG4hQ6o75dMWCDmhbbtbh2n+V+wizOGTYOfr5VpQHKb6D9abpC3Weqqtkx2LW73J9lqf/oHWuGT9GjDnlFKvdmznRSsYDxis3Xi1UHInbl7wICPvw6Z8upe6yvUk7L2SrEkYSLMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwjfcWh3pn+A6U81HcpM90iMkC3sfD2P/f92GQD0ORk=;
 b=FTaU8r2cCExADEej/vxtTNfsOu9NExqhad1Eu/hES0sGomgDT4xPBGOi+rMMXwNqsBH+v9Whf9uuIINUH/7XG9YjqG5L2dXh5KIdfZwLGkgNMgOY4nspmu72aDBg0GwzUrktwbXbLU7ZaEzfvsStvd8mryAXu4VqXaKJxhM9pqCr2f8/+4SX2CN6MsCp2xmO+dl/nTYK/orQf7Q3SurLuEyKntNtxRZU8m0N8ccKC/Jh/SrwNvQwDfZaAzoU98xFagcgPiS6ZFmZ+ydOWGMrBEL9KTX9idNzrV3n7riPbZ4vVMhpRPrfMO/Rtbjs6VUtElW8I/JE5uU9tknblaDsGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
Received: from BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24)
 by MN6PR10MB7489.namprd10.prod.outlook.com (2603:10b6:208:478::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Tue, 15 Oct
 2024 09:39:47 +0000
Received: from BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::e024:9e13:d386:d19e]) by BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::e024:9e13:d386:d19e%3]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 09:39:47 +0000
From: Javier Viguera <javier.viguera@digi.com>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com,
	javier.viguera@digi.com
Subject: [meta-oe][gatesgarth][PATCH] c-ares: switch to main branch
Date: Tue, 15 Oct 2024 11:39:38 +0200
Message-ID: <20241015093938.1746130-1-javier.viguera@digi.com>
X-Mailer: git-send-email 2.47.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:610:76::26) To BLAPR10MB5156.namprd10.prod.outlook.com
 (2603:10b6:208:321::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5156:EE_|MN6PR10MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 953374f5-7339-4db3-c85e-08dcecfd4efc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NOW4IJLluNYtxZ3hlnXy8RWw3AM7xG21ggoguGeN0wKPdpeNUqlWLAqzIsjw?=
 =?us-ascii?Q?Q/RXtS8iGDhP6GltVuccFuSbFeXQO8kvgNcKJl29jIqQ1dH1h+qyVhXd+2Oc?=
 =?us-ascii?Q?ufpDUsGFb7fAph4zvv+l/EH/6vDsz+Mix2EpSldUK0mL1uNvIGhLrZzvgqoI?=
 =?us-ascii?Q?nb9PPjXU/qvp1iUkvdfavcupV4MaBVhcvQDwTfSY2BoL6Tg3PfUXg1reOOdP?=
 =?us-ascii?Q?oTY1ObOBoApWF++e3UTqim5uk1/ZzDNovCUfLonmJnrxQ1yEoAqv/0bVfhWx?=
 =?us-ascii?Q?OAfyXzj1OlaeauYeOFXXroYc1THg4K9qxl3mBL62Si8DRauIKNY5nouwV0w9?=
 =?us-ascii?Q?QsGmxd7Xv7uu9afM2kkGivcphAGfeplVH8Ewn3zYZXaPQrxiqgUmWC1UBM1E?=
 =?us-ascii?Q?KFsu02A8MVVXHvZ8I22VRYN1H8mmJgZNg7iKbwvQ4E5jc6lRfSJgZYSBsxUI?=
 =?us-ascii?Q?bE3eSr4+eQFKDPRx2NnqXs9XxpCMllgQPBWLAdRzq5ficlR6eSti3HudEtEy?=
 =?us-ascii?Q?9lKNXr+pvj73RHLfm53LCakaAMajhlnXXBjHYzKL2df6G/7DtPTLgopm3LPp?=
 =?us-ascii?Q?jT2RaNizaP6BJViUJ2MfdzSlsIS4dPOginIWwduEZ9Fm2kS1YTJCSjinbNx/?=
 =?us-ascii?Q?X98G3yCXGcW/WjJlMueTqWGIePCVpFyZoHLt0IXemc3EfI/kTu42UU3i8+kT?=
 =?us-ascii?Q?bDHQTeQID/ViKRYd+1dCh359Z9f5sM9cIj4K3YAym+QJWnnFzEY+Jk40aCkx?=
 =?us-ascii?Q?gc/8YHMxTTAtf5cZKdROwiT32ZTpsa4ipM92tt25nacUMcjSsU96ZZON/9Xv?=
 =?us-ascii?Q?pd9J+GtYDB2toPde7ENzcNZg9u7LppuYXf/w5qWC44uC9OFyZG680uIG5weg?=
 =?us-ascii?Q?OB18SkaFeK9t4+tgt/aoqd4MbtSSpDj5ypLiuTZkfvgaNUi32VyXX3sksOtq?=
 =?us-ascii?Q?F/LJ+zZaQ99gPKCIkuhD201NdmYakqLwECeAco0OA/8/R//H2UvpENkiJDMh?=
 =?us-ascii?Q?NqG5JQbaUrNCKmtEZlb2uYBPzU9pvUklHimZ9XUBCwMpyGRZ6cTE+tO6jY3R?=
 =?us-ascii?Q?8Gxs8UyWc5u+2hEEy5wgQ4i6bIb1nqTuLvtasWdzMQHdvfObzMPXHYDPxw+X?=
 =?us-ascii?Q?5ZAIuDzT8lmi7emeUYpAwRN6GrSBmu0YfME0Xy5lh6OIgf5JGFO00WCmvewU?=
 =?us-ascii?Q?OVHKsWcOAxqB/yoyejC6xy9oHVs+cQGmCfX0wipY2zyusxAPDC+NFrFm7oCs?=
 =?us-ascii?Q?gc2VCMu/Jbl3icS9WCSSUEIA+qn1RE2wkMNV+M3qttiMtDPugIQiqluT/IDG?=
 =?us-ascii?Q?jJy69iaoKIw+/T8eeoqhRwyKgmNOQOIyIaygN3uMBdHRzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5156.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FRsgBB3/xONB9t9XMsP3DtkAuP+YZV8IIhD72mvMUo+dgBwD0a0Q/40a1ck0?=
 =?us-ascii?Q?1sfROD0OJtUYPhQ4ojlm6AEPE7no6x0ghU+6DtX256zGlaTOXC7Yr9JakSQ0?=
 =?us-ascii?Q?+senJeQkROdP9XVBhdg/HWbIUfVPzl7rggKSwLzIMw0OZZWjJlzyZuyeRJqv?=
 =?us-ascii?Q?AMfrafBWM+8hBeSq4p4m9HttSRuVfd9+0/DlifkBX02bBtTkmpzcRIkkb1NA?=
 =?us-ascii?Q?wgRazOmtmfz7vCDXoQAnGS0laDHgdmaGhxuMkPD6PG6rEMehxXMsqf2GM86p?=
 =?us-ascii?Q?linFcsju/CUeptPKmFA9RG+TacHDpbmwXN5WXI8ZPUADRF9FcfUwXUdC9kAN?=
 =?us-ascii?Q?CHvH/kY7hSYAc7b6mT9YEg0Z4QuBrMbe9hvPi0WqFgSspLYoFQX7ORShKKPk?=
 =?us-ascii?Q?6LubhZAr69wxh6SAXG5dzHJbVCe0wp8NeZGF+p7dib9ZnAD0fWBlB4ndf342?=
 =?us-ascii?Q?qaaY9KWIVIdGEyCdpPRF533KUZoEyWoC90L0aH9t1xuRC/jcphOXNE23trsQ?=
 =?us-ascii?Q?AMA7Du/H8CSSg8O4j+0jWzVTMtcbuT6krWmVP/hMgIMmGbSG1Bo8MMzut+/m?=
 =?us-ascii?Q?R7QA0ZAUV/sxcFSdJYHqDcBKyK7lO20HjWmR0gKOmKW7Sj10I7OSC58Ei5+G?=
 =?us-ascii?Q?PfhNLVTIozeeWgG86t6b/Trq0mpwhcJBRBoWCfABu4AdPsnp7biUD6wAOI+g?=
 =?us-ascii?Q?vmFRcrm1jOghHmzBUcMDQN2742LPg2lwogjZiWoXM54V338butHYD59amwxH?=
 =?us-ascii?Q?gOS1Lk7/kLsJGuzZ5vypkY5EzEwhfCRltZajEsXNcw/ndVYrYooniKtEO7Xd?=
 =?us-ascii?Q?S+4Wn6QAh1hT0UBrcO1geoD5PS4Rf125VYM3oHnr8VkOUEcgdg7zFst89c1R?=
 =?us-ascii?Q?v6X/juggnazzAN+podqyaNgtEjpO9unhqKx79hGcCTuFbZwwBIove67AfbYM?=
 =?us-ascii?Q?n9yccakQBJaZCfTMIJ1WG7xGREOJOmTjfv1TpE4+xCG4j1cyTiwnB37eHx9h?=
 =?us-ascii?Q?JrS1BDBX1WzQegKwz+kfr8YpMo4BUKmhlLBE4MJ+DB6YgJ9ANkIfaDXjzW84?=
 =?us-ascii?Q?JRuj9A3vH0k0D5nS97nSlpsL5jnj7cX+GpR5x0AAQEUWsf4qHQKh/Z2eMDzy?=
 =?us-ascii?Q?liqdFCM7tFsTpGMEfYvzJ5HWC/8ruuHyQurvy/bJXwFnuIN1aIYvIzLB95lo?=
 =?us-ascii?Q?pLmvAZTN5SxbcDUcZep8ZSPAbhcskoangawxzpZrI10WGKuyIQs//kD+7F80?=
 =?us-ascii?Q?wRSQSwRmsxerwjqlrU+iSF4fGDiKmQbVs0KlVlxrK4VC9VfZoZrclzvGwZRl?=
 =?us-ascii?Q?OBQU7nm046zijl81EdFQQuD1o89KF7F3APsz9dWBaxNLGUblPce9MKX+Mxf+?=
 =?us-ascii?Q?aMm+cmyjioItP58ltw9jREDds0reo86oZOdlBVWdxdb41XscmhCkapebOTQC?=
 =?us-ascii?Q?I/5HbdYENUxoCHGGLdzfq/r6Bq+4WlWU01EY1pjX46n7Di1JSmt+/62c87I2?=
 =?us-ascii?Q?iFG0O2j3OUYRJMEi04S5Y2WjTI62PCd/GY71KaRVQMmyjnOeayebCzkmfoYg?=
 =?us-ascii?Q?3RghjUiYj9Og7yXOjsGBNpL3uVa3YKcWd0ijCXSp?=
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953374f5-7339-4db3-c85e-08dcecfd4efc
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5156.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 09:39:47.7915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9lcdywZWsAupjeeSPuZcIFi4im9A2jKXWh6EkfKYuTypIbVPUvrwAjOyKb2zw/vtCD0PMFj78lCSTuwyt5B8bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7489
X-BESS-ID: 1728985189-105380-21190-25393-1
X-BESS-VER: 2019.1_20241004.2057
X-BESS-Apparent-Source-IP: 104.47.55.168
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVhbmBkBGBlDMyMjULNXS1MzcwM
	g01dDcPM0g1djcxMIgydgyKTnVyFCpNhYA2/79aUAAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.259738 [from 
	cloudscan14-185.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 09:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112926

This fixes do_fetch failure, as upstream renamed master branch to main.

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
index 67dd701807de..0106bc2d10c8 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.16.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 PV = "1.16.0+gitr${SRCPV}"
 
 SRC_URI = "\
-    git://github.com/c-ares/c-ares.git \
+    git://github.com/c-ares/c-ares.git;branch=main;protocol=https \
     file://cmake-install-libcares.pc.patch \
     file://0001-fix-configure-error-mv-libcares.pc.cmakein-to-libcar.patch \
 "

