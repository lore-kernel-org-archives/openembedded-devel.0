Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F8CCD13DA
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 20:55:13 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13534.1777755311701210000
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 May 2026 13:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Obyl//VG;
 spf=pass (domain: konsulko.com, ip: 209.85.210.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f1f6103afso1232018b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 13:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1777755311; x=1778360111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyyfNNCK84EyUogXLrjZx9UW+eneiJFYGI6j78cha50=;
        b=Obyl//VGUh4MufHIblJt5eijpQ5IFXkKzZe9IQuBZGQbVAwrv2B948yxzwOUp88mjR
         DJ4vPnZpEMM8+7+6lQsNd9drt5VJRvpdH00tnJItTtN+vO5QuTnrMo6DXD21cyIVg2R8
         Gcb8kcHc1G6EpP0aIA2r7jyy6lAwAStr/VfZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777755311; x=1778360111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YyyfNNCK84EyUogXLrjZx9UW+eneiJFYGI6j78cha50=;
        b=CgDqjzzbcodzSSH7xpB/0JEesO+kTZRLsnPg3Cpe7gEOEaoZX2cKZbxLeEbsVQB4Ne
         6ljthr/Ny3vnwFK1AIeGHcS/IKo7wPhVGsGZNl3ASveHWDop2EIIrVFG9pnxMg4BWhwA
         YYuS4WKQo9qEsK56zKs/UZZOk4XBydeMZtFSswkxDZAQ17WWAsi1SFLpwCWDY25q/moN
         OFJAjtIa3Bf0xQGClroZKGSyOEu/Fr8SXAAIIC0MuZXXc/9yyjNZTGVlvXZ9ZzkB5e/v
         E2EkVveVbm2Fzth099qAZxY6dFt/4zV/Z19cv/H4uuIJvCN73HfcvGNhphJCDREymy+j
         jFQA==
X-Gm-Message-State: AOJu0Yx3VPXB001+qas1rJTBFPnrRf5HjZ1yZnTmviwXPiXAJwkLf6Wr
	Ygrtn+bgQB9ibMPyat9dZLPxdLJcyP+u82jAxdORuxtqERkyZSZNwrq36GTNKYgmpgFobiu8nia
	vMcGO
X-Gm-Gg: AeBDiet/mbaTRj8Sbuz5gwV/xQVE+NLidseuW19hT9dQmjl6dR4KavhElTv5m0oOjUi
	ACArzj5DsZEGL4CxwhD4CVVtRn/N5lU9FRrCgS8EGuh/ey4ooI8esL2/NM6e4y8Wa2hki1MnQga
	A0OiamhvQzDglQPfbr/C0qBQKXO3CW2Hed28ut3LWgEEcRt41numaNZx/3NpjKBQ/h3rwXPlUX3
	5hcn6X5v4xru2EQZ8p9xusRya7iS0WCdyMPRpAw6DpJ4yfCXJoA5QrOLt0IGJ//HKUWOW9Zt3Eo
	QaDRsQ1BwnqDu0OmB7EyWWjPvpJF+3tDyf7DqyktSuHWKJkjnLplpBCJpH8Cq5fVFxI9+mREaUn
	kq1e6k4k37Mjdp3xbbij3sxp4gD8+u1arBZHlzW+BddUkP4p5BZfT8XuSezEkJJ9jA7uLtjjIoD
	s5sfz6wW1hsAKS65/qcNIMuX7ulE6xhkfEedKHo6EpRg/VPhONbg==
X-Received: by 2002:a05:6a00:997:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-8352d15fe10mr4098096b3a.19.1777755310831;
        Sat, 02 May 2026 13:55:10 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6021:700:f870:4337:268a:bb6a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b8500dsm7198746b3a.58.2026.05.02.13.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 13:55:10 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [meta-webserver][PATCH 1/3] nginx: upgrade stable 1.28.3 -> 1.30.0
Date: Sat,  2 May 2026 13:54:59 -0700
Message-ID: <20260502205501.185550-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 May 2026 20:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126764

From: Tim Orling <tim.orling@konsulko.com>

2026-04-14
nginx 1.30.0 is the new annual stable branch, replacing 1.28.x as the
recommended branch for production deployments. Per nginx's release
model, each new stable line is cut from the prior year's mainline
(odd-numbered) branch; 1.30.x therefore carries forward the features
and fixes developed in 1.29.x. The 1.28.x branch enters maintenance
mode and will receive only critical security fixes from this point.

Inheriting from 1.29.x, the new stable line brings: HTTP Early Hints
(status code 103) for proxied responses, HTTP/2 transport to upstream
backends, Encrypted ClientHello (ECH) for TLS, sticky session support
for upstream groups, Multipath TCP (MPTCP) support, and a default
proxy_http_version raised from 1.0 to 1.1 with keep-alive enabled.
That last item is a behavioural change worth noting: deployments that
were implicitly relying on the prior 1.0 default for upstream
connections may see different connection-reuse and trailers behaviour
after this upgrade. See the upstream CHANGES file for the complete
list of additions, fixes, and behavioural changes between 1.28.x and
1.30.0.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb | 7 -------
 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb | 5 +++++
 2 files changed, 5 insertions(+), 7 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
deleted file mode 100644
index 9872a6de3b..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
-
-SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
-
-CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
new file mode 100644
index 0000000000..644f391e27
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.0.bb
@@ -0,0 +1,5 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
+
+SRC_URI[sha256sum] = "058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b"
-- 
2.47.3


