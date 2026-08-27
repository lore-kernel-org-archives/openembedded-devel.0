Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C42BC61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1806.1787856846401068980
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=KWEs6MGV;
 spf=pass (domain: est.tech, ip: 52.101.65.29, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOm06DlXmCl/sjVbwJWI8qEmADa6oL3Yyt+5R8dnVJSGua2zQq6t5R7JBx3+wuC2evGi4hEKSuUibdd8/uX6538AqrgVfQueUurjKloMS0ihW2waVw1z9Priv+jX/Lf3Up/hBfmPmCDLNAddgTTxVCnaaRHCebALRR76XDd7shuFtoXBYpzzfAPk4vJr9l0a08n3qBAwUvR7sT7FX37jtWquEYP8xmkMJDtHd0KBfpdhkbi7cZ8ObqygEFRb0t+9xsFZgqA4nrkzmBh+Ax5s3SslxZqnMVoAmzTV42N8fH8If7J2zZdVvH8yl42DOOOJpVLI+oFJfVPIBVK4Jt0twg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxJBVcAYp+sbMtIxtwSltqF8RIjNc1SsynI882wdNCs=;
 b=EFQmbRQw8UknMV+ztne0XM9uXIURigJcjMjaM6HaYqibuEVTZntEpWUpjQb9pCfcbRJ4zbFQ49dNfHz/UPuyWv4QMDMgDXkhVeM2yKcPoVSTblc8yyym2o+eb/lDE4qnIwag5MJlNvmd9pJDkfp/dCBCLTZSIbqpkE9eR/bcPDENaXm15BkUDRwHQI3TNnmxpN2t7IsacJGdlAzsZMypgSbYPVtLpTOsgDNTrGrUn1ycMzBpkhxamByd1Lk2eQMPcYvrTK6hJrB257Vw5pdlGZ3dVUU0YS/52XR1BW+NBLOG6KkOQ3b/xDprEaljr9J2LjUGg1GaXfdM/PCm/jqwqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxJBVcAYp+sbMtIxtwSltqF8RIjNc1SsynI882wdNCs=;
 b=KWEs6MGVZH/jenFhpq/1r1nKaUmXOWXaASmO8EKOCyu+FPk98h3hZMT7kLkB+Q6qlTXMIV14HrnSghmSt1OA7bkZYVqPCkmrwHX0ngti2sC3jzWDpG40BlEvL1u6o5phMdMDlDClLAhd+SGGUf4HtMyTcZswFhzvhalgvfiNEtjxL50VAog1uXPidmPrg1d5tsszIdf9A2q1BPd+l5ERiKt5vba2Dqld7gJ3fnFnUIaLXKbmLxKdbWXDlbhWBUS6vSX9pOZ6FU70N3P2rLAu97QVBQFosjK8k3nqQKc5AzGF0blLldVmB85w3wtTop9V2VSE7VBl48xF7VuUwKaFyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:04 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 14/20] freeradius: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:18 +0200
Message-ID: <20260827185324.78997-15-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: f9590cae-9ec8-499c-7839-08df046c90c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	PBdAQgiusurEscLaBqdFlfz99yvXZtk3JmE9ZrzYUYCBLdzemEFW2DhRYD46egLK4oFk1+vEIx1SCtOx/M3x7fEpQKuXOgkfe8fG3z1gb+ZExTz5niEaI4rCz76IuJQdDtnJyTRJB4+DHpEth0GrdrdwOQsvEXpNbI0PGWhUFxc7Fp4LvR6w945y8jXAxPoxvSPOIkCBPP+KJWUc9d1TCY0KCN8VjREwAEWS/yqw+zaYOqKoVo0dcxOcP1RtLmc9gqVa5hLK4WnCm1s51+LLYKFt+028NlnqHADNtjtPmWgubHjmiJbG2kgpUd5lIcw0vYa1fEAtuJ3WR7dxRSRy/W31fzQOBhyCa6Yii+L1hWao1I2v9fIAL7IPZgBi85pQVRILw3EIx35vzo8Jm9k+3wv2F9i6zm1EV7oSEvbBOEx7VERD8FNKnlaCWEdjfEfx+2UJ7B4NQxlAATGc0/EIewVt7MERmgyxOs8+endI7hFoOZbxPBeSsxHlFdqLCyMaRdupS5Hjo7MdlIa1VdipeLzxWj3YymU7LhtNAeXWfLBroe+ivM7c9+cgPtODqtixRSEIo7acHDfxDEbjSDg4iPrKh1hEKiKoC4z12Ef1uZvSvtrnmOR6lAeXNa6AMVAVwDey/czi2xzSMZeC9l0Q6+E7daI99jmRyBVGOzNZDtY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jvpNcvUotqAKyh7iZ2Rj8waIVXjT0W/L40AcOVlGrj3JiTEsMYBnYhsE/H2D?=
 =?us-ascii?Q?AOOQZREK23yHZXf1zbYMgc5c4C9O9ihs1AwDTTyV6dflj1blpJ1YlfV3iH/W?=
 =?us-ascii?Q?Y/SQNvBoMGfV4TK7ClZKPsc9riqyTcSPTCzdJv3bM9R7wp3wZbdiotjENq9d?=
 =?us-ascii?Q?m5GkcWCDKjRDF/hlMe9VKBPKDvpYChTCHcoA9XVHVBAFLhY8SAG5dQUg8rJU?=
 =?us-ascii?Q?A5+3Em741/166U/X99wiAx2CE4ssaqkh789UT2AqEIeXLO6weP2WJkI4HndC?=
 =?us-ascii?Q?lwrpG9rFAL4oXfZWki9ogppZP1X6w+xW2gAJwqyqIwbP534AI83dO2A9vgmW?=
 =?us-ascii?Q?0xj8m2nq7m3JO/CJuzmJykVgwzJszlJXPjiCr3ernJyc7NQPteUFJIUiQzpx?=
 =?us-ascii?Q?FimG2CYrsg6yY39oWlHfUa1Ox5MgcFM3eqDLpUkLneOf9Cs/9XvFXQ2nthEk?=
 =?us-ascii?Q?BF8iMVXjESsBry/cKAFvvc8tZO0/n6XOTGAPbcPdKPWZLn/uWETCNMre3eQi?=
 =?us-ascii?Q?UgA8jk3RO+gzxa8uxH0Q0kTWJx9IPHrYQ/9xaBi6/X+5fgy3gRc/y1GQ59Ag?=
 =?us-ascii?Q?PYU3XMHZnULtlAfdC9WfBjVdfmXMehVa5xLcoYmis2aiQy4buahVSrnshAKX?=
 =?us-ascii?Q?I4BKqQx3DstSGIXaQjFWnZpA7fucVjxYrm8PAeheKFevZOpOlPHFbtyN6SRY?=
 =?us-ascii?Q?aRf37aKIyeke7XnKqFfKdMmohEPgSHXKhRuIy/Da6ccOzi/GEINeOYL+KreN?=
 =?us-ascii?Q?X1PpXF1FLcqAm7L3psXyZGXYK/1iUY2eT6YyO+S3ldoKCQ6N4MGcqO3zTLxW?=
 =?us-ascii?Q?gilYuwPaEozj8vGKOW9IKqVCRaqekRovbBAPk6cRrNPOw0sBDA6t3C0e8ok8?=
 =?us-ascii?Q?tGz0uaKpELGdHgV54wNairE2/5bOgCJ9Y/uGv26i3lmUdqqwPYFZwZafcUfr?=
 =?us-ascii?Q?qQmV2DtnuEuKPFujpRBT9/qjJzawZTnrEb9s3KZNihnD6EtYryGHnNs7rqk4?=
 =?us-ascii?Q?fyITUkyr59RGknH6OlodQET72r8pxbt85aByywdiA9LJFuyQk2pKB48GHx1C?=
 =?us-ascii?Q?Xo3ueT3n0yLcRTK+h9siW9iiV1/jcDJkuRVMt6G6dmnHZ9yrxd2krEJM6Axb?=
 =?us-ascii?Q?l1fH8b9N+hXV6sf95QBYS5N9VpzknAYSaetJ+NQVwEompcJxwiRou4e6mu4H?=
 =?us-ascii?Q?HLDfM2vpjXGCsr9QGDJfEtfEN382cRI2ggfS1tK7UYmpKLvBB7Shrdgxl9v2?=
 =?us-ascii?Q?NyhZSyWDPeNaIzIlS1uhPHji0rz6H+pOjL/38M3spMlzlzx2KPQzBSHW7q5/?=
 =?us-ascii?Q?ZaC61MlIf81HZj+Zk9ezdFzfFC50gjbYlUw/c4cMVWURliz1ycvTiTTbrwdU?=
 =?us-ascii?Q?jVaRm5YMdYlwKG8L4dsH0p3KrtvgNi2CRjsFqQLQwZEuH8I4eP5hjxrk+ViC?=
 =?us-ascii?Q?8qs8wITHfBxcdXDFpKr7uQQiP9eLOxCwfQOhGmb6YunkvALN+O0I9hqGQkMb?=
 =?us-ascii?Q?qF4NeDU03Jhaq+nncpz4SJeH6LSdOTyFKQXChSdXv5t22nxXguYSIzm5DGrS?=
 =?us-ascii?Q?Gm40fT46VCbpxtK4XI9/QUNfRVb/hhWOWN4qYQxIlcYSw/CCE16wi3FOpobj?=
 =?us-ascii?Q?IwH6Rfnn3r4bHw4I1BUgZrOgPkM6AjjSXzEJRCNPQkD/+WsfxEU3k9/bIzOz?=
 =?us-ascii?Q?ELSu5j3Yu40ElulVTYV6TZLdKB3S+s78Mnft/Nj26KsUQayCj65lss0mtsiJ?=
 =?us-ascii?Q?oOz8hLFgc3RoACb8Kyn55bD8ocaQ/2I98keq/LSD0PrsFemhbVN4tL0pNI9O?=
X-MS-Exchange-AntiSpam-MessageData-1: U43DVYilqZfRdRBp0B8dWY9UMW1kQ5gvREc=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f9590cae-9ec8-499c-7839-08df046c90c7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:04.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yDqY21QCp5NlH2JJjyhfBtsPxA3MgGlALDbrSfYDxOr5HB7/G646UjbqSrvmXXzz8mxYPD7fO7ak3WFV6TLHhnSmH1wautgmBQY4jzO+JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129549

OpenSSL 4.0 makes ASN1_STRING opaque. Use ASN1_STRING accessor
functions.

Upstream-Status: Submitted [https://github.com/FreeRADIUS/freeradius-server=
/pull/5841]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ING-functions-for-OpenSSL-4.0-compat.patch | 78 +++++++++++++++++++
 .../freeradius/freeradius_3.2.10.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/freerad=
ius/0001-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius/000=
1-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch b/meta-networking/=
recipes-connectivity/freeradius/freeradius/0001-Use-ASN1_STRING-functions-f=
or-OpenSSL-4.0-compat.patch
new file mode 100644
index 0000000000..9c7c9a15b0
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius/0001-Use-A=
SN1_STRING-functions-for-OpenSSL-4.0-compat.patch
@@ -0,0 +1,78 @@
+From e2c69353ed1702c22eac2191b67977853d7d4277 Mon Sep 17 00:00:00 2001
+From: Antonio Torres <antorres@redhat.com>
+Date: Tue, 5 May 2026 14:42:27 +0200
+Subject: [PATCH] Use ASN1_STRING functions for OpenSSL 4.0 compat
+
+Use ASN1_STRING accessor functions instead of direct field access
+for ASN1_IA5STRING, ASN1_INTEGER, and ASN1_TIME structures.
+
+This fixes compatibility with OpenSSL 4.0.
+
+Signed-off-by: Antonio Torres <antorres@redhat.com>
+Upstream-Status: Submitted [https://github.com/FreeRADIUS/freeradius-serve=
r/pull/5841]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/main/tls.c | 26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/src/main/tls.c b/src/main/tls.c
+index bcb65cecca8b..211eb0f9ff9d 100644
+--- a/src/main/tls.c
++++ b/src/main/tls.c
+@@ -2568,7 +2568,7 @@ static int ocsp_parse_cert_url(X509 *cert, char **ho=
st_out, char **port_out,
+ 		if (OBJ_obj2nid(ad->method) !=3D NID_ad_OCSP) continue;
+ 		if (ad->location->type !=3D GEN_URI) continue;
+=20
+-		if (OCSP_parse_url((char *) ad->location->d.ia5->data, host_out,
++		if (OCSP_parse_url((const char *) ASN1_STRING_get0_data(ad->location->d=
.ia5), host_out,
+ 				   port_out, path_out, is_https)) {
+ 			ret =3D 1;
+ 			break;
+@@ -3050,12 +3050,14 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	 *	we're at the client or issuing certificate.
+ 	 */
+ 	if (certs &&
+-	    (lookup <=3D 1) && sn && ((size_t) sn->length < (sizeof(buf) / 2))) =
{
++	    (lookup <=3D 1) && sn && ((size_t) ASN1_STRING_length(sn) < (sizeof(=
buf) / 2))) {
+ 		char *p =3D buf;
+ 		int i;
++		int sn_len =3D ASN1_STRING_length(sn);
++		const unsigned char *sn_data =3D ASN1_STRING_get0_data(sn);
+=20
+-		for (i =3D 0; i < sn->length; i++) {
+-			sprintf(p, "%02x", (unsigned int)sn->data[i]);
++		for (i =3D 0; i < sn_len; i++) {
++			sprintf(p, "%02x", (unsigned int)sn_data[i]);
+ 			p +=3D 2;
+ 		}
+ 		vp =3D fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_SERIAL][l=
ookup], buf, T_OP_SET);
+@@ -3068,9 +3070,11 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	buf[0] =3D '\0';
+ 	asn_time =3D X509_get_notAfter(client_cert);
+ 	if (certs && (lookup <=3D 1) && asn_time &&
+-	    (asn_time->length < (int) sizeof(buf))) {
+-		memcpy(buf, (char*) asn_time->data, asn_time->length);
+-		buf[asn_time->length] =3D '\0';
++	    (ASN1_STRING_length(asn_time) < (int) sizeof(buf))) {
++		int time_len =3D ASN1_STRING_length(asn_time);
++		const unsigned char *time_data =3D ASN1_STRING_get0_data(asn_time);
++		memcpy(buf, time_data, time_len);
++		buf[time_len] =3D '\0';
+ 		vp =3D fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_EXPIRATIO=
N][lookup], buf, T_OP_SET);
+ 		rdebug_pair(L_DBG_LVL_2, request, vp, NULL);
+ 	}
+@@ -3081,9 +3085,11 @@ int cbtls_verify(int ok, X509_STORE_CTX *ctx)
+ 	buf[0] =3D '\0';
+ 	asn_time =3D X509_get_notBefore(client_cert);
+ 	if (certs && (lookup <=3D 1) && asn_time &&
+-	    (asn_time->length < (int) sizeof(buf))) {
+-		memcpy(buf, (char*) asn_time->data, asn_time->length);
+-		buf[asn_time->length] =3D '\0';
++	    (ASN1_STRING_length(asn_time) < (int) sizeof(buf))) {
++		int time_len =3D ASN1_STRING_length(asn_time);
++		const unsigned char *time_data =3D ASN1_STRING_get0_data(asn_time);
++		memcpy(buf, time_data, time_len);
++		buf[time_len] =3D '\0';
+ 		vp =3D fr_pair_make(talloc_ctx, certs, cert_attr_names[FR_TLS_VALID_SIN=
CE][lookup], buf, T_OP_SET);
+ 		rdebug_pair(L_DBG_LVL_2, request, vp, NULL);
+ 	}
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2=
.10.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.=
bb
index 19d8e69db0..2ff1a9e2be 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.2.10.bb
@@ -39,6 +39,7 @@ SRC_URI =3D "git://github.com/FreeRADIUS/freeradius-serve=
r.git;branch=3Dv3.2.x;tag=3D$
     file://0016-version.c-don-t-print-build-flags.patch \
     file://0017-Add-acinclude.m4-to-include-required-macros.patch \
     file://0018-Fix-permissions-after-generating-certificates-with-m.patch=
 \
+    file://0001-Use-ASN1_STRING-functions-for-OpenSSL-4.0-compat.patch \
 "
=20
 raddbdir =3D "${sysconfdir}/${MLPREFIX}raddb"

