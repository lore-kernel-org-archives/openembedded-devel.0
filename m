Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94746CC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:08 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3525.1791885601239495571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 03:00:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l+mr3Tl9;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3a80d1c98f5so1570049a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885601; x=1792490401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzhOadSLXEjkCZQf8kF0CiKxu747zV1HS66bc/YW6YM=;
        b=l+mr3Tl961hXhXqZw1yi0jfTkX++sUd9zG346LOyQZABRpB4H0h/KsA5lem8SVKQx1
         ZkgzzIaASqYGxdU8gv3p/JLkwBwia39aDG1l9TrB8olw8Oyi9d2H5gu+v4269p6wrHfp
         DhlTQL2eE9TCPr3RirVcYpWH+NjKapVazdGXYntHjjnm+Mb59flKhWjGD2wtTVa/7urG
         +IqxkZH7yrp9+0I4mMn5m2lVAQ8PkXZpEbsfXTMH/Z7ed4ljL+Lfa2J7bGlc/8f/aI3x
         Xjt7L26u50LYUE/KC2Tw1hOnSrsqrjmZFBTGH24sbDeQx+2YAiLoVB++nqAKh8XStBHl
         97mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885601; x=1792490401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MzhOadSLXEjkCZQf8kF0CiKxu747zV1HS66bc/YW6YM=;
        b=nKAWow0iysSmp5IRPnUlaU8Lt1Ub/Ta8nuaMCFDIW8IwuSyghqVdD5vUbgUgNCngb0
         bt88bgZBPBro+H0MIjRSji5ZD1VNBjlGXOz1cklmPL+Q2OelIf896WMddTaCJY1vKLfr
         zT//4fF/6WFQfBxXPSPAUpctCh/NILnkZSyrEBNV2vZuw7kUR51i1kKHUWLj+e0RGzPv
         BS1KqraL5qsoYTx3Mn2POr2QVBmjpO7fPqbUbi/ScJ6Tujyk0RRD2YePDlEyw5PbEa/R
         6lMs8gQchnwZsEeJmoHB3S8pAVsgx9F5doWnhenO752k0bGDpEQr1L9LUnWRAVSGTsIY
         DVOg==
X-Gm-Message-State: AFq9FYLud5uTU+hfMSIWL2Wkm6DigEUEqt/1wvCmBPD3/GtsIXlrW5VC
	O/DbQ/EGrzXudxgkSjCK6o8Ff3q8rDrbZwbNnK+MAu/qr3cWg8q9uIOgmG3GbQ==
X-Gm-Gg: AYBFou3h3ubtcfkl+YpXp+pU9GIF0TbSzp3Sl0/zPRj0s2qv3oVBXJ4K3OHR2Xgf+kP
	irm9vlhCFkyugnbteOpnENWRN/FHA7pSKIawirD3RmpeEIzU6miw6g+gQNVEA9PCtLURn1LrcYD
	bO7/IcBYi4Xx1ooR4wc1T6dtu8RQ3Rb7SpikmuuFh3mrTzHhHomBUKeouuuDCg89NGcM9JrozHV
	Ztopp6AiTvujt2Re2sOuX7x6dC9tVZoYd4BEiIhoGwdZZmKVYAISF+YSMRkaZHfD7e6KOuLva5T
	J3PgeEohKiwCvmoZlNVcwKOR3/eE2HF2xF0LuIGE3UJ9bf7YfJ/pFrSlRaHr39EozZ5AguXgLZT
	w1TRpaLXyahiz4tqhEaNyWLX8r9ZcLHF9ADRAR0Aky+QA8LjyVT54mcWVbdyoak0jv1WCTgp8Rf
	BsVAzh9aEP3/4qN/srlL40PsRJw28bVONqeJYLxo4lV9sIUfW34G4woDXqU2wsJAagqjjcWF45G
	GhWI8QnngEu74jv9Gm6hq8yJmQN9BHh6ZewILI=
X-Received: by 2002:a17:90b:4b92:b0:3a5:3f7:271 with SMTP id 98e67ed59e1d1-3ab3ac9b31bmr9272067a91.58.1791885600394;
        Tue, 13 Oct 2026 03:00:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:00:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 18/28] strongswan: patch CVE-2026-78132
Date: Tue, 13 Oct 2026 22:58:53 +1300
Message-ID: <20261013095903.3544906-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130851

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

