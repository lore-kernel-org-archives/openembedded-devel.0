Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67856CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:30 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33276.1792043120357690579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ASgLfbNv;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so25873125ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043120; x=1792647920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MzhOadSLXEjkCZQf8kF0CiKxu747zV1HS66bc/YW6YM=;
        b=ASgLfbNvrDiem3tc7yzIonF9xNVCaSr63FZ4EJuXNam9/9rs9Ddj/n8JSR4nuP93K6
         DYFo7BR281IRcDhv2Uz+wNf5SaKW5QHCDYwWvTAaPiWteP4wpwoVBYUWEBrpSIB5R96u
         +2aawg1wpeBZzhbSx39qR8lbhif+nFD3ziKjg8i6e7e2u5l3hiSM0Ffd+21QG3tLixSg
         34zY3KzmYptgqneUaU2K5wWEOFmKhT0xfcBgj8ZwvWmRdIsh8i9lwv0ISpERBNJHyjzu
         lEtClkIHzWOQCzxPvbgelISUabMFXaI1cd+DLn8GbmQ+qrUF7ZtKiRmnGC9bON6MsH5m
         E5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043120; x=1792647920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MzhOadSLXEjkCZQf8kF0CiKxu747zV1HS66bc/YW6YM=;
        b=1pkgZDUwXE4L0NU/C6DW7QstTERWuT31S7JXjMrIK7UY2qjCYC7vg1fvfPVkgG9GUs
         FQB37O4LWGi7kBmcuqwQVKbBUov1wUgCB8WcYeOOtcOxm2IbP+WI9do3wuoaDYqyyvZ0
         Ekm+/96Xmt9u/pq0GkOD/bLX3L+DyWB/TEozP+NQ0Mj+khxjEcYlhtLGQy0F2sJbPlZo
         aLNm631TT1qDRq9LJwFeCBTegtutTGq3qprYj0z6JFe0VRXtrtGpWsDoTkEc2Vf6yFj1
         VFJnl6Vz/64fcbpzDxRQKwWbWMsrPVeVNnDSVSRQVWEMDFhW9w8Wqoo3N96ruwt6keug
         N+lg==
X-Gm-Message-State: AFq9FYJ7DeX+QuIw14Li/18QTf4Dr6vDF+1R3inIUgpXDOKmovkejZWe
	LMyzsyNB0sGtnUs/57bzfx+ON3v2s3IzoovDeiSl5ACjj6gtuEGMiA+lz00bZQ==
X-Gm-Gg: AYBFou3DvD5NvOucpxL8ymdcw36xKiiTle1hc6YE8EMDl+ljE0thTn/TUxWXGWAq40d
	FYSYP2WGP9XIXqBANHR0q4ltZuLfSmfm1/J+A+CYXWhNsZ67CxXlUmSuwxfiHejIHlkiYem41/L
	XtqY0/quSknfUJNTE8GuyGSDQsPTsy0XZl5zTV9CEzWlNbgro1iJrT2M7B5045iSmMcfU+gyMDu
	2+AgvniyhF/1iAx9nKr+4mf2LtKBrJU74jWR+Gy6pzdpcox9IXEiWKmW8uqTNy0KeTXqSp0BrLR
	LGMql9GfqcPKnr1D1g9NXJe7Fd0V78vS+EcgkjTJiFp9lveSYNeNtuEYqsmWreVWpnATucnFNDT
	xOoCDu5Quhg5J8slZrImUlZdtjFh8uqr99J6jZaFldctHRWeQWjRcpvlwhuy/FrceL2sSDoYa2W
	K/Lplr9P2yav3FTTMlHEWm7lYy32LBw89A8oxjBn5R3s0YSVCN0ltUH60D74Txluvv7vb74SduD
	SfAVPTMgpzLOBmajqyP3hI=
X-Received: by 2002:a17:903:324d:b0:2df:a0d4:71de with SMTP id d9443c01a7336-2e842710e5amr108689665ad.0.1792043119649;
        Wed, 14 Oct 2026 22:45:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 70/82] strongswan: patch CVE-2026-78132
Date: Thu, 15 Oct 2026 18:41:58 +1300
Message-ID: <2afc7f40c8bcb6fecd5e0ab185ec4c3825b13bba.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130990

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78132

[1]https://download.strongswan.org/security/CVE-2026-78132/strongswan-5.1.3-6.0.7_x509_ac_ietfattr_loop.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78132).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit dd3053a1a3806a37d1297e726d3eababfb539f8e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78132.patch           | 75 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
new file mode 100644
index 0000000000..f3ddd5b61a
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
@@ -0,0 +1,75 @@
+From d8144c609148eda1ca55eac2ecddcd81bbd799b5 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 1 Jul 2026 16:24:23 +0200
+Subject: [PATCH] x509: Prevent infinite loop when parsing ietfAttrSyntax in
+ attribute certificates
+
+This is the same issue that was fixed with 407fcca200fd ("asn1-parser:
+Fix CHOICE parsing") for other CHOICE elements.  This one was missed and
+can be triggered pre-auth by sending an attribute certificate to a peer.
+Since it's parsed before verifying it, the certificate doesn't have to
+be valid.
+
+For versions older than 5.5.3, this patch requires prior application of
+the fix for CVE-2017-9023, which introduced proper CHOICE handling in
+the ASN.1 parser.
+
+Fixes: a17598bc6992 ("x509: Integrate IETF attribute handling, and obsolete ietf_attributes_t")
+Fixes: CVE-2026-78132
+
+CVE: CVE-2026-78132
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/86bf2cbf5d9941b7ef16a1b25f0baf5589e0b64e]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 36 +++++++++++-------------
+ 1 file changed, 17 insertions(+), 19 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 11a847e..46c1f58 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -249,26 +249,24 @@ static void parse_roleSyntax(chunk_t blob, int level0)
+  */
+ static const asn1Object_t ietfAttrSyntaxObjects[] =
+ {
+-	{ 0, "ietfAttrSyntax",		ASN1_SEQUENCE,		ASN1_NONE }, /*  0 */
+-	{ 1,   "policyAuthority",	ASN1_CONTEXT_C_0,	ASN1_OPT |
+-													ASN1_BODY }, /*  1 */
+-	{ 1,   "end opt",			ASN1_EOC,			ASN1_END  }, /*  2 */
+-	{ 1,   "values",			ASN1_SEQUENCE,		ASN1_LOOP }, /*  3 */
+-	{ 2,     "octets",			ASN1_OCTET_STRING,	ASN1_OPT |
+-													ASN1_BODY }, /*  4 */
+-	{ 2,     "end choice",		ASN1_EOC,			ASN1_END  }, /*  5 */
+-	{ 2,     "oid",				ASN1_OID,			ASN1_OPT |
+-													ASN1_BODY }, /*  6 */
+-	{ 2,     "end choice",		ASN1_EOC,			ASN1_END  }, /*  7 */
+-	{ 2,     "string",			ASN1_UTF8STRING,	ASN1_OPT |
+-													ASN1_BODY }, /*  8 */
+-	{ 2,     "end choice",		ASN1_EOC,			ASN1_END  }, /*  9 */
+-	{ 1,   "end loop",			ASN1_EOC,			ASN1_END  }, /* 10 */
+-	{ 0, "exit",				ASN1_EOC,			ASN1_EXIT }
++	{ 0, "ietfAttrSyntax",		ASN1_SEQUENCE,		ASN1_NONE            }, /*  0 */
++	{ 1,   "policyAuthority",	ASN1_CONTEXT_C_0,	ASN1_OPT|ASN1_BODY   }, /*  1 */
++	{ 1,   "end opt",			ASN1_EOC,			ASN1_END             }, /*  2 */
++	{ 1,   "values",			ASN1_SEQUENCE,		ASN1_LOOP            }, /*  3 */
++	{ 2,     "value choice",	ASN1_EOC,			ASN1_CHOICE          }, /*  4 */
++	{ 3,       "octets",		ASN1_OCTET_STRING,	ASN1_OPT|ASN1_BODY   }, /*  5 */
++	{ 3,       "end choice",	ASN1_EOC,			ASN1_END|ASN1_CH     }, /*  6 */
++	{ 3,       "oid",			ASN1_OID,			ASN1_OPT|ASN1_BODY   }, /*  7 */
++	{ 3,       "end choice",	ASN1_EOC,			ASN1_END|ASN1_CH     }, /*  8 */
++	{ 3,       "string",		ASN1_UTF8STRING,	ASN1_OPT|ASN1_BODY   }, /*  9 */
++	{ 3,       "end choice",	ASN1_EOC,			ASN1_END|ASN1_CH     }, /* 10 */
++	{ 2,     "end choices",		ASN1_EOC,			ASN1_END|ASN1_CHOICE }, /* 11 */
++	{ 1,   "end loop",			ASN1_EOC,			ASN1_END             }, /* 12 */
++	{ 0, "exit",				ASN1_EOC,			ASN1_EXIT            }
+ };
+-#define IETF_ATTR_OCTETS	 4
+-#define IETF_ATTR_OID		 6
+-#define IETF_ATTR_STRING	 8
++#define IETF_ATTR_OCTETS	 5
++#define IETF_ATTR_OID		 7
++#define IETF_ATTR_STRING	 9
+ 
+ /**
+  * Parse group memberships, IETF attributes
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index 4f6a5d2ae7..b070ecf862 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78133.patch \
            file://CVE-2026-78131.patch \
            file://CVE-2026-78130.patch \
+           file://CVE-2026-78132.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

