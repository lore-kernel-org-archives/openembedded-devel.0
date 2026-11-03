Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7979.1793701473042332231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=PTuJ6xS4;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso37906275e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701471; x=1794306271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rhJSOyTdJjvmvUVzZ7quBwjvLRXuIYjSSMd5ZwgqZC8=;
        b=PTuJ6xS4ofFJo0F+bX+i7lsY0iM0RdC/v9GYth0vQqjH2nfcvC3dFpdvjQ+D/ESZKf
         4N7XgGrs4qZZx5kyFPz2BCg693TkgyVJftV0PB6vm1RdbNc/rO4HYxl5xPuEm7WBrxkP
         lCAMcK8riRGy2pFYp8D3W67jOyk9qo6vUso+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701471; x=1794306271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rhJSOyTdJjvmvUVzZ7quBwjvLRXuIYjSSMd5ZwgqZC8=;
        b=H7rZssYRjQB7Hn+LirMW6IYqDYzbdE1H5V/EiiGsnQegMyDyjgADpn0xVvju5bGd0H
         lJFXoVcbLRFyl+DEkM4iCfbwMu07FUxGrBy44zckjcFIZRFgzuD6Ih2qGFgjMiijVRPM
         WxlXuNWWPiAKR6cuBg+6v/GTX4cBUdmAzwyEJkmZFcOd5wsrvrPig3qLkQipVBcNhS3P
         yHidvtxl80N9oJReY3Wqsfm2faWxuqLb2GRuSJyIXQJAcmSjOV0o3ICire9SyAFSLDzO
         ESVyLbHXzqC1tX3C9DUyKh2Hnv3OWid9fe27w+dwW3PvjrYCrIESgXwpJkHjYLXXsfcr
         U18A==
X-Gm-Message-State: APuU4Z9IDcIg1K/ZjYV7QixOqDIbx8M+uQ7tg0u1Ec3fl+I1RJMji7KU
	Xja4p9d4rQhBvTy9z0YaFkAPGR5EBXoacb/ruVonRNLBKWGV4UjvEAjDQcIvqdUeYqfCSmemX4D
	6S8yY
X-Gm-Gg: AYBFou0H/6W1d9LiBO0XqPvjAu2jvYKO12fs5GKQiVPeGoT8RTMBkVTdvfAGeib0lRf
	g3FsO0pNUq1oqdqUWYVbMZqPsOtO6dauVNT4WHr5fak5WENBRuZz5gn4GSV0UsYPiGLAUsskvOT
	k0ZsgwCfy/2Ziog9e4HYiJjiGzAUvEDtzE3cR0g8NJARPF/3wg8LKK9EZigVGgTbZIDPi3bqmrd
	LII5folsYm7Etsl2yclIQ1ZzrXA1TlHapiSyiz1XRHXyzHNAuZRcgv286ux3pljhBbgUxYQ1xm/
	jvIFJIcFw4s7dheGYt+TzhBa2ONGmGafO1ELjmSBmhPF4ScYJnUF55D6g159ldEJ7oKK5MTLRmT
	K9bNOCYA361ssx8DU5qd+H6HRGhj2hGS5xELqe9a47K9LxLrbJZ+2HnW9PZTBYNauSB79G8VkIO
	cHM7T108Q8gFpC8b+WNKBRNTIf7eEp21g6mG6ossiOQG4lOEa/vPQuVLcwyRiiC0qaCUvkshLrK
	P1IlBElXpRa99oz2SR9m4gpmXYHUq0g1/Wzf+OvRlublcykstY41u5iYMXQ/xMdQic8hsUxtCNZ
	nDLaDQs4GLIoSj00oMW1REIkHMpusij1wgdQf3NklX4FLDzjpKnJQgR3yO0CPVOxa9Ka2TAAf71
	jSDBmf5P6+E0xOrzbuqiOLqLviJCYfcSdxHjMCajO+NFUESKiY6Hmsw==
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr306241075e9.29.1793701471193;
        Tue, 03 Nov 2026 02:24:31 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:30 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 22/22] python3-zeroconf: Upgrade 0.151.5 -> 0.153.0
Date: Tue,  3 Nov 2026 12:23:50 +0200
Message-ID: <20261103102350.1952237-22-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131785
Content-Type: text/plain; charset="utf-8"

Upgrade to release 0.153.0:

- Drop Python 3.10 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-zeroconf_0.151.5.bb => python3-zeroconf_0.153.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.151.5.bb => python3-zeroconf_0.153.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.153.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.153.0.bb
index 4111f49a11..e902ae6959 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.151.5.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.153.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ede793c8b5508eab1acfad7c0c4e335"
 
-SRC_URI[sha256sum] = "28c2ec9d772007eedf11b41a9c9fd3d5c684c17b00721ff8f1ee31b20ad286a1"
+SRC_URI[sha256sum] = "28bd0baa208f4ea481a386e9eefdd3a65663fada34233432301a0c221d741d1d"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3

