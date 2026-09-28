Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3661C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:56 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46628.1790553829352375684
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GK7vjKuV;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso15378145ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553829; x=1791158629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ai/bXCQaTM9rm4/wcSsh5+fh1uv5kYeEh3dqWT7tsuY=;
        b=GK7vjKuVd98L5Z2vH0Q0EaeHO7JHX7HWcoxyr0VChXJmw0ESu7Z3BnojqtC2P2BPwI
         p1y2WjQc0jjMkUI9tWzh6dthQvvde7FgXC41DRLa7Arr79PgRQ4BIa8d+qoIaF4Zmmyc
         zzfZGCs1TAHYbe6yZ9vdJklnBrKFIEm1/MkDmYaaV82XJuX9tHgYhJslhr+0MxLzkmUi
         YWwiXBbV4c0+HJtSp83RZJ0pxTltSh5p0TDFEPuPWtSTIEUepPtnL4f6+ungY5F0DyWB
         qCAEAHG7E2h91+Y1AdxXg4Ux+Xb2K8/qWeFmTpBZIl0c1SxqFbr8DMQKUp2WfRWiZ20x
         Ilxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553829; x=1791158629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ai/bXCQaTM9rm4/wcSsh5+fh1uv5kYeEh3dqWT7tsuY=;
        b=kLm4k5LLx7gBH71l/V8XikdxV4D2Bxdc9l5my5h2/7MZgdx9tDV/JJM0H5eyXL/YRQ
         ivSpJwekjGmqdUDSiqX4j2LEmOiGji/YxvtLTsbZDTwNFs98IpE6YTogwpRaa0FSVZ9q
         2rTyusr0gNxgxalzbssZMuuJidelVaxLyhL5M52mG9Wb4Re5q6fijBQ8hT8eX+jJE5Yu
         lTA9hFRwjA7vX7xVtyoSkXYaZrReyA7ZLoag4NdehWnywr4+5Wsut3gOon8sRH2O+1kM
         WBkU0Ky6SOPLhuzETkO64zK5nxk1GTcjpZD2P6o+7f8W0o/DkUlS2duHtED9R0rYmjkw
         kRZw==
X-Gm-Message-State: AFq9FYLNEG/sTJhSPOfgt+rnKp32MowrUrKC+UJwHIUvabBuSVTa1GdU
	3MUI7Rt8vhaJj0hVC3fuZHmQerQrG2+CYnOr+qGhL319jvzy3GjAYGULwuUZQw==
X-Gm-Gg: AYBFou00CxytjwY+Jlk0snR09Anb87l1Mo97NsjfjbyC5CqGKx14e83OK/LgnBuMHgw
	T9bLTvGI51h4JE/UDa+3LuLdQmV2CltBh7H6hpJoYL2wLxfwr/i8phVxt7JM5Fx/Kh05sn698mS
	4Rjpk30KqtIv234K+fpXMjdHLyPugmVrsSVMy3ruVYVJ0nfdDD5ZbTu7Ytuk+LYDLr6TrrAlguK
	v0k+5KJUyVgQdNsGWm8YYoppSfED69gc+32mjtVDQiyBm1n5Mb17L1a2DqXRnKYm9kWD60LaipU
	crqyaFlQ9TFsglzCzHUqG2Wk8Z/aufoE8PnDRv47jSzE/mPj4Z7bGMT1CiUrvfiBB4OPMAdg7wL
	aeDGK0nTipaC4JHLyagIJpVhJIv74yl/em2lBlHNNcXkRlZ7J8fhhhCCDyW+NDP2ff3aB4ribwP
	XQXvzccBGPaxpGYg/KkO8PTLcaxnnk9z+BxN3zq7QV71lFGp7vKzxOJgX2FvKnM1NqIa2lhqKv9
	DNTsdeWoZcqE6ftUUNvp98=
X-Received: by 2002:a17:902:e949:b0:2e1:35ec:e03d with SMTP id d9443c01a7336-2e135ece527mr8271295ad.31.1790553828679;
        Sun, 27 Sep 2026 17:03:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 19/30] python3-flask-httpauth: upgrade 4.8.0 -> 4.8.1
Date: Mon, 28 Sep 2026 13:02:51 +1300
Message-ID: <20260928000302.2528437-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130406

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/miguelgrinberg/Flask-HTTPAuth/blob/v4.8.1/CHANGES.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...lask-httpauth_4.8.0.bb => python3-flask-httpauth_4.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-httpauth_4.8.0.bb => python3-flask-httpauth_4.8.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.1.bb
index cf0f73aef5..cd54b163b9 100644
--- a/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-httpauth_4.8.1.bb
@@ -7,9 +7,9 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-PYPI_PACKAGE = "Flask-HTTPAuth"
+PYPI_PACKAGE = "flask_httpauth"
 
-SRC_URI[sha256sum] = "66568a05bc73942c65f1e2201ae746295816dc009edd84b482c44c758d75097a"
+SRC_URI[sha256sum] = "88499b22f1353893743c3cd68f2ca561c4ad9ef75cd6bcc7f621161cd0e80744"
 
 RDEPENDS:${PN} += "\
     python3-flask \

