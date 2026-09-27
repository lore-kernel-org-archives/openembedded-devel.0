Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194F7CA5FA0
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:33 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34496.1790506227638954703
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TwtGUaeF;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a8568e9so925509b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506227; x=1791111027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLNwOQrB+HhP0cPRDrzF+xRl77HqsEWu+poC+VuaF9s=;
        b=TwtGUaeFQe+uAaBCMgkGI/GyHWc2EOovJOrNofEbyLu6mJeLil038Rj2g2mvnRhU+B
         Mdfwk2TBkNdO2z8w17Lau68gVo5WzdNDJTa3Bf2EuFyAeNEOI4Wf9JaY0BF7nXk4yYcP
         MCtDGl0up8w4ZxRYgUdqN6LunoMnj13JWAojs5ItADRHfa7b543V2REXYrq+ywgAQ5BB
         okZ5k0KLuvYgFfRg3DyXhlW2tiQHDFnS/bAR4hChLi8ZMJEh8dJI1yLYXMJ8s4eIs/uE
         P4/y38dMqgAdvEVNLKvIcWQgYf5lzVOYoOwXbSmG6G9cWUeLVE4VvhJTRMkMM3aZfAfZ
         T7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506227; x=1791111027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLNwOQrB+HhP0cPRDrzF+xRl77HqsEWu+poC+VuaF9s=;
        b=mR3kyYYFWjxXBdAUFHfog/bBinSAkgFX6ZWC/cue4R0YMSYpMPUDVccE5suciPRhQh
         1kCkxnbZkpC/5BBMbd6CSNQcyRrBKdTZj3WiEDZeTZCgxtyC+fM+Akhwzy++7IXDL8kW
         oLW8MZt76jYL8NDMGlzN+KLAElyVO1l398QY5HFvEzxqnXLmivSqXsKhmB7sm6lyeadQ
         Q2OjsizCEqO7oz9PJYwUtUOrRRWD1+60rM3MxfLZ6EXnJBYLkIL/AIkTq34HILFf0AjZ
         eaIRmQLxe2u3mcEh+aFa/cyXD7DyV+/xs2uk61RGDO4v9eI3rD62J5dUfkG18zxusanq
         lFCA==
X-Gm-Message-State: AFuF++lELUyFs9Hm9K/vOcu63caASq6pr4WSsD5H9yjEF6h8dUO1AMBR
	++7ap493W8ZBvjPHdDz2BcBaVlNYvcK++/NR8pJMpyF6dndeAMwM9y/SA4nosg==
X-Gm-Gg: AYBFou1BDFwq9fNaeKJnbHuJ7GW/QDJkofka3TfY1Gc9fCtvzB1NzNIXbEe5Aioq55T
	0rL6R9lcAZQi7riRYDdAQm3fuhsqKbXhPIGzQJIF+2rYoO/uZeahKXoLfSS6ljb+TVOZNOvKXC2
	+gyWMdXExeIBtYNt1o4rk2QYS2UiF6UrSc0YLQVW+mYqG0BVXEMcM5kGc58pKQ4iJvxTv7Xwxro
	m2YM1y6NJIZijZ6JmoV5D9xp2RqXA2uRyAg26Eb/C21ryj70T+6ooJLuHAzlFZdThhhkEVZwr8w
	hc2sMo3PjvXws/I96mkE5HBZskYGJxVI2Wmj/eMsfLP669m2YLePr1vdkDjpMhHeyPGDi7L5ySd
	p4dLaz6enCheyYJ6WmgCkU1Bc/0JPVkh+tKaSVu2BnUH24/SW4Y2thw012OLzO25xWsgl6g8RSj
	mQkr34HZ1GmXBoGb300ZWMo4icT/p6hR74O7s/XAdP9f+Cyigc+/PkyOLUmloXH+bzN5KRnA784
	ncbjs3qyBnTi89GIuBriuvTH8ZcnYqzSw==
X-Received: by 2002:a05:6a00:12d7:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-87e9f0550ebmr9049499b3a.37.1790506226915;
        Sun, 27 Sep 2026 03:50:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 7/35] restinio: upgrade 0.7.9.1 -> 0.7.10
Date: Sun, 27 Sep 2026 23:49:34 +1300
Message-ID: <20260927105002.1832451-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130341

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/Stiffstream/restinio/releases/tag/v0.7.10

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../restinio/{restinio_0.7.9.1.bb => restinio_0.7.10.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/restinio/{restinio_0.7.9.1.bb => restinio_0.7.10.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.7.10.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
rename to meta-networking/recipes-connectivity/restinio/restinio_0.7.10.bb
index ea44be5169..cd86395882 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.7.9.1.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.7.10.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=d9ef67870895758240c3889695ad2558"
 DEPENDS = "asio fmt llhttp expected-lite"
 
 SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v${PV}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "4a0429e2ea4ece200228226f0c628ecf9ac111cb6a6b12ad857de84c0576bf80"
+SRC_URI[sha256sum] = "15d60b0c96012a911e67226c4ffb50db4eea90a51e503315c17cb978f9a73d20"
 
 UPSTREAM_CHECK_URI = "https://github.com/Stiffstream/restinio/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"

