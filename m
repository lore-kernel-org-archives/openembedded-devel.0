Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A506EC61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30599.1678100598822097122
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pVS+9XqI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326AeiL2016794
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=4tq3drBK8+A+yqiusRsLcau9fjGsRa+4Ptdwflj0Z0M=;
 b=pVS+9XqIWPX7PO17rrtfZDtaEgJj9KTP/x/ZWtWZ4PdqC0UxaxUCKFKaUH28/GdrD2i7
 Dj5qxt7Hko4u8qp9Bbdkt17U5yqJsjrMJRegGWbyUeO7Qyc7TlL9vR/uRwpeRxVuDH3p
 Hz9ysA/nJu572eHG94Tt59EnnrKS7r2H5/NTdPKloyFvvfbo/Vst08lWK1EbsvThYDRY
 Twp2LZ4XPxsCT3aDRTAIOQsJ+vYl7RX7ucbmA8ahr1HSQVm62m4I+OYj8jWM5bxaD9N3
 NQRjEwnr3kjzH36SUJc+mpKuu1nPwIHbpUKI5s1tGnw+Uiu866XHLQHMKOHlg7lP6tHT sw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258sp5a-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXVfajlGACpMEtbDdQ2JS4qJfezxUNjPNkPQLqh1J27loIQrvrpsToAZcmaLuJx1aOAB1v5xwphqm0UjvzTHyM0ZLMbhTztPn4Z8pcdwT6tXYJwvlaegBTqdrY+vf1gNv2T5kzByR8ol0TC9Fn3ehC8OCkwsCvhp6dy9GX3mZOKHys6YeBbLGTTGyaW0uW253Ol9GGVO40l/qek31DSkz6R5YS8CydXrgxf81Ulx3hv047bTBp7Urb9wC287j6iRLLNg3MxX1AdEceziFC4w6Ea/YjeMh/Os0J7+IO+S7GyLQHLz6MGS1rFFuHpbxQvPfdBwkC6SjVe9ep3H9nBuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tq3drBK8+A+yqiusRsLcau9fjGsRa+4Ptdwflj0Z0M=;
 b=MgDqmkd9zhZ5dfZCCWVLHBaCsjX1g/MuP22hHvnysQXUtEel7L8Sj6Si2NcUFyuQWyS/ivoyLee4bY7pa8kSSCx12rJEZ3h9UEtAjDPXhAyuoyeIgxaRuRp3+Ub6FauORm7CRyIfLtq8JoTVH14JYJIJQ3RH4Id7Jaz1XxVRnKvFzqmwOmul1iBUU4T3vlDV6tYHpt1hxLtqiYMzAjG195Va7X2pMhA0PGH00ip0xxJoEidE3EgYJQii14lwLq0bFCLCsCeRW9lcEZprhiJHTV1KaivVlImhZUedZvdsWOMtc1Q9occZjmQE5RFu/vwqcCdTzEeU5ip4Gc1Y4zej8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:16 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/6] libnetfilter-cttimeout: upgrade 1.0.0 -> 1.0.1
Date: Mon,  6 Mar 2023 19:02:59 +0800
Message-Id: <20230306110301.75991-5-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306110301.75991-1-yi.zhao@windriver.com>
References: <20230306110301.75991-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a265057-555e-4f52-b814-08db1e32633a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	04qR2zuVQ/CnnfOWR+IUFZXl7umajtCBWCOo23e+xxurs1DPrdW8FGdSsEbuYAs/xHI5pxikXaZYZBJ6wo2U9WlzSKEQRlEuTSncOqHbz23JCxecanvnGQwwDRhBcP+QoSrcU9x9O9bM7RIaQGM5+tRXDiIdRwUG2nxnVzhwW41eAQ62JhJZ1dI/9cxooxo38UHNBsVqjQsn75V4zwdDD0IJFKklwtUr46/jL2RpePRj3QT/aGrwRU5VyEi/MjRT6vh06NsyQqbOe4vSr7WBoS+XGpImhLKG1UF9GjB4k+A6E+UuzUlLJ6g2TJtu+Lvq4LhcA++rhK4YEvYe+At0wR5sJJn+cDREWT5vINgfa83aOQzJrJwGB00ZtkxPO3Xqy6NfI6jFIpd1+lYdFlKM4uHXCL3+APtKP6DmO/u6saczKIG2sl7PIUdjj7kF0xk5EBI6o6AywwwG+ZuTQovyrFvlYhUCP0RgFHld4SU6ALvRvi6FeHHb2Pf1n91AK5TPZmkFonwiKXks8mqstFk2lDq+V++x5QuFRjCWe24PvZwK8h96OHxoeWoX4XXXCauiydF5Nux17t1042VZQBzvAgdea/sFQfcoLcs+hRO6plCXKpKGA1+D/XQOBUx4L0HIiu7tfpV0MR+t4I1KVYNdcaj892vGetjCwKOo+QPBGFJZ9qdXGyF3kGPP9NxolF0D
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(83380400001)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(30864003)(66476007)(66556008)(66946007)(8936002)(8676002)(6916009)(86362001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6whHpdG65eeml5J5QIQWAjcxl50gYcxi416XNJ5K5r9Sd1GcMg75w4AJV5xo?=
 =?us-ascii?Q?H9FXJq5gbI5P/oJelIfjw6Kxo2HsMvmeMJimI7k5PNh5hFMIuEyaqSPilHKe?=
 =?us-ascii?Q?nAP+4ws4AweaQQLQq0ifso/ftCvdmB8F7/V847gjKUQ6bZyU1bHsd1grdYMT?=
 =?us-ascii?Q?dvf6rXQNVMNtZ90bptDF3mhtHuyxwf95YufZ0uJu/XqrSKNfoPKGzV7ZCs6O?=
 =?us-ascii?Q?MYC3/vkhFlS0TcWqLl56tuj8R2qjvzHn+QfUh4aBvzadV6u++61uNOmTwYNj?=
 =?us-ascii?Q?ryfmkQn1XLc1I2PLy3yf1Bl49L043ufPuclUaLtkYKt9b/O7ftEmFFA0WSjt?=
 =?us-ascii?Q?+KfAyWjc/pcp9XwJtPfcXiYKBRNIVAictWMwpea/Jy96hjnDidiFmKl1TBFf?=
 =?us-ascii?Q?s55OskbY035Lx4Eqf2BPKR0EdE2FTTlPBjCsYYFuRPrkHS6fp2XRXRJUGSzz?=
 =?us-ascii?Q?z/sIuB919qGjyqLkVQhoGTFsaw5oaF6OpgCZvjwPx0SD+w+A3yd/g4pjkFwR?=
 =?us-ascii?Q?mtAD21uLqD/qa3R5tqkHVtzHP0rCY/fEY97okbP+MDhOWjG7waBEm6SUoC++?=
 =?us-ascii?Q?fyVxlPBoJsklb+dg6ltGK442mnnPr0NYukEj+5clx4aJWTMQT6SjHiz7OhGX?=
 =?us-ascii?Q?Hb2xO+NMz7iTwnvA4h4/uvFVhijwzBci/M5JQY93OXNnsDIwMAS1RBVXoR4E?=
 =?us-ascii?Q?4/8tTIzf2bEnwonsFi8lTSKPGT4cNSMR0MqGN9unA77KZye5wAzTwfRP0kzm?=
 =?us-ascii?Q?OoPrdcK1WdP3wMRtZowdRpg7GEbmb3cRbRyK2gvQ2CR1yvGSh2rO81qbaqbC?=
 =?us-ascii?Q?uGmmgBpEvLHlLduubj6c9w7YAinnQXTF+jqnKLQbRpVNb9ByU9WNRlum+o3O?=
 =?us-ascii?Q?U6suiF71gZjnn5fSTHkiFeBbc0fh+UyMhMlnA5tB/f9scB3kZC7Eozo1JCbC?=
 =?us-ascii?Q?3/Bz+uJc/bkQlaQLq8JQpTY+eLBlTcO68UDeNrrHaUi+ucdERxFoMyVKBURv?=
 =?us-ascii?Q?ewSLQsjtypu2s9l4/xUPtZcJ8ELXPLzn9KrZCXM4YHxGDTzskZjTzflIVB7e?=
 =?us-ascii?Q?UsXIWr9NDjVeKPzCh1keEOG2XK+vaU0w5Na2JI2kCBNT7YQudZPK2qkiA3Ip?=
 =?us-ascii?Q?kAMrjF+dz2TpKfhsjWP1TGNCGnzToLvcrtjtCeIOcA6oEwhJL+7qBDImLd/o?=
 =?us-ascii?Q?PhVz2+onrLnB67ZQY2G9oh+MW3nFpkCgh6T/F9oBhSyydJYpk8WGtD6+xPAz?=
 =?us-ascii?Q?Bugf4qET04Vt6Sp5f4zr7ZdVCZXdq3l0OHy1USajKcaq2072OiZ5nD9iLIpF?=
 =?us-ascii?Q?OnYoGR92LcaDkeuwOGByqn19Z8wClsU/jmvTPUyBFZCcpWrgxGcoxqXadgFX?=
 =?us-ascii?Q?kgDqg7XHPE0tzj/7BBKZBjc0HJzIqWJYL1+kdzI4UxcRt8FsxNtCTc97xT7Q?=
 =?us-ascii?Q?aMwfay8yH01bFK0ZiArUVRVw/2W1gu+rEMtMqCO1ftRC26uItS8YQXkrB/WG?=
 =?us-ascii?Q?frF0DByVthDakx6Wf+N5okuKB3HFXG7N4Hw/mjvWNtPEHOClPF4yaInbxo+g?=
 =?us-ascii?Q?+Knb7C2tesi3780gbtcox1bvSFnkrRpKAvCEa+DWeCzLbOC2i9wYTGNq25Rz?=
 =?us-ascii?Q?hA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a265057-555e-4f52-b814-08db1e32633a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:16.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euFZSEgHx0PlznFAsp7UBdKwDa4ir9uTL1/ypS/ZoldHmxaMUFkzIrqyZiaGy5QPx0fS3SoZ5TATkU4oYjKfew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: yeLAUdEzaNibn9SX9ort59FgtemvaaQg
X-Proofpoint-ORIG-GUID: yeLAUdEzaNibn9SX9ort59FgtemvaaQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101397

Drop backport patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...etfilter-cttimeout-visibility-hidden.patch | 264 ------------------
 ...0.0.bb => libnetfilter-cttimeout_1.0.1.bb} |  10 +-
 2 files changed, 5 insertions(+), 269 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch
 rename meta-networking/recipes-filter/libnetfilter/{libnetfilter-cttimeout_1.0.0.bb => libnetfilter-cttimeout_1.0.1.bb} (55%)

diff --git a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch b/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch
deleted file mode 100644
index 2c606c832..000000000
--- a/meta-networking/recipes-filter/libnetfilter/files/libnetfilter-cttimeout-visibility-hidden.patch
+++ /dev/null
@@ -1,264 +0,0 @@
-From d0c4e39d12f903e06db262656cff2e24d267bed7 Mon Sep 17 00:00:00 2001
-From: Kevin Cernekee <cernekee@chromium.org>
-Date: Wed, 4 Jan 2017 14:30:25 -0800
-Subject: Use __EXPORTED rather than EXPORT_SYMBOL
-
-clang is sensitive to the ordering of
-__attribute__((visibility("default"))) relative to the function
-body.  gcc is not.  So if we try to re-declare an existing function
-with default visibility, clang prints a warning and generates
-a broken .so file in which nfct_timeout_* are not exported to library
-callers.
-
-Move the attribute up into the function definition to make clang happy.
-
-Signed-off-by: Kevin Cernekee <cernekee@chromium.org>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- doxygen.cfg.in               |  2 +-
- src/internal.h               |  5 ++---
- src/libnetfilter_cttimeout.c | 44 +++++++++++++++++---------------------------
- 3 files changed, 20 insertions(+), 31 deletions(-)
-
-diff --git a/doxygen.cfg.in b/doxygen.cfg.in
-index 8e5d449..09c3ce0 100644
---- a/doxygen.cfg.in
-+++ b/doxygen.cfg.in
-@@ -72,7 +72,7 @@ RECURSIVE              = YES
- EXCLUDE                = 
- EXCLUDE_SYMLINKS       = NO
- EXCLUDE_PATTERNS       = */.git/* .*.d
--EXCLUDE_SYMBOLS        = EXPORT_SYMBOL nfct_timeout _container_policy_cb
-+EXCLUDE_SYMBOLS        = nfct_timeout _container_policy_cb
- EXAMPLE_PATH           = 
- EXAMPLE_PATTERNS       = 
- EXAMPLE_RECURSIVE      = NO
-diff --git a/src/internal.h b/src/internal.h
-index 3a88d1a..5d78171 100644
---- a/src/internal.h
-+++ b/src/internal.h
-@@ -3,10 +3,9 @@
- 
- #include "config.h"
- #ifdef HAVE_VISIBILITY_HIDDEN
--#	define __visible	__attribute__((visibility("default")))
--#	define EXPORT_SYMBOL(x)	typeof(x) (x) __visible
-+#	define __EXPORTED	__attribute__((visibility("default")))
- #else
--#	define EXPORT_SYMBOL
-+#	define __EXPORTED
- #endif
- 
- #endif
-diff --git a/src/libnetfilter_cttimeout.c b/src/libnetfilter_cttimeout.c
-index 7844a1f..a0a7185 100644
---- a/src/libnetfilter_cttimeout.c
-+++ b/src/libnetfilter_cttimeout.c
-@@ -187,7 +187,7 @@ struct nfct_timeout {
-  * In case of success, this function returns a valid pointer, otherwise NULL
-  * s returned and errno is appropriately set.
-  */
--struct nfct_timeout *nfct_timeout_alloc(void)
-+struct nfct_timeout __EXPORTED *nfct_timeout_alloc(void)
- {
- 	struct nfct_timeout *t;
- 
-@@ -197,19 +197,17 @@ struct nfct_timeout *nfct_timeout_alloc(void)
- 
- 	return t;
- }
--EXPORT_SYMBOL(nfct_timeout_alloc);
- 
- /**
-  * nfct_timeout_free - release one conntrack timeout object
-  * \param t pointer to the conntrack timeout object
-  */
--void nfct_timeout_free(struct nfct_timeout *t)
-+void __EXPORTED nfct_timeout_free(struct nfct_timeout *t)
- {
- 	if (t->timeout)
- 		free(t->timeout);
- 	free(t);
- }
--EXPORT_SYMBOL(nfct_timeout_free);
- 
- /**
-  * nfct_timeout_attr_set - set one attribute of the conntrack timeout object
-@@ -217,7 +215,7 @@ EXPORT_SYMBOL(nfct_timeout_free);
-  * \param type attribute type you want to set
-  * \param data pointer to data that will be used to set this attribute
-  */
--int
-+int __EXPORTED
- nfct_timeout_attr_set(struct nfct_timeout *t, uint32_t type, const void *data)
- {
- 	switch(type) {
-@@ -236,7 +234,6 @@ nfct_timeout_attr_set(struct nfct_timeout *t, uint32_t type, const void *data)
- 	t->attrset |= (1 << type);
- 	return 0;
- }
--EXPORT_SYMBOL(nfct_timeout_attr_set);
- 
- /**
-  * nfct_timeout_attr_set_u8 - set one attribute of the conntrack timeout object
-@@ -244,12 +241,11 @@ EXPORT_SYMBOL(nfct_timeout_attr_set);
-  * \param type attribute type you want to set
-  * \param data pointer to data that will be used to set this attribute
-  */
--int
-+int __EXPORTED
- nfct_timeout_attr_set_u8(struct nfct_timeout *t, uint32_t type, uint8_t data)
- {
- 	return nfct_timeout_attr_set(t, type, &data);
- }
--EXPORT_SYMBOL(nfct_timeout_attr_set_u8);
- 
- /**
-  * nfct_timeout_attr_set_u16 - set one attribute of the conntrack timeout object
-@@ -257,23 +253,21 @@ EXPORT_SYMBOL(nfct_timeout_attr_set_u8);
-  * \param type attribute type you want to set
-  * \param data pointer to data that will be used to set this attribute
-  */
--int
-+int __EXPORTED
- nfct_timeout_attr_set_u16(struct nfct_timeout *t, uint32_t type, uint16_t data)
- {
- 	return nfct_timeout_attr_set(t, type, &data);
- }
--EXPORT_SYMBOL(nfct_timeout_attr_set_u16);
- 
- /**
-  * nfct_timeout_attr_unset - unset one attribute of the conntrack timeout object
-  * \param t pointer to the conntrack timeout object
-  * \param type attribute type you want to set
-  */
--void nfct_timeout_attr_unset(struct nfct_timeout *t, uint32_t type)
-+void __EXPORTED nfct_timeout_attr_unset(struct nfct_timeout *t, uint32_t type)
- {
- 	t->attrset &= ~(1 << type);
- }
--EXPORT_SYMBOL(nfct_timeout_attr_unset);
- 
- /**
-  * nfct_timeout_policy_attr_set_u32 - set one attribute of the policy
-@@ -281,7 +275,7 @@ EXPORT_SYMBOL(nfct_timeout_attr_unset);
-  * \param type attribute type you want to set
-  * \param data data that will be used to set this attribute
-  */
--int
-+int __EXPORTED
- nfct_timeout_policy_attr_set_u32(struct nfct_timeout *t,
- 				 uint32_t type, uint32_t data)
- {
-@@ -319,18 +313,17 @@ nfct_timeout_policy_attr_set_u32(struct nfct_timeout *t,
- 
- 	return 0;
- }
--EXPORT_SYMBOL(nfct_timeout_policy_attr_set_u32);
- 
- /**
-  * nfct_timeout_policy_attr_unset - unset one attribute of the policy
-  * \param t pointer to the conntrack timeout object
-  * \param type attribute type you want to set
-  */
--void nfct_timeout_policy_attr_unset(struct nfct_timeout *t, uint32_t type)
-+void __EXPORTED
-+nfct_timeout_policy_attr_unset(struct nfct_timeout *t, uint32_t type)
- {
- 	t->attrset &= ~(1 << type);
- }
--EXPORT_SYMBOL(nfct_timeout_policy_attr_unset);
- 
- /**
-  * nfct_timeout_policy_attr_to_name - get state name from protocol state number
-@@ -340,7 +333,8 @@ EXPORT_SYMBOL(nfct_timeout_policy_attr_unset);
-  * This function returns NULL if unsupported protocol or state number is passed.
-  * Otherwise, a pointer to valid string is returned.
-  */
--const char *nfct_timeout_policy_attr_to_name(uint8_t l4proto, uint32_t state)
-+const char __EXPORTED *
-+nfct_timeout_policy_attr_to_name(uint8_t l4proto, uint32_t state)
- {
- 	if (timeout_protocol[l4proto].state_to_name == NULL) {
- 		printf("no array state name\n");
-@@ -354,7 +348,6 @@ const char *nfct_timeout_policy_attr_to_name(uint8_t l4proto, uint32_t state)
- 
- 	return timeout_protocol[l4proto].state_to_name[state];
- }
--EXPORT_SYMBOL(nfct_timeout_policy_attr_to_name);
- 
- /**
-  * @}
-@@ -438,8 +431,9 @@ nfct_timeout_snprintf_default(char *buf, size_t size,
-  * This function returns -1 in case that some mandatory attributes are
-  * missing. On sucess, it returns 0.
-  */
--int nfct_timeout_snprintf(char *buf, size_t size, const struct nfct_timeout *t,
--			  unsigned int type, unsigned int flags)
-+int __EXPORTED
-+nfct_timeout_snprintf(char *buf, size_t size, const struct nfct_timeout *t,
-+		      unsigned int type, unsigned int flags)
- {
- 	int ret = 0;
- 
-@@ -454,7 +448,6 @@ int nfct_timeout_snprintf(char *buf, size_t size, const struct nfct_timeout *t,
- 
- 	return ret;
- }
--EXPORT_SYMBOL(nfct_timeout_snprintf);
- 
- /**
-  * @}
-@@ -477,7 +470,7 @@ EXPORT_SYMBOL(nfct_timeout_snprintf);
-  * - CTNL_MSG_TIMEOUT_GET: get conntrack timeout object.
-  * - CTNL_MSG_TIMEOUT_DEL: delete conntrack timeout object.
-  */
--struct nlmsghdr *
-+struct nlmsghdr __EXPORTED *
- nfct_timeout_nlmsg_build_hdr(char *buf, uint8_t cmd,
- 			     uint16_t flags, uint32_t seq)
- {
-@@ -496,14 +489,13 @@ nfct_timeout_nlmsg_build_hdr(char *buf, uint8_t cmd,
- 
- 	return nlh;
- }
--EXPORT_SYMBOL(nfct_timeout_nlmsg_build_hdr);
- 
- /**
-  * nfct_timeout_nlmsg_build_payload - build payload from ct timeout object
-  * \param nlh: netlink message that you want to use to add the payload.
-  * \param t: pointer to a conntrack timeout object
-  */
--void
-+void __EXPORTED
- nfct_timeout_nlmsg_build_payload(struct nlmsghdr *nlh,
- 				 const struct nfct_timeout *t)
- {
-@@ -532,7 +524,6 @@ nfct_timeout_nlmsg_build_payload(struct nlmsghdr *nlh,
- 	}
- 
- }
--EXPORT_SYMBOL(nfct_timeout_nlmsg_build_payload);
- 
- static int
- timeout_nlmsg_parse_attr_cb(const struct nlattr *attr, void *data)
-@@ -629,7 +620,7 @@ timeout_parse_attr_data(struct nfct_timeout *t, const struct nlattr *nest)
-  * This function returns -1 in case that some mandatory attributes are
-  * missing. On sucess, it returns 0.
-  */
--int
-+int __EXPORTED
- nfct_timeout_nlmsg_parse_payload(const struct nlmsghdr *nlh,
- 				 struct nfct_timeout *t)
- {
-@@ -654,7 +645,6 @@ nfct_timeout_nlmsg_parse_payload(const struct nlmsghdr *nlh,
- 	}
- 	return 0;
- }
--EXPORT_SYMBOL(nfct_timeout_nlmsg_parse_payload);
- 
- /**
-  * @}
--- 
-cgit v1.1
-
diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
similarity index 55%
rename from meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
rename to meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
index dc87d9b12..5349e6e4b 100644
--- a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.1.bb
@@ -5,11 +5,11 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 DEPENDS = "libmnl"
 
-SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cttimeout/files/libnetfilter_cttimeout-${PV}.tar.bz2;name=tar \
-           file://libnetfilter-cttimeout-visibility-hidden.patch \
-"
-SRC_URI[tar.md5sum] = "7697437fc9ebb6f6b83df56a633db7f9"
-SRC_URI[tar.sha256sum] = "aeab12754f557cba3ce2950a2029963d817490df7edb49880008b34d7ff8feba"
+SRC_URI = "https://www.netfilter.org/projects/libnetfilter_cttimeout/files/libnetfilter_cttimeout-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "ac64b55952b79cb9910db95ce8883940"
+SRC_URI[sha256sum] = "0b59da2f3204e1c80cb85d1f6d72285fc07b01a2f5678abf5dccfbbefd650325"
 
 S = "${WORKDIR}/libnetfilter_cttimeout-${PV}"
 
-- 
2.25.1


