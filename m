Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CA2CC6B2F
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32863.1792043118856043427
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Wm6Qhv2R;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e934449bb0so12233305ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043118; x=1792647918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q3bjbu3SYHQnOKZUSQVvueM5tc9yw5nav+41CQmL1xA=;
        b=Wm6Qhv2R2oKGFWZIUfB5LOFqT/uNLvDUkSwIlNl1/qjDoxDZvpCH3+7pCVRZ46+5Nc
         o7a86GpKHmol/kE35aJn9Dl0e2A8UAtSX12wp90/LyESrT9fYbNKeRJsTFlOAGr1G3Kt
         Tf8erqDQi9DoA5ok6XM18iHdke7PLDg7P3QlvrFy/jeKJ5zGkrKxUyswTYPsdBrX/mGX
         3ZJWXuksszQ1/44wsVqe+kNEaukIrozVqARBXVTNqiGfkYm3QUrtOddeCXfxCDeilFcd
         hh0rKBTIZ13LTeBvoW/UjY0ah7q/+8BvzOYoUBMzmPpKyQYEJAn5+uK7DzhqaXu9XNhz
         E1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043118; x=1792647918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=q3bjbu3SYHQnOKZUSQVvueM5tc9yw5nav+41CQmL1xA=;
        b=rCPpkUN9edW7DJhSfTUDXVaSug+NxYXqDPpsaU+44DOhW4VBJ62eTNtwrGx0Hu/59h
         0HvWEEESjkMBW7POzjvfcDfnYYtxZBYW7pmLzqKVtyJXcInPZtyYSYySvC7CzMdIz0nI
         Y3KM0fgE6qtredDoV+b92fS3RX5sYXQDYwqo2WLwzDj/ae/rWZLTxCKm203FgLZ2sOPz
         xORxfsV+CUNKJ5RdacCLcL/YzA5Jd0kjphjVW/QLC3Jv3UlY0coxIfjNWl/BiS+hh2BC
         vmNexcBsbH6K7Zsyn09Qd3qE925o9GoFV3680Oiu4Mz+LHhMKGb4sXmSA+Uzb9j3Og3W
         B7qQ==
X-Gm-Message-State: AFq9FYJkm9X03/Fn7AnCNjfagyIIAZKDXqTW0/tnG6LwU0nYXI6qM8bG
	hIAhNp0vzyeH4ptjnTnGFKXZCe4F3iG3y3lOyt3sxZBdyCBPbepNUKxoR4TNrQ==
X-Gm-Gg: AYBFou3Fj2faYLTVDjBEUsgTZJj0EzfVH7w2mPDCyvUHTpnY6mYgx0cCqYH0+ww9UKX
	md6ag7xX3RzM0gYjANdlohLlea0sRI7k1WyvytVMtQ1+4az6aH0ItsiRXdxAHUBpu7HwdSm6zmz
	hlU5kEUxW4eUSQFRdrseuJkB9NGy5Af8Qu/MogSMqGvfRWkPdQEhlOZj6Ej+BxMTFw4IefGTA/2
	K8GBEEyHMYSooZxPUWFQxCdGyfCkMM2c+VxsTBPsKzCzZ50yabRWUSJ58H92hq+YZLtGshnd07q
	sCDwNMJrqzoTjgi8YpsxFTxGjSThmbm3acnEBjJzS5vegK1fGSaEuzW6SJo64DtMcN+NmHbMXbV
	dWVZTSHLFkQtWds1f+gxyFYqUVbr7eY6qOm3MybptPg1c6zYTtI6xk4pDGGvMy7X+HBDlBa2Oyw
	jAErUn4wqbvlQPNTiXvUUrJzYpZxaV357godj12TrxYSoBxYURg7R8sRN7pv8WBRKo2byy48j/Y
	oowje26aeO6mA5ERBveM2OMjlO1C71RiQ==
X-Received: by 2002:a17:902:d50a:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2e842f31562mr157143835ad.50.1792043117565;
        Wed, 14 Oct 2026 22:45:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:16 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 69/82] strongswan: patch CVE-2026-78130
Date: Thu, 15 Oct 2026 18:41:57 +1300
Message-ID: <359b6fb06745cc3e4e87f248d3e45c7398bf1078.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130989

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

