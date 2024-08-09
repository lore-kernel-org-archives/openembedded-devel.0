Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C81C531DB
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 16:32:27 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.88288.1723221141888872516
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 09:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RIOP71TH;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3685a564bafso1029795f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723221140; x=1723825940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woZRl8PltuDzB6tF+RON3puWkXx5ofrq9cMeO79kzTE=;
        b=RIOP71THrqjH9Mr03Ge7nAngY9+K4n14LD26pujAl/BPtF9CIzYfXcNwv8KgaJsK/j
         8Ze7WKHWFlrVmKkhirxFiuQRfly0XYi7ed6qcXTcObpyRrGLBYAXaMJ08MINYPzqi/s5
         aQtRzqUWOSqfH6CqOGB61P0mRAUXp73HJOAEyu0X/WX8522/ADPKD48BnR8ZUYINN8A+
         BojkkcEHg57pt+NWgw2jRhQW+LKb6IY+qrZwzFR5XD4qWIJovcOK1cSCJeqkeziWHbng
         tI3l2rBdgK2avEMdiI7HxkNhTJ5RdI9CPwyCi/xlRfdXPANLIJ1V+8AbGWW98iAXw/3Y
         45Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723221140; x=1723825940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woZRl8PltuDzB6tF+RON3puWkXx5ofrq9cMeO79kzTE=;
        b=psAdKKZjnaVcASTesr3w6Lv1R8O7zIqRphFlQyY4Hx//tssWlWrAdiGNDd+7Mzjk95
         984UkN8ZVnf7NpUWqbZNXNhpmtmK5wd1MMKDZYX8u3s2xcRFRtrAJoZdE4uCd6y2MKp8
         vwvOlj+usyoJagXlX9vHVpCO0822rq9yJw2QDyWUZzKSVwo7fUp/TpVoMu3LlUIn9cW6
         paKTByVT/zfaBJfQU+P7srlUzXjfVyBTSPjEfRe11DGlB47mH7Ujs8kJkQVRSqjsKefz
         hZ44KJFjYQXl7M1MWRa9XFNc51U0NRzOrCTcUNvnPlfU/bmI8GKvJmm92WNECBHhhaVw
         vAsw==
X-Gm-Message-State: AOJu0YxOKhAAmHHk53STV1M3Dz7yqiSp5vDAQlxsBAzEKr1y3RD4fDyM
	dH8klNKd8AqKRF95oHJ8CR/G5wsx8yIkMCGKq3RL/vlBHDClfrZPtBDXc9qY
X-Google-Smtp-Source: AGHT+IH+Bj9aHmyU0QHb5XigDpq9qHE5R0xvDcdDrh0B0DUf3x31jONcV6uQDTuagn0bnjYtjKa7Ig==
X-Received: by 2002:a5d:6803:0:b0:367:f104:d9e8 with SMTP id ffacd0b85a97d-36d60e02f63mr1448201f8f.47.1723221139865;
        Fri, 09 Aug 2024 09:32:19 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716bf49sm5789123f8f.25.2024.08.09.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 09:32:19 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 07/12] python3-pyjwt: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 19:30:56 +0300
Message-Id: <20240809163101.8416-7-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809163101.8416-1-alperyasinak1@gmail.com>
References: <20240809163101.8416-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111718

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-pyjwt-2.8.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
index 92a8f44c6..06d481a3b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.8.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 SRC_URI[sha256sum] = "57e28d156e3d5c10088e0c68abb90bfac3df82b40a71bd0daa20c65ccd5c23de"
 
 PYPI_PACKAGE = "PyJWT"
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = " \
     python3-json \
-- 
2.25.1


