Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A615CF6BE5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:46:29 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1639.1767858382790861767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:46:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AwihEJvi;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1495357f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 23:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767858381; x=1768463181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaQX3tONZtgcLUcRxkz/fcQmeaX5UdMMEZmfXKp0GF8=;
        b=AwihEJviuKuc8S38QiXwDgjI2qzRDcMGJ9drWzSop4GopbIx/c+h6yZ9vPQeb3uuAP
         1kXJY7JPJZdK9SG44k7+V4q80HM5zs6DFfnPracJGxZ2O8uwwaxTu270eM7M2usk9ArQ
         DOcbpSwuT8js3sz7q1FIp0UpLvgoM2GsNk5YPFJURp6vJSROsZxQGC4zsUyE/orYqtvv
         cs05yk1+BwAPcB/s/J5Pv7UnWEMJYD68AMzbCasCUJcAgzRAtpKsJPxptcpH9xOQF0rB
         HuVRfhqWR7GKnlln3CRCfOFFHpMa3JYPV5Iw98E+U2F6O9NjptQamhIf47/+GOVKBam2
         fCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767858381; x=1768463181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gaQX3tONZtgcLUcRxkz/fcQmeaX5UdMMEZmfXKp0GF8=;
        b=XOZZmpRXnvNBLoNLH7rJdCELM5NKjhQRvyFRrRSAUQe1x+iAnvWGS+FmrLS7o7Zve1
         13+vq5EhYO8ILY1WOTfMLxt1I0zx09QJR2n5CKqRNcfdW1D/yfnGE6vxauuXTTr8L8PR
         F9u7UP7zRJgz04HwjjZP49kt9Ohn8AX8tJwKoAU594T9fJq9y2Y1icXl1a7WEaAHhBaV
         4EpAGhIuGhl8SBGr8nkcl7mOtrTlh0Cn63tgVM5EB5cOF6ugK3Cbv++8J9UG/vogyaKP
         ESyHpmbKUsewyWSDLzMEI1DwZk1JzrTpIvysbUGGmqIner8UDx5tXEqaFTsE/4WiEYES
         YtMQ==
X-Gm-Message-State: AOJu0Yw4byN3Q5HAjXSvJHjpWm5XwcQm6T7i79D3DgrVacCaUrAIIjHK
	ymD2QIAiH2XGw2eFKB3xA32I28lNLvPeZLicGHer4ukmqe0vxpHB3K1NX+23jg==
X-Gm-Gg: AY/fxX5zJeuL547El5nUZhdZHZs89RaMp9wFGfceHK3gLD/ttf2on699c7DoNkMk0bB
	KC+yJAepZmIQrHd1Pnvb0LIydPJpAc0okfo+mKKV2UHAcS6h3cFu72f0GrxYxnrsTVLPybCPCDk
	c8/OP6j5fsHcZ4TEO/T11qENy2LUDHZsCX/Snjnzt7qKYoJGK6tnCxCUEUPP2g3EoM1PmsYGmfg
	8030zDUgUcPccgZEob0NGCrlCVTSDrFRUSoMxHt/wwZQAs+nm+3+aWY5iX3X4SzkMapC0T2Xqvl
	GJkOCGNKUBZfJh8DZCY/hFX+VNIGogCVzQgmPV1g0JJByM773XBViTzfkiWQ7SdHmHqCPmXvxN8
	z6U+taU0ZeksuR4LxwcngBZLUCj8A1A+mHfCEehCOaDUVPQdZdR4DSP+a6Nn9u5oxFsxvdaTiJB
	W1NPrQQTaJ
X-Google-Smtp-Source: AGHT+IFrdlguIxaJdhFcp1X6pg8HhcCfoYHttUlcp8+xncnSTkWllVfufn33W3tfJVerAtjDn76FFQ==
X-Received: by 2002:a05:6000:1448:b0:430:fc3a:fbce with SMTP id ffacd0b85a97d-432c36328e7mr7026968f8f.15.1767858380822;
        Wed, 07 Jan 2026 23:46:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm15200292f8f.11.2026.01.07.23.46.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 23:46:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-tornado: patch CVE-2023-28370
Date: Thu,  8 Jan 2026 08:46:15 +0100
Message-ID: <20260108074618.2782232-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108074618.2782232-1-skandigraun@gmail.com>
References: <20260108074618.2782232-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123250

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-28370

The NVD advisory mentions that the vulnerability was fixed
in v6.3.2. I checked the commits in that tag, and picked the
only one that's commit message described the same vulnerability
as the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python3-tornado/CVE-2023-28370.patch      | 39 +++++++++++++++++++
 .../python/python3-tornado_6.1.bb             |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2023-28370.patch

diff --git a/meta-python/recipes-devtools/python/python3-tornado/CVE-2023-28370.patch b/meta-python/recipes-devtools/python/python3-tornado/CVE-2023-28370.patch
new file mode 100644
index 0000000000..b8b6029753
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tornado/CVE-2023-28370.patch
@@ -0,0 +1,39 @@
+From c5674de64189ac407e6ace51bed08899f267ae44 Mon Sep 17 00:00:00 2001
+From: Ben Darnell <ben@bendarnell.com>
+Date: Sat, 13 May 2023 20:58:52 -0400
+Subject: [PATCH] web: Fix an open redirect in StaticFileHandler
+
+Under some configurations the default_filename redirect could be exploited
+to redirect to an attacker-controlled site. This change refuses to redirect
+to URLs that could be misinterpreted.
+
+A test case for the specific vulnerable configuration will follow after the
+patch has been available.
+
+CVE: CVE-2023-28370
+Upstream-Status: Backport [https://github.com/tornadoweb/tornado/commit/32ad07c54e607839273b4e1819c347f5c8976b2f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tornado/web.py | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/tornado/web.py b/tornado/web.py
+index 546e6ec..8410880 100644
+--- a/tornado/web.py
++++ b/tornado/web.py
+@@ -2771,6 +2771,15 @@ class StaticFileHandler(RequestHandler):
+             # but there is some prefix to the path that was already
+             # trimmed by the routing
+             if not self.request.path.endswith("/"):
++                if self.request.path.startswith("//"):
++                    # A redirect with two initial slashes is a "protocol-relative" URL.
++                    # This means the next path segment is treated as a hostname instead
++                    # of a part of the path, making this effectively an open redirect.
++                    # Reject paths starting with two slashes to prevent this.
++                    # This is only reachable under certain configurations.
++                    raise HTTPError(
++                        403, "cannot redirect path with two initial slashes"
++                    )
+                 self.redirect(self.request.path + "/", permanent=True)
+                 return None
+             absolute_path = os.path.join(absolute_path, self.default_filename)
diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.1.bb b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
index 1dedc51029..d4cb58febc 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.1.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "http://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+SRC_URI += "file://CVE-2023-28370.patch"
 SRC_URI[md5sum] = "f324f5e7607798552359d6ab054c4321"
 SRC_URI[sha256sum] = "33c6e81d7bd55b468d2e793517c909b139960b6c790a60b7991b9b6b76fb9791"
 

