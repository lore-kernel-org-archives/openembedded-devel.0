Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5722.1794549878137215906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 22:04:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a+f6v8/F;
 spf=pass (domain: mvista.com, ip: 74.125.82.170, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f8cdd30beso1240509eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 22:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1794549877; x=1795154677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0gHQy2RTQoGaQD/uxu9li0FuJKETi0L/dTCWrsqP3k=;
        b=a+f6v8/Fc9IX7keJtDmYqc6GrX39DAMHzzqV6wEZDIE6NTG1tJ+3B9lSSttR8hYpBK
         mx7yHr73tEIYRFxTvnFJoc1q4GrM4SaUIREjoDwGcNXVDYVmDTAYU8fL6EnluVUYSBoO
         rEyahldvpK4TTLaoPU85IsORtXicZu/3CkuqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794549877; x=1795154677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0gHQy2RTQoGaQD/uxu9li0FuJKETi0L/dTCWrsqP3k=;
        b=GH8UvTEBJ1CjffidaLyDJC9mYpkW1qlkug89952TfmMsCx/s5JL/v9CuP9oq+fDIxU
         6Lk4PMirS+2fe8TVVGgsvTYcST1wOG8o7J/rLY7dblewc0fiDRC4JT/uIDHc49iMibXj
         2qmrJ5wfLF+Q28jmaGMlnSp3xfsl3+G4GpyLGzpHcqaEBovWDNT6beq0RzTUlNd9YHPU
         gHpbqB7G77YHViciZFkZ7YQ6ydhyfjd81J1Mh27Gk6T9p7BDXrk26/Pe09PAl4ObxM0P
         eeKe8EcbMf312FxfscujdlJvpH/PLJmWUhKto1b/cTBadEHL3E6DSJDcxRzDcniBre6h
         94NQ==
X-Gm-Message-State: APuU4Z8cGt6zSMvpbEYi53e35ztXDtJRH/g38I9BoWvFEFDX6t9mnI/S
	H6RtJ9IGjTP9dDE72DLyEpl54kjHyWIWGHh+b9WtmxviUXa5c6VuqXj7WsbAo0N9ljjQMJhg4WD
	jjSXWIEE=
X-Gm-Gg: AYBFou01nJT0Q3dwhcgh8VNieZa1TQKnj7wwJtrc2iLrkToebTa5Yxnx1J/W4Hk55iy
	NC+MTVFBjAl10gw4F/z3r1ibDQnLqLt68WMLGjJKZXeBeL+VpvegTm5k3he8gQFJS87tufUxpJB
	xnK9QI7VT+RSUoIxxHsw6eZsArjy+MMFrSNDEgCQrbUGsqQkrBJxcdOaU+JlZkAKwWJTJ+URhaL
	YYqzjKZjpvHTx2K2um83Nh1D5al4oZQWvTrNn0KhVro0I43lq6PmEbSVQmqU84zZSdIw4Xlos35
	G+u769I/MGH3lj6GZzrfrJvbQkzvciiWRo1sfPfEp6u6sbpKWLlEGRCokl8elipsRbmD1GYvZ2w
	4DEl+HmHLl3ElBLuWbS/VJ0GTNyPSqUUkbUlSlXqfgjxW8qY4LsBpnTRMrgUS9pVNPmpTvad4NT
	E/1b+xDYdIAzIdwYQgdIyqDPeUniMNWo3QPomrfnyNYlGkRxFMKaf3qrGqFCLeZOYZHYLblPzoL
	DbZjmIz3o9TuSrvHf9d1UXsdu9llv2aRnaHXu06yFKLvUIfV/qXLzD1c6UjH5Nk1gDpzqL4xPSr
	2IInLYRlq/h35zkrIEl+lwYWbQbvlRMv29ayQ2fq
X-Received: by 2002:a05:7300:e9cd:10b0:379:7251:9a1b with SMTP id 5a478bee46e88-3797251ad11mr1599390eec.21.1794549853619;
        Thu, 12 Nov 2026 22:04:13 -0800 (PST)
Return-Path: <hprajapati@mvista.com>
Received: from MVIN00013.mvista.com ([27.121.101.115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm4065972eec.13.2026.11.12.22.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:04:13 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: anuj.mittal@oss.qualcomm.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networking][scarthgap][PATCH] strongswan: fix for CVE-2026-78130, CVE-2026-78132
Date: Fri, 13 Nov 2026 11:33:58 +0530
Message-ID: <20261113060358.136538-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 06:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132224
Content-Type: text/plain; charset="utf-8"

Pick patch according to [1] & [2] which is also mentioned at Debian report in [3] & [4].

[1] https://download.strongswan.org/security/CVE-2026-78130/
[2] https://download.strongswan.org/security/CVE-2026-78132/
[3] https://security-tracker.debian.org/tracker/CVE-2026-78130
[4] https://security-tracker.debian.org/tracker/CVE-2026-78132

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../strongswan/CVE-2026-78130.patch           | 55 +++++++++++++
 .../strongswan/CVE-2026-78132.patch           | 77 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  2 +
 3 files changed, 134 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
new file mode 100644
index 0000000000..6ca1c5dc6e
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
@@ -0,0 +1,55 @@
+From 4dae392b32a2c56441fd7ca50ad32a0874455995 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 19 Jun 2026 11:57:48 +0200
+Subject: [PATCH] x509: Avoid NULL-pointer dereference if issuerName is missing
+ in attribute certificate
+
+If neither authoritiyKeyIdentifier nor issuerName are encoded in an
+attribute certificate, the validation in `acert_validator.c:verify()`
+will cause a NULL-pointer dereference via `issued_by()` (the lookup
+with NULL identity will enumerate all trusted certificates).
+
+Fixes: 26930a8c3e42 ("certificate factory can load certs from file")
+Fixes: CVE-2026-78130
+
+Origin: https://download.strongswan.org/security/CVE-2026-78130/strongswan-5.1.3-6.0.7_x509_ac_issuer_null.patch
+Reviewed-by: Simon Quigley <tsimonq2@debian.org>
+Last-Update: 2026-10-26
+
+CVE: CVE-2026-78130
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78130/strongswan-5.1.3-6.0.7_x509_ac_issuer_null.patch]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 2e370f5..a0b6cc3 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -913,7 +913,11 @@ METHOD(certificate_t, has_issuer, id_match_t,
+ 	{
+ 		return ID_MATCH_PERFECT;
+ 	}
+-	return this->issuerName->matches(this->issuerName, issuer);
++	if (this->issuerName)
++	{
++		return this->issuerName->matches(this->issuerName, issuer);
++	}
++	return ID_MATCH_NONE;
+ }
+ 
+ METHOD(certificate_t, issued_by, bool,
+@@ -950,7 +954,8 @@ METHOD(certificate_t, issued_by, bool,
+ 	}
+ 	else
+ 	{
+-		if (!this->issuerName->equals(this->issuerName,
++		if (!this->issuerName ||
++			!this->issuerName->equals(this->issuerName,
+ 									  issuer->get_subject(issuer)))
+ 		{
+ 			return FALSE;
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
new file mode 100644
index 0000000000..14d9389928
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
@@ -0,0 +1,77 @@
+From d925e4625626a70611a979d4ab231c6e2d313e4a Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78132/strongswan-5.1.3-6.0.7_x509_ac_ietfattr_loop.patch]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 36 +++++++++++-------------
+ 1 file changed, 17 insertions(+), 19 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index a0b6cc3..3b04542 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -265,26 +265,24 @@ static void parse_roleSyntax(chunk_t blob, int level0)
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
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 661727e501..de792a2332 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -18,6 +18,8 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://constraints-Case-insensitive-matching-and-reject-exc.patch \
            file://tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch \
            file://libradius-Reject-undersized-attributes-in-enumerator.patch \
+           file://CVE-2026-78130.patch \
+           file://CVE-2026-78132.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.50.1

