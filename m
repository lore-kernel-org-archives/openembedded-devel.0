Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE19C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:39:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1655.1642124366210534206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L5gi6s+9;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1S7dK008787
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=vN6t4fA2f556m1IDyZ6K9DeSDaOwzuHb7PWEm113E7Q=;
 b=L5gi6s+9iULMsZlpEzT5Ezx/6bcX8mhFhC+x5V1Ia5wqeIjNj7Dm7+V66Pijuvs3Yg6W
 l15Yd7ZBLJT0mXOZUQD7zab9mRNpMkuSWbp6hYr1J4Dl3BMdZe6TmYoYuT50EhNLZuQr
 rSoL+Pf/Nlo4cikynOZMGtRkHEAEXxNBNxqgOa8G3aVenNrhJXTzLTvRJbPfBmRFCBrJ
 g0dpe4TSlvR+W9WC4PgYMJmY02BGYeaA6L7c/Y+YoZHm9U56UfcIvDRa21XyJifH8chq
 nxgmfhYtELq0IoBIVHsH/5sEAlNooo22Kn5bHKuOxAdUSOWt826/O1JqQmKxPGUz9n/K 2w==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhtf01f6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 01:39:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dra5uWplLwwYmyduRJgM67+J8attb7cN+zB8E5UqkRdeHRgBh2q8LHWwXdxrh66/64QOUBCUOy/evgcG+rovYH63oa+3uXThnBmV91+s8mqJhQUijz4IZh74Jyf59o8rSj16mDSbpj1tm3YmE4dxiwQ3dP/TKLu/gfpObnPJhrAevMKQ1kSPu+IN/DFgs4FCxx2j/MQCRjd8pO3MBW9YFUK7AYn/9vSN0EHdmiUM8Nxt4pBSWgPa8Tr9TAGs0pO4JKMBmsVHClymD2BF6JOjS+pVOzVITkC9RqYt9w/jvhP5Pe9prmur1E/RWh7loESYQ1gxFc4DBL6cJ6QjuqATbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN6t4fA2f556m1IDyZ6K9DeSDaOwzuHb7PWEm113E7Q=;
 b=A5L0/+W98Z0nEIxjjyHynPBAi4AUYbbzMnMPbc/pxxCpKGOdZKicKxkwdPoivEk4Bp43xyZ98lV6bCxs453zEMRAPPoNQaAURm37TtqszKEsXdG3T2RYZIVQ06C55VZ2IAPgNcTPssXJk6jCq8KGyW5rj+9PFMZn0IjMMrTBgEpybVFJ7nxwiJEVQVAusOrvGHs3QSpGCqZMzXnbRJ95Xpg+3tSvmvB8wzlibEWHVLvfp8wiQsJsNDkl9qC18u1D1jfvDepvoHOMN/cRthaEeBvHqmRuFr9SeHQ6R7ccKUl59mY9MPO/4QvGnLUxFQ2lltfjN4kJONmVvlZIHUfCKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by SN6PR11MB2591.namprd11.prod.outlook.com (2603:10b6:805:60::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:20 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openldap: ignore the mkdir errors in Makefile
Date: Fri, 14 Jan 2022 09:39:08 +0800
Message-Id: <20220114013908.229760-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:203:d0::18) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e61a39e7-9e48-494e-9daa-08d9d6feaf92
X-MS-TrafficTypeDiagnostic: SN6PR11MB2591:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2591E161A874801E06B6532AF9549@SN6PR11MB2591.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eYW/gY9isPaym7cdPRx/oP/Tg6uKTWS8PRl8btqajpjNb4WhfnDkPYQzX6zCprq8ZMPx8WcW9anRJQf8Mi8domNSHmXQyqdZ2998t6BkPdOkcS5yaEYteC+avvdXBlOpDs/gk6oqCcips00y5YHLjMFEDefytXOJAYO9ubW5QEQRviCUUtrDCtC8VbqdQuSWzdyKWZvuMswTzzxUz71kUkEN8R5twlmC1Y2CaPEJGuZLwJlXFQMkptNkur3DjWmb+A7DT5oNqp2FD1hAFaGD6an22k6A52lLV8cXpda85OCmif1Va9RZyac1wAJqHEk6+afBCKzKLfiU4IKucZrkO5oW3mJ9eck88byGP8kRvoCiyhr1eBXYwiJf0xERlFx8ldxlejleGPRdgUWyr7Aqbs1edx196oXIZj6J/oGPc0IICz3YdjSxASa+mERytxo+MJ+0+HOkqNjvaWPQLppWjNTze2w+tThRemcZcAnZhN6F8OCdSjKNpps+WoeQolaB7+S9Z4+ondTLlJ7/tJlqUA1sUpEn77tXmzCRD1eSEp98n9SaQfs1hTanD3Z+Diy3nEuXypqfBdwhQhUDpi9sW0QTtlzl2nteI2LTgctbxnSrOgmRC6TAkyPPedv4MgG4XF8eDmNnCYGGGx/cRCaiCUslBvOnVKYQ7US2SotZDmRx6BK9aaViavLPmz7qyH/UiqjYOX//2xY8Uv5WglboRisQReWHbW2Pj6iOTFh+2zgqrHE2v3kxzIrCedFKF3KwLQkjicmKm9DbvqQNTBnXSl4y9gzu11f2/q72gBOZ4rs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(83380400001)(8936002)(8676002)(52116002)(2616005)(66476007)(6506007)(44832011)(66946007)(1076003)(508600001)(86362001)(5660300002)(36756003)(66556008)(38100700002)(6666004)(2906002)(6916009)(186003)(6512007)(26005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+HqL4qGpKSNpNvYHTM9tZk0XHBfk8IWxX+oKt8/qKiqjJQK4pl/OzFHpgt+k?=
 =?us-ascii?Q?E/B1b75PNYv7dzDJY7XbKD8hms7tJiGXOumHrpIQNu9hjdERWsmf/mbTO9FK?=
 =?us-ascii?Q?g4QvUJ+tKh7VlqRVCEI8JJyC8W82myZLqyaNmOXd8Oa1YeL4WXOerxoSomlN?=
 =?us-ascii?Q?kTcfPPFYRCr922hzvzBFzBdYcKZK/mjiUhEN+FCQtj5J0VdGSYRxcgMvJe3t?=
 =?us-ascii?Q?J88pIGzvjSaX1wWq7C+WTmvd4gSoZhHluV0eB5HDvDaZhY5zAT/tLP39USA7?=
 =?us-ascii?Q?WYhp3qyqdfh3tw1kuYAtvHPpnafGUMQ3sQu0GX2Lb8ooiRERVr7P/mscExuQ?=
 =?us-ascii?Q?kUWsflRLjYG5l1XeqQBUl6il/JbKEOzm8rvIetniwzEXkbkj0efeho55TB+c?=
 =?us-ascii?Q?fLhJYFrkFYB4B6mxbl2FQFHXl/A8b5B1O/QK/qO3GkZMoPzsFZJNwDHsimNL?=
 =?us-ascii?Q?1KhLgYBkpBAKh+wN26kudjcLHHNIYfrD/jy05rIGRbls1JplAv4LjwBKmf7m?=
 =?us-ascii?Q?FCrAtTpGTTqcH0JNdkW+qrbd+L/R7r3iy7gm0ein2pyQHo6kTmSDXeJqEHey?=
 =?us-ascii?Q?BnTTMPPufCsnvuFKfJenScoUf0KOgQ7E7d4cOLZK0Rykk5l7x0jUFeY5yLzn?=
 =?us-ascii?Q?Xx01vZRHHLlIKFymg38HBbHPMiaK+6EIpEwopfDUWZuMlFGfVNSpmvH6gzhQ?=
 =?us-ascii?Q?p+Cbd8A//bjMMleMKHOPacW55EI5JjzaxIMrf5xSP0l38IwTpAok7oZiW0Pd?=
 =?us-ascii?Q?f7fyc4Lje1yrH0am0wPIEh1rH3aGbhS2VU225HcZcbm9CMZP/t45RzwDeKaL?=
 =?us-ascii?Q?bFNZmJOA9rEchZJmzy9SVvzTzFhdb4kxtM7jPaFOxHASf46U/KOkvgf/mru/?=
 =?us-ascii?Q?DWsVo6qA14fIIr91WcN+cyByRj7/Yl7Iwy58B13Hv+ASgpDxpNx4f1Bi1Lu3?=
 =?us-ascii?Q?XMeF3ljPm7F2Nxt58zJxxpvnHpKql/0htWvBmbGhBe871GCedJ48laAPQ3Vd?=
 =?us-ascii?Q?npoTjbjuBpUIFuTvDSrJOB+O3On3xtAoOAHfT1A3bWnmWZXEbKFHc5P/pc7p?=
 =?us-ascii?Q?H/y57UgAcKOMGyNX3zHn1hHQOX2LxMOiWUn+LAZV4V2mIufMK9Zwmcvh7TMC?=
 =?us-ascii?Q?jKKHPaYg/ihbanfxLN7BJU+Wj8CbrLAXnmCMFFSkdr34aqbjtSAprjJTK1A8?=
 =?us-ascii?Q?/8khomg5RYWr3eL3yZITMoJ0TaYO1S5HZXpfgoLepD4R9eI+Esygum3ITlIE?=
 =?us-ascii?Q?coQbTtLMOqQdgmkbLgINAomfC+sz2ZtjlfXmAmLNoERU4F+heHN2p5J1EY+l?=
 =?us-ascii?Q?coqMK7Ezr45KLy4qh0Bfn0r48yNi1txb0K/K0lQcCBsmReLfwcrhtdYIYlFM?=
 =?us-ascii?Q?isgZCd9k02fDwxu4OQnOayZDXsIEFAOC+/BxOydPmzXpNaNVqPngbQgKaAd0?=
 =?us-ascii?Q?01L6HzYR3ahzH6MX8D3Lj8pMlovUblfClDFDfZokRCeFUmzrK30cDMtZsm42?=
 =?us-ascii?Q?JGkpN85pR1m08yHnWhZxsg27AKepDdNcpvEom22WyNJkfgj+esLJFSVb5WCK?=
 =?us-ascii?Q?ryPzjBnYZANYdkbAiTeQzTgA2MxlI1BeGeNZEkVxeHUQ1ghkbo0ft0d9mtr5?=
 =?us-ascii?Q?v+TjsiJv0UGN7qxhkX19Jmw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e61a39e7-9e48-494e-9daa-08d9d6feaf92
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:20.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9mZIAndubTstCvtc9me8QBpltTWkXWbPE/v2BzzvIruN0Qu+ut3bH5K5oJA/wyouqHiTv4strN9VdjogPFUjhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2591
X-Proofpoint-ORIG-GUID: lVG3kgIeFao-bDFEXXREGeJkYXPIst9V
X-Proofpoint-GUID: lVG3kgIeFao-bDFEXXREGeJkYXPIst9V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:39:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94814

Ignore the mkdir errors to fix the parallel build failure:

../../build/shtool mkdir -p TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-wrs-linux-gnueabi/openldap/2.5.9-r0/image/usr/lib
mkdir: cannot create directory 'TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-wrs-linux-gnueabi/openldap/2.5.9-r0/image/usr/lib': File exists
make[1]: *** [Makefile:288: install-local] Error 1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-Makefile.in-ignore-the-mkdir-errors.patch | 33 +++++++++++++++++++
 .../openldap/openldap_2.5.9.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch b/meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
new file mode 100644
index 000000000..552726bb0
--- /dev/null
+++ b/meta-oe/recipes-support/openldap/openldap/0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch
@@ -0,0 +1,33 @@
+From 690f69791eb6cd0d7e94b4d73219ee864de27f62 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 10 Jan 2022 10:13:51 +0800
+Subject: [PATCH] libraries/Makefile.in: ignore the mkdir errors
+
+Ignore the mkdir errors to fix the parallel build failure:
+
+../../build/shtool mkdir -p TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-wrs-linux-gnueabi/openldap/2.5.9-r0/image/usr/lib
+mkdir: cannot create directory 'TOPDIR/tmp-glibc/work/cortexa15t2hf-neon-wrs-linux-gnueabi/openldap/2.5.9-r0/image/usr/lib': File exists
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ libraries/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libraries/Makefile.in b/libraries/Makefile.in
+index d9cb2ff..c6b251f 100644
+--- a/libraries/Makefile.in
++++ b/libraries/Makefile.in
+@@ -24,7 +24,7 @@ PKGCONFIG_DIR=$(DESTDIR)$(libdir)/pkgconfig
+ PKGCONFIG_SRCDIRS=liblber libldap
+ 
+ install-local:
+-	@$(MKDIR) $(PKGCONFIG_DIR)
++	@-$(MKDIR) $(PKGCONFIG_DIR)
+ 	@for i in $(PKGCONFIG_SRCDIRS); do \
+ 	    $(INSTALL_DATA) $$i/*.pc $(PKGCONFIG_DIR); \
+ 	done
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index c008c7b4b..f3b8c6c98 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://remove-user-host-pwd-from-version.patch \
     file://0001-ldif-filter-fix-parallel-build-failure.patch \
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
+    file://0001-libraries-Makefile.in-ignore-the-mkdir-errors.patch \
 "
 
 SRC_URI[md5sum] = "237fc2d881c27f8dd5d9f396e2865c11"
-- 
2.25.1


