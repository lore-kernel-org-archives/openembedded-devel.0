Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47F6C54E64
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 13:22:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.15898.1711632140287903041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Mar 2024 06:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kGDBaaLt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=481736fa43=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42SA1R4B013588
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 06:22:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=TN/OmG+ccc9wyXZSFL
	bM1pf3t6fCGJEHiHC8vvUI3l0=; b=kGDBaaLtA9Pv+2DNyQZDyuAam+1cvP91As
	nlPM33m4RRmLKzYS3i62DXGX9sfLfkf86GxdFtsLdNbEY2OOjMK+s8Mp9Tn5QISu
	uH9XFrrzeQxm43TktJ3h/xqEjtMQdYNoiALHxJKTGHduJk92WinaQ0ho04z4KJo3
	Vb6pmSjXXwxOaY1hc2+M0FUIOG+8jF8SY+BcS523DKPKARHPdLIj067Wk3zOh7sp
	N1Fz/gsJHTPkfeiHEIxlSg5cC22OUviX5uWQMQJX4ikpDC4S4bfuh6eZtLHWEeUI
	u9k8XfcNpSXHMGWLg1Zg4Ezv0alYr9wmZN6Xar+vgKgGUvGOindg==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1xkgxh10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 06:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBa0hvotI6ehYbMtPJ3Qo1+GJkJKFBPgveoL7k3U5Ul/PF8GyfjE2bmoY5BVdazjrz3OOotYz69h0cyh4GD6hfhwaaW9JNput3JB4qFUa1V8M7Ry8d3fPxOLzbD1QR2jiij6z3U7dp1g/gnCDnhDLS4GAyjrp5vamgD/Yeixj+2WGXK9xrelUCSwA8rQB1N8mbs4lhwmC7QXwYZurUwT6bosKEdeOYIM7N42J+LbA2iCXgtlqdot8kXq4fZtK+BoGe1p4x+uWBYo0RwD4AJK282TcQWuiKnkWcBnhdlr8Gf6oh6C5iZUa4uGu73TZISN8jM+Z6OUUtvdKRjMlku2pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TN/OmG+ccc9wyXZSFLbM1pf3t6fCGJEHiHC8vvUI3l0=;
 b=HI+oU21FwAapUcwvb+BJ0JxSUHwrZb1UJ8PoguAgQ2P0KrYA6VzFzj22P+Jlrvwj8JC7I5rO5Etaq3g/zqsJ7+hESGgC8rjK1HkyiSYlbrdUPFIqxgDCKZQSkFgbhzvYrqFNpDRYlxAYKFN8lwtx1Mjh4oz2+cCAfMwqg2yJHjI2id1qiCaRUhIb2JLCeoh4uyLQ3tL478qRYztznajjQFoba/rn+kWddeaoVBsrydlZkfWoTFo0C6HbD7f/lDWf9SWX4NW7KyiJI9i9SMYNegWcB1dHY5s0EX47PelWRC3upXEjoWfmj6cAz2/RpZyfYjlFTbprLVKY57R4jyKYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.39; Thu, 28 Mar
 2024 13:22:16 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::ac1c:eab6:e008:9b74]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::ac1c:eab6:e008:9b74%5]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 13:22:16 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH V2 2/2] nodejs: fix CVE-2023-46809
Thread-Topic: [oe][meta-oe][kirkstone][PATCH V2 2/2] nodejs: fix
 CVE-2023-46809
Thread-Index: AQHaaXGimACCUlVvAUCoi+uYLSQC4rFNUuyW
Date: Thu, 28 Mar 2024 13:22:16 +0000
Message-ID: 
 <MW4PR11MB5822BBAF493E7DFFC71B449A843B2@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20240227113717.1068213-1-archana.polampalli@windriver.com>
 <17B7B53C5C511BAF.14830@lists.openembedded.org>
In-Reply-To: <17B7B53C5C511BAF.14830@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|DM6PR11MB4594:EE_
x-ms-office365-filtering-correlation-id: 5af29985-f04d-42ce-dc47-08dc4f2a1673
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z+papwRySpzgozqOycUCIXgdgENGHkOaqLwn+6ePokd3dTQmiVSFgxizvkNMVfmwjCHNC/zKsuMqUygM8kNDRoqJ45Cz2o0JSDoAXJP2LcI4Mbe1OIHM0WixFNxhhNkjg/tE2PByVo3Lm0A/t4C1UatbtO8aLnbIjWYN/BbAKQ4wrA78i9qOO8Q5C59O1kj1nsGgm5m1nPqss4KZ4xGz7oVWGEIEl4Jn2H1bGnUoxMKf1B5o07/D7P/RaNBv1FDDs4WGohFUFOODxWDtx9VflURGzNzSjFVKZ7gUp/abmL7ybtQjLv9RZjUbBCOC/alDAzG+Lm/cYVXeISveCvo3b0rjh1a3LlyFrlzA6cdWAGjS1rrvPmvJ8yDsQy1cy4C4yROw7hBwEjU/0Klvd8ndAm0n5TkumNr+5GfgOPAV/Mxmu4dMIIwsE6EfiaWXdCOCEXqebK42YUhZBPR2PW5tR2FnQ+a4g5gJub77OEO4mxtfT10zbe4NKxBjpQ0e7cTHoDpMbd6bjnZi4tbTR7RPQ8okxyD7rMbDGQXWvA1Ebqtft6BNNJnvkQT9uyPfM3VfWPOLiqf09sXlKHJsMaWzXbsnUMT+IGXpVvIbdnEl9AGHcDO8hZ4IwffUcQZ0eNXB1n0/z1yeihyZ9IYEKRt8KBC+DjYQJl3dtgTMDJrOti+9T4IL51VbLRvYF1Qagt4R
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?2bUH0ZD+2h01jYY3YkbOZkMNtxz0V5nr9Vehbbk1g2pCV81z3y4t81y1YVqu?=
 =?us-ascii?Q?KsLB8xUYiohGBIeS31N0JlQ/H2FMIiR2HGQjgd97R4magHcoRgRFYj2/ioNq?=
 =?us-ascii?Q?85RqiofwZbWdBr5iAVlpDTdKwKhZEIw80hu05gBu/psemtx85x3NyEmm7Gmf?=
 =?us-ascii?Q?QAFScK7n1+4QKtH2nwUNsLKijASQdLWhoFvFFJzOzd5dD6oJfil8acL/vSh5?=
 =?us-ascii?Q?WxZ7fmOsi/aW9ojc0jYs6sMxZK3lPf/QkcZPLIztBZutIdvj0JcpVeaqsGPn?=
 =?us-ascii?Q?z6Fqc3MPrGbcUaRBjpPB6ueDKz3+PtKC54i0y4nrAaHvPDIUN7w0kknwMoP0?=
 =?us-ascii?Q?062OBmnzIajxMeZbau0kZ7LfH5JoX9ea5GKnjp+GDouo0quLs9Y6DnWpBNU2?=
 =?us-ascii?Q?R/6XiradpZkSyFSZcv8Q0baL9CigDIvk8W5eq790hbOejRjVSDJAj9DrsaTI?=
 =?us-ascii?Q?5cHnsonmcQgNhvZHnfEdxlEetK7PF2mdSF4JUKTBnHt5BeWva374v/ghvEXo?=
 =?us-ascii?Q?vY+On2cto4P38F3CXyYSUQas/IaRIsp7G+1Bs7KL5HJNEHqt/m32dWR8UWDG?=
 =?us-ascii?Q?Pf/mip0hgxotGO4/QSO+xIxQOGwCV0XnmJjoXJPG2lIt6qPx5BMIo25ctqfq?=
 =?us-ascii?Q?/qKDTQYsUd6UAhqdvshj3frbbraPl2bV2hJw+sweB1Rne8Tz/DXIMGUCF4QY?=
 =?us-ascii?Q?Lnr9AcsqeBfEfWCUw7q7AP3BZvXcdDTz0GTv3P7Tfz4rdFwLfSF/M+Zx2PV3?=
 =?us-ascii?Q?AFzM9uMAZ0/dZz/zR6Zo5Zpth4Tudn+Cay+iSt+SuMQIPVH76XX7CeTVbkpp?=
 =?us-ascii?Q?f0CYL5r9Am+deSTHPaVVjejrD++J+dQd5cIAluyeV7tA5g64O/M2DFzFGL5d?=
 =?us-ascii?Q?UxPuOsMC6iTLTPReCZkBM0wy1SBHoN5DDh8Omif1xeFgKpgugAmEgS7YQZw3?=
 =?us-ascii?Q?3VekSdWYHahs4FazrtcsRedGN8NNWGKkhJr0knqQdWDVfcUZqut2glhVz3rV?=
 =?us-ascii?Q?RSvl5CJvufmQkxqyMwOytcpxewBVhaAYLReraj+0NKOLhACAoehfNUI8zYls?=
 =?us-ascii?Q?oIBPfFVi/PRGvY0bGNYzoRWEh9ghKb96pxkv0yGTeooV/g6KMPkULBrPN1mB?=
 =?us-ascii?Q?JPRtexpteoRfzDtZZPqnIDa0YzC/CfPn5Y1nvs6hbBkyERRDrepxD0Hop5Le?=
 =?us-ascii?Q?vnyjm4Cw3TjMoZ/0yb0PjCGYvPvRG8+87qTU+FaOC0nHqeR7otm1HC+K/5SY?=
 =?us-ascii?Q?6mOJVBsl3vPYEDBN7kPu9DVb06JLUOAfeGzIUMs+eHn1mWBpthnaOBQTVJzV?=
 =?us-ascii?Q?TSIyP4kqknChLh4ssVEX209dFvvX3oSEvPQD3ZAWnaYaOjqmSF1EaqHy5UJL?=
 =?us-ascii?Q?aidWBi+NmGXrbpC/Tu92O7VIeyLJ3AkbjVcqb4c/QBE6du3JmLXF/O4lESM5?=
 =?us-ascii?Q?uGwp+vdA8hpcXnmNQZzOzTK1mAO5wkcehQVLQuZcoI7pIdGUF/sQYLupxPwp?=
 =?us-ascii?Q?3GmTrz+iDwkLoJv5CkKi3myKfzlCw+Y+dCgbg2OI6yH0qF6y7Afd+4qlYjsF?=
 =?us-ascii?Q?xP5QUl7KscJE2nV0+F1s/a8/I5nI+D27q9UjCN5x/1PtOxZfFzUy1nRAy0UW?=
 =?us-ascii?Q?Ow=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822BBAF493E7DFFC71B449A843B2MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af29985-f04d-42ce-dc47-08dc4f2a1673
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 13:22:16.3275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kbep+6egXcxrqSTE1vm4mZaKOD2F6aRwnaKtumiUhjXDq3SJimWh3hWEb8OqxRGrjkRjQLOQOVLY+PTnRmBpmrxpG+kPowwIgxx8j/nvdWRpfuRE2SaVZv68EEV/9zym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-Proofpoint-ORIG-GUID: u79xuX-znJjLrZog1ljfqup_B0YQ8bvF
X-Proofpoint-GUID: u79xuX-znJjLrZog1ljfqup_B0YQ8bvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_13,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Mar 2024 13:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109668

--_000_MW4PR11MB5822BBAF493E7DFFC71B449A843B2MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there any issue with this patch?

Regards,
Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: Tuesday, February 27, 2024 17:07
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH V2 2/2] nodejs: fix CVE-2023-46809

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nodejs/nodejs/CVE-2023-46809.patch        | 625 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_16.20.2.bb |   1 +
 2 files changed, 626 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.p=
atch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
new file mode 100644
index 000000000..991d39fcf
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch
@@ -0,0 +1,625 @@
+From d3d357ab096884f10f5d2f164149727eea875635 Mon Sep 17 00:00:00 2001
+From: Michael Dawson <midawson@redhat.com>
+Date: Thu, 4 Jan 2024 21:32:51 +0000
+Subject: [PATCH] crypto: disable PKCS#1 padding for privateDecrypt
+
+Refs: https://hackerone.com/bugs?subject=3Dnodejs&report_id=3D2269177
+
+Disable RSA_PKCS1_PADDING for crypto.privateDecrypt() in order
+to protect against the Marvin attack.
+
+Includes a security revert flag that can be used to restore
+support.
+
+Signed-off-by: Michael Dawson <midawson@redhat.com>
+PR-URL: https://github.com/nodejs-private/node-private/pull/525
+Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
+Reviewed-By: Matteo Collina <matteo.collina@gmail.com>
+
+CVE-ID: CVE-2023-46809
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/d3d357ab0=
96884f1]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/crypto_cipher.cc                 |  28 ++
+ src/node_revert.h                           |   1 +
+ test/parallel/test-crypto-rsa-dsa-revert.js | 475 ++++++++++++++++++++
+ test/parallel/test-crypto-rsa-dsa.js        |  42 +-
+ 4 files changed, 533 insertions(+), 13 deletions(-)
+ create mode 100644 test/parallel/test-crypto-rsa-dsa-revert.js
+
+diff --git a/src/crypto/crypto_cipher.cc b/src/crypto/crypto_cipher.cc
+index 10579ce..0311c68 100644
+--- a/src/crypto/crypto_cipher.cc
++++ b/src/crypto/crypto_cipher.cc
+@@ -6,6 +6,7 @@
+ #include "node_buffer.h"
+ #include "node_internals.h"
+ #include "node_process-inl.h"
++#include "node_revert.h"
+ #include "v8.h"
+
+ namespace node {
+@@ -1061,6 +1062,33 @@ void PublicKeyCipher::Cipher(const FunctionCallback=
Info<Value>& args) {
+   uint32_t padding;
+   if (!args[offset + 1]->Uint32Value(env->context()).To(&padding)) return=
;
+
++  if (EVP_PKEY_cipher =3D=3D EVP_PKEY_decrypt &&
++      operation =3D=3D PublicKeyCipher::kPrivate && padding =3D=3D RSA_PK=
CS1_PADDING &&
++      !IsReverted(SECURITY_REVERT_CVE_2023_46809)) {
++    EVPKeyCtxPointer ctx(EVP_PKEY_CTX_new(pkey.get(), nullptr));
++    CHECK(ctx);
++
++    if (EVP_PKEY_decrypt_init(ctx.get()) <=3D 0) {
++      return ThrowCryptoError(env, ERR_get_error());
++    }
++
++    int rsa_pkcs1_implicit_rejection =3D
++        EVP_PKEY_CTX_ctrl_str(ctx.get(), "rsa_pkcs1_implicit_rejection", =
"1");
++    // From the doc -2 means that the option is not supported.
++    // The default for the option is enabled and if it has been
++    // specifically disabled we want to respect that so we will
++    // not throw an error if the option is supported regardless
++    // of how it is set. The call to set the value
++    // will not affect what is used since a different context is
++    // used in the call if the option is supported
++    if (rsa_pkcs1_implicit_rejection <=3D 0) {
++      return THROW_ERR_INVALID_ARG_VALUE(
++          env,
++          "RSA_PKCS1_PADDING is no longer supported for private decryptio=
n,"
++          " this can be reverted with --security-revert=3DCVE-2023-46809"=
);
++    }
++  }
++
+   const EVP_MD* digest =3D nullptr;
+   if (args[offset + 2]->IsString()) {
+     const Utf8Value oaep_str(env->isolate(), args[offset + 2]);
+diff --git a/src/node_revert.h b/src/node_revert.h
+index 83dcb62..bc2a288 100644
+--- a/src/node_revert.h
++++ b/src/node_revert.h
+@@ -18,6 +18,7 @@ namespace node {
+ #define SECURITY_REVERSIONS(XX)                                          =
  \
+   XX(CVE_2021_44531, "CVE-2021-44531", "Cert Verif Bypass via URI SAN")  =
  \
+   XX(CVE_2021_44532, "CVE-2021-44532", "Cert Verif Bypass via Str Inject"=
) \
++  XX(CVE_2023_46809, "CVE-2023-46809", "Marvin attack on PKCS#1 padding")=
 \
+ //  XX(CVE_2016_PEND, "CVE-2016-PEND", "Vulnerability Title")
+
+ enum reversion {
+diff --git a/test/parallel/test-crypto-rsa-dsa-revert.js b/test/parallel/t=
est-crypto-rsa-dsa-revert.js
+new file mode 100644
+index 0000000..84ec8f6
+--- /dev/null
++++ b/test/parallel/test-crypto-rsa-dsa-revert.js
+@@ -0,0 +1,475 @@
++'use strict';
++// Flags: --security-revert=3DCVE-2023-46809
++const common =3D require('../common');
++if (!common.hasCrypto)
++  common.skip('missing crypto');
++
++const assert =3D require('assert');
++const crypto =3D require('crypto');
++
++const constants =3D crypto.constants;
++
++const fixtures =3D require('../common/fixtures');
++
++// Test certificates
++const certPem =3D fixtures.readKey('rsa_cert.crt');
++const keyPem =3D fixtures.readKey('rsa_private.pem');
++const rsaKeySize =3D 2048;
++const rsaPubPem =3D fixtures.readKey('rsa_public.pem', 'ascii');
++const rsaKeyPem =3D fixtures.readKey('rsa_private.pem', 'ascii');
++const rsaKeyPemEncrypted =3D fixtures.readKey('rsa_private_encrypted.pem'=
,
++                                            'ascii');
++const dsaPubPem =3D fixtures.readKey('dsa_public.pem', 'ascii');
++const dsaKeyPem =3D fixtures.readKey('dsa_private.pem', 'ascii');
++const dsaKeyPemEncrypted =3D fixtures.readKey('dsa_private_encrypted.pem'=
,
++                                            'ascii');
++const rsaPkcs8KeyPem =3D fixtures.readKey('rsa_private_pkcs8.pem');
++const dsaPkcs8KeyPem =3D fixtures.readKey('dsa_private_pkcs8.pem');
++
++const ec =3D new TextEncoder();
++
++const openssl1DecryptError =3D {
++  message: 'error:06065064:digital envelope routines:EVP_DecryptFinal_ex:=
' +
++    'bad decrypt',
++  code: 'ERR_OSSL_EVP_BAD_DECRYPT',
++  reason: 'bad decrypt',
++  function: 'EVP_DecryptFinal_ex',
++  library: 'digital envelope routines',
++};
++
++const decryptError =3D common.hasOpenSSL3 ?
++  { message: 'error:1C800064:Provider routines::bad decrypt' } :
++  openssl1DecryptError;
++
++const decryptPrivateKeyError =3D common.hasOpenSSL3 ? {
++  message: 'error:1C800064:Provider routines::bad decrypt',
++} : openssl1DecryptError;
++
++function getBufferCopy(buf) {
++  return buf.buffer.slice(buf.byteOffset, buf.byteOffset + buf.byteLength=
);
++}
++
++// Test RSA encryption/decryption
++{
++  const input =3D 'I AM THE WALRUS';
++  const bufferToEncrypt =3D Buffer.from(input);
++  const bufferPassword =3D Buffer.from('password');
++
++  let encryptedBuffer =3D crypto.publicEncrypt(rsaPubPem, bufferToEncrypt=
);
++
++  // Test other input types
++  let otherEncrypted;
++  {
++    const ab =3D getBufferCopy(ec.encode(rsaPubPem));
++    const ab2enc =3D getBufferCopy(bufferToEncrypt);
++
++    crypto.publicEncrypt(ab, ab2enc);
++    crypto.publicEncrypt(new Uint8Array(ab), new Uint8Array(ab2enc));
++    crypto.publicEncrypt(new DataView(ab), new DataView(ab2enc));
++    otherEncrypted =3D crypto.publicEncrypt({
++      key: Buffer.from(ab).toString('hex'),
++      encoding: 'hex'
++    }, Buffer.from(ab2enc).toString('hex'));
++  }
++
++  let decryptedBuffer =3D crypto.privateDecrypt(rsaKeyPem, encryptedBuffe=
r);
++  const otherDecrypted =3D crypto.privateDecrypt(rsaKeyPem, otherEncrypte=
d);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++  assert.strictEqual(otherDecrypted.toString(), input);
++
++  decryptedBuffer =3D crypto.privateDecrypt(rsaPkcs8KeyPem, encryptedBuff=
er);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  let decryptedBufferWithPassword =3D crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, encryptedBuffer);
++
++  const otherDecryptedBufferWithPassword =3D crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: ec.encode('password')
++  }, encryptedBuffer);
++
++  assert.strictEqual(
++    otherDecryptedBufferWithPassword.toString(),
++    decryptedBufferWithPassword.toString());
++
++  decryptedBufferWithPassword =3D crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, encryptedBuffer);
++
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  encryptedBuffer =3D crypto.publicEncrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, bufferToEncrypt);
++
++  decryptedBufferWithPassword =3D crypto.privateDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: 'password'
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  encryptedBuffer =3D crypto.privateEncrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, bufferToEncrypt);
++
++  decryptedBufferWithPassword =3D crypto.publicDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  // Now with explicit RSA_PKCS1_PADDING.
++  encryptedBuffer =3D crypto.privateEncrypt({
++    padding: crypto.constants.RSA_PKCS1_PADDING,
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, bufferToEncrypt);
++
++  decryptedBufferWithPassword =3D crypto.publicDecrypt({
++    padding: crypto.constants.RSA_PKCS1_PADDING,
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  // Omitting padding should be okay because RSA_PKCS1_PADDING is the def=
ault.
++  decryptedBufferWithPassword =3D crypto.publicDecrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: bufferPassword
++  }, encryptedBuffer);
++  assert.strictEqual(decryptedBufferWithPassword.toString(), input);
++
++  // Now with RSA_NO_PADDING. Plaintext needs to match key size.
++  // OpenSSL 3.x has a rsa_check_padding that will cause an error if
++  // RSA_NO_PADDING is used.
++  if (!common.hasOpenSSL3) {
++    {
++      const plaintext =3D 'x'.repeat(rsaKeySize / 8);
++      encryptedBuffer =3D crypto.privateEncrypt({
++        padding: crypto.constants.RSA_NO_PADDING,
++        key: rsaKeyPemEncrypted,
++        passphrase: bufferPassword
++      }, Buffer.from(plaintext));
++
++      decryptedBufferWithPassword =3D crypto.publicDecrypt({
++        padding: crypto.constants.RSA_NO_PADDING,
++        key: rsaKeyPemEncrypted,
++        passphrase: bufferPassword
++      }, encryptedBuffer);
++      assert.strictEqual(decryptedBufferWithPassword.toString(), plaintex=
t);
++    }
++  }
++
++  encryptedBuffer =3D crypto.publicEncrypt(certPem, bufferToEncrypt);
++
++  decryptedBuffer =3D crypto.privateDecrypt(keyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  encryptedBuffer =3D crypto.publicEncrypt(keyPem, bufferToEncrypt);
++
++  decryptedBuffer =3D crypto.privateDecrypt(keyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  encryptedBuffer =3D crypto.privateEncrypt(keyPem, bufferToEncrypt);
++
++  decryptedBuffer =3D crypto.publicDecrypt(keyPem, encryptedBuffer);
++  assert.strictEqual(decryptedBuffer.toString(), input);
++
++  assert.throws(() =3D> {
++    crypto.privateDecrypt({
++      key: rsaKeyPemEncrypted,
++      passphrase: 'wrong'
++    }, bufferToEncrypt);
++  }, decryptError);
++
++  assert.throws(() =3D> {
++    crypto.publicEncrypt({
++      key: rsaKeyPemEncrypted,
++      passphrase: 'wrong'
++    }, encryptedBuffer);
++  }, decryptError);
++
++  encryptedBuffer =3D crypto.privateEncrypt({
++    key: rsaKeyPemEncrypted,
++    passphrase: Buffer.from('password')
++  }, bufferToEncrypt);
++
++  assert.throws(() =3D> {
++    crypto.publicDecrypt({
++      key: rsaKeyPemEncrypted,
++      passphrase: Buffer.from('wrong')
++    }, encryptedBuffer);
++  }, decryptError);
++}
++
++function test_rsa(padding, encryptOaepHash, decryptOaepHash) {
++  const size =3D (padding =3D=3D=3D 'RSA_NO_PADDING') ? rsaKeySize / 8 : =
32;
++  const input =3D Buffer.allocUnsafe(size);
++  for (let i =3D 0; i < input.length; i++)
++    input[i] =3D (i * 7 + 11) & 0xff;
++  const bufferToEncrypt =3D Buffer.from(input);
++
++  padding =3D constants[padding];
++
++  const encryptedBuffer =3D crypto.publicEncrypt({
++    key: rsaPubPem,
++    padding: padding,
++    oaepHash: encryptOaepHash
++  }, bufferToEncrypt);
++
++  let decryptedBuffer =3D crypto.privateDecrypt({
++    key: rsaKeyPem,
++    padding: padding,
++    oaepHash: decryptOaepHash
++  }, encryptedBuffer);
++  assert.deepStrictEqual(decryptedBuffer, input);
++
++  decryptedBuffer =3D crypto.privateDecrypt({
++    key: rsaPkcs8KeyPem,
++    padding: padding,
++    oaepHash: decryptOaepHash
++  }, encryptedBuffer);
++  assert.deepStrictEqual(decryptedBuffer, input);
++}
++
++test_rsa('RSA_NO_PADDING');
++test_rsa('RSA_PKCS1_PADDING');
++test_rsa('RSA_PKCS1_OAEP_PADDING');
++
++// Test OAEP with different hash functions.
++test_rsa('RSA_PKCS1_OAEP_PADDING', undefined, 'sha1');
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha1', undefined);
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha256', 'sha256');
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha512', 'sha512');
++assert.throws(() =3D> {
++  test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha256', 'sha512');
++}, {
++  code: 'ERR_OSSL_RSA_OAEP_DECODING_ERROR'
++});
++
++// The following RSA-OAEP test cases were created using the WebCrypto API=
 to
++// ensure compatibility when using non-SHA1 hash functions.
++{
++  const { decryptionTests } =3D
++      JSON.parse(fixtures.readSync('rsa-oaep-test-vectors.js', 'utf8'));
++
++  for (const { ct, oaepHash, oaepLabel } of decryptionTests) {
++    const label =3D oaepLabel ? Buffer.from(oaepLabel, 'hex') : undefined=
;
++    const copiedLabel =3D oaepLabel ? getBufferCopy(label) : undefined;
++
++    const decrypted =3D crypto.privateDecrypt({
++      key: rsaPkcs8KeyPem,
++      oaepHash,
++      oaepLabel: oaepLabel ? label : undefined
++    }, Buffer.from(ct, 'hex'));
++
++    assert.strictEqual(decrypted.toString('utf8'), 'Hello Node.js');
++
++    const otherDecrypted =3D crypto.privateDecrypt({
++      key: rsaPkcs8KeyPem,
++      oaepHash,
++      oaepLabel: copiedLabel
++    }, Buffer.from(ct, 'hex'));
++
++    assert.strictEqual(otherDecrypted.toString('utf8'), 'Hello Node.js');
++  }
++}
++
++// Test invalid oaepHash and oaepLabel options.
++for (const fn of [crypto.publicEncrypt, crypto.privateDecrypt]) {
++  assert.throws(() =3D> {
++    fn({
++      key: rsaPubPem,
++      oaepHash: 'Hello world'
++    }, Buffer.alloc(10));
++  }, {
++    code: 'ERR_OSSL_EVP_INVALID_DIGEST'
++  });
++
++  for (const oaepHash of [0, false, null, Symbol(), () =3D> {}]) {
++    assert.throws(() =3D> {
++      fn({
++        key: rsaPubPem,
++        oaepHash
++      }, Buffer.alloc(10));
++    }, {
++      code: 'ERR_INVALID_ARG_TYPE'
++    });
++  }
++
++  for (const oaepLabel of [0, false, null, Symbol(), () =3D> {}, {}]) {
++    assert.throws(() =3D> {
++      fn({
++        key: rsaPubPem,
++        oaepLabel
++      }, Buffer.alloc(10));
++    }, {
++      code: 'ERR_INVALID_ARG_TYPE'
++    });
++  }
++}
++
++// Test RSA key signing/verification
++let rsaSign =3D crypto.createSign('SHA1');
++let rsaVerify =3D crypto.createVerify('SHA1');
++assert.ok(rsaSign);
++assert.ok(rsaVerify);
++
++const expectedSignature =3D fixtures.readKey(
++  'rsa_public_sha1_signature_signedby_rsa_private_pkcs8.sha1',
++  'hex'
++);
++
++rsaSign.update(rsaPubPem);
++let rsaSignature =3D rsaSign.sign(rsaKeyPem, 'hex');
++assert.strictEqual(rsaSignature, expectedSignature);
++
++rsaVerify.update(rsaPubPem);
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true=
);
++
++// Test RSA PKCS#8 key signing/verification
++rsaSign =3D crypto.createSign('SHA1');
++rsaSign.update(rsaPubPem);
++rsaSignature =3D rsaSign.sign(rsaPkcs8KeyPem, 'hex');
++assert.strictEqual(rsaSignature, expectedSignature);
++
++rsaVerify =3D crypto.createVerify('SHA1');
++rsaVerify.update(rsaPubPem);
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true=
);
++
++// Test RSA key signing/verification with encrypted key
++rsaSign =3D crypto.createSign('SHA1');
++rsaSign.update(rsaPubPem);
++const signOptions =3D { key: rsaKeyPemEncrypted, passphrase: 'password' }=
;
++rsaSignature =3D rsaSign.sign(signOptions, 'hex');
++assert.strictEqual(rsaSignature, expectedSignature);
++
++rsaVerify =3D crypto.createVerify('SHA1');
++rsaVerify.update(rsaPubPem);
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true=
);
++
++rsaSign =3D crypto.createSign('SHA1');
++rsaSign.update(rsaPubPem);
++assert.throws(() =3D> {
++  const signOptions =3D { key: rsaKeyPemEncrypted, passphrase: 'wrong' };
++  rsaSign.sign(signOptions, 'hex');
++}, decryptPrivateKeyError);
++
++//
++// Test RSA signing and verification
++//
++{
++  const privateKey =3D fixtures.readKey('rsa_private_b.pem');
++  const publicKey =3D fixtures.readKey('rsa_public_b.pem');
++
++  const input =3D 'I AM THE WALRUS';
++
++  const signature =3D fixtures.readKey(
++    'I_AM_THE_WALRUS_sha256_signature_signedby_rsa_private_b.sha256',
++    'hex'
++  );
++
++  const sign =3D crypto.createSign('SHA256');
++  sign.update(input);
++
++  const output =3D sign.sign(privateKey, 'hex');
++  assert.strictEqual(output, signature);
++
++  const verify =3D crypto.createVerify('SHA256');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(publicKey, signature, 'hex'), true);
++
++  // Test the legacy signature algorithm name.
++  const sign2 =3D crypto.createSign('RSA-SHA256');
++  sign2.update(input);
++
++  const output2 =3D sign2.sign(privateKey, 'hex');
++  assert.strictEqual(output2, signature);
++
++  const verify2 =3D crypto.createVerify('SHA256');
++  verify2.update(input);
++
++  assert.strictEqual(verify2.verify(publicKey, signature, 'hex'), true);
++}
++
++
++//
++// Test DSA signing and verification
++//
++{
++  const input =3D 'I AM THE WALRUS';
++
++  // DSA signatures vary across runs so there is no static string to veri=
fy
++  // against.
++  const sign =3D crypto.createSign('SHA1');
++  sign.update(input);
++  const signature =3D sign.sign(dsaKeyPem, 'hex');
++
++  const verify =3D crypto.createVerify('SHA1');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), true);
++
++  // Test the legacy 'DSS1' name.
++  const sign2 =3D crypto.createSign('DSS1');
++  sign2.update(input);
++  const signature2 =3D sign2.sign(dsaKeyPem, 'hex');
++
++  const verify2 =3D crypto.createVerify('DSS1');
++  verify2.update(input);
++
++  assert.strictEqual(verify2.verify(dsaPubPem, signature2, 'hex'), true);
++}
++
++
++//
++// Test DSA signing and verification with PKCS#8 private key
++//
++{
++  const input =3D 'I AM THE WALRUS';
++
++  // DSA signatures vary across runs so there is no static string to veri=
fy
++  // against.
++  const sign =3D crypto.createSign('SHA1');
++  sign.update(input);
++  const signature =3D sign.sign(dsaPkcs8KeyPem, 'hex');
++
++  const verify =3D crypto.createVerify('SHA1');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), true);
++}
++
++
++//
++// Test DSA signing and verification with encrypted key
++//
++const input =3D 'I AM THE WALRUS';
++
++{
++  const sign =3D crypto.createSign('SHA1');
++  sign.update(input);
++  assert.throws(() =3D> {
++    sign.sign({ key: dsaKeyPemEncrypted, passphrase: 'wrong' }, 'hex');
++  }, decryptPrivateKeyError);
++}
++
++{
++  // DSA signatures vary across runs so there is no static string to veri=
fy
++  // against.
++  const sign =3D crypto.createSign('SHA1');
++  sign.update(input);
++  const signOptions =3D { key: dsaKeyPemEncrypted, passphrase: 'password'=
 };
++  const signature =3D sign.sign(signOptions, 'hex');
++
++  const verify =3D crypto.createVerify('SHA1');
++  verify.update(input);
++
++  assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), true);
++}
+diff --git a/test/parallel/test-crypto-rsa-dsa.js b/test/parallel/test-cry=
pto-rsa-dsa.js
+index 9afcb38..fd27827 100644
+--- a/test/parallel/test-crypto-rsa-dsa.js
++++ b/test/parallel/test-crypto-rsa-dsa.js
+@@ -220,20 +220,36 @@ function test_rsa(padding, encryptOaepHash, decryptO=
aepHash) {
+     padding: padding,
+     oaepHash: encryptOaepHash
+   }, bufferToEncrypt);
++  if (padding =3D=3D=3D constants.RSA_PKCS1_PADDING) {
++    assert.throws(() =3D> {
++      crypto.privateDecrypt({
++        key: rsaKeyPem,
++        padding: padding,
++        oaepHash: decryptOaepHash
++      }, encryptedBuffer);
++    }, { code: 'ERR_INVALID_ARG_VALUE' });
++    assert.throws(() =3D> {
++      crypto.privateDecrypt({
++        key: rsaPkcs8KeyPem,
++        padding: padding,
++        oaepHash: decryptOaepHash
++      }, encryptedBuffer);
++    }, { code: 'ERR_INVALID_ARG_VALUE' });
++  } else {
++    let decryptedBuffer =3D crypto.privateDecrypt({
++      key: rsaKeyPem,
++      padding: padding,
++      oaepHash: decryptOaepHash
++    }, encryptedBuffer);
++    assert.deepStrictEqual(decryptedBuffer, input);
+
+-  let decryptedBuffer =3D crypto.privateDecrypt({
+-    key: rsaKeyPem,
+-    padding: padding,
+-    oaepHash: decryptOaepHash
+-  }, encryptedBuffer);
+-  assert.deepStrictEqual(decryptedBuffer, input);
+-
+-  decryptedBuffer =3D crypto.privateDecrypt({
+-    key: rsaPkcs8KeyPem,
+-    padding: padding,
+-    oaepHash: decryptOaepHash
+-  }, encryptedBuffer);
+-  assert.deepStrictEqual(decryptedBuffer, input);
++    decryptedBuffer =3D crypto.privateDecrypt({
++      key: rsaPkcs8KeyPem,
++      padding: padding,
++      oaepHash: decryptOaepHash
++    }, encryptedBuffer);
++    assert.deepStrictEqual(decryptedBuffer, input);
++  }
+ }
+
+ test_rsa('RSA_NO_PADDING');
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb
index b4261eaf8..c03461df4 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "http://nodejs.org/dist/v${PV}/node-v${PV}.ta=
r.xz \
            file://CVE-2022-25883.patch \
            file://CVE-2024-22019.patch \
            file://CVE-2024-22025.patch \
+           file://CVE-2023-46809.patch \
            "
 SRC_URI:append:class-target =3D " \
            file://0001-Using-native-binaries.patch \
--
2.40.0


--_000_MW4PR11MB5822BBAF493E7DFFC71B449A843B2MW4PR11MB5822namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Is there any issue with this patch?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, February 27, 2024 17:07<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH V2 2/2] nodejs: fix CVE-2023=
-46809</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Archana Polampalli &lt;archana.polampalli@wi=
ndriver.com&gt;<br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../nodejs/nodejs/CVE-2023-46809.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 625 ++++++++++++++++++<br>
&nbsp;.../recipes-devtools/nodejs/nodejs_16.20.2.bb |&nbsp;&nbsp; 1 +<br>
&nbsp;2 files changed, 626 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46=
809.patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch b/=
meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch<br>
new file mode 100644<br>
index 000000000..991d39fcf<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/CVE-2023-46809.patch<br>
@@ -0,0 +1,625 @@<br>
+From d3d357ab096884f10f5d2f164149727eea875635 Mon Sep 17 00:00:00 2001<br>
+From: Michael Dawson &lt;midawson@redhat.com&gt;<br>
+Date: Thu, 4 Jan 2024 21:32:51 +0000<br>
+Subject: [PATCH] crypto: disable PKCS#1 padding for privateDecrypt<br>
+<br>
+Refs: <a href=3D"https://hackerone.com/bugs?subject=3Dnodejs&amp;report_id=
=3D2269177">https://hackerone.com/bugs?subject=3Dnodejs&amp;report_id=3D226=
9177</a><br>
+<br>
+Disable RSA_PKCS1_PADDING for crypto.privateDecrypt() in order<br>
+to protect against the Marvin attack.<br>
+<br>
+Includes a security revert flag that can be used to restore<br>
+support.<br>
+<br>
+Signed-off-by: Michael Dawson &lt;midawson@redhat.com&gt;<br>
+PR-URL: <a href=3D"https://github.com/nodejs-private/node-private/pull/525=
">https://github.com/nodejs-private/node-private/pull/525</a><br>
+Reviewed-By: Rafael Gonzaga &lt;rafael.nunu@hotmail.com&gt;<br>
+Reviewed-By: Matteo Collina &lt;matteo.collina@gmail.com&gt;<br>
+<br>
+CVE-ID: CVE-2023-46809<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/nodejs/node/commi=
t/d3d357ab096884f1">https://github.com/nodejs/node/commit/d3d357ab096884f1<=
/a>]<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ src/crypto/crypto_cipher.cc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 28 ++<br>
+ src/node_revert.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 1 +<br>
+ test/parallel/test-crypto-rsa-dsa-revert.js | 475 ++++++++++++++++++++<br=
>
+ test/parallel/test-crypto-rsa-dsa.js&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 42 +-<br>
+ 4 files changed, 533 insertions(+), 13 deletions(-)<br>
+ create mode 100644 test/parallel/test-crypto-rsa-dsa-revert.js<br>
+<br>
+diff --git a/src/crypto/crypto_cipher.cc b/src/crypto/crypto_cipher.cc<br>
+index 10579ce..0311c68 100644<br>
+--- a/src/crypto/crypto_cipher.cc<br>
++++ b/src/crypto/crypto_cipher.cc<br>
+@@ -6,6 +6,7 @@<br>
+ #include &quot;node_buffer.h&quot;<br>
+ #include &quot;node_internals.h&quot;<br>
+ #include &quot;node_process-inl.h&quot;<br>
++#include &quot;node_revert.h&quot;<br>
+ #include &quot;v8.h&quot;<br>
+<br>
+ namespace node {<br>
+@@ -1061,6 +1062,33 @@ void PublicKeyCipher::Cipher(const FunctionCallback=
Info&lt;Value&gt;&amp; args) {<br>
+&nbsp;&nbsp; uint32_t padding;<br>
+&nbsp;&nbsp; if (!args[offset + 1]-&gt;Uint32Value(env-&gt;context()).To(&=
amp;padding)) return;<br>
+<br>
++&nbsp; if (EVP_PKEY_cipher =3D=3D EVP_PKEY_decrypt &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; operation =3D=3D PublicKeyCipher::kPrivate=
 &amp;&amp; padding =3D=3D RSA_PKCS1_PADDING &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !IsReverted(SECURITY_REVERT_CVE_2023_46809=
)) {<br>
++&nbsp;&nbsp;&nbsp; EVPKeyCtxPointer ctx(EVP_PKEY_CTX_new(pkey.get(), null=
ptr));<br>
++&nbsp;&nbsp;&nbsp; CHECK(ctx);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (EVP_PKEY_decrypt_init(ctx.get()) &lt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ThrowCryptoError(env, ERR_get_error=
());<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp; int rsa_pkcs1_implicit_rejection =3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EVP_PKEY_CTX_ctrl_str(ctx.get(=
), &quot;rsa_pkcs1_implicit_rejection&quot;, &quot;1&quot;);<br>
++&nbsp;&nbsp;&nbsp; // From the doc -2 means that the option is not suppor=
ted.<br>
++&nbsp;&nbsp;&nbsp; // The default for the option is enabled and if it has=
 been<br>
++&nbsp;&nbsp;&nbsp; // specifically disabled we want to respect that so we=
 will<br>
++&nbsp;&nbsp;&nbsp; // not throw an error if the option is supported regar=
dless<br>
++&nbsp;&nbsp;&nbsp; // of how it is set. The call to set the value<br>
++&nbsp;&nbsp;&nbsp; // will not affect what is used since a different cont=
ext is<br>
++&nbsp;&nbsp;&nbsp; // used in the call if the option is supported<br>
++&nbsp;&nbsp;&nbsp; if (rsa_pkcs1_implicit_rejection &lt;=3D 0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return THROW_ERR_INVALID_ARG_VALUE(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; env,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;RSA_PKCS1_PA=
DDING is no longer supported for private decryption,&quot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot; this can be=
 reverted with --security-revert=3DCVE-2023-46809&quot;);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; }<br>
++<br>
+&nbsp;&nbsp; const EVP_MD* digest =3D nullptr;<br>
+&nbsp;&nbsp; if (args[offset + 2]-&gt;IsString()) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const Utf8Value oaep_str(env-&gt;isolate(), args[=
offset + 2]);<br>
+diff --git a/src/node_revert.h b/src/node_revert.h<br>
+index 83dcb62..bc2a288 100644<br>
+--- a/src/node_revert.h<br>
++++ b/src/node_revert.h<br>
+@@ -18,6 +18,7 @@ namespace node {<br>
+ #define SECURITY_REVERSIONS(XX)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+&nbsp;&nbsp; XX(CVE_2021_44531, &quot;CVE-2021-44531&quot;, &quot;Cert Ver=
if Bypass via URI SAN&quot;)&nbsp;&nbsp;&nbsp; \<br>
+&nbsp;&nbsp; XX(CVE_2021_44532, &quot;CVE-2021-44532&quot;, &quot;Cert Ver=
if Bypass via Str Inject&quot;) \<br>
++&nbsp; XX(CVE_2023_46809, &quot;CVE-2023-46809&quot;, &quot;Marvin attack=
 on PKCS#1 padding&quot;) \<br>
+ //&nbsp; XX(CVE_2016_PEND, &quot;CVE-2016-PEND&quot;, &quot;Vulnerability=
 Title&quot;)<br>
+<br>
+ enum reversion {<br>
+diff --git a/test/parallel/test-crypto-rsa-dsa-revert.js b/test/parallel/t=
est-crypto-rsa-dsa-revert.js<br>
+new file mode 100644<br>
+index 0000000..84ec8f6<br>
+--- /dev/null<br>
++++ b/test/parallel/test-crypto-rsa-dsa-revert.js<br>
+@@ -0,0 +1,475 @@<br>
++'use strict';<br>
++// Flags: --security-revert=3DCVE-2023-46809<br>
++const common =3D require('../common');<br>
++if (!common.hasCrypto)<br>
++&nbsp; common.skip('missing crypto');<br>
++<br>
++const assert =3D require('assert');<br>
++const crypto =3D require('crypto');<br>
++<br>
++const constants =3D crypto.constants;<br>
++<br>
++const fixtures =3D require('../common/fixtures');<br>
++<br>
++// Test certificates<br>
++const certPem =3D fixtures.readKey('rsa_cert.crt');<br>
++const keyPem =3D fixtures.readKey('rsa_private.pem');<br>
++const rsaKeySize =3D 2048;<br>
++const rsaPubPem =3D fixtures.readKey('rsa_public.pem', 'ascii');<br>
++const rsaKeyPem =3D fixtures.readKey('rsa_private.pem', 'ascii');<br>
++const rsaKeyPemEncrypted =3D fixtures.readKey('rsa_private_encrypted.pem'=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'ascii');<br>
++const dsaPubPem =3D fixtures.readKey('dsa_public.pem', 'ascii');<br>
++const dsaKeyPem =3D fixtures.readKey('dsa_private.pem', 'ascii');<br>
++const dsaKeyPemEncrypted =3D fixtures.readKey('dsa_private_encrypted.pem'=
,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 'ascii');<br>
++const rsaPkcs8KeyPem =3D fixtures.readKey('rsa_private_pkcs8.pem');<br>
++const dsaPkcs8KeyPem =3D fixtures.readKey('dsa_private_pkcs8.pem');<br>
++<br>
++const ec =3D new TextEncoder();<br>
++<br>
++const openssl1DecryptError =3D {<br>
++&nbsp; message: 'error:06065064:digital envelope routines:EVP_DecryptFina=
l_ex:' +<br>
++&nbsp;&nbsp;&nbsp; 'bad decrypt',<br>
++&nbsp; code: 'ERR_OSSL_EVP_BAD_DECRYPT',<br>
++&nbsp; reason: 'bad decrypt',<br>
++&nbsp; function: 'EVP_DecryptFinal_ex',<br>
++&nbsp; library: 'digital envelope routines',<br>
++};<br>
++<br>
++const decryptError =3D common.hasOpenSSL3 ?<br>
++&nbsp; { message: 'error:1C800064:Provider routines::bad decrypt' } :<br>
++&nbsp; openssl1DecryptError;<br>
++<br>
++const decryptPrivateKeyError =3D common.hasOpenSSL3 ? {<br>
++&nbsp; message: 'error:1C800064:Provider routines::bad decrypt',<br>
++} : openssl1DecryptError;<br>
++<br>
++function getBufferCopy(buf) {<br>
++&nbsp; return buf.buffer.slice(buf.byteOffset, buf.byteOffset + buf.byteL=
ength);<br>
++}<br>
++<br>
++// Test RSA encryption/decryption<br>
++{<br>
++&nbsp; const input =3D 'I AM THE WALRUS';<br>
++&nbsp; const bufferToEncrypt =3D Buffer.from(input);<br>
++&nbsp; const bufferPassword =3D Buffer.from('password');<br>
++<br>
++&nbsp; let encryptedBuffer =3D crypto.publicEncrypt(rsaPubPem, bufferToEn=
crypt);<br>
++<br>
++&nbsp; // Test other input types<br>
++&nbsp; let otherEncrypted;<br>
++&nbsp; {<br>
++&nbsp;&nbsp;&nbsp; const ab =3D getBufferCopy(ec.encode(rsaPubPem));<br>
++&nbsp;&nbsp;&nbsp; const ab2enc =3D getBufferCopy(bufferToEncrypt);<br>
++<br>
++&nbsp;&nbsp;&nbsp; crypto.publicEncrypt(ab, ab2enc);<br>
++&nbsp;&nbsp;&nbsp; crypto.publicEncrypt(new Uint8Array(ab), new Uint8Arra=
y(ab2enc));<br>
++&nbsp;&nbsp;&nbsp; crypto.publicEncrypt(new DataView(ab), new DataView(ab=
2enc));<br>
++&nbsp;&nbsp;&nbsp; otherEncrypted =3D crypto.publicEncrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: Buffer.from(ab).toString('hex'),<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encoding: 'hex'<br>
++&nbsp;&nbsp;&nbsp; }, Buffer.from(ab2enc).toString('hex'));<br>
++&nbsp; }<br>
++<br>
++&nbsp; let decryptedBuffer =3D crypto.privateDecrypt(rsaKeyPem, encrypted=
Buffer);<br>
++&nbsp; const otherDecrypted =3D crypto.privateDecrypt(rsaKeyPem, otherEnc=
rypted);<br>
++&nbsp; assert.strictEqual(decryptedBuffer.toString(), input);<br>
++&nbsp; assert.strictEqual(otherDecrypted.toString(), input);<br>
++<br>
++&nbsp; decryptedBuffer =3D crypto.privateDecrypt(rsaPkcs8KeyPem, encrypte=
dBuffer);<br>
++&nbsp; assert.strictEqual(decryptedBuffer.toString(), input);<br>
++<br>
++&nbsp; let decryptedBufferWithPassword =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: 'password'<br>
++&nbsp; }, encryptedBuffer);<br>
++<br>
++&nbsp; const otherDecryptedBufferWithPassword =3D crypto.privateDecrypt({=
<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: ec.encode('password')<br>
++&nbsp; }, encryptedBuffer);<br>
++<br>
++&nbsp; assert.strictEqual(<br>
++&nbsp;&nbsp;&nbsp; otherDecryptedBufferWithPassword.toString(),<br>
++&nbsp;&nbsp;&nbsp; decryptedBufferWithPassword.toString());<br>
++<br>
++&nbsp; decryptedBufferWithPassword =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: 'password'<br>
++&nbsp; }, encryptedBuffer);<br>
++<br>
++&nbsp; assert.strictEqual(decryptedBufferWithPassword.toString(), input);=
<br>
++<br>
++&nbsp; encryptedBuffer =3D crypto.publicEncrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: 'password'<br>
++&nbsp; }, bufferToEncrypt);<br>
++<br>
++&nbsp; decryptedBufferWithPassword =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: 'password'<br>
++&nbsp; }, encryptedBuffer);<br>
++&nbsp; assert.strictEqual(decryptedBufferWithPassword.toString(), input);=
<br>
++<br>
++&nbsp; encryptedBuffer =3D crypto.privateEncrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp; }, bufferToEncrypt);<br>
++<br>
++&nbsp; decryptedBufferWithPassword =3D crypto.publicDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp; }, encryptedBuffer);<br>
++&nbsp; assert.strictEqual(decryptedBufferWithPassword.toString(), input);=
<br>
++<br>
++&nbsp; // Now with explicit RSA_PKCS1_PADDING.<br>
++&nbsp; encryptedBuffer =3D crypto.privateEncrypt({<br>
++&nbsp;&nbsp;&nbsp; padding: crypto.constants.RSA_PKCS1_PADDING,<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp; }, bufferToEncrypt);<br>
++<br>
++&nbsp; decryptedBufferWithPassword =3D crypto.publicDecrypt({<br>
++&nbsp;&nbsp;&nbsp; padding: crypto.constants.RSA_PKCS1_PADDING,<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp; }, encryptedBuffer);<br>
++&nbsp; assert.strictEqual(decryptedBufferWithPassword.toString(), input);=
<br>
++<br>
++&nbsp; // Omitting padding should be okay because RSA_PKCS1_PADDING is th=
e default.<br>
++&nbsp; decryptedBufferWithPassword =3D crypto.publicDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp; }, encryptedBuffer);<br>
++&nbsp; assert.strictEqual(decryptedBufferWithPassword.toString(), input);=
<br>
++<br>
++&nbsp; // Now with RSA_NO_PADDING. Plaintext needs to match key size.<br>
++&nbsp; // OpenSSL 3.x has a rsa_check_padding that will cause an error if=
<br>
++&nbsp; // RSA_NO_PADDING is used.<br>
++&nbsp; if (!common.hasOpenSSL3) {<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const plaintext =3D 'x'.repeat(rsaKeySize =
/ 8);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encryptedBuffer =3D crypto.privateEncrypt(=
{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; padding: crypto.constants.RSA_=
NO_PADDING,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, Buffer.from(plaintext));<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; decryptedBufferWithPassword =3D crypto.pub=
licDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; padding: crypto.constants.RSA_=
NO_PADDING,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passphrase: bufferPassword<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert.strictEqual(decryptedBufferWithPass=
word.toString(), plaintext);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; }<br>
++<br>
++&nbsp; encryptedBuffer =3D crypto.publicEncrypt(certPem, bufferToEncrypt)=
;<br>
++<br>
++&nbsp; decryptedBuffer =3D crypto.privateDecrypt(keyPem, encryptedBuffer)=
;<br>
++&nbsp; assert.strictEqual(decryptedBuffer.toString(), input);<br>
++<br>
++&nbsp; encryptedBuffer =3D crypto.publicEncrypt(keyPem, bufferToEncrypt);=
<br>
++<br>
++&nbsp; decryptedBuffer =3D crypto.privateDecrypt(keyPem, encryptedBuffer)=
;<br>
++&nbsp; assert.strictEqual(decryptedBuffer.toString(), input);<br>
++<br>
++&nbsp; encryptedBuffer =3D crypto.privateEncrypt(keyPem, bufferToEncrypt)=
;<br>
++<br>
++&nbsp; decryptedBuffer =3D crypto.publicDecrypt(keyPem, encryptedBuffer);=
<br>
++&nbsp; assert.strictEqual(decryptedBuffer.toString(), input);<br>
++<br>
++&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passphrase: 'wrong'<br>
++&nbsp;&nbsp;&nbsp; }, bufferToEncrypt);<br>
++&nbsp; }, decryptError);<br>
++<br>
++&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; crypto.publicEncrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passphrase: 'wrong'<br>
++&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp; }, decryptError);<br>
++<br>
++&nbsp; encryptedBuffer =3D crypto.privateEncrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp; passphrase: Buffer.from('password')<br>
++&nbsp; }, bufferToEncrypt);<br>
++<br>
++&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; crypto.publicDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPemEncrypted,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; passphrase: Buffer.from('wrong')<br>
++&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp; }, decryptError);<br>
++}<br>
++<br>
++function test_rsa(padding, encryptOaepHash, decryptOaepHash) {<br>
++&nbsp; const size =3D (padding =3D=3D=3D 'RSA_NO_PADDING') ? rsaKeySize /=
 8 : 32;<br>
++&nbsp; const input =3D Buffer.allocUnsafe(size);<br>
++&nbsp; for (let i =3D 0; i &lt; input.length; i++)<br>
++&nbsp;&nbsp;&nbsp; input[i] =3D (i * 7 + 11) &amp; 0xff;<br>
++&nbsp; const bufferToEncrypt =3D Buffer.from(input);<br>
++<br>
++&nbsp; padding =3D constants[padding];<br>
++<br>
++&nbsp; const encryptedBuffer =3D crypto.publicEncrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaPubPem,<br>
++&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp; oaepHash: encryptOaepHash<br>
++&nbsp; }, bufferToEncrypt);<br>
++<br>
++&nbsp; let decryptedBuffer =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaKeyPem,<br>
++&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
++&nbsp; }, encryptedBuffer);<br>
++&nbsp; assert.deepStrictEqual(decryptedBuffer, input);<br>
++<br>
++&nbsp; decryptedBuffer =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp; key: rsaPkcs8KeyPem,<br>
++&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
++&nbsp; }, encryptedBuffer);<br>
++&nbsp; assert.deepStrictEqual(decryptedBuffer, input);<br>
++}<br>
++<br>
++test_rsa('RSA_NO_PADDING');<br>
++test_rsa('RSA_PKCS1_PADDING');<br>
++test_rsa('RSA_PKCS1_OAEP_PADDING');<br>
++<br>
++// Test OAEP with different hash functions.<br>
++test_rsa('RSA_PKCS1_OAEP_PADDING', undefined, 'sha1');<br>
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha1', undefined);<br>
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha256', 'sha256');<br>
++test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha512', 'sha512');<br>
++assert.throws(() =3D&gt; {<br>
++&nbsp; test_rsa('RSA_PKCS1_OAEP_PADDING', 'sha256', 'sha512');<br>
++}, {<br>
++&nbsp; code: 'ERR_OSSL_RSA_OAEP_DECODING_ERROR'<br>
++});<br>
++<br>
++// The following RSA-OAEP test cases were created using the WebCrypto API=
 to<br>
++// ensure compatibility when using non-SHA1 hash functions.<br>
++{<br>
++&nbsp; const { decryptionTests } =3D<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JSON.parse(fixtures.readSync('rsa-oaep-tes=
t-vectors.js', 'utf8'));<br>
++<br>
++&nbsp; for (const { ct, oaepHash, oaepLabel } of decryptionTests) {<br>
++&nbsp;&nbsp;&nbsp; const label =3D oaepLabel ? Buffer.from(oaepLabel, 'he=
x') : undefined;<br>
++&nbsp;&nbsp;&nbsp; const copiedLabel =3D oaepLabel ? getBufferCopy(label)=
 : undefined;<br>
++<br>
++&nbsp;&nbsp;&nbsp; const decrypted =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPkcs8KeyPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepLabel: oaepLabel ? label : undefined<b=
r>
++&nbsp;&nbsp;&nbsp; }, Buffer.from(ct, 'hex'));<br>
++<br>
++&nbsp;&nbsp;&nbsp; assert.strictEqual(decrypted.toString('utf8'), 'Hello =
Node.js');<br>
++<br>
++&nbsp;&nbsp;&nbsp; const otherDecrypted =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPkcs8KeyPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepLabel: copiedLabel<br>
++&nbsp;&nbsp;&nbsp; }, Buffer.from(ct, 'hex'));<br>
++<br>
++&nbsp;&nbsp;&nbsp; assert.strictEqual(otherDecrypted.toString('utf8'), 'H=
ello Node.js');<br>
++&nbsp; }<br>
++}<br>
++<br>
++// Test invalid oaepHash and oaepLabel options.<br>
++for (const fn of [crypto.publicEncrypt, crypto.privateDecrypt]) {<br>
++&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; fn({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPubPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash: 'Hello world'<br>
++&nbsp;&nbsp;&nbsp; }, Buffer.alloc(10));<br>
++&nbsp; }, {<br>
++&nbsp;&nbsp;&nbsp; code: 'ERR_OSSL_EVP_INVALID_DIGEST'<br>
++&nbsp; });<br>
++<br>
++&nbsp; for (const oaepHash of [0, false, null, Symbol(), () =3D&gt; {}]) =
{<br>
++&nbsp;&nbsp;&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fn({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPubPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, Buffer.alloc(10));<br>
++&nbsp;&nbsp;&nbsp; }, {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code: 'ERR_INVALID_ARG_TYPE'<br>
++&nbsp;&nbsp;&nbsp; });<br>
++&nbsp; }<br>
++<br>
++&nbsp; for (const oaepLabel of [0, false, null, Symbol(), () =3D&gt; {}, =
{}]) {<br>
++&nbsp;&nbsp;&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fn({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPubPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepLabel<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, Buffer.alloc(10));<br>
++&nbsp;&nbsp;&nbsp; }, {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; code: 'ERR_INVALID_ARG_TYPE'<br>
++&nbsp;&nbsp;&nbsp; });<br>
++&nbsp; }<br>
++}<br>
++<br>
++// Test RSA key signing/verification<br>
++let rsaSign =3D crypto.createSign('SHA1');<br>
++let rsaVerify =3D crypto.createVerify('SHA1');<br>
++assert.ok(rsaSign);<br>
++assert.ok(rsaVerify);<br>
++<br>
++const expectedSignature =3D fixtures.readKey(<br>
++&nbsp; 'rsa_public_sha1_signature_signedby_rsa_private_pkcs8.sha1',<br>
++&nbsp; 'hex'<br>
++);<br>
++<br>
++rsaSign.update(rsaPubPem);<br>
++let rsaSignature =3D rsaSign.sign(rsaKeyPem, 'hex');<br>
++assert.strictEqual(rsaSignature, expectedSignature);<br>
++<br>
++rsaVerify.update(rsaPubPem);<br>
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true=
);<br>
++<br>
++// Test RSA PKCS#8 key signing/verification<br>
++rsaSign =3D crypto.createSign('SHA1');<br>
++rsaSign.update(rsaPubPem);<br>
++rsaSignature =3D rsaSign.sign(rsaPkcs8KeyPem, 'hex');<br>
++assert.strictEqual(rsaSignature, expectedSignature);<br>
++<br>
++rsaVerify =3D crypto.createVerify('SHA1');<br>
++rsaVerify.update(rsaPubPem);<br>
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true=
);<br>
++<br>
++// Test RSA key signing/verification with encrypted key<br>
++rsaSign =3D crypto.createSign('SHA1');<br>
++rsaSign.update(rsaPubPem);<br>
++const signOptions =3D { key: rsaKeyPemEncrypted, passphrase: 'password' }=
;<br>
++rsaSignature =3D rsaSign.sign(signOptions, 'hex');<br>
++assert.strictEqual(rsaSignature, expectedSignature);<br>
++<br>
++rsaVerify =3D crypto.createVerify('SHA1');<br>
++rsaVerify.update(rsaPubPem);<br>
++assert.strictEqual(rsaVerify.verify(rsaPubPem, rsaSignature, 'hex'), true=
);<br>
++<br>
++rsaSign =3D crypto.createSign('SHA1');<br>
++rsaSign.update(rsaPubPem);<br>
++assert.throws(() =3D&gt; {<br>
++&nbsp; const signOptions =3D { key: rsaKeyPemEncrypted, passphrase: 'wron=
g' };<br>
++&nbsp; rsaSign.sign(signOptions, 'hex');<br>
++}, decryptPrivateKeyError);<br>
++<br>
++//<br>
++// Test RSA signing and verification<br>
++//<br>
++{<br>
++&nbsp; const privateKey =3D fixtures.readKey('rsa_private_b.pem');<br>
++&nbsp; const publicKey =3D fixtures.readKey('rsa_public_b.pem');<br>
++<br>
++&nbsp; const input =3D 'I AM THE WALRUS';<br>
++<br>
++&nbsp; const signature =3D fixtures.readKey(<br>
++&nbsp;&nbsp;&nbsp; 'I_AM_THE_WALRUS_sha256_signature_signedby_rsa_private=
_b.sha256',<br>
++&nbsp;&nbsp;&nbsp; 'hex'<br>
++&nbsp; );<br>
++<br>
++&nbsp; const sign =3D crypto.createSign('SHA256');<br>
++&nbsp; sign.update(input);<br>
++<br>
++&nbsp; const output =3D sign.sign(privateKey, 'hex');<br>
++&nbsp; assert.strictEqual(output, signature);<br>
++<br>
++&nbsp; const verify =3D crypto.createVerify('SHA256');<br>
++&nbsp; verify.update(input);<br>
++<br>
++&nbsp; assert.strictEqual(verify.verify(publicKey, signature, 'hex'), tru=
e);<br>
++<br>
++&nbsp; // Test the legacy signature algorithm name.<br>
++&nbsp; const sign2 =3D crypto.createSign('RSA-SHA256');<br>
++&nbsp; sign2.update(input);<br>
++<br>
++&nbsp; const output2 =3D sign2.sign(privateKey, 'hex');<br>
++&nbsp; assert.strictEqual(output2, signature);<br>
++<br>
++&nbsp; const verify2 =3D crypto.createVerify('SHA256');<br>
++&nbsp; verify2.update(input);<br>
++<br>
++&nbsp; assert.strictEqual(verify2.verify(publicKey, signature, 'hex'), tr=
ue);<br>
++}<br>
++<br>
++<br>
++//<br>
++// Test DSA signing and verification<br>
++//<br>
++{<br>
++&nbsp; const input =3D 'I AM THE WALRUS';<br>
++<br>
++&nbsp; // DSA signatures vary across runs so there is no static string to=
 verify<br>
++&nbsp; // against.<br>
++&nbsp; const sign =3D crypto.createSign('SHA1');<br>
++&nbsp; sign.update(input);<br>
++&nbsp; const signature =3D sign.sign(dsaKeyPem, 'hex');<br>
++<br>
++&nbsp; const verify =3D crypto.createVerify('SHA1');<br>
++&nbsp; verify.update(input);<br>
++<br>
++&nbsp; assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), tru=
e);<br>
++<br>
++&nbsp; // Test the legacy 'DSS1' name.<br>
++&nbsp; const sign2 =3D crypto.createSign('DSS1');<br>
++&nbsp; sign2.update(input);<br>
++&nbsp; const signature2 =3D sign2.sign(dsaKeyPem, 'hex');<br>
++<br>
++&nbsp; const verify2 =3D crypto.createVerify('DSS1');<br>
++&nbsp; verify2.update(input);<br>
++<br>
++&nbsp; assert.strictEqual(verify2.verify(dsaPubPem, signature2, 'hex'), t=
rue);<br>
++}<br>
++<br>
++<br>
++//<br>
++// Test DSA signing and verification with PKCS#8 private key<br>
++//<br>
++{<br>
++&nbsp; const input =3D 'I AM THE WALRUS';<br>
++<br>
++&nbsp; // DSA signatures vary across runs so there is no static string to=
 verify<br>
++&nbsp; // against.<br>
++&nbsp; const sign =3D crypto.createSign('SHA1');<br>
++&nbsp; sign.update(input);<br>
++&nbsp; const signature =3D sign.sign(dsaPkcs8KeyPem, 'hex');<br>
++<br>
++&nbsp; const verify =3D crypto.createVerify('SHA1');<br>
++&nbsp; verify.update(input);<br>
++<br>
++&nbsp; assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), tru=
e);<br>
++}<br>
++<br>
++<br>
++//<br>
++// Test DSA signing and verification with encrypted key<br>
++//<br>
++const input =3D 'I AM THE WALRUS';<br>
++<br>
++{<br>
++&nbsp; const sign =3D crypto.createSign('SHA1');<br>
++&nbsp; sign.update(input);<br>
++&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp; sign.sign({ key: dsaKeyPemEncrypted, passphrase: 'wron=
g' }, 'hex');<br>
++&nbsp; }, decryptPrivateKeyError);<br>
++}<br>
++<br>
++{<br>
++&nbsp; // DSA signatures vary across runs so there is no static string to=
 verify<br>
++&nbsp; // against.<br>
++&nbsp; const sign =3D crypto.createSign('SHA1');<br>
++&nbsp; sign.update(input);<br>
++&nbsp; const signOptions =3D { key: dsaKeyPemEncrypted, passphrase: 'pass=
word' };<br>
++&nbsp; const signature =3D sign.sign(signOptions, 'hex');<br>
++<br>
++&nbsp; const verify =3D crypto.createVerify('SHA1');<br>
++&nbsp; verify.update(input);<br>
++<br>
++&nbsp; assert.strictEqual(verify.verify(dsaPubPem, signature, 'hex'), tru=
e);<br>
++}<br>
+diff --git a/test/parallel/test-crypto-rsa-dsa.js b/test/parallel/test-cry=
pto-rsa-dsa.js<br>
+index 9afcb38..fd27827 100644<br>
+--- a/test/parallel/test-crypto-rsa-dsa.js<br>
++++ b/test/parallel/test-crypto-rsa-dsa.js<br>
+@@ -220,20 +220,36 @@ function test_rsa(padding, encryptOaepHash, decryptO=
aepHash) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; padding: padding,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; oaepHash: encryptOaepHash<br>
+&nbsp;&nbsp; }, bufferToEncrypt);<br>
++&nbsp; if (padding =3D=3D=3D constants.RSA_PKCS1_PADDING) {<br>
++&nbsp;&nbsp;&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp;&nbsp;&nbsp; }, { code: 'ERR_INVALID_ARG_VALUE' });<br>
++&nbsp;&nbsp;&nbsp; assert.throws(() =3D&gt; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPkcs8KeyPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp;&nbsp;&nbsp; }, { code: 'ERR_INVALID_ARG_VALUE' });<br>
++&nbsp; } else {<br>
++&nbsp;&nbsp;&nbsp; let decryptedBuffer =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaKeyPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
++&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp;&nbsp;&nbsp; assert.deepStrictEqual(decryptedBuffer, input);<br>
+<br>
+-&nbsp; let decryptedBuffer =3D crypto.privateDecrypt({<br>
+-&nbsp;&nbsp;&nbsp; key: rsaKeyPem,<br>
+-&nbsp;&nbsp;&nbsp; padding: padding,<br>
+-&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
+-&nbsp; }, encryptedBuffer);<br>
+-&nbsp; assert.deepStrictEqual(decryptedBuffer, input);<br>
+-<br>
+-&nbsp; decryptedBuffer =3D crypto.privateDecrypt({<br>
+-&nbsp;&nbsp;&nbsp; key: rsaPkcs8KeyPem,<br>
+-&nbsp;&nbsp;&nbsp; padding: padding,<br>
+-&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
+-&nbsp; }, encryptedBuffer);<br>
+-&nbsp; assert.deepStrictEqual(decryptedBuffer, input);<br>
++&nbsp;&nbsp;&nbsp; decryptedBuffer =3D crypto.privateDecrypt({<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key: rsaPkcs8KeyPem,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; padding: padding,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oaepHash: decryptOaepHash<br>
++&nbsp;&nbsp;&nbsp; }, encryptedBuffer);<br>
++&nbsp;&nbsp;&nbsp; assert.deepStrictEqual(decryptedBuffer, input);<br>
++&nbsp; }<br>
+ }<br>
+<br>
+ test_rsa('RSA_NO_PADDING');<br>
+--<br>
+2.40.0<br>
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb b/meta-oe/re=
cipes-devtools/nodejs/nodejs_16.20.2.bb<br>
index b4261eaf8..c03461df4 100644<br>
--- a/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb<br>
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_16.20.2.bb<br>
@@ -29,6 +29,7 @@ SRC_URI =3D &quot;<a href=3D""></a>http://nodejs.org/dist=
/v${PV}/node-v${PV}.tar.xz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-25883.patch">file://CVE-2022-25883.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2024-22019.patch">file://CVE-2024-22019.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2024-22025.patch">file://CVE-2024-22025.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-46809.patch">file://CVE-2023-46809.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI:append:class-target =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Using-native-binaries.patch">file://0001-Using-native-binar=
ies.patch</a> \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822BBAF493E7DFFC71B449A843B2MW4PR11MB5822namp_--

