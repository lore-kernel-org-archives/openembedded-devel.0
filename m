Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9484.1795678534736580435
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 23:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@streamunlimited.com header.s=google header.b=ESNA9sgW;
 spf=pass (domain: streamunlimited.com, ip: 209.85.221.43, mailfrom: peter.suti@streamunlimited.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-498f5fa5103so3924457f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 23:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1795678533; x=1796283333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iA0/+p+SVG/ymVSApqrMzZsZ4tC0OQ9RrppZNMKJRNc=;
        b=ESNA9sgWkvDTirAdZPpU3Gl5vTExT0LvWC7yK2W3rQsQ0iJqCTizC13377XB1m/nf+
         u1Nk9vDNmaIxfi+x0+s5c0SGPDyBoLSg5Bd3zyp1wvqTyQZtUwzg0Ahcm8VyAECLGpSj
         K14JHwVDqXU1gz19QpN7lrE1r7XL3KyRm+XZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795678533; x=1796283333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iA0/+p+SVG/ymVSApqrMzZsZ4tC0OQ9RrppZNMKJRNc=;
        b=B5ih2uSFNUPfB7Qj/6d9RsAI3ZE8UgqRhJtbhn+HyFRf0GWRGcoKbHf0bRKOboD/XA
         T4iMtpVRHKyZItoxtCCP2nsKh0hgjYK/T7T3Fhb3P633OAMXs+9lbBsgITf6fYvv6pG6
         me9JlaJj9i2OHfD60z2NKfItLZhsCvsqLPOIleuySbA/3yoQadWoYzDJUlRGCL2ug+8F
         vWVSPkUI5Y1X4yrwLSvRO3yjJqkpB4Xm3p6EtrKJVS7njqtrHZyC1V8mdQSHVtJcMyGv
         rsag84kzQXNgEgfStFFsH9VTub1Dcfdb4LLKZOvhwCtfGWJ4i+UmwIcZKp30UVQbMD+R
         M1KQ==
X-Gm-Message-State: APuU4Z9wE8lgfUquaxxA+aF+lCN2fXN41KfYW3SEsfFbeXYVQgP2cF7J
	vJHCMhPiHXOUCsi6DjWxTtSJE+9kTMoySBmjORrZ7wvAaSxQrgx4bKkHbYTqH8E3gQWAZncSeyD
	C+S6c5acTHQ==
X-Gm-Gg: AZFdTZcy8qlxh3x1yOgFMP+jBNRFfAUIJJNEOPfGiNO9O9blE+7g2gJHG4x4PefaSlb
	LMRthNgWuTlnCJTg6ekLT8a0f8rMkLt1Ygq+kuJtYOfu3fXy1GohT/W9nbOc43FngKbRnGBAOlT
	0oUq6JgOpGCkRcPEVcw3C+Uh4IdqvrQyqjM10oCL5xnk2uVfyiWyPQFjvOVx2wI5am1mrIpoCNB
	gLHbs/uKLQk0hmI6OxTWn0IUK3xFrUjsqYEqn7QFXx+cmxl71ylNbHh6cAZCKN0xdcZzlOJMrsy
	+KFlScGjRa0zSCZzV/XRluQq2km+tFKk5x+HJlN3gyqm/IVAoe9PJRdQGoAFUxBGtY17PI/9rYq
	IdJ+sntlwThBZSYc0XN9PWNRDA9ywmK31D6zYyjqdMpcDFkhpMMUJRkV5vz4erHNPvZOV90YLmD
	iqETW5x8cBV9LDOLPKONdwwaR16ShxxQwKkBpeiEu4BmtFrBO2jNfx+GBbtXWHfHM8q9u7IbkaI
	v+Z/D2FartQHhQZuiM0Dq82bK012KuuFBRCbg8EX9Ckb6OTZZnKZ1kNvgo+QyO5tXdW18nnic+b
	RHJjY8UZySdEM7L4BDjp5WJdj78dlMcGTIKHPP7DdUwsfWYa76SLKDrnNEitZ02WobS0q8s1ZYo
	S
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb88940f1bmr401632715e9.34.1795678532699;
        Wed, 25 Nov 2026 23:35:32 -0800 (PST)
Return-Path: <peter.suti@streamunlimited.com>
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm38483210f8f.37.2026.11.25.23.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:35:32 -0800 (PST)
From: Peter Suti <peter.suti@streamunlimited.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Suti <peter.suti@streamunlimited.com>
Subject: [meta-oe][PATCH] conserver: only inherit useradd with systemd
Date: Thu, 26 Nov 2026 08:35:14 +0100
Message-ID: <20261126073514.48187-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 07:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133088
Content-Type: text/plain; charset="utf-8"

With multilib enabled and systemd not in DISTRO_FEATURES, parsing
fails:

    ERROR: .../conserver_8.3.0.bb: .../conserver_8.3.0.bb inherits
    useradd but doesn't set USERADD_PACKAGES

Without systemd, USERADD_PACKAGES only holds whitespace. That passes
the "if not useradd_packages" check in useradd.bbclass, but for a
multilib variant multilib.bbclass filters the variable through
suffix_filter(), which returns " ".join(val.split()). The result is an
empty string and the check fails.

Fix this by inheriting useradd only when systemd is enabled, as the
user is only needed by conserver.service. USERADD_PACKAGES can then be
set unconditionally. chrony does the same for its privdrop user.

Tested on qemux86-64 with MULTILIBS = "multilib:lib32", both with
INIT_MANAGER = "sysvinit" and "systemd":

    bitbake -p
    bitbake -e conserver
    bitbake -e lib32-conserver

With sysvinit, useradd is not inherited, so as before no user is
created. With systemd, USERADD_PACKAGES is "conserver" and
"lib32-conserver" and both inherit useradd.

Fixes https://github.com/openembedded/meta-openembedded/issues/1058

AI-Generated: Claude Code, Opus 5.5
Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
index 8a841bf97e..57b50f30c8 100644
--- a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
+++ b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
@@ -17,7 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b28513e7b696027d3d2b8dbf117f9fe5"
 
 DEPENDS = "virtual/crypt"
 
-inherit autotools ptest systemd useradd
+inherit autotools ptest systemd
+inherit_defer ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'useradd', '', d)}
 
 SRC_URI = "\
     git://github.com/bstansell/conserver;protocol=https;branch=master;tag=v${PV} \
@@ -81,9 +82,7 @@ RDEPENDS:${PN}-ptest += "bash"
 
 SYSTEMD_SERVICE:${PN} = "${PN}.service"
 
-USERADD_PACKAGES = "\
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${PN}', '', d)} \
-"
+USERADD_PACKAGES = "${PN}"
 USERADD_PARAM:${PN} = "\
     -M -d /invalid -r -U -s ${sbindir}/nologin conserver; \
 "
-- 
2.43.0

