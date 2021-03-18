Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.40])
 by mx.groups.io with SMTP id smtpd.web08.5150.1616044483342594826
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 22:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=shFow6s5;
 spf=pass (domain: kpit.com, ip: 40.107.139.40, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVpwyrNz4PT1KtjIksJdKNaXv3FSOWotdkdhuL5HmW1+RZ/sdtQGXWgx1vszTzPQROF7XMnz15KsROASSpiG8CdXkNtXNrzq0iCiclaCebvNXOI2uRE7VEJGO+0vD/SODa+oYkLnhxupjk/QAmvBofzcHvkh/9yAZXLRdDPDSCwev9q/gGhyc7PEvCdl3yor7L9J9/6o973cFkV266TuiPey7cDTJa2fJI3A5lSqWeR+azR6ZddnQR4tRBHrMwtT0B5v8CSUqCTbYXrbZoFKKpcwHZQJUKc6jm1wZtxVr0TYdtrcZ+44/Ve3oW0yoiwjfN7WH1Rt5vFozbaWv46wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABHG4ptJEeRBnGOy130tCMWS/D+k3hKb+4HVvn6GL4k=;
 b=Z32442TszmhM1/W9EXXnfTFYtv+W8lQg2GD1zcq4w8VSShmfk61THAKff3uyKmegY3kVfvzjKAiBvOPINFkCiTrJZrMZpJxVWIVv01A2Wwb1J7CPDoqowBNvdjORXQ8jIjJZ9I8b2u+pMbBRHzgjftrZGwQTutto5ySQSiMdJZ0Vs4FGyGyI50ljP278OOW2l5Vqs5IQDqmpPCIpcsay54+/CO+T9ONTuxvPzs8A9joeqG8KKDhFCPh0hVjxCCjOElgQmtEqEvzH5ElKfke5tarfT6B/U51xWN4GBd6ZgTfuqHVLDOUgYW/SdcEgrEps4Vx3ACjGyiRh+dszl0ueyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABHG4ptJEeRBnGOy130tCMWS/D+k3hKb+4HVvn6GL4k=;
 b=shFow6s5935cQA00xAhJiaeBllSg8drNP7IFXZBwoIfQIpxZQL1mjdh1YuMUx9ycBpUoTGXkhdvZaDMukT9mD6IIM335yKi/dpflIRo/T0UxjPNzH44snSG/XFX36n8KFtKqEj5SPryiCYYsE5TcJkhik3HLH88cyn5zR35/2+c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR01MB2899.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 05:14:27 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 05:14:26 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Harpritkaur.Bhandari@kpit.com
Subject: [meta-networking][meta-oe][dunfell][PATCH] dnsmasq: Add fixes for CVEs reported for dnsmasq
Date: Thu, 18 Mar 2021 10:44:06 +0530
Message-Id: <20210318051406.3607-1-Sana.Kazi@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [106.220.85.168]
X-ClientProxiedBy: MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::16) To BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::17)
Return-Path: Sana.Kazi@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (106.220.85.168) by MAXPR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 05:14:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fdfba685-90b0-483d-6dc8-08d8e9ccb25e
X-MS-TrafficTypeDiagnostic: BM1PR01MB2899:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB2899D4F51B8761EA68ECA1FB99699@BM1PR01MB2899.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/WOXfVsw6Tlig18z2UAUGwtC15cu70EYR8boC0SxOzPFmVZAd0cdbHmYet0RL4aLOOOvgtp5n5IlTdkfkDmHQStcc9drg9yw71RPlWtRLTNE1dba2BP2/ysrttVuh6AfPDGNdMh2bE0W822uBAXrXZlkpWl0KZUKn+y00nviuQcKl8+mHbi6bv2HMSOKPNVZaeOaGE8RrPeDTXxwez+ijmhaZ1nhC+z8vLGt62uGTnwUZTJJ3nEVQ82yAGLRPBSsKMGLAfts5ZGiInvxohyxHQliNbRmPnU4d+e73xMwgsdBg08P9qDP0iew0zzEQrk7TJLt7xnGqQTuidIyBNShLOBX1dbuouizD760yN4r74KZ9FJVvO+Ps1273cSD2F7eo5V1680e1JdHabVOez9D6aNzHmtngTsnqD7ErKiXkD4Fd+KpEb5HLgqSZJ6q4s0U5/TwFbW1WrfciF/WPDUDIKyGAiEqL4Y2Eh+nTTcmnZyFDQY65Ddz97etZeSRUXtBh6wt8p9NQw8mAC3YnQlF7KWEWtOhNYMhhEFR2h2xA0ZOJ0DLFPvi8SlSMtGtrw8OlGkZIgNvbllsgSqeAeJ8GPf/W3SzQ12Wx25uSH35EKamd+VGkgGaK2/vdxvZE+N8z3HLjBKrnk5I0n0l9+nzOeHXaoVzimKTikPIVaZZQreWAkG8mDryZOCbg9cK6v9/UIXguAE5hAn6MLbA8vS1NyoZ3vmDbuk37bQn3jdfq6G9n4FVtao2a21u2Q6w3zBT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(86362001)(52116002)(107886003)(2616005)(956004)(36756003)(6666004)(1076003)(66574015)(66476007)(316002)(69590400012)(8936002)(8676002)(5660300002)(16526019)(4326008)(6506007)(83380400001)(6486002)(186003)(478600001)(966005)(26005)(66556008)(66946007)(30864003)(2906002)(1006002)(38100700001)(6512007)(2004002)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?dzocZ28Ub9FvoGUUqfbfgE+0yecuBrzrUr0CoTXTIz94LQthutaKX005SBZb?=
 =?us-ascii?Q?9WNcJXdjbURTgsKs/bQTujRHpb0/CRR+182lqpmHWM+uNTeXux28QTzxmsWi?=
 =?us-ascii?Q?oonrf9aiAGj+QW1n43LY0wCSVjJFnax0+GdVabKLvji42NTZRWmXtYaREVXG?=
 =?us-ascii?Q?XCxy6Mtp7kI9NjOB12F1XU0EcZklYrZxSzXC+brjgYJhN7LNeP82bW3UwW0T?=
 =?us-ascii?Q?FQAPxVNWpAPi8RzKi0D+/ZTiG1nk18HOg4ZSt38iEkCJY3ZknWLksPoMV4go?=
 =?us-ascii?Q?xc2zKK5Dsk28ldZJuZOUswYSvq7qAARiq9GptuB0hVPYWARcKR6osdU20Zgp?=
 =?us-ascii?Q?cnmd3fb19cwToO+ub3VgEvZNyC2BL8fQ11s3cGawZiCwHX65cHl9lhCE+9WQ?=
 =?us-ascii?Q?o66S3JypP1sBIyHIVNIo/T4LJF5OgqQp9TT70cUmIPz8PcfC+leiehBsSBUH?=
 =?us-ascii?Q?tyZ7Re0JO/GGGuUiSjJOD9TzKqq7T9PDRO4sMoG3Vg6OviQoJnid9telJ2uz?=
 =?us-ascii?Q?oBPU2KbWzdVngtz2D5QDNl+mI78OsGnxoRx/JZstflMCNzQgd3QViqpkLrIA?=
 =?us-ascii?Q?+4BP5MAtejjOLuIPnysuT3Ljze06j2rQXP/GdTmQdT95vBAjf1fVCuZsFtvs?=
 =?us-ascii?Q?8wlYC6bKDdncdUGSTSKpoLsBZr0JvgTZFAqYzs7NR4GzIkxS1iHsryPqu1ou?=
 =?us-ascii?Q?UiuLIHlCcVoOaLB5eQQq/F3dMsZIsx0U2abWWf7aGFj2zvdcW0JSl/cCbu8o?=
 =?us-ascii?Q?CRsYw6V/MpUI2/2CCDBPL7nTfG83OR7wGQJ5cQYlXQyILfU7ElXA0Vi/oMGu?=
 =?us-ascii?Q?VMrFsfQAKXAJD3DX3CWaptRFpvXiuqpOOfB+mdJfJfXuljRiIKh8Ri38n2fu?=
 =?us-ascii?Q?K35Q4FIoOiBdJnBqnVCA2yKsJdGgfQcfPoqgY2BKwaMvlYYivOptF4btOEwX?=
 =?us-ascii?Q?M8uTHvPXXuKX3fckN7Es7JKQQZw7cTlGv3sSU1tlnr3vhYf6apDgGsVJy/2I?=
 =?us-ascii?Q?nnZB4cKyy4VgmPyRQiFQjzCs/5PJC3jKfyt1L0kyRMZU3gf4JsIVO2nMmNEZ?=
 =?us-ascii?Q?Cuf4KJRod/VKY5GZAanyWXt9MqObipDaXV03LBnniUEB86vk8dVmAR8UWwHB?=
 =?us-ascii?Q?w1610qKDTByY4zu+5pCIAlr9hydHL6QeWPX4LEndXyWI2GQxIfKCyWD5Yybv?=
 =?us-ascii?Q?JhecOjD7DPPEWrS2acpRzv9bob45XmQzK72iagM3jcBA8Ljb28U2t0Yxdue3?=
 =?us-ascii?Q?t1IrMjxx5814fgrWusrMnLLUeq1an1WleC6uqfuPjo8+VBdcYJnARgjQGYFW?=
 =?us-ascii?Q?x4aPQ+LakE1s9rV87NOjdKY6?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdfba685-90b0-483d-6dc8-08d8e9ccb25e
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 05:14:25.7652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+SFh38n5bU6TJxVbGHRA4WLyN/kGNJldqmlQmbJ8jaF+GhnsxrGoHX5sYbqTpDF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2899
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Applied single patch for below listed CVEs which avoids remote
attacker to overwrite memory:
CVE-2020-25681
CVE-2020-25682
CVE-2020-25683
CVE-2020-25687
as they are fixed by single commit
http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dcommit;h=3D4e96a4be685=
c9e4445f6ee79ad0b36b9119b502a
Link: https://www.openwall.com/lists/oss-security/2021/01/19/1

Also, applied patch for below listed CVEs:

CVE-2020-25684
CVE-2020-25685
CVE-2020-25686

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   7 +-
 .../dnsmasq/files/CVE-2020-25681.patch        | 373 +++++++++++
 .../dnsmasq/files/CVE-2020-25684.patch        | 100 +++
 .../dnsmasq/files/CVE-2020-25685-1.patch      | 590 ++++++++++++++++++
 .../dnsmasq/files/CVE-2020-25685-2.patch      | 201 ++++++
 .../dnsmasq/files/CVE-2020-25686-1.patch      | 335 ++++++++++
 .../dnsmasq/files/CVE-2020-25686-2.patch      |  66 ++
 7 files changed, 1671 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25681.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25684.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25685-1.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25685-2.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25686-1.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25686-2.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
index 92415386c..a1dc0f3a0 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
@@ -4,5 +4,10 @@ SRC_URI[dnsmasq-2.81.md5sum] =3D "e43808177a773014b5892ccb=
a238f7a8"
 SRC_URI[dnsmasq-2.81.sha256sum] =3D "3c28c68c6c2967c3a96e9b432c0c046a5df17=
a426d3a43cffe9e693cf05804d0"
 SRC_URI +=3D "\
     file://lua.patch \
+    file://CVE-2020-25681.patch \
+    file://CVE-2020-25684.patch \
+    file://CVE-2020-25685-1.patch \
+    file://CVE-2020-25685-2.patch \
+    file://CVE-2020-25686-1.patch \
+    file://CVE-2020-25686-2.patch \
 "
-
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.p=
atch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
new file mode 100644
index 000000000..cab734ed1
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
@@ -0,0 +1,373 @@
+From 4e96a4be685c9e4445f6ee79ad0b36b9119b502a Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 11 Nov 2020 23:25:04 +0000
+Subject: [PATCH] Fix remote buffer overflow CERT VU#434904
+
+The problem is in the sort_rrset() function and allows a remote
+attacker to overwrite memory. Any dnsmasq instance with DNSSEC
+enabled is vulnerable.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG    |   7 +-
+ src/dnssec.c | 273 ++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 158 insertions(+), 122 deletions(-)
+
+CVE: CVE-2020-25681
+CVE: CVE-2020-25682
+CVE: CVE-2020-25683
+CVE: CVE-2020-25687
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D4e96a4be685c9e4445f6ee79ad0b36b9119b502a]
+Comment: No change in any hunk
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index db5c2d1..e95aa34 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -223,138 +223,147 @@ static int check_date_range(unsigned long curtime,=
 u32 date_start, u32 date_end)
+     && serial_compare_32(curtime, date_end) =3D=3D SERIAL_LT;
+ }
+
+-/* Return bytes of canonicalised rdata, when the return value is zero, th=
e remaining
+-   data, pointed to by *p, should be used raw. */
+-static int get_rdata(struct dns_header *header, size_t plen, unsigned cha=
r *end, char *buff, int bufflen,
+-                   unsigned char **p, u16 **desc)
++/* Return bytes of canonicalised rrdata one by one.
++   Init state->ip with the RR, and state->end with the end of same.
++   Init state->op to NULL.
++   Init state->desc to RR descriptor.
++   Init state->buff with a MAXDNAME * 2 buffer.
++
++   After each call which returns 1, state->op points to the next byte of =
data.
++   On returning 0, the end has been reached.
++*/
++struct rdata_state {
++  u16 *desc;
++  size_t c;
++  unsigned char *end, *ip, *op;
++  char *buff;
++};
++
++static int get_rdata(struct dns_header *header, size_t plen, struct rdata=
_state *state)
+ {
+-  int d =3D **desc;
++  int d;
+
+-  /* No more data needs mangling */
+-  if (d =3D=3D (u16)-1)
++  if (state->op && state->c !=3D 1)
+     {
+-      /* If there's more data than we have space for, just return what fi=
ts,
+-       we'll get called again for more chunks */
+-      if (end - *p > bufflen)
+-      {
+-        memcpy(buff, *p, bufflen);
+-        *p +=3D bufflen;
+-        return bufflen;
+-      }
+-
+-      return 0;
++      state->op++;
++      state->c--;
++      return 1;
+     }
+-
+-  (*desc)++;
+-
+-  if (d =3D=3D 0 && extract_name(header, plen, p, buff, 1, 0))
+-    /* domain-name, canonicalise */
+-    return to_wire(buff);
+-  else
+-    {
+-      /* plain data preceding a domain-name, don't run off the end of the=
 data */
+-      if ((end - *p) < d)
+-      d =3D end - *p;
++
++  while (1)
++    {
++      d =3D *(state->desc);
+
+-      if (d !=3D 0)
++      if (d =3D=3D (u16)-1)
+       {
+-        memcpy(buff, *p, d);
+-        *p +=3D d;
++        /* all the bytes to the end. */
++        if ((state->c =3D state->end - state->ip) !=3D 0)
++          {
++            state->op =3D state->ip;
++            state->ip =3D state->end;;
++          }
++        else
++          return 0;
++      }
++      else
++      {
++        state->desc++;
++
++        if (d =3D=3D (u16)0)
++          {
++            /* domain-name, canonicalise */
++            int len;
++
++            if (!extract_name(header, plen, &state->ip, state->buff, 1, 0=
) ||
++                (len =3D to_wire(state->buff)) =3D=3D 0)
++              continue;
++
++            state->c =3D len;
++            state->op =3D (unsigned char *)state->buff;
++          }
++        else
++          {
++            /* plain data preceding a domain-name, don't run off the end =
of the data */
++            if ((state->end - state->ip) < d)
++              d =3D state->end - state->ip;
++
++            if (d =3D=3D 0)
++              continue;
++
++            state->op =3D state->ip;
++            state->c =3D d;
++            state->ip +=3D d;
++          }
+       }
+
+-      return d;
++      return 1;
+     }
+ }
+
+-/* Bubble sort the RRset into the canonical order.
+-   Note that the byte-streams from two RRs may get unsynced: consider
+-   RRs which have two domain-names at the start and then other data.
+-   The domain-names may have different lengths in each RR, but sort equal
+-
+-   ------------
+-   |abcde|fghi|
+-   ------------
+-   |abcd|efghi|
+-   ------------
+-
+-   leaving the following bytes as deciding the order. Hence the nasty lef=
t1 and left2 variables.
+-*/
++/* Bubble sort the RRset into the canonical order. */
+
+ static int sort_rrset(struct dns_header *header, size_t plen, u16 *rr_des=
c, int rrsetidx,
+                     unsigned char **rrset, char *buff1, char *buff2)
+ {
+-  int swap, quit, i, j;
++  int swap, i, j;
+
+   do
+     {
+       for (swap =3D 0, i =3D 0; i < rrsetidx-1; i++)
+       {
+-        int rdlen1, rdlen2, left1, left2, len1, len2, len, rc;
+-        u16 *dp1, *dp2;
+-        unsigned char *end1, *end2;
++        int rdlen1, rdlen2;
++        struct rdata_state state1, state2;
++
+         /* Note that these have been determined to be OK previously,
+            so we don't need to check for NULL return here. */
+-        unsigned char *p1 =3D skip_name(rrset[i], header, plen, 10);
+-        unsigned char *p2 =3D skip_name(rrset[i+1], header, plen, 10);
+-
+-        p1 +=3D 8; /* skip class, type, ttl */
+-        GETSHORT(rdlen1, p1);
+-        end1 =3D p1 + rdlen1;
+-
+-        p2 +=3D 8; /* skip class, type, ttl */
+-        GETSHORT(rdlen2, p2);
+-        end2 =3D p2 + rdlen2;
++        state1.ip =3D skip_name(rrset[i], header, plen, 10);
++        state2.ip =3D skip_name(rrset[i+1], header, plen, 10);
++        state1.op =3D state2.op =3D NULL;
++        state1.buff =3D buff1;
++        state2.buff =3D buff2;
++        state1.desc =3D state2.desc =3D rr_desc;
+
+-        dp1 =3D dp2 =3D rr_desc;
++        state1.ip +=3D 8; /* skip class, type, ttl */
++        GETSHORT(rdlen1, state1.ip);
++        if (!CHECK_LEN(header, state1.ip, plen, rdlen1))
++          return rrsetidx; /* short packet */
++        state1.end =3D state1.ip + rdlen1;
+
+-        for (quit =3D 0, left1 =3D 0, left2 =3D 0, len1 =3D 0, len2 =3D 0=
; !quit;)
++        state2.ip +=3D 8; /* skip class, type, ttl */
++        GETSHORT(rdlen2, state2.ip);
++        if (!CHECK_LEN(header, state2.ip, plen, rdlen2))
++          return rrsetidx; /* short packet */
++        state2.end =3D state2.ip + rdlen2;
++
++        while (1)
+           {
+-            if (left1 !=3D 0)
+-              memmove(buff1, buff1 + len1 - left1, left1);
++            int ok1, ok2;
+
+-            if ((len1 =3D get_rdata(header, plen, end1, buff1 + left1, (M=
AXDNAME * 2) - left1, &p1, &dp1)) =3D=3D 0)
+-              {
+-                quit =3D 1;
+-                len1 =3D end1 - p1;
+-                memcpy(buff1 + left1, p1, len1);
+-              }
+-            len1 +=3D left1;
+-
+-            if (left2 !=3D 0)
+-              memmove(buff2, buff2 + len2 - left2, left2);
+-
+-            if ((len2 =3D get_rdata(header, plen, end2, buff2 + left2, (M=
AXDNAME *2) - left2, &p2, &dp2)) =3D=3D 0)
+-              {
+-                quit =3D 1;
+-                len2 =3D end2 - p2;
+-                memcpy(buff2 + left2, p2, len2);
+-              }
+-            len2 +=3D left2;
+-
+-            if (len1 > len2)
+-              left1 =3D len1 - len2, left2 =3D 0, len =3D len2;
+-            else
+-              left2 =3D len2 - len1, left1 =3D 0, len =3D len1;
+-
+-            rc =3D (len =3D=3D 0) ? 0 : memcmp(buff1, buff2, len);
+-
+-            if (rc > 0 || (rc =3D=3D 0 && quit && len1 > len2))
+-              {
+-                unsigned char *tmp =3D rrset[i+1];
+-                rrset[i+1] =3D rrset[i];
+-                rrset[i] =3D tmp;
+-                swap =3D quit =3D 1;
+-              }
+-            else if (rc =3D=3D 0 && quit && len1 =3D=3D len2)
++            ok1 =3D get_rdata(header, plen, &state1);
++            ok2 =3D get_rdata(header, plen, &state2);
++
++            if (!ok1 && !ok2)
+               {
+                 /* Two RRs are equal, remove one copy. RFC 4034, para 6.3=
 */
+                 for (j =3D i+1; j < rrsetidx-1; j++)
+                   rrset[j] =3D rrset[j+1];
+                 rrsetidx--;
+                 i--;
++                break;
++              }
++            else if (ok1 && (!ok2 || *state1.op > *state2.op))
++              {
++                unsigned char *tmp =3D rrset[i+1];
++                rrset[i+1] =3D rrset[i];
++                rrset[i] =3D tmp;
++                swap =3D 1;
++                break;
+               }
+-            else if (rc < 0)
+-              quit =3D 1;
++            else if (ok2 && (!ok1 || *state2.op > *state1.op))
++              break;
++
++            /* arrive here when bytes are equal, go round the loop again
++               and compare the next ones. */
+           }
+       }
+     } while (swap);
+@@ -569,15 +578,18 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in
+       wire_len =3D to_wire(keyname);
+       hash->update(ctx, (unsigned int)wire_len, (unsigned char*)keyname);
+       from_wire(keyname);
++
++#define RRBUFLEN 300 /* Most RRs are smaller than this. */
+
+       for (i =3D 0; i < rrsetidx; ++i)
+       {
+-        int seg;
+-        unsigned char *end, *cp;
+-        u16 len, *dp;
++        int j;
++        struct rdata_state state;
++        u16 len;
++        unsigned char rrbuf[RRBUFLEN];
+
+         p =3D rrset[i];
+-
++
+         if (!extract_name(header, plen, &p, name, 1, 10))
+           return STAT_BOGUS;
+
+@@ -586,12 +598,11 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in
+         /* if more labels than in RRsig name, hash *.<no labels in rrsig =
labels field>  4035 5.3.2 */
+         if (labels < name_labels)
+           {
+-            int k;
+-            for (k =3D name_labels - labels; k !=3D 0; k--)
++            for (j =3D name_labels - labels; j !=3D 0; j--)
+               {
+                 while (*name_start !=3D '.' && *name_start !=3D 0)
+                   name_start++;
+-                if (k !=3D 1 && *name_start =3D=3D '.')
++                if (j !=3D 1 && *name_start =3D=3D '.')
+                   name_start++;
+               }
+
+@@ -612,24 +623,44 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in
+         if (!CHECK_LEN(header, p, plen, rdlen))
+           return STAT_BOGUS;
+
+-        end =3D p + rdlen;
++        /* canonicalise rdata and calculate length of same, use
++           name buffer as workspace for get_rdata. */
++        state.ip =3D p;
++        state.op =3D NULL;
++        state.desc =3D rr_desc;
++        state.buff =3D name;
++        state.end =3D p + rdlen;
+
+-        /* canonicalise rdata and calculate length of same, use name buff=
er as workspace.
+-           Note that name buffer is twice MAXDNAME long in DNSSEC mode. *=
/
+-        cp =3D p;
+-        dp =3D rr_desc;
+-        for (len =3D 0; (seg =3D get_rdata(header, plen, end, name, MAXDN=
AME * 2, &cp, &dp)) !=3D 0; len +=3D seg);
+-        len +=3D end - cp;
+-        len =3D htons(len);
++        for (j =3D 0; get_rdata(header, plen, &state); j++)
++          if (j < RRBUFLEN)
++            rrbuf[j] =3D *state.op;
++
++        len =3D htons((u16)j);
+         hash->update(ctx, 2, (unsigned char *)&len);
++
++        /* If the RR is shorter than RRBUFLEN (most of them, in practice)
++           then we can just digest it now. If it exceeds RRBUFLEN we have=
 to
++           go back to the start and do it in chunks. */
++        if (j >=3D RRBUFLEN)
++          {
++            state.ip =3D p;
++            state.op =3D NULL;
++            state.desc =3D rr_desc;
++
++            for (j =3D 0; get_rdata(header, plen, &state); j++)
++              {
++                 rrbuf[j] =3D *state.op;
++
++                 if (j =3D=3D RRBUFLEN - 1)
++                   {
++                     hash->update(ctx, RRBUFLEN, rrbuf);
++                     j =3D -1;
++                   }
++              }
++          }
+
+-        /* Now canonicalise again and digest. */
+-        cp =3D p;
+-        dp =3D rr_desc;
+-        while ((seg =3D get_rdata(header, plen, end, name, MAXDNAME * 2, =
&cp, &dp)))
+-          hash->update(ctx, seg, (unsigned char *)name);
+-        if (cp !=3D end)
+-          hash->update(ctx, end - cp, cp);
++        if (j !=3D 0)
++          hash->update(ctx, j, rrbuf);
+       }
+
+       hash->digest(ctx, hash->digest_size, digest);
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.p=
atch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
new file mode 100644
index 000000000..64ebed257
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
@@ -0,0 +1,100 @@
+From 257ac0c5f7732cbc6aa96fdd3b06602234593aca Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Thu, 12 Nov 2020 18:49:23 +0000
+Subject: [PATCH] Check destination of DNS UDP query replies.
+
+At any time, dnsmasq will have a set of sockets open, bound to
+random ports, on which it sends queries to upstream nameservers.
+This patch fixes the existing problem that a reply for ANY in-flight
+query would be accepted via ANY open port, which increases the
+chances of an attacker flooding answers "in the blind" in an
+attempt to poison the DNS cache. CERT VU#434904 refers.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG     |  6 +++++-
+ src/forward.c | 37 ++++++++++++++++++++++++++++---------
+ 2 files changed, 33 insertions(+), 10 deletions(-)
+
+CVE: CVE-2020-25684
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D257ac0c5f7732cbc6aa96fdd3b06602234593aca]
+Comment: No change in any hunk
+
+diff --git a/src/forward.c b/src/forward.c
+index 9c2b2c6..134e0fc 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -16,7 +16,7 @@
+
+ #include "dnsmasq.h"
+
+-static struct frec *lookup_frec(unsigned short id, void *hash);
++static struct frec *lookup_frec(unsigned short id, int fd, int family, vo=
id *hash);
+ static struct frec *lookup_frec_by_sender(unsigned short id,
+                                         union mysockaddr *addr,
+                                         void *hash);
+@@ -805,7 +805,7 @@ void reply_query(int fd, int family, time_t now)
+   crc =3D questions_crc(header, n, daemon->namebuff);
+ #endif
+
+-  if (!(forward =3D lookup_frec(ntohs(header->id), hash)))
++  if (!(forward =3D lookup_frec(ntohs(header->id), fd, family, hash)))
+     return;
+
+ #ifdef HAVE_DUMPFILE
+@@ -2339,14 +2339,25 @@ struct frec *get_new_frec(time_t now, int *wait, s=
truct frec *force)
+ }
+
+ /* crc is all-ones if not known. */
+-static struct frec *lookup_frec(unsigned short id, void *hash)
++static struct frec *lookup_frec(unsigned short id, int fd, int family, vo=
id *hash)
+ {
+   struct frec *f;
+
+   for(f =3D daemon->frec_list; f; f =3D f->next)
+     if (f->sentto && f->new_id =3D=3D id &&
+       (!hash || memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0))
+-      return f;
++      {
++      /* sent from random port */
++      if (family =3D=3D AF_INET && f->rfd4 && f->rfd4->fd =3D=3D fd)
++        return f;
++
++      if (family =3D=3D AF_INET6 && f->rfd6 && f->rfd6->fd =3D=3D fd)
++        return f;
++
++      /* sent to upstream from bound socket. */
++      if (f->sentto->sfd && f->sentto->sfd->fd =3D=3D fd)
++        return f;
++      }
+
+   return NULL;
+ }
+@@ -2407,12 +2418,20 @@ void server_gone(struct server *server)
+ static unsigned short get_id(void)
+ {
+   unsigned short ret =3D 0;
++  struct frec *f;
+
+-  do
+-    ret =3D rand16();
+-  while (lookup_frec(ret, NULL));
+-
+-  return ret;
++  while (1)
++    {
++      ret =3D rand16();
++
++      /* ensure id is unique. */
++      for (f =3D daemon->frec_list; f; f =3D f->next)
++      if (f->sentto && f->new_id =3D=3D ret)
++        break;
++
++      if (!f)
++      return ret;
++    }
+ }
+
+
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.pat=
ch
new file mode 100644
index 000000000..a8d9b7e3f
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch
@@ -0,0 +1,590 @@
+From 2d765867c597db18be9d876c9c17e2c0fe1953cd Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Thu, 12 Nov 2020 22:06:07 +0000
+Subject: [PATCH] Use SHA-256 to provide security against DNS cache poisoni=
ng.
+
+Use the SHA-256 hash function to verify that DNS answers
+received are for the questions originally asked. This replaces
+the slightly insecure SHA-1 (when compiled with DNSSEC) or
+the very insecure CRC32 (otherwise). Refer: CERT VU#434904.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG            |   5 +
+ Makefile             |   3 +-
+ bld/Android.mk       |   2 +-
+ src/dnsmasq.h        |  11 +-
+ src/dnssec.c         |  31 -----
+ src/forward.c        |  43 ++-----
+ src/hash_questions.c | 281 +++++++++++++++++++++++++++++++++++++++++++
+ src/rfc1035.c        |  49 --------
+ 8 files changed, 301 insertions(+), 124 deletions(-)
+ create mode 100644 src/hash_questions.c
+
+CVE: CVE-2020-25685
+Upstream-Status: Backport []http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dcommit;h=3D2d765867c597db18be9d876c9c17e2c0fe1953cd]
+Comment: No change in any hunk
+
+diff --git a/Makefile b/Makefile
+index 78e25f0..0354e0f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -77,7 +77,8 @@ objs =3D cache.o rfc1035.o util.o option.o forward.o net=
work.o \
+        helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o \
+        dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o \
+        domain.o dnssec.o blockdata.o tables.o loop.o inotify.o \
+-       poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o
++       poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o \
++       metrics.o hash_questions.o
+
+ hdrs =3D dnsmasq.h config.h dhcp-protocol.h dhcp6-protocol.h \
+        dns-protocol.h radv-protocol.h ip6addr.h metrics.h
+diff --git a/bld/Android.mk b/bld/Android.mk
+index 080a615..f924be9 100644
+--- a/bld/Android.mk
++++ b/bld/Android.mk
+@@ -11,7 +11,7 @@ LOCAL_SRC_FILES :=3D  bpf.c cache.c dbus.c dhcp.c dnsmas=
q.c \
+                   radv.c slaac.c auth.c ipset.c domain.c \
+                   dnssec.c dnssec-openssl.c blockdata.c tables.c \
+                   loop.c inotify.c poll.c rrfilter.c edns0.c arp.c \
+-                  crypto.c dump.c ubus.c
++                  crypto.c dump.c ubus.c metrics.c hash_questions.c
+
+ LOCAL_MODULE :=3D dnsmasq
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 4d78c37..0a7639f 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -655,11 +655,7 @@ struct hostsfile {
+ #define FREC_TEST_PKTSZ       256
+ #define FREC_HAS_EXTRADATA    512
+
+-#ifdef HAVE_DNSSEC
+-#define HASH_SIZE 20 /* SHA-1 digest size */
+-#else
+-#define HASH_SIZE sizeof(int)
+-#endif
++#define HASH_SIZE 32 /* SHA-256 digest size */
+
+ struct frec {
+   union mysockaddr source;
+@@ -1229,7 +1225,6 @@ int check_for_bogus_wildcard(struct dns_header *head=
er, size_t qlen, char *name,
+                            struct bogus_addr *baddr, time_t now);
+ int check_for_ignored_address(struct dns_header *header, size_t qlen, str=
uct bogus_addr *baddr);
+ int check_for_local_domain(char *name, time_t now);
+-unsigned int questions_crc(struct dns_header *header, size_t plen, char *=
name);
+ size_t resize_packet(struct dns_header *header, size_t plen,
+                 unsigned char *pheader, size_t hlen);
+ int add_resource_record(struct dns_header *header, char *limit, int *trun=
cp,
+@@ -1254,9 +1249,11 @@ int dnssec_validate_reply(time_t now, struct dns_he=
ader *header, size_t plen, ch
+                         int check_unsigned, int *neganswer, int *nons, in=
t *nsec_ttl);
+ int dnskey_keytag(int alg, int flags, unsigned char *key, int keylen);
+ size_t filter_rrsigs(struct dns_header *header, size_t plen);
+-unsigned char* hash_questions(struct dns_header *header, size_t plen, cha=
r *name);
+ int setup_timestamp(void);
+
++/* hash_questions.c */
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name);
++
+ /* crypto.c */
+ const struct nettle_hash *hash_find(char *name);
+ int hash_init(const struct nettle_hash *hash, void **ctxp, unsigned char =
**digestp);
+diff --git a/src/dnssec.c b/src/dnssec.c
+index e95aa34..9410a7e 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -2087,35 +2087,4 @@ size_t dnssec_generate_query(struct dns_header *hea=
der, unsigned char *end, char
+   return ret;
+ }
+
+-unsigned char* hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
+-{
+-  int q;
+-  unsigned int len;
+-  unsigned char *p =3D (unsigned char *)(header+1);
+-  const struct nettle_hash *hash;
+-  void *ctx;
+-  unsigned char *digest;
+-
+-  if (!(hash =3D hash_find("sha1")) || !hash_init(hash, &ctx, &digest))
+-    return NULL;
+-
+-  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
+-    {
+-      if (!extract_name(header, plen, &p, name, 1, 4))
+-      break; /* bad packet */
+-
+-      len =3D to_wire(name);
+-      hash->update(ctx, len, (unsigned char *)name);
+-      /* CRC the class and type as well */
+-      hash->update(ctx, 4, p);
+-
+-      p +=3D 4;
+-      if (!CHECK_LEN(header, p, plen, 0))
+-      break; /* bad packet */
+-    }
+-
+-  hash->digest(ctx, hash->digest_size, digest);
+-  return digest;
+-}
+-
+ #endif /* HAVE_DNSSEC */
+diff --git a/src/forward.c b/src/forward.c
+index 134e0fc..4f9a963 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -256,19 +256,16 @@ static int forward_query(int udpfd, union mysockaddr=
 *udpaddr,
+   union all_addr *addrp =3D NULL;
+   unsigned int flags =3D 0;
+   struct server *start =3D NULL;
+-#ifdef HAVE_DNSSEC
+   void *hash =3D hash_questions(header, plen, daemon->namebuff);
++#ifdef HAVE_DNSSEC
+   int do_dnssec =3D 0;
+-#else
+-  unsigned int crc =3D questions_crc(header, plen, daemon->namebuff);
+-  void *hash =3D &crc;
+ #endif
+   unsigned int gotname =3D extract_request(header, plen, daemon->namebuff=
, NULL);
+   unsigned char *oph =3D find_pseudoheader(header, plen, NULL, NULL, NULL=
, NULL);
+   (void)do_bit;
+
+   /* may be no servers available. */
+-  if (forward || (hash && (forward =3D lookup_frec_by_sender(ntohs(header=
->id), udpaddr, hash))))
++  if (forward || (forward =3D lookup_frec_by_sender(ntohs(header->id), ud=
paddr, hash)))
+     {
+       /* If we didn't get an answer advertising a maximal packet in EDNS,
+        fall back to 1280, which should work everywhere on IPv6.
+@@ -769,9 +766,6 @@ void reply_query(int fd, int family, time_t now)
+   size_t nn;
+   struct server *server;
+   void *hash;
+-#ifndef HAVE_DNSSEC
+-  unsigned int crc;
+-#endif
+
+   /* packet buffer overwritten */
+   daemon->srv_save =3D NULL;
+@@ -798,12 +792,7 @@ void reply_query(int fd, int family, time_t now)
+   if (difftime(now, server->pktsz_reduced) > UDP_TEST_TIME)
+     server->edns_pktsz =3D daemon->edns_pktsz;
+
+-#ifdef HAVE_DNSSEC
+   hash =3D hash_questions(header, n, daemon->namebuff);
+-#else
+-  hash =3D &crc;
+-  crc =3D questions_crc(header, n, daemon->namebuff);
+-#endif
+
+   if (!(forward =3D lookup_frec(ntohs(header->id), fd, family, hash)))
+     return;
+@@ -1115,8 +1104,7 @@ void reply_query(int fd, int family, time_t now)
+                       log_query(F_NOEXTRA | F_DNSSEC | F_IPV6, daemon->ke=
yname, (union all_addr *)&(server->addr.in6.sin6_addr),
+                                 querystr("dnssec-query", querytype));
+
+-                    if ((hash =3D hash_questions(header, nn, daemon->name=
buff)))
+-                      memcpy(new->hash, hash, HASH_SIZE);
++                    memcpy(new->hash, hash_questions(header, nn, daemon->=
namebuff), HASH_SIZE);
+                     new->new_id =3D get_id();
+                     header->id =3D htons(new->new_id);
+                     /* Save query for retransmission */
+@@ -1970,15 +1958,9 @@ unsigned char *tcp_request(int confd, time_t now,
+             if (!flags && last_server)
+               {
+                 struct server *firstsendto =3D NULL;
+-#ifdef HAVE_DNSSEC
+-                unsigned char *newhash, hash[HASH_SIZE];
+-                if ((newhash =3D hash_questions(header, (unsigned int)siz=
e, daemon->namebuff)))
+-                  memcpy(hash, newhash, HASH_SIZE);
+-                else
+-                  memset(hash, 0, HASH_SIZE);
+-#else
+-                unsigned int crc =3D questions_crc(header, (unsigned int)=
size, daemon->namebuff);
+-#endif
++                unsigned char hash[HASH_SIZE];
++                memcpy(hash, hash_questions(header, (unsigned int)size, d=
aemon->namebuff), HASH_SIZE);
++
+                 /* Loop round available servers until we succeed in conne=
cting to one.
+                    Note that this code subtly ensures that consecutive qu=
eries on this connection
+                    which can go to the same server, do so. */
+@@ -2117,20 +2099,11 @@ unsigned char *tcp_request(int confd, time_t now,
+                     /* If the crc of the question section doesn't match t=
he crc we sent, then
+                        someone might be attempting to insert bogus values=
 into the cache by
+                        sending replies containing questions and bogus ans=
wers. */
+-#ifdef HAVE_DNSSEC
+-                    newhash =3D hash_questions(header, (unsigned int)m, d=
aemon->namebuff);
+-                    if (!newhash || memcmp(hash, newhash, HASH_SIZE) !=3D=
 0)
++                    if (memcmp(hash, hash_questions(header, (unsigned int=
)m, daemon->namebuff), HASH_SIZE) !=3D 0)
+                       {
+                         m =3D 0;
+                         break;
+                       }
+-#else
+-                    if (crc !=3D questions_crc(header, (unsigned int)m, d=
aemon->namebuff))
+-                      {
+-                        m =3D 0;
+-                        break;
+-                      }
+-#endif
+
+                     m =3D process_reply(header, now, last_server, (unsign=
ed int)m,
+                                       option_bool(OPT_NO_REBIND) && !nore=
bind, no_cache_dnssec, cache_secure, bogusanswer,
+@@ -2345,7 +2318,7 @@ static struct frec *lookup_frec(unsigned short id, i=
nt fd, int family, void *has
+
+   for(f =3D daemon->frec_list; f; f =3D f->next)
+     if (f->sentto && f->new_id =3D=3D id &&
+-      (!hash || memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0))
++      (memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0))
+       {
+       /* sent from random port */
+       if (family =3D=3D AF_INET && f->rfd4 && f->rfd4->fd =3D=3D fd)
+diff --git a/src/hash_questions.c b/src/hash_questions.c
+new file mode 100644
+index 0000000..ae112ac
+--- /dev/null
++++ b/src/hash_questions.c
+@@ -0,0 +1,281 @@
++/* Copyright (c) 2012-2020 Simon Kelley
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; version 2 dated June, 1991, or
++   (at your option) version 3 dated 29 June, 2007.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program.  If not, see <http://www.gnu.org/licenses/>.
++*/
++
++
++/* Hash the question section. This is used to safely detect query
++   retransmission and to detect answers to questions we didn't ask, which
++   might be poisoning attacks. Note that we decode the name rather
++   than CRC the raw bytes, since replies might be compressed differently.
++   We ignore case in the names for the same reason.
++
++   The hash used is SHA-256. If we're building with DNSSEC support,
++   we use the Nettle cypto library. If not, we prefer not to
++   add a dependency on Nettle, and use a stand-alone implementaion.
++*/
++
++#include "dnsmasq.h"
++
++#ifdef HAVE_DNSSEC
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
++{
++  int q;
++  unsigned char *p =3D (unsigned char *)(header+1);
++  const struct nettle_hash *hash;
++  void *ctx;
++  unsigned char *digest;
++
++  if (!(hash =3D hash_find("sha256")) || !hash_init(hash, &ctx, &digest))
++    {
++      /* don't think this can ever happen. */
++      static unsigned char dummy[HASH_SIZE];
++      static int warned =3D 0;
++
++      if (warned)
++      my_syslog(LOG_ERR, _("Failed to create SHA-256 hash object"));
++      warned =3D 1;
++
++      return dummy;
++    }
++
++  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
++    {
++      char *cp, c;
++
++      if (!extract_name(header, plen, &p, name, 1, 4))
++      break; /* bad packet */
++
++      for (cp =3D name; (c =3D *cp); cp++)
++       if (c >=3D 'A' && c <=3D 'Z')
++         *cp +=3D 'a' - 'A';
++
++      hash->update(ctx, cp - name, (unsigned char *)name);
++      /* CRC the class and type as well */
++      hash->update(ctx, 4, p);
++
++      p +=3D 4;
++      if (!CHECK_LEN(header, p, plen, 0))
++      break; /* bad packet */
++    }
++
++  hash->digest(ctx, hash->digest_size, digest);
++  return digest;
++}
++
++#else /* HAVE_DNSSEC */
++
++#define SHA256_BLOCK_SIZE 32            // SHA256 outputs a 32 byte diges=
t
++typedef unsigned char BYTE;             // 8-bit byte
++typedef unsigned int  WORD;             // 32-bit word, change to "long" =
for 16-bit machines
++
++typedef struct {
++  BYTE data[64];
++  WORD datalen;
++  unsigned long long bitlen;
++  WORD state[8];
++} SHA256_CTX;
++
++static void sha256_init(SHA256_CTX *ctx);
++static void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)=
;
++static void sha256_final(SHA256_CTX *ctx, BYTE hash[]);
++
++
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
++{
++  int q;
++  unsigned char *p =3D (unsigned char *)(header+1);
++  SHA256_CTX ctx;
++  static BYTE digest[SHA256_BLOCK_SIZE];
++
++  sha256_init(&ctx);
++
++  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
++    {
++      char *cp, c;
++
++      if (!extract_name(header, plen, &p, name, 1, 4))
++      break; /* bad packet */
++
++      for (cp =3D name; (c =3D *cp); cp++)
++       if (c >=3D 'A' && c <=3D 'Z')
++         *cp +=3D 'a' - 'A';
++
++      sha256_update(&ctx, (BYTE *)name, cp - name);
++      /* CRC the class and type as well */
++      sha256_update(&ctx, (BYTE *)p, 4);
++
++      p +=3D 4;
++      if (!CHECK_LEN(header, p, plen, 0))
++      break; /* bad packet */
++    }
++
++  sha256_final(&ctx, digest);
++  return (unsigned char *)digest;
++}
++
++/* Code from here onwards comes from https://github.com/B-Con/crypto-algo=
rithms
++   and was written by Brad Conte (brad@bradconte.com), to whom all credit=
 is given.
++
++   This code is in the public domain, and the copyright notice at the hea=
d of this
++   file does not apply to it.
++*/
++
++
++/****************************** MACROS ******************************/
++#define ROTLEFT(a,b) (((a) << (b)) | ((a) >> (32-(b))))
++#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))
++
++#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
++#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
++#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
++#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
++#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
++#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))
++
++/**************************** VARIABLES *****************************/
++static const WORD k[64] =3D {
++                         0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x39=
56c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
++                         0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72=
be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
++                         0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2d=
e92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
++                         0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6=
e00bf3,0xd5a79147,0x06ca6351,0x14292967,
++                         0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x65=
0a7354,0x766a0abb,0x81c2c92e,0x92722c85,
++                         0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd1=
92e819,0xd6990624,0xf40e3585,0x106aa070,
++                         0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x39=
1c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
++                         0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90=
befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
++};
++
++/*********************** FUNCTION DEFINITIONS ***********************/
++static void sha256_transform(SHA256_CTX *ctx, const BYTE data[])
++{
++  WORD a, b, c, d, e, f, g, h, i, j, t1, t2, m[64];
++
++  for (i =3D 0, j =3D 0; i < 16; ++i, j +=3D 4)
++    m[i] =3D (data[j] << 24) | (data[j + 1] << 16) | (data[j + 2] << 8) |=
 (data[j + 3]);
++  for ( ; i < 64; ++i)
++    m[i] =3D SIG1(m[i - 2]) + m[i - 7] + SIG0(m[i - 15]) + m[i - 16];
++
++  a =3D ctx->state[0];
++  b =3D ctx->state[1];
++  c =3D ctx->state[2];
++  d =3D ctx->state[3];
++  e =3D ctx->state[4];
++  f =3D ctx->state[5];
++  g =3D ctx->state[6];
++  h =3D ctx->state[7];
++
++  for (i =3D 0; i < 64; ++i)
++    {
++      t1 =3D h + EP1(e) + CH(e,f,g) + k[i] + m[i];
++      t2 =3D EP0(a) + MAJ(a,b,c);
++      h =3D g;
++      g =3D f;
++      f =3D e;
++      e =3D d + t1;
++      d =3D c;
++      c =3D b;
++      b =3D a;
++      a =3D t1 + t2;
++    }
++
++  ctx->state[0] +=3D a;
++  ctx->state[1] +=3D b;
++  ctx->state[2] +=3D c;
++  ctx->state[3] +=3D d;
++  ctx->state[4] +=3D e;
++  ctx->state[5] +=3D f;
++  ctx->state[6] +=3D g;
++  ctx->state[7] +=3D h;
++}
++
++static void sha256_init(SHA256_CTX *ctx)
++{
++  ctx->datalen =3D 0;
++  ctx->bitlen =3D 0;
++  ctx->state[0] =3D 0x6a09e667;
++  ctx->state[1] =3D 0xbb67ae85;
++  ctx->state[2] =3D 0x3c6ef372;
++  ctx->state[3] =3D 0xa54ff53a;
++  ctx->state[4] =3D 0x510e527f;
++  ctx->state[5] =3D 0x9b05688c;
++  ctx->state[6] =3D 0x1f83d9ab;
++  ctx->state[7] =3D 0x5be0cd19;
++}
++
++static void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)
++{
++  WORD i;
++
++  for (i =3D 0; i < len; ++i)
++    {
++      ctx->data[ctx->datalen] =3D data[i];
++      ctx->datalen++;
++      if (ctx->datalen =3D=3D 64) {
++      sha256_transform(ctx, ctx->data);
++      ctx->bitlen +=3D 512;
++      ctx->datalen =3D 0;
++      }
++    }
++}
++
++static void sha256_final(SHA256_CTX *ctx, BYTE hash[])
++{
++  WORD i;
++
++  i =3D ctx->datalen;
++
++  // Pad whatever data is left in the buffer.
++  if (ctx->datalen < 56)
++    {
++      ctx->data[i++] =3D 0x80;
++      while (i < 56)
++      ctx->data[i++] =3D 0x00;
++    }
++  else
++    {
++      ctx->data[i++] =3D 0x80;
++      while (i < 64)
++      ctx->data[i++] =3D 0x00;
++      sha256_transform(ctx, ctx->data);
++      memset(ctx->data, 0, 56);
++    }
++
++  // Append to the padding the total message's length in bits and transfo=
rm.
++  ctx->bitlen +=3D ctx->datalen * 8;
++  ctx->data[63] =3D ctx->bitlen;
++  ctx->data[62] =3D ctx->bitlen >> 8;
++  ctx->data[61] =3D ctx->bitlen >> 16;
++  ctx->data[60] =3D ctx->bitlen >> 24;
++  ctx->data[59] =3D ctx->bitlen >> 32;
++  ctx->data[58] =3D ctx->bitlen >> 40;
++  ctx->data[57] =3D ctx->bitlen >> 48;
++  ctx->data[56] =3D ctx->bitlen >> 56;
++  sha256_transform(ctx, ctx->data);
++
++  // Since this implementation uses little endian byte ordering and SHA u=
ses big endian,
++  // reverse all the bytes when copying the final state to the output has=
h.
++  for (i =3D 0; i < 4; ++i)
++    {
++      hash[i]      =3D (ctx->state[0] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 4]  =3D (ctx->state[1] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 8]  =3D (ctx->state[2] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 12] =3D (ctx->state[3] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 16] =3D (ctx->state[4] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 20] =3D (ctx->state[5] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 24] =3D (ctx->state[6] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 28] =3D (ctx->state[7] >> (24 - i * 8)) & 0x000000ff;
++    }
++}
++
++#endif
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index fefe63d..a8cdc6e 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -333,55 +333,6 @@ unsigned char *skip_section(unsigned char *ansp, int =
count, struct dns_header *h
+   return ansp;
+ }
+
+-/* CRC the question section. This is used to safely detect query
+-   retransmission and to detect answers to questions we didn't ask, which
+-   might be poisoning attacks. Note that we decode the name rather
+-   than CRC the raw bytes, since replies might be compressed differently.
+-   We ignore case in the names for the same reason. Return all-ones
+-   if there is not question section. */
+-#ifndef HAVE_DNSSEC
+-unsigned int questions_crc(struct dns_header *header, size_t plen, char *=
name)
+-{
+-  int q;
+-  unsigned int crc =3D 0xffffffff;
+-  unsigned char *p1, *p =3D (unsigned char *)(header+1);
+-
+-  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
+-    {
+-      if (!extract_name(header, plen, &p, name, 1, 4))
+-      return crc; /* bad packet */
+-
+-      for (p1 =3D (unsigned char *)name; *p1; p1++)
+-      {
+-        int i =3D 8;
+-        char c =3D *p1;
+-
+-        if (c >=3D 'A' && c <=3D 'Z')
+-          c +=3D 'a' - 'A';
+-
+-        crc ^=3D c << 24;
+-        while (i--)
+-          crc =3D crc & 0x80000000 ? (crc << 1) ^ 0x04c11db7 : crc << 1;
+-      }
+-
+-      /* CRC the class and type as well */
+-      for (p1 =3D p; p1 < p+4; p1++)
+-      {
+-        int i =3D 8;
+-        crc ^=3D *p1 << 24;
+-        while (i--)
+-          crc =3D crc & 0x80000000 ? (crc << 1) ^ 0x04c11db7 : crc << 1;
+-      }
+-
+-      p +=3D 4;
+-      if (!CHECK_LEN(header, p, plen, 0))
+-      return crc; /* bad packet */
+-    }
+-
+-  return crc;
+-}
+-#endif
+-
+ size_t resize_packet(struct dns_header *header, size_t plen, unsigned cha=
r *pheader, size_t hlen)
+ {
+   unsigned char *ansp =3D skip_questions(header, plen);
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.pat=
ch
new file mode 100644
index 000000000..6f60b36ed
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch
@@ -0,0 +1,201 @@
+From 2024f9729713fd657d65e64c2e4e471baa0a3e5b Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat.co=
m>
+Date: Wed, 25 Nov 2020 17:18:55 +0100
+Subject: [PATCH] Support hash function from nettle (only)
+
+Unlike COPTS=3D-DHAVE_DNSSEC, allow usage of just sha256 function from
+nettle, but keep DNSSEC disabled at build time. Skips use of internal
+hash implementation without support for validation built-in.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ Makefile             |  8 +++++---
+ bld/pkg-wrapper      | 41 ++++++++++++++++++++++-------------------
+ src/config.h         |  8 ++++++++
+ src/crypto.c         |  7 +++++++
+ src/dnsmasq.h        |  2 +-
+ src/hash_questions.c |  2 +-
+ 6 files changed, 44 insertions(+), 24 deletions(-)
+
+CVE: CVE-2020-25685
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D2024f9729713fd657d65e64c2e4e471baa0a3e5b]
+Comment: No change in any hunk
+
+diff --git a/Makefile b/Makefile
+index 0354e0f..7d2afd1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -53,7 +53,7 @@ top?=3D$(CURDIR)
+
+ dbus_cflags =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DBUS $(PKG=
_CONFIG) --cflags dbus-1`
+ dbus_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DBUS $(PKG=
_CONFIG) --libs dbus-1`
+-ubus_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_UBUS "" --=
copy -lubox -lubus`
++ubus_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_UBUS "" --=
copy '-lubox -lubus'`
+ idn_cflags =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_=
CONFIG) --cflags libidn`
+ idn_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_=
CONFIG) --libs libidn`
+ idn2_cflags =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(=
PKG_CONFIG) --cflags libidn2`
+@@ -61,8 +62,10 @@
+ ct_libs =3D       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK =
$(PKG_CONFIG) --libs libnetfilter_conntrack`
+ lua_cflags =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --cflags lua`
+ lua_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --libs lua`
+-nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(P=
KG_CONFIG) --cflags nettle hogweed`
+-nettle_libs =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(P=
KG_CONFIG) --libs nettle hogweed`
++nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC    =
 $(PKG_CONFIG) --cflags 'nettle hogweed' \
++                                                        HAVE_NETTLEHASH $=
(PKG_CONFIG) --cflags nettle`
++nettle_libs =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC    =
 $(PKG_CONFIG) --libs 'nettle hogweed' \
++                                                        HAVE_NETTLEHASH $=
(PKG_CONFIG) --libs nettle`
+ gmp_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC NO_=
GMP --copy -lgmp`
+ sunos_libs =3D    `if uname | grep SunOS >/dev/null 2>&1; then echo -lsoc=
ket -lnsl -lposix4; fi`
+ version =3D     -DVERSION=3D'\"`$(top)/bld/get-version $(top)`\"'
+diff --git a/bld/pkg-wrapper b/bld/pkg-wrapper
+index 704bdd3..89713b4 100755
+--- a/bld/pkg-wrapper
++++ b/bld/pkg-wrapper
+@@ -1,35 +1,37 @@
+ #!/bin/sh
+
+-search=3D$1
+-shift
+-pkg=3D$1
+-shift
+-op=3D$1
+-shift
+-
+ in=3D`cat`
+
+-if grep "^\#[[:space:]]*define[[:space:]]*$search" config.h >/dev/null 2>=
&1 || \
+-    echo $in | grep $search >/dev/null 2>&1; then
++search()
++{
++    grep "^\#[[:space:]]*define[[:space:]]*$1" config.h >/dev/null 2>&1 |=
| \
++    echo $in | grep $1 >/dev/null 2>&1
++}
++
++while [ "$#" -gt 0 ]; do
++    search=3D$1
++    pkg=3D$2
++    op=3D$3
++    lib=3D$4
++    shift 4
++if search "$search"; then
++
+ # Nasty, nasty, in --copy, arg 2 (if non-empty) is another config to sear=
ch for, used with NO_GMP
+     if [ $op =3D "--copy" ]; then
+       if [ -z "$pkg" ]; then
+-          pkg=3D"$*"
+-      elif grep "^\#[[:space:]]*define[[:space:]]*$pkg" config.h >/dev/nu=
ll 2>&1 || \
+-               echo $in | grep $pkg >/dev/null 2>&1; then
++          pkg=3D"$lib"
++      elif search "$pkg"; then
+           pkg=3D""
+       else
+-          pkg=3D"$*"
++          pkg=3D"$lib"
+       fi
+-    elif grep "^\#[[:space:]]*define[[:space:]]*${search}_STATIC" config.=
h >/dev/null 2>&1 || \
+-           echo $in | grep ${search}_STATIC >/dev/null 2>&1; then
+-      pkg=3D`$pkg  --static $op $*`
++    elif search "${search}_STATIC"; then
++      pkg=3D`$pkg  --static $op $lib`
+     else
+-      pkg=3D`$pkg $op $*`
++      pkg=3D`$pkg $op $lib`
+     fi
+
+-    if grep "^\#[[:space:]]*define[[:space:]]*${search}_STATIC" config.h =
>/dev/null 2>&1 || \
+-         echo $in | grep ${search}_STATIC >/dev/null 2>&1; then
++    if search "${search}_STATIC"; then
+       if [ $op =3D "--libs" ] || [ $op =3D "--copy" ]; then
+           echo "-Wl,-Bstatic $pkg -Wl,-Bdynamic"
+       else
+@@ -40,3 +42,4 @@ if grep "^\#[[:space:]]*define[[:space:]]*$search" confi=
g.h >/dev/null 2>&1 || \
+     fi
+ fi
+
++done
+diff --git a/src/config.h b/src/config.h
+index 7187ffa..e71a117 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -120,6 +120,9 @@ HAVE_AUTH
+    define this to include the facility to act as an authoritative DNS
+    server for one or more zones.
+
++HAVE_NETTLEHASH
++   include just hash function from nettle, but no DNSSEC.
++
+ HAVE_DNSSEC
+    include DNSSEC validator.
+
+@@ -187,6 +190,7 @@ RESOLVFILE
+ /* #define HAVE_IDN */
+ /* #define HAVE_LIBIDN2 */
+ /* #define HAVE_CONNTRACK */
++/* #define HAVE_NETTLEHASH */
+ /* #define HAVE_DNSSEC */
+
+
+@@ -420,6 +424,10 @@ static char *compile_opts =3D
+ "no-"
+ #endif
+ "auth "
++#if !defined(HAVE_NETTLEHASH) && !defined(HAVE_DNSSEC)
++"no-"
++#endif
++"nettlehash "
+ #ifndef HAVE_DNSSEC
+ "no-"
+ #endif
+diff --git a/src/crypto.c b/src/crypto.c
+index ca63111..09525d2 100644
+--- a/src/crypto.c
++++ b/src/crypto.c
+@@ -25,6 +25,9 @@
+ #if NETTLE_VERSION_MAJOR =3D=3D 3 && NETTLE_VERSION_MINOR >=3D 6
+ #  include <nettle/gostdsa.h>
+ #endif
++#endif
++
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)
+ #include <nettle/nettle-meta.h>
+ #include <nettle/bignum.h>
+
+@@ -167,6 +170,10 @@ int hash_init(const struct nettle_hash *hash, void **=
ctxp, unsigned char **diges
+
+   return 1;
+ }
++
++#endif
++
++#ifdef HAVE_DNSSEC
+
+ static int dnsmasq_rsa_verify(struct blockdata *key_data, unsigned int ke=
y_len, unsigned char *sig, size_t sig_len,
+                             unsigned char *digest, size_t digest_len, int=
 algo)
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 9f74c7a..914f469 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -157,7 +157,7 @@ extern int capget(cap_user_header_t header, cap_user_d=
ata_t data);
+ #include <priv.h>
+ #endif
+
+-#ifdef HAVE_DNSSEC
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)
+ #  include <nettle/nettle-meta.h>
+ #endif
+
+diff --git a/src/hash_questions.c b/src/hash_questions.c
+index ae112ac..917c18e 100644
+--- a/src/hash_questions.c
++++ b/src/hash_questions.c
+@@ -28,7 +28,7 @@
+
+ #include "dnsmasq.h"
+
+-#ifdef HAVE_DNSSEC
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)
+ unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
+ {
+   int q;
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.pat=
ch
new file mode 100644
index 000000000..b07ab6045
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch
@@ -0,0 +1,335 @@
+From 15b60ddf935a531269bb8c68198de012a4967156 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 18 Nov 2020 18:34:55 +0000
+Subject: [PATCH] Handle multiple identical near simultaneous DNS queries
+ better.
+
+Previously, such queries would all be forwarded
+independently. This is, in theory, inefficent but in practise
+not a problem, _except_ that is means that an answer for any
+of the forwarded queries will be accepted and cached.
+An attacker can send a query multiple times, and for each repeat,
+another {port, ID} becomes capable of accepting the answer he is
+sending in the blind, to random IDs and ports. The chance of a
+succesful attack is therefore multiplied by the number of repeats
+of the query. The new behaviour detects repeated queries and
+merely stores the clients sending repeats so that when the
+first query completes, the answer can be sent to all the
+clients who asked. Refer: CERT VU#434904.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG     |  16 +++++-
+ src/dnsmasq.h |  19 ++++---
+ src/forward.c | 142 ++++++++++++++++++++++++++++++++++++++++++--------
+ 3 files changed, 147 insertions(+), 30 deletions(-)
+
+CVE: CVE-2020-25686
+Upstream-Status: Backport [http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.gi=
t;a=3Dcommit;h=3D15b60ddf935a531269bb8c68198de012a4967156]
+Comment: No change in any hunk
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 0a7639f..fa8c5ea 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -653,19 +653,24 @@ struct hostsfile {
+ #define FREC_DO_QUESTION       64
+ #define FREC_ADDED_PHEADER    128
+ #define FREC_TEST_PKTSZ       256
+-#define FREC_HAS_EXTRADATA    512
++#define FREC_HAS_EXTRADATA    512
++#define FREC_HAS_PHEADER     1024
+
+ #define HASH_SIZE 32 /* SHA-256 digest size */
+
+ struct frec {
+-  union mysockaddr source;
+-  union all_addr dest;
++  struct frec_src {
++    union mysockaddr source;
++    union all_addr dest;
++    unsigned int iface, log_id;
++    unsigned short orig_id;
++    struct frec_src *next;
++  } frec_src;
+   struct server *sentto; /* NULL means free */
+   struct randfd *rfd4;
+   struct randfd *rfd6;
+-  unsigned int iface;
+-  unsigned short orig_id, new_id;
+-  int log_id, fd, forwardall, flags;
++  unsigned short new_id;
++  int fd, forwardall, flags;
+   time_t time;
+   unsigned char *hash[HASH_SIZE];
+ #ifdef HAVE_DNSSEC
+@@ -1093,6 +1098,8 @@ extern struct daemon {
+   int back_to_the_future;
+ #endif
+   struct frec *frec_list;
++  struct frec_src *free_frec_src;
++  int frec_src_count;
+   struct serverfd *sfds;
+   struct irec *interfaces;
+   struct listener *listeners;
+diff --git a/src/forward.c b/src/forward.c
+index 50da095..d9b32b3 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -20,6 +20,8 @@ static struct frec *lookup_frec(unsigned short id, int f=
d, int family, void *has
+ static struct frec *lookup_frec_by_sender(unsigned short id,
+                                         union mysockaddr *addr,
+                                         void *hash);
++static struct frec *lookup_frec_by_query(void *hash, unsigned int flags);
++
+ static unsigned short get_id(void);
+ static void free_frec(struct frec *f);
+
+@@ -255,6 +257,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+   int type =3D SERV_DO_DNSSEC, norebind =3D 0;
+   union all_addr *addrp =3D NULL;
+   unsigned int flags =3D 0;
++  unsigned int fwd_flags =3D 0;
+   struct server *start =3D NULL;
+   void *hash =3D hash_questions(header, plen, daemon->namebuff);
+ #ifdef HAVE_DNSSEC
+@@ -263,7 +266,18 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,
+   unsigned int gotname =3D extract_request(header, plen, daemon->namebuff=
, NULL);
+   unsigned char *oph =3D find_pseudoheader(header, plen, NULL, NULL, NULL=
, NULL);
+   (void)do_bit;
+-
++
++  if (header->hb4 & HB4_CD)
++    fwd_flags |=3D FREC_CHECKING_DISABLED;
++  if (ad_reqd)
++    fwd_flags |=3D FREC_AD_QUESTION;
++  if (oph)
++    fwd_flags |=3D FREC_HAS_PHEADER;
++#ifdef HAVE_DNSSEC
++  if (do_bit)
++    fwd_flags |=3D FREC_DO_QUESTION;
++#endif
++
+   /* may be no servers available. */
+   if (forward || (forward =3D lookup_frec_by_sender(ntohs(header->id), ud=
paddr, hash)))
+     {
+@@ -336,6 +350,39 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,
+     }
+   else
+     {
++      /* Query from new source, but the same query may be in progress
++       from another source. If so, just add this client to the
++       list that will get the reply.
++
++       Note that is the EDNS client subnet option is in use, we can't do =
this,
++       as the clients (and therefore query EDNS options) will be differen=
t
++       for each query. The EDNS subnet code has checks to avoid
++       attacks in this case. */
++      if (!option_bool(OPT_CLIENT_SUBNET) && (forward =3D lookup_frec_by_=
query(hash, fwd_flags)))
++      {
++        /* Note whine_malloc() zeros memory. */
++        if (!daemon->free_frec_src &&
++            daemon->frec_src_count < daemon->ftabsize &&
++            (daemon->free_frec_src =3D whine_malloc(sizeof(struct frec_sr=
c))))
++          daemon->frec_src_count++;
++
++        /* If we've been spammed with many duplicates, just drop the quer=
y. */
++        if (daemon->free_frec_src)
++          {
++            struct frec_src *new =3D daemon->free_frec_src;
++            daemon->free_frec_src =3D new->next;
++            new->next =3D forward->frec_src.next;
++            forward->frec_src.next =3D new;
++            new->orig_id =3D ntohs(header->id);
++            new->source =3D *udpaddr;
++            new->dest =3D *dst_addr;
++            new->log_id =3D daemon->log_id;
++            new->iface =3D dst_iface;
++          }
++
++        return 1;
++      }
++
+       if (gotname)
+       flags =3D search_servers(now, &addrp, gotname, daemon->namebuff, &t=
ype, &domain, &norebind);
+
+@@ -343,22 +390,22 @@ static int forward_query(int udpfd, union mysockaddr=
 *udpaddr,
+       do_dnssec =3D type & SERV_DO_DNSSEC;
+ #endif
+       type &=3D ~SERV_DO_DNSSEC;
+-
++
+       if (daemon->servers && !flags)
+       forward =3D get_new_frec(now, NULL, NULL);
+       /* table full - flags =3D=3D 0, return REFUSED */
+
+       if (forward)
+       {
+-        forward->source =3D *udpaddr;
+-        forward->dest =3D *dst_addr;
+-        forward->iface =3D dst_iface;
+-        forward->orig_id =3D ntohs(header->id);
++        forward->frec_src.source =3D *udpaddr;
++        forward->frec_src.orig_id =3D ntohs(header->id);
++        forward->frec_src.dest =3D *dst_addr;
++        forward->frec_src.iface =3D dst_iface;
+         forward->new_id =3D get_id();
+         forward->fd =3D udpfd;
+         memcpy(forward->hash, hash, HASH_SIZE);
+         forward->forwardall =3D 0;
+-        forward->flags =3D 0;
++        forward->flags =3D fwd_flags;
+         if (norebind)
+           forward->flags |=3D FREC_NOREBIND;
+         if (header->hb4 & HB4_CD)
+@@ -413,9 +460,9 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+       unsigned char *pheader;
+
+       /* If a query is retried, use the log_id for the retry when logging=
 the answer. */
+-      forward->log_id =3D daemon->log_id;
++      forward->frec_src.log_id =3D daemon->log_id;
+
+-      plen =3D add_edns0_config(header, plen, ((unsigned char *)header) +=
 PACKETSZ, &forward->source, now, &subnet);
++      plen =3D add_edns0_config(header, plen, ((unsigned char *)header) +=
 PACKETSZ, &forward->frec_src.source, now, &subnet);
+
+       if (subnet)
+       forward->flags |=3D FREC_HAS_SUBNET;
+@@ -552,7 +599,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+       return 1;
+
+       /* could not send on, prepare to return */
+-      header->id =3D htons(forward->orig_id);
++      header->id =3D htons(forward->frec_src.orig_id);
+       free_frec(forward); /* cancel */
+     }
+
+@@ -804,8 +851,8 @@ void reply_query(int fd, int family, time_t now)
+
+   /* log_query gets called indirectly all over the place, so
+      pass these in global variables - sorry. */
+-  daemon->log_display_id =3D forward->log_id;
+-  daemon->log_source_addr =3D &forward->source;
++  daemon->log_display_id =3D forward->frec_src.log_id;
++  daemon->log_source_addr =3D &forward->frec_src.source;
+
+   if (daemon->ignore_addr && RCODE(header) =3D=3D NOERROR &&
+       check_for_ignored_address(header, n, daemon->ignore_addr))
+@@ -1080,6 +1127,7 @@ void reply_query(int fd, int family, time_t now)
+                     new->sentto =3D server;
+                     new->rfd4 =3D NULL;
+                     new->rfd6 =3D NULL;
++                    new->frec_src.next =3D NULL;
+                     new->flags &=3D ~(FREC_DNSKEY_QUERY | FREC_DS_QUERY |=
 FREC_HAS_EXTRADATA);
+                     new->forwardall =3D 0;
+
+@@ -1215,9 +1263,11 @@ void reply_query(int fd, int family, time_t now)
+
+       if ((nn =3D process_reply(header, now, forward->sentto, (size_t)n, =
check_rebind, no_cache_dnssec, cache_secure, bogusanswer,
+                             forward->flags & FREC_AD_QUESTION, forward->f=
lags & FREC_DO_QUESTION,
+-                            forward->flags & FREC_ADDED_PHEADER, forward-=
>flags & FREC_HAS_SUBNET, &forward->source)))
++                            forward->flags & FREC_ADDED_PHEADER, forward-=
>flags & FREC_HAS_SUBNET, &forward->frec_src.source)))
+       {
+-        header->id =3D htons(forward->orig_id);
++        struct frec_src *src;
++
++        header->id =3D htons(forward->frec_src.orig_id);
+         header->hb4 |=3D HB4_RA; /* recursion if available */
+ #ifdef HAVE_DNSSEC
+         /* We added an EDNSO header for the purpose of getting DNSSEC RRs=
, and set the value of the UDP payload size
+@@ -1233,13 +1283,26 @@ void reply_query(int fd, int family, time_t now)
+           }
+ #endif
+
++        for (src =3D &forward->frec_src; src; src =3D src->next)
++          {
++            header->id =3D htons(src->orig_id);
++
+ #ifdef HAVE_DUMPFILE
+-        dump_packet(DUMP_REPLY, daemon->packet, (size_t)nn, NULL, &forwar=
d->source);
++            dump_packet(DUMP_REPLY, daemon->packet, (size_t)nn, NULL, &sr=
c->source);
+ #endif
+-
+-        send_from(forward->fd, option_bool(OPT_NOWILD) || option_bool (OP=
T_CLEVERBIND), daemon->packet, nn,
+-                  &forward->source, &forward->dest, forward->iface);
++
++            send_from(forward->fd, option_bool(OPT_NOWILD) || option_bool=
 (OPT_CLEVERBIND), daemon->packet, nn,
++                      &src->source, &src->dest, src->iface);
++
++            if (option_bool(OPT_EXTRALOG) && src !=3D &forward->frec_src)
++              {
++                daemon->log_display_id =3D src->log_id;
++                daemon->log_source_addr =3D &src->source;
++                log_query(F_UPSTREAM, "query", NULL, "duplicate");
++              }
++          }
+       }
++
+       free_frec(forward); /* cancel */
+     }
+ }
+@@ -2202,6 +2265,17 @@ void free_rfd(struct randfd *rfd)
+
+ static void free_frec(struct frec *f)
+ {
++  struct frec_src *src, *tmp;
++
++   /* add back to freelist of not the record builtin to every frec. */
++  for (src =3D f->frec_src.next; src; src =3D tmp)
++    {
++      tmp =3D src->next;
++      src->next =3D daemon->free_frec_src;
++      daemon->free_frec_src =3D src;
++    }
++
++  f->frec_src.next =3D NULL;
+   free_rfd(f->rfd4);
+   f->rfd4 =3D NULL;
+   f->sentto =3D NULL;
+@@ -2342,17 +2416,39 @@ static struct frec *lookup_frec_by_sender(unsigned=
 short id,
+                                         void *hash)
+ {
+   struct frec *f;
++  struct frec_src *src;
++
++  for (f =3D daemon->frec_list; f; f =3D f->next)
++    if (f->sentto &&
++      !(f->flags & (FREC_DNSKEY_QUERY | FREC_DS_QUERY)) &&
++      memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0)
++      for (src =3D &f->frec_src; src; src =3D src->next)
++      if (src->orig_id =3D=3D id &&
++          sockaddr_isequal(&src->source, addr))
++        return f;
++
++  return NULL;
++}
++
++static struct frec *lookup_frec_by_query(void *hash, unsigned int flags)
++{
++  struct frec *f;
++
++  /* FREC_DNSKEY and FREC_DS_QUERY are never set in flags, so the test be=
low
++     ensures that no frec created for internal DNSSEC query can be return=
ed here. */
++
++#define FLAGMASK (FREC_CHECKING_DISABLED | FREC_AD_QUESTION | FREC_DO_QUE=
STION \
++                | FREC_HAS_PHEADER | FREC_DNSKEY_QUERY | FREC_DS_QUERY)
+
+   for(f =3D daemon->frec_list; f; f =3D f->next)
+     if (f->sentto &&
+-      f->orig_id =3D=3D id &&
+-      memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0 &&
+-      sockaddr_isequal(&f->source, addr))
++      (f->flags & FLAGMASK) =3D=3D flags &&
++      memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0)
+       return f;
+-
++
+   return NULL;
+ }
+-
++
+ /* Send query packet again, if we can. */
+ void resend_query()
+ {
+--
+2.20.1
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.pat=
ch
new file mode 100644
index 000000000..4e03dd92b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch
@@ -0,0 +1,66 @@
+From 6a6e06fbb0d4690507ceaf2bb6f0d8910f3d4914 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 4 Dec 2020 18:35:11 +0000
+Subject: [PATCH] Small cleanups in frec_src datastucture handling.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ src/forward.c | 22 +++++++++++++---------
+ 1 file changed, 13 insertions(+), 9 deletions(-)
+
+CVE: CVE-2020-25686
+Upstream-Status: Backport [http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.gi=
t;a=3Dcommit;h=3D6a6e06fbb0d4690507ceaf2bb6f0d8910f3d4914]
+Comment: No change in any hunk
+
+diff --git a/src/forward.c b/src/forward.c
+index 70b84d7..f94c4cf 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -361,7 +361,10 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,
+         if (!daemon->free_frec_src &&
+             daemon->frec_src_count < daemon->ftabsize &&
+             (daemon->free_frec_src =3D whine_malloc(sizeof(struct frec_sr=
c))))
+-          daemon->frec_src_count++;
++          {
++            daemon->frec_src_count++;
++            daemon->free_frec_src->next =3D NULL;
++          }
+
+         /* If we've been spammed with many duplicates, just drop the quer=
y. */
+         if (daemon->free_frec_src)
+@@ -398,6 +401,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+         forward->frec_src.orig_id =3D ntohs(header->id);
+         forward->frec_src.dest =3D *dst_addr;
+         forward->frec_src.iface =3D dst_iface;
++        forward->frec_src.next =3D NULL;
+         forward->new_id =3D get_id();
+         forward->fd =3D udpfd;
+         memcpy(forward->hash, hash, HASH_SIZE);
+@@ -2265,16 +2265,16 @@
+
+ static void free_frec(struct frec *f)
+ {
+-  struct frec_src *src, *tmp;
+-
+-   /* add back to freelist of not the record builtin to every frec. */
+-  for (src =3D f->frec_src.next; src; src =3D tmp)
++  struct frec_src *last;
++
++  /* add back to freelist if not the record builtin to every frec. */
++  for (last =3D f->frec_src.next; last && last->next; last =3D last->next=
) ;
++  if (last)
+     {
+-      tmp =3D src->next;
+-      src->next =3D daemon->free_frec_src;
+-      daemon->free_frec_src =3D src;
++      last->next =3D daemon->free_frec_src;
++      daemon->free_frec_src =3D f->frec_src.next;
+     }
+-
++
+   f->frec_src.next =3D NULL;
+   free_rfd(f->rfd4);
+   f->rfd4 =3D NULL;
+--
+2.20.1
+
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
