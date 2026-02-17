Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66ABBE68170
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 10:31:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9267.1771324270149050832
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 02:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gygbrKxP;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-481188b7760so33870665e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 02:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771324268; x=1771929068; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2auiRHpOgvpwZKnb/PJGNhPhYYBK0xEUPzUkXPSIiM=;
        b=gygbrKxPou0YdsqkYHHTySPA6MTt7bHctL9E1Wj1ZhJrwvMWUhB6sAJRfrJ6vvQFNt
         SBr8rnPPBgENat37h1tPBfKevjSMzCdyMuhIbMBQAlGj2jX0rXltyUjKIlAUCwJC1bpZ
         27hkPOTQmtB/2RlE0UEGkjqO1iFXlj88uJHz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771324268; x=1771929068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F2auiRHpOgvpwZKnb/PJGNhPhYYBK0xEUPzUkXPSIiM=;
        b=MnPD5+JOQNN0eGv5b+c5TqVLfKGlcdtVEc7jEbHHg2SFMZsqDAvHCx8kUzMmHczBXD
         Fi2LpHv5HhbqsvH6OQCDXZ0hcn0L5yyoGnD2cmTWbPR1oP/cpFlv3dikEz+xHUSSLpjN
         mSaTPOfDdljkI4yu53NgwIqWoQLNUZxNWyAOCgENp3FKiTGhqOT92AHei3lgFxdQ/ajw
         w26o/0WW64ZJPgLt0XrAoalzgD3tSXBI0iBcoYJ+JJBXuB3gBgDQ2j/hbOtuUmAWql7p
         +4vZsaa9z/e6uQq1vI7uzY+X0BeY2VyqLs8xANGaNiieCo+keDA4y3++/lk3Uiw0GQ6b
         SQMA==
X-Gm-Message-State: AOJu0YwBtpnLi3xBMcOsMs3qu6tnsJwkDX7RFVf0JB3DCGe2eifY8FnC
	M3LZRuy+UlZQec/uykT0va/gXhaHSgRRAVGfOot66QCGZr1dZEIWX3azSvD7z/KODQiwONazlxn
	M5+sx
X-Gm-Gg: AZuq6aIPELGsFuWWcSfvvFn4bgPoEFBH3d+19Yd/v2W2TTn0KKBKaxBc0L3G+TJL+IW
	7/uC5GHtaABtyZvJSV++FtVFcUyj7NTiC9vwY0nurLHsqvDG/+ti+nULZoNgokHpu4s4X0c0J1j
	0ZSp0vBmLe9LnEtT9qoFMMe4EHWWVXOm9w62tVm/iOSwK4gXlUrgBQ4FvVGVuKSdb9Y2W7PKEO3
	9qttA8lU72ulPGIi7NwoNZpl4RM1wP4BDc6FV/dpKP9U3Uh0TTtQViv90kwkGvZUghzOfYwy2uq
	uNlv8UqbFYu7Nu0OrBC5AJ5qQhrBA5z4MgpeDskZYTJvSjNDjiEWugYceo+Dt1Kx/gNW+Km7PWI
	5Xy84vELUjlpAvvEARh9p6s5SWhwNU2pKwxvLYXNYgj7nxpKI2xqGJyt6hvjgVageTrCELFMIKi
	J2PIq9q1rP5Cx6HLQ9CA81WtxGHx97P86U9Jo/
X-Received: by 2002:a05:600c:1d10:b0:480:6852:8d94 with SMTP id 5b1f17b1804b1-48373a45d65mr213387675e9.27.1771324267502;
        Tue, 17 Feb 2026 02:31:07 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d82sm33305378f8f.31.2026.02.17.02.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 02:31:07 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-tox: Upgrade 4.27.0 -> 4.36.1
Date: Tue, 17 Feb 2026 12:31:02 +0200
Message-ID: <20260217103104.2849723-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260217103104.2849723-1-leon.anavi@konsulko.com>
References: <20260217103104.2849723-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 10:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124446

Upgrade to release 4.36.1:

- ci(workflows): add explicit permissions to workflows
- Add architecture documentation
- docs(man): add Unix man page and composable CLI argument
  inheritance
- Add new logging section in documentation
- Report TOML parse errors during config discovery instead of
  silently ignoring them
- fix(execute): adopt CPython subprocess stream handling

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tox_4.27.0.bb => python3-tox_4.36.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.27.0.bb => python3-tox_4.36.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.27.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.36.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.27.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.36.1.bb
index 4deacdb3d9..98646b44a7 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.36.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "b97d5ecc0c0d5755bcc5348387fef793e1bfa68eb33746412f4c60881d7f5f57"
+SRC_URI[sha256sum] = "085ddf2e6ebd2a5be04ae8f4a2c6422a7994a4702b3c187edc4e99f1e7ccdc2a"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.47.3


