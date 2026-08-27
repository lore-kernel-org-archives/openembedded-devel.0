Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF06C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1890.1787856851987395423
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=k/idb1qx;
 spf=pass (domain: est.tech, ip: 52.101.65.27, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQPZg7IMRDqOIuf6zJ6J2roa8h1LLD88idSn1T6/G5nSlnNvDpVoeRm5mfif3z4/XetKkE5MMzxo9kXboEblrFAMTqy0T7o+hcxOFASxAU46oRox0WLxn79caVpgvCnQShQrrhjSTx9tL2N59ZpLBwkp2FDJuYPJcVn5tjQcjZRBKN59U3KGX8FLNQbu+y0Dbcijp90rImUiJ2UeUMyrCdaXKtrbxSK+C1lfT6IsMpOwAgI4w+Hj2GVVqENZi4sGb/sPjTdgWpHMuB4+M24zdWhsoVxcjMRsDa8Mv2ZqEtuQGq8s7V9sQHWBaAZecL5Hy18bflqtlhNMVuHH1n/wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRdSGWRM+IrB9OrRvcqx1tKQIgawBAywXCqOVg6CFo4=;
 b=ZVtUsIUigxq4o8SQgVggjG++iKsy/lfwohEQ5sB+1oGbbO9LFrl0DEQJaddK8MKZ34pPQcg3rXHqcE3PeP/O113FTJqKkeRiQwlW7tmV8wf3FOdOsX3qTFRRR0pJ8iAjM0Wc9NWlN+sgqJxna3B2YbCQs56SNwWVNOZQek8NDu6aO3+o/7KKhNU0wp3c0EiiZ+ZYLqjN0bC/MZEDMbfkpsFjaMT4tVBZ3e9LEF0QbhX+qZrZq8YxFHVETPUE2raXlNyjIXPax+6QoDuudWiA0bXntkoDsVogXQW2tPeAEp8wjmBnDfCRlSNc1jjyh65XIs/MXzh2+qzxQw96AGasWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRdSGWRM+IrB9OrRvcqx1tKQIgawBAywXCqOVg6CFo4=;
 b=k/idb1qxZsvf/F0AFVcDZJNrYq/dmNllGJOt4UN0zJWL24QRHFBtFxHMBUClVLS2NcRdZgc76fmnMySTuzyObSA/RCpV5A1C3wDNkzEsjjg1p49AKopRbAYEUpvQjYjxxpXOgNgudONTfHeA9NWJ4LevMEZPtUkV/Ze8dyOKB/KgaDIQ8CJl2svq8S211M5AL+EOMmwosqydaERjmM0pFZc7yHkD0pM8xsqmVGSXwREZS4imctoN63gS+hwCpqh9UxomlAXkLAyUq9wHwKxB0olfzojXtbRtSWxDry2NOcG95JjY6hB2zQDjLApsje3h47SlFqFXrM/fGAvZCt3HZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:11 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:11 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 17/20] libesmtp: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:21 +0200
Message-ID: <20260827185324.78997-18-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:10:120::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1993e1-ab69-42a3-34b6-08df046c954f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	I6ub4YvlXKGRNb56Z201d4swPSw4XCFZaQc2GdLonjLig1a0IBamWpQmsyB1W2z0qf2FrszwQazf/XbsxImw1YMyCPd8qzAKVVqqEAF18KHjzBW75yM/6aWp7BpaX1Rvq0w41ZHCYzormXa8g0R8cLq2sX8xPVqo+yqK4Dvj1qCD7NLwd1CapC7hConRJcHCxCrVhNTdak0wRu/jsngEmBJuUbQN7Pp0n9dl7CNYJoSaHPQAl24fL8NsXQZIZ/jRlrnOnZW/C0g/B5NiclkF2EItneuOM53XNjqEbDxfzQWcdq39vW60SfBlOr1STwAzwU+JYtbCq+HKUTr9mfk5N1SANO89r/J7F+oK7ypdgllj55Q0Vps90QedfsQ6jR8GHHGpzvshXxbHMmuQ3DBlqUIe97tBdMnzuwlcFP5PwyNgNvVMUqUAymxFGJybzgXJurlUnBdFyoNHvazhWBhtXtxYbHiTw7LBt33xaXG1ngjt4VzcablvQ0bH8aSKHH9SarXqNw0rch7Wr6r6D8dZVZOolAOzm+15padcmsahRksvb98LZaAtb3LYJM6f6QuNNwjjiijCxnT0GRxK3WSxdlKEfEo7iXwqesIXcm3bsmaKt8cHvOET7IhKilJTxLou5XnpJj2Fw+SpCzt+w2adkvOcqdne8zPMw1n7oSPBmdg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LOdbP9X4auluZWnXW+fFLxtYdH2TRDz5HtMhZnUkELRVJcoWu9Bh7XoDunoJ?=
 =?us-ascii?Q?u22+E52lociimx9teTznSUAv1QkE5Z67bcVP0oA+YNanq34VjVsymbu16xBz?=
 =?us-ascii?Q?s1wQamWI0qdaC9s7Fdn4bOCWGfw/+3FQ17QmTPwUIhORvsGx2tWYffdA5deD?=
 =?us-ascii?Q?ZVcJczoLbWQz5UeFp90eV+d9GEJpflIDnfCMgulppveVc2r6mgB+eDMbbK3I?=
 =?us-ascii?Q?onudxalS9OdNLRUAWtKwFlOId5X8MZqTNjoGIJyFPTehaf3i88iw5VZJq9ea?=
 =?us-ascii?Q?0SC2CBWdkKgEGKye0fMWnrGGkiS+nh6lcqGCCWnLc0mVYXnaS0sOf0HDlqFf?=
 =?us-ascii?Q?2VoAGiaaZpxLmeOkfbvMZx5fYsccqJfm4xIXFj+oixAQ3DTBaXK/cPgWSUKH?=
 =?us-ascii?Q?ohaqD4anWaauMBiRhJCE6+kshwjZ+fQ2lsgDPAsICxjvDMCdfPGonB8l4UVm?=
 =?us-ascii?Q?haKPxarF8b36CeQiXvKYK+ZK4DNE36HnCSxFojvjZya0UbqMxII9paSXwX0c?=
 =?us-ascii?Q?xL0viDdnNVPFNsdZm1/REzNBr1uwn9oqe1QOwP2NyZikDqO/KReVwFbfwZFT?=
 =?us-ascii?Q?wic2YQzMWx8eEnLSpG7nvlWHrfoTe5vfVsp1lHkWQ/p2c7Ark6gSfhm3MTJo?=
 =?us-ascii?Q?jM14I9dAPItXQ1PqZ6bPd3fRHGZ0wyFQW3nD13yIQSlETUN30aoM33eg5UdV?=
 =?us-ascii?Q?hjBmCZ8Um178GQ/9hrn3YlW+kQc/xCBWcRuPHvSnW9w7Uh2vNl35vR6LoV9R?=
 =?us-ascii?Q?KhPav9meYLubxy6qQAzm5rZQ3qrXd/h7CsPERl2MaT31WjZvRRoRY5sv9Z1Z?=
 =?us-ascii?Q?xXTWc8doWyCP/t9wGSnHSyAl1ABx1FlefQQeImP6kZ6pU+KxjM9UX8c+EDH/?=
 =?us-ascii?Q?p/chWKMfeCF/GKSyTMh4kLmIh1yHqdW/McbC3F+7p3u04aqSH5VOD//jbEzV?=
 =?us-ascii?Q?5zHRnWE+ldradoYRZrwGa454W0UdZJIiZbkmLAPrvjfFEYJOdBXVKbMHApSN?=
 =?us-ascii?Q?yk+e0pM2O68kHm7opS8UtkM6hj+QVfrRdoT/hru4vTS6ysut2Fj5RkAhmBzR?=
 =?us-ascii?Q?mPYQ+RTcqZST1iH07f7m45YZGv2pqxjSl5pJt/P/ZzR1zECYiYTduol2aCzB?=
 =?us-ascii?Q?RlFtzHZvnA0H1jp/WJO99pCnzx4mmWwwL5bctyIno6HMweghwV5SXaWgIqWY?=
 =?us-ascii?Q?rSUOK+qHx2dXhZHPKnfz2FRXVX5Y1B8VPdgjyEhf/+UUINoVbuh1rA3aTfJ0?=
 =?us-ascii?Q?HaokpJdD1mrYoTW8Koqb0blCm6LsW/lQ+8BES33EaAyGTo0c7moDee+cQlZJ?=
 =?us-ascii?Q?fvBKLOaAAHZi9h5qPEtMnKypvQeizW4w2JuqU2bkGcaLfQmwvqncabWnHuqH?=
 =?us-ascii?Q?GRwK2io6dYvIHhSdXi+mgygGe3f02KSo9agwG+ZzYGmN+EaoI0txfcfzJu6T?=
 =?us-ascii?Q?YfnEtWNjTeLOIjb0TDSqmKribIaMof4u5ofcJ63Dy5TSojOorg+DqlrYFsgz?=
 =?us-ascii?Q?K51xNwxOz4RAGvErS5kTBho+2oLnQK8rKNcKO3xBoZn01Ap6eMiHjf195m9R?=
 =?us-ascii?Q?aZEGX+tF8/h4cHCYvBEldALv5cTU0kbofr24T6WcG1i3eFTQ0nXQSV6B3GQz?=
 =?us-ascii?Q?IkHw7tE5r4uKY7T2NEVJr+XzitKyexaAvXOSm4cSIR5kTtW1tPGCbFZ0MSkL?=
 =?us-ascii?Q?aPDnjRjSSs3xhNGeAucnckLGFSShHcUj05cW8W24GwyRLnkRkkXxfP9emQ6d?=
 =?us-ascii?Q?3lpUU7dEJUKRAPEy0pPT+5ggjfbINK02573ZNmi2qcniyB986M81tj+gf5wo?=
X-MS-Exchange-AntiSpam-MessageData-1: PQlmHCofK64EU9lxsg5uKl/5bdDHrvUTVME=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1993e1-ab69-42a3-34b6-08df046c954f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:11.8747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Odmjb7JLqFFLCPK9XOvqDOCENabvePowcLLYrnbrQIfoY1EzKBYSWs125GIXSrKIbTLvWBinOINADNm2MDGvZ0ZumBSCIyH3xEDQw6dXISI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129552

OpenSSL 4.0 makes ASN1_STRING opaque. Use accessor functions.

Upstream-Status: Submitted [https://github.com/libesmtp/libESMTP/pull/34]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 31 +++++++++++++++++++
 .../libesmtp/libesmtp_1.1.0.bb                |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/libesmtp/libesmtp/0001-=
Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/meta-networking/recipes-support/libesmtp/libesmtp/0001-Fix-bui=
ld-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/meta-networking/recipes-supp=
ort/libesmtp/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.pa=
tch
new file mode 100644
index 0000000000..a949639502
--- /dev/null
+++ b/meta-networking/recipes-support/libesmtp/libesmtp/0001-Fix-build-with=
-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,31 @@
+From f74ac43fcd2af19dac28901bfb9dd1e62a8ec7b0 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+Upstream-Status: Submitted [https://github.com/libesmtp/libESMTP/pull/34]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL=
 *ssl)
+=20
+ 	      if (name->type =3D=3D GEN_DNS)
+ 		{
+-		  const char *ia5str =3D (const char *) name->d.ia5->data;
+-		  size_t ia5len =3D name->d.ia5->length;
++		  const char *ia5str =3D (const char *) ASN1_STRING_get0_data(name->d.i=
a5);
++		  size_t ia5len =3D ASN1_STRING_length(name->d.ia5);
+=20
+ 		  hasaltname =3D 1;
+ 		  if (strlen (ia5str) =3D=3D ia5len && match_domain (host, ia5str))
diff --git a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb b/m=
eta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
index 50f83221c0..d1364a8948 100644
--- a/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
+++ b/meta-networking/recipes-support/libesmtp/libesmtp_1.1.0.bb
@@ -9,7 +9,9 @@ SECTION =3D "libs"
 DEPENDS =3D "openssl"
=20
 SRC_URI =3D "git://github.com/libesmtp/libESMTP.git;branch=3Dmaster;protoc=
ol=3Dhttps \
-           file://0001-Add-build-option-for-NTLM-support.patch"
+           file://0001-Add-build-option-for-NTLM-support.patch \
+           file://0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch=
 \
+           "
 SRCREV =3D "1d0af244310a66943ab400be56b15a9087f181eb"
=20
=20

