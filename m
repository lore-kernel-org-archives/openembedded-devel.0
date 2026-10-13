Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB20CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 10:00:08 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3433.1791885598505396640
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nIShymgv;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccc6b11a19aso994393a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885598; x=1792490398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q3bjbu3SYHQnOKZUSQVvueM5tc9yw5nav+41CQmL1xA=;
        b=nIShymgv0bK430OQv8AOg/GKk5CmfF2iPFN/gnW1/Z0GF3Kp5JilPA9iNsUJsoF9Sd
         i27naSB6HOk9G5tCcxrjvye89Vn1YOVfS/VCbd/8/Bs2SUDKRVEy/70aTvD42yyOFFsm
         M0xYYqFCjLODaaYi9AlfUqXbRUfytXi112jahPzScu5xa1r2mnLyqq5e3AaoIcaGEmca
         RxxM/T0+rjEs951UQC5rkQopuYWWhSYr22W4dZwPgE+mugiJd38QK5E9ZJoS4haLRhjw
         SPluDcBwUp4ygVz0R5r987hQc667mmDVlldUzZgsjN2irorJaRYgWS9DcvL1PSZ8GF5z
         2omA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885598; x=1792490398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q3bjbu3SYHQnOKZUSQVvueM5tc9yw5nav+41CQmL1xA=;
        b=w6eRKXEwgC5zi1XMaH0ZeuddJq/UZ8qE2bPvKRzP5NbNAG723oG40jE6mg2F4wJP1y
         c6ZDLiJvSoCzH7AZ/gztwWrL1Qv2m+sTc8qZdLwlOHo+/k066n73dQGNh+irO2EcKWsE
         wU6w2SGJ9GQyTp/UoPnYMMRiYzNokOF/h2GP/EWHS0x8pCm+fwFQkYM7ra6F5WdG2GCr
         c715WnoWcZbtcAOvfZvLN3g7IglKz1SYYNHtga1vp78SwfGtpFZCB9oKMZn+w9hd6ZkR
         koMmHbaXrQq0L1cfI6MuOErgFz+ohlN43zd6uQsAunRgij6QcMsmdk+6vhBTay6ggT8W
         Vjig==
X-Gm-Message-State: AFq9FYLQTt06DrRXST8j0xuWbwaGjJ9+HdLstbPyDpNU9/oUsj4m8nUJ
	dSLwxSYJcCp+oJVL6dlaocxNs83XUlyngAD6YR4jr5g0ccPeLHKN+oFaVAUgZA==
X-Gm-Gg: AYBFou2LAbwrf8JLTETT/OnQ+2/tQ+EcM1kvlXroHLbrLil0zvid4Vf5yU8bBgOlLto
	M4sCB1Ueep74g+n+WqiPzotTabsJLmV6+hPyAKM6Y3UkmoRHl4+ylLY0ZYPa48z9WhYKiorWy92
	k48yIftKLznEr6fx7ERPvslGbKS1ah1Mg9mO1EK81UD1XYG+p2OZysnPBrPXwgP9iJtkFEhAv6v
	Ft1zdxUn1NyX/442uy/BQGkCSxzHola/hdEMqnXfTCWiJJW9WBjEhwhwOUWQZB6e36AlzVjupcb
	iQW0okWwCiZzhzG9d/pRvwm4z4zGY/rJU2HBwKNmwa4Q++pPuXoRY0fxe1RbGh9IyFz7LXJmrd0
	+v/cSkmYaKdT69jO0AG84jXDImh9iFcNPCp/7wGWL5on6Sr1GxIo7M1701/0kUOlQkAzH/YeA5M
	7TB4Hr/97IXPQAOV+W7vwID5zORjj2DI9+KdNTBYbq85C4T5fAxzlCTQ8kH4biINHbWd9oRsv0v
	RlwoXrlDhv3j324pQPRGvOVUI9Mqgr+kWIGgak=
X-Received: by 2002:a17:90b:1dd1:b0:3a8:f70f:1cb8 with SMTP id 98e67ed59e1d1-3ab3aceb97dmr8798077a91.44.1791885597827;
        Tue, 13 Oct 2026 02:59:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-networking][blacksail][PATCH 17/28] strongswan: patch CVE-2026-78130
Date: Tue, 13 Oct 2026 22:58:52 +1300
Message-ID: <20261013095903.3544906-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 10:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130850

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78130

[1]https://download.strongswan.org/security/CVE-2026-78130/strongswan-5.1.3-6.0.7_x509_ac_issuer_null.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78130).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit d831ff4ac956483745e6df0fe9a4f6fe055440f8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78130.patch           | 49 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
new file mode 100644
index 0000000000..8fe5c7f278
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
@@ -0,0 +1,49 @@
+From 254d971bbe7479fe5fffc34cd1dd1e349a48e7aa Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-78130
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/bee6ce27761e1f38958be36ebe6688ef963c3d22]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/x509/x509_ac.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/x509/x509_ac.c b/src/libstrongswan/plugins/x509/x509_ac.c
+index 68b7cf9..11a847e 100644
+--- a/src/libstrongswan/plugins/x509/x509_ac.c
++++ b/src/libstrongswan/plugins/x509/x509_ac.c
+@@ -898,7 +898,11 @@ METHOD(certificate_t, has_issuer, id_match_t,
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
+@@ -935,7 +939,8 @@ METHOD(certificate_t, issued_by, bool,
+ 	}
+ 	else
+ 	{
+-		if (!this->issuerName->equals(this->issuerName,
++		if (!this->issuerName ||
++			!this->issuerName->equals(this->issuerName,
+ 									  issuer->get_subject(issuer)))
+ 		{
+ 			return FALSE;
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index af687f5e4d..4f6a5d2ae7 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78129.patch \
            file://CVE-2026-78133.patch \
            file://CVE-2026-78131.patch \
+           file://CVE-2026-78130.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

