Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.462.1795102827984498386
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d7lwnzan;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14724665e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 07:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795102826; x=1795707626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iKmxbpMixKeMckjlhZx3BhHnZrkSp/htl5cFaikVWKs=;
        b=d7lwnzanqKP+Zy75xZ09k2Eg2hEOvnvJwWcNOwhH/CpTXV3FheEepwtNAwTw9rDQWZ
         PN3wOmKBIxGtfMjvXmIy4IYQaCulIwtQocqL5rcECBwMWjIvw1jIXcTACE5hCbTkoeFQ
         sJ0BJUR7Xp9tc/PUsWYaxma5eiEpzpcm4izh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795102826; x=1795707626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iKmxbpMixKeMckjlhZx3BhHnZrkSp/htl5cFaikVWKs=;
        b=LnKnmNO/bU1uwJq/wB9WFxIasVwg2k+NlXAB1hupdN5pT/jqGr6KsYPsMU2FNF7uwe
         YwF8VQt3PYXSUSW/Mj0IT3WdOQPCJvNEE0R1UCNaF4+XiwtXqz6ZtEzLugiADtHreEYm
         9ypC7Mq2fYOsuL5+55j7xZWvoJG1h+YIC18V6VTkbTm+VR7xMY8LUzop41Y23ngmux7y
         zL6QppAD5+HN24t6MeoX8qKUozAkCQqzRUqSZT5mS2BlqvtfrsxLqJVkfIeildCxo8yY
         QT7digkkOy2PRT+zEZMsNGKp306ECmc4FZvGDM6ib+b46aunkcVyp80zwTSh09F5356s
         Uy9g==
X-Gm-Message-State: APuU4Z+9JPFBtKwm7b8in9yoGU5ig2oF7SFp4p06YNPJAI3KruqkusRr
	DNbzUSZxao8fwfoGoluj6PqtGfRVntZXTeSvizezMZ9U+kLD0glFfWWsBheykNsVQhtd6/SEX9V
	PW/Wf
X-Gm-Gg: AYBFou2mgbCYoTdbEPz1W6zEg13VRPvveoQO5+UnXWVcm/Mbs3BiJ03rP5sZltdUTpB
	XxlWoMJhRevYXRTTR1qMfMQ/UbF6Q74qSsXTwEUkbY5LQVyIFryno0E34QYurGwqYFgY/WgjqmC
	lwJJLMYHzYsNcsrsDWaCCVZgLLNX4KV4N4Tb+DlFUoEJ/Kd1RVj45ev0MT/MvOBRXvLP1ij3ppU
	hSSQPUHkm4/pWy/wAvvE6K4Vf5ciGKOv4jzeMxqdNVo8GRUTG9zgVHkVvhtj15QwKWnG+nqECCV
	ATzeHLj2V0Ljyq5ULqnJ5zEGTWNVBfgyu9PMMJ8CXjlviqCPqfqV48yV9rg+AJPWviJ2xCxpgrb
	jWnpZcMMJ6Abu71MBfNdPk2OgrqWmHuDv6BxNTso6aNHAfDh47j0Z6UkiB06IelSBEYcxEM4n9Y
	I6kWiCwVyY8DCtbltvogOsTZwmWoFImgiamSCu6q6ZPwLiiETE+BIFNecJ/eS4tmU34GgManYko
	RSjePDymLhYO7Jb2g+1/6tP3nXo+0sLsrz+2mviMvyLxhWAxfE5j3I/M1fHQft7iYKQMLT10b9g
	Xu1FhgkleKgUHgtzyjGVjqFiVeWjyliJzcI9UAOGwx5aPpQ1qvW9WSaESSvmJTby5k7gx+r4mty
	tqMS004C7haV8bNuyRIOAT2hWgpOI3WQaPa4hW3lNHY+UQUEeyXM20/31DOa487z/WJidk4bAYm
	8=
X-Received: by 2002:a7b:cbc8:0:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb860f6ae9mr28445285e9.2.1795102826299;
        Thu, 19 Nov 2026 07:40:26 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm225495f8f.52.2026.11.19.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:40:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/11] python3-regex: Upgrade 2026.11.15 -> 2026.11.19
Date: Thu, 19 Nov 2026 17:40:11 +0200
Message-ID: <20261119154014.1039002-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119154014.1039002-1-leon.anavi@konsulko.com>
References: <20261119154014.1039002-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 15:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132686
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.11.19:

- Findall: return strings for a single group that repeats
- Fix locking of scanner/splitter state shared across threads

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-regex_2026.11.15.bb => python3-regex_2026.11.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2026.11.15.bb => python3-regex_2026.11.19.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2026.11.15.bb b/meta-python/recipes-devtools/python/python3-regex_2026.11.19.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-regex_2026.11.15.bb
rename to meta-python/recipes-devtools/python/python3-regex_2026.11.19.bb
index 7543845702..264b95aebe 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2026.11.15.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2026.11.19.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d6ec7e29e62ebf93ab2a593d1137022b6025497d8610e5cb666d52f9ee5bb0ce"
+SRC_URI[sha256sum] = "2826a006b68acfd3ed5074433caafe21d7f9d026eb82cb856724a4a893a70915"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.47.3

