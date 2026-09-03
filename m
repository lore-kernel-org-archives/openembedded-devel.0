Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9F6C624DB
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:24 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4193.1788429015925575589
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RW8ZaDuM;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8557c3f270eso1325118b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429015; x=1789033815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CA3EgUX6ufWUvu7n6WLdjqniUHZ/Nfd4qdZ6+mr35T4=;
        b=RW8ZaDuMWvwP89NgyL0jndN9XQJM++gQ8P20Re/yYNU5hlFe8Ut7Hf1/v9AcPBtEKF
         ElEuQeZSqhlW6ue0yeUfxB1Vckfq08v5U3m4xQbDz9QyMHQHL9jIx3aveb/IhVOUW9KR
         /5OVureun9FjDClldAkRqPAhkkVWfIezwxzdxlJjO7Wv2SG9NHI69KrkMhiz/EcnNyDd
         4iLXxH8pFxB9n3rQvOXFbJ9PmFFuUkIbOKt1CvuILFLnlZaurDvoVchyL4DPMoiJJ1MG
         6DoqCbHtV4v58vvXMK69+MoEF64AHh/1cVY9nej9Jha3MrHm2rYoQ8NStP8uP68sENK0
         l+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429015; x=1789033815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CA3EgUX6ufWUvu7n6WLdjqniUHZ/Nfd4qdZ6+mr35T4=;
        b=YEaOJS4h1XgxZoU8eqPoIf6T6zqtXMfUapYyPrIRgUXS+eHEv2GE07ROCJ80X9FtKm
         i7H6ZifndCPXVkXNXghDaqqR4f/Z0cNcHzczrqVIKKSTUw90FUw67a3+96/JSmh66k06
         t8BQg1td/z83bRZqZQc56jJ6ZeWNwPr9crJwgFYPKGnmkPP4ee5zfRhPP3cMcGIxpMEk
         DcBRbwcoh0FFpGmVLi/KleiiWLptYG++dwclaNcrn8YHK9o4HK7wM/1auyDFiRyPEzS7
         4B3SihMrbBUpuFape5H4YOqicHlAH8Fdq8Xzf9FIj948sLr5YmAXLr2vKHR50pOMjgzY
         kdSw==
X-Gm-Message-State: AFuF++msnOoQhYxyzJ5mH3Z55qqwp3ycOEa9+8ZtYc1xQ7vG51TRXfRg
	OyoO/r0L1STA9Q5x0W/0rUTu+DspIuKbfeCSyRj8ym70Y7RkJfqI3kJDyn8qWAUH
X-Gm-Gg: AYBFou1JmzaBC8U98j1ASVBrOAL5jr7BDwKdbDJahE2qcR8ENKWHXZkqCZ4xoNbj8Uu
	iQOHacdBR3lbRDNh234BSmRFEWSM42dY4C2AyvdnWCVnSKx+TXEjiGcMJ2zuMCaaPoj+24S6E8K
	gzxLdlHz6RIVQ4cIPtZPGzo6s09zWZevAEhrrjSRbTxclL3gheexU084LaJARvoJ6yX3LCXnFGI
	QR1MsGFWcsino43++B8hJ0OHECiiEpHO4+vkOb+xKJg4/OutkeBvrGbBrH2nYMIOXVIV1yLqBqi
	R91sKnc/W6+13TioMgmacI6zbyQULN/6YuWHjZ+TzZtDyPv54AP+dM7BgHKiWrC0Sr6aYnq5OJE
	vq/U3dIVB0I9+rB/h0kphTHJqlcOmnpxOG5qNIVK4ZNz8PbM83C7/VSOycdoMJg5YyiEktRKaoF
	WUQHIgtUxH7XN/I5XCN4gWkUAD0WpM01sMoxonp9Hi7ScMxCkhzZmekRLNTZKPZXDT+oPe4mxTP
	jZDheYZUzI=
X-Received: by 2002:a05:6a00:4f92:b0:857:73e2:9105 with SMTP id d2e1a72fcca58-85ed94bb426mr14673642b3a.21.1788429015287;
        Thu, 03 Sep 2026 02:50:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 7/22] libfido2, libfido2-initial: ignore CVE-2026-40947
Date: Thu,  3 Sep 2026 21:49:38 +1200
Message-ID: <20260903094954.3240723-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129723

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-40947

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb | 2 ++
 meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb b/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
index 7d9838b003..053d1f6d45 100644
--- a/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2-initial_1.16.0.bb
@@ -38,3 +38,5 @@ do_install() {
         ${S}/src/libfido2.pc.in > ${D}${datadir}/pkgconfig/libfido2.pc
 
 }
+
+CVE_STATUS[CVE-2026-40947] = "not-applicable-platform: issue only applies on Windows"
diff --git a/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb b/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
index 09d34603d6..8595cbae81 100644
--- a/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
+++ b/meta-oe/recipes-support/libfido2/libfido2_1.16.0.bb
@@ -21,3 +21,5 @@ EXTRA_OECMAKE = "-DUDEV_RULES_DIR=${nonarch_base_libdir}/udev/rules.d -DBUILD_EX
 PACKAGE_BEFORE_PN = "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/fido2-*"
+
+CVE_STATUS[CVE-2026-40947] = "not-applicable-platform: issue only applies on Windows"

