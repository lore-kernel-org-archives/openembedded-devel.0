Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB31C982FD
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 04:33:53 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.732.1790224429431408342
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 21:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=eiR8t6rI;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8631d0023daso914930b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790224429; x=1790829229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QozY+IpOyaLK2wJymvSE8umBSfDcKUb7Tnq4E703TZU=;
        b=eiR8t6rI8iYz4/NmsTh7eHTTArtGtIWS0QQ46OtNPxb5DShnoF9+4qxgJ12czS0jJn
         Us5Ojuqt7jJ4xs+KUgQQTvJPpgtR5XRWV9DWrEbVpTZN5jv0a+9g7QcqVkJ+SuJOJpXz
         Su6Kyd8LWnMOguxBHwzMUffylhGB9gdW+0nFwAmjIvcveqBmNMqER+VjdKXKVZ0nGUyZ
         LJJoIHLC1cgbnwleSmUhqwMe9jlfNzYI803twpbeC/Gj8bxeTYCmCGcPpCVWfjLEOaJy
         FZD/cF0oI7VhXBAEWPu66WsnNYnRSQ0OxBQmNFamBOigHTtntMAxadddSOToSrnXFkMn
         IuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790224429; x=1790829229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QozY+IpOyaLK2wJymvSE8umBSfDcKUb7Tnq4E703TZU=;
        b=fMAHYEZUZKIVtee8+oYKQ9bqzBOv7EdVIxWr/wyLPozOAecji1iexzFW1XeSzBi070
         GbR/Enlz0l8S9w2MSiPXD3Scv0FOg00NT7WYl1eYILXMjr//E5FRoSyxn8fPdxgxU1ma
         aiyMdqOzmXogb1NLrlkuHe6sk923Ai06dpNJ6vH1NhacHJrMe10TUyYYelTvrHZld7ve
         6NHfz6IKuV6vH+hvqZ+0AwEYyrp5QrWybCIv/BZ1gfoH5yI0a+EcT46i8VkQLe9kPuQf
         yqd7xcS668a1UbO8sUFE2WNdiWAjELozUTC+HpxCKG5KUuSh/88Q6ihwgtlIbHda/QGA
         CO9Q==
X-Gm-Message-State: AFuF++nqNdWEy1VtgK8cBmr6agdoy4n/yn4piVo7BPu0G2ABXIlJl40E
	/6WPkdYqcyCapPvT4QwHVv+l8PTfp7+GwuujuaNLpdBpT9IpIooxP6pljV2VXw==
X-Gm-Gg: AYBFou0efUKiOIgyjhR3Tft7NW4YFXLQJdT36J8bzYQKViWZ56UhTXeKTGwJ9l1LJza
	UgulBRm4T32aymxDVlQ0kNxDZvc7Au69HX6FyQ7rpGkzqXWTF7JNAXLWlddhJ24Vi8Pv9tQWF6x
	Yd4xTKvlCNgY1P9K0PekrSQTkkQWB+JJ2oAt3Qmc706md6Ugo0KuHW9xLRruazx8Zq/g9pMxkIn
	4KYqSK0gapMHum3O751ExjMPjM6/BnpHYidwOtGTNjM/JkKnqvv5nmN/ktkIe/2Vm/t8+Som0fk
	CtAKeyz1s8RclZ2qzYZB17I4xDr+sIBvjsXSA6rufjzyIqZw9OrZbBKLHpPLNcIJEVtfypPgqMZ
	LwG2m1Oa538oDl/GEfgpanDjGx9ho7HBlXnUsv1T2l4sGuuYTDz7aXilM9y8Gym20uyDMjGNg9s
	zS7TfTtsCPqTWf0s26bQRXCLy0I0c+b9bgVm06bA2chGyxs4t7tSdr/P9mruDuy+eYVALxvG1ca
	Yq+WTBZ+V4Cne0Z6K2pKu0=
X-Received: by 2002:aa7:88c2:0:b0:86b:43f6:67c4 with SMTP id d2e1a72fcca58-87e9869458amr1040994b3a.1.1790224428771;
        Wed, 23 Sep 2026 21:33:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1e601b5dsm2189686b3a.61.2026.09.23.21.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 21:33:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 13/24] strongswan: patch CVE-2026-78132
Date: Thu, 24 Sep 2026 16:33:03 +1200
Message-ID: <20260924043315.1663186-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
References: <20260924043315.1663186-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Sep 2026 04:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130261

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78132

[1]https://download.strongswan.org/security/CVE-2026-78132/strongswan-5.1.3-6.0.7_x509_ac_ietfattr_loop.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78132).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78132.patch           | 75 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
new file mode 100644
index 0000000000..eb53d99ba5
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
+Upstream-Status: Backport [https://github.com/strongiswan/strongswan/commit/86bf2cbf5d9941b7ef16a1b25f0baf5589e0b64e]
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
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index ffc9d1433e..1597455d15 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78133.patch \
            file://CVE-2026-78131.patch \
            file://CVE-2026-78130.patch \
+           file://CVE-2026-78132.patch \
 "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"

