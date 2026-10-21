Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2930.1792600038645625555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 09:27:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J8WXyR3t;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-675676afc3cso967263d50.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792600038; x=1793204838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqAL9RaW/OS0m7HuMP06qaul/hRiwEw2nZwV7TIXI0w=;
        b=J8WXyR3tPYRPiB54AW6I6cgJSpzu2kci7S0qlwrH6ziclr2FDfj1dZZszzrWAdC352
         wRxUvw/I7Yhh+bk1O7vHraWV3qGzRpK7U33+1CCPVlK4uunyVgTrbI2W7r0cUxtHp6Xk
         Pw0/L0z1C7+JDg+ZdouGhc4ypRys08TwvmkOvfaMk/9OTR+ujA0s+YPn7X1NJFibG7vV
         rmrPN3PXFvzsQOhmLLhKGGpwdKWez9YNnulzExK7ThGdALlnz9X/Smti2dS0EHVbEKe7
         3GvuNdpGDTfCWjWZTZ5LS6B+x6ECW/nj5m7ExWR1Aif6GzwXMEP7xuGyO8naIFJakKZ4
         Xd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792600038; x=1793204838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqAL9RaW/OS0m7HuMP06qaul/hRiwEw2nZwV7TIXI0w=;
        b=zIJgpJJG+61aNc+lSGQTfbt/pDUYsWgsfwZvIY4tmYHEknMcBB5ILzgot3pqdpzkP5
         2zy4NvsH5gMSvobTdKulcA+gkXt7E1M0txLMfTpmcBVTtQegMiiebCy8aPdovkBDg7kq
         qvv5Gr2htVW11OmUtp+ORpd+CFnx+NEFBM/fA5/tkxGaAo/cpulTqve8eEJkRulWIYEy
         OFnTw1IcfUTxx71yiIjCYdu8Yy4ri+g2Ft3h0jYBb40T19Gd8YedjnuAKad54d0wvETL
         nwFosCTjhTNiRb13uAeivs5U+CV8vTM9ASD7YNoNVB/YWJE3j9Lr6aW5COBPmByHHf4t
         ikaA==
X-Gm-Message-State: AFq9FYLCj9O5octEtIoNe8r7Cgh3kHfSyhv2KeuzCMci/fHYr8uqdDsq
	nv+L+hhxYJrqFuBeKIUUbKa0PjmFVRohbIsi/MG50pCJwdNTbzdyiiWlRFRN9Tw6
X-Gm-Gg: AYBFou3hnrgLSF5QEjW4u59n/tWPYOxBWrZLC3Stn8vwNNcOrU9uWnwFgUPe82t7juv
	UPymFDqVrkzSnLfXhQrgBZQuS+0YdwiTRuGCd/TaVgTVX4Gdxi0NaiFSdf4sk3LI0cB+ympafDY
	wljnBFzfqxTh/3NJbgx8WQxO9/tWFug5G4H1JN034eJay8mqCTl4YQWXwGLwjGsuYj0l8U7qf1M
	aGXX5OezYH8Redxj/roRHjyk/z+Ok/G/3FbfTdK18HCPZ5L5IQUfMc/FsNpfQTEqPsvPMDEabID
	WsbVq3eZKCIaBWGerFo+3BpOL0yL+1hX/TVxPwVMihO+T2K/QY3NCGCEbfIDLs6l3BCYZCB5MWz
	rSCnQ9quFWKcQdmkICRh9bq/gviK9LWqCIsI03vrG38TMEURuIFRrr7AJupYuEhpUKTEFCiyG4x
	4R9T1J3xLEuuscsAhYyGykVxhjSQLg5jzV1ngoiy2nKTPMfSQE5Z6I+H2UMxFgExgkb4IXptp1Q
	i7Zi+qrZEJ1HocjZt0+bYxoHe7FlvjtA7v0Ub7YSUjFq/ZpvJzKbS/pWyeZ+/jy0ljblPEc7AyR
	z0sU78dhCSFGRVDuaKZpsaj2TH6kqFN70/sFuJXF3Fj1yTVfpsK8o0e8cCvap1/xaQN1RwrNdSf
	G3dk=
X-Received: by 2002:a05:690e:1094:10b0:677:b8bb:3443 with SMTP id 956f58d0204a3-67a0e46b3e6mr990678d50.29.1792600037604;
        Wed, 21 Oct 2026 09:27:17 -0700 (PDT)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.54.204.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a0e539f46sm1294418d50.17.2026.10.21.09.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:27:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.34 -> 8.2.35
Date: Wed, 21 Oct 2026 12:27:04 -0400
Message-ID: <20261021162704.3928361-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 16:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131303
Content-Type: text/plain; charset="utf-8"

This is a security update.  Fixes unauthenticated remote code execution.

CVE-2026-109618 CVE-2026-109619

Advisory: https://www.php.net/archive/2026.php#2026-10-21-5

Changelog: https://www.php.net/ChangeLog-8.php#8.2.35

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.34.bb => php_8.2.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.34.bb => php_8.2.35.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.34.bb b/meta-oe/recipes-devtools/php/php_8.2.35.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.34.bb
rename to meta-oe/recipes-devtools/php/php_8.2.35.bb
index 41a4a4a4e6..282427d8b3 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.34.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.35.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "0467d63a819016811d35fd14f734764813ab149750379790634294c723cd7562"
+SRC_URI[sha256sum] = "0f43efd1ac24d4f90002c8d4d570bf4c4d59fa14313bf270aae8cf04d9dfdef3"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0

