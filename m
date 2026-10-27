Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14854.1793092877058563961
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=XTZlD0EE;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so26933565e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092875; x=1793697675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUyVVB8tEuAwlNGBdjagWycPnr77zc4hCFIUB0oXOdo=;
        b=XTZlD0EEdMTu+JTFjN7ObU5FNJavoKUklIHoKsiDaY/mADQdkZzQy8sIGeTs6ttxeQ
         /ZCuicP4qoHyUz/SbyUHjtstEyvFSn5bsN7ucJc2RXMcVP+tjYj/YFSfQbAILydtQRSX
         Uq5J2exMC8/8I9V6TGZ1tEXZuaKweHOnxd59Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092875; x=1793697675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qUyVVB8tEuAwlNGBdjagWycPnr77zc4hCFIUB0oXOdo=;
        b=i0L7eD4GWeu9q9Q2ygcXanCO2gywr2HapE/1AwCYbjOzrXOCNTCp3g0VruGLt0PJ9q
         +1cs9/3RRfxuVOUNuB/QW45pdbTW0bBpYqQxyheDYL1wckPyr33giW2p1Oe2CogTzM5o
         gZbTHdTe6kSwJOtKOATO+1TnAeNic4N++QkEL9FVj7PrJBdt2dooYrk9f9HwKiCkzA7x
         lxf6N6tg1JNXGpw37CSZmcvtl5SYBv+pWYh+71Sbm8FVL+f+CQVy8+iSu1oTaFnPmYIA
         4ueJfuUnrqvAmZ4n79FQ/8hzeNl+97sga1KwhoPviFkC1ckxY5aBr7crCl6Ss3kZPysd
         oi0g==
X-Gm-Message-State: AFq9FYJ4L6b518eGiuj6FbnQHzNmG3NMlR1YH1INJCw4cPmSU928IJif
	Rut3rl/5IPzVK0iJf1JjBMPRAOyyVw+Q5rWR+lKnP+IJYEW7jHKdhJLIhvgAwnJc0BbldKJGoYE
	cyjbU
X-Gm-Gg: AYBFou1uFSavOx6OT1y+x4qZcF4lDH9mnW3iaxmXNbtKHrmKvk+ymuwXxCzrpWkKWl5
	OeIxs6u3mvBTD9a7WJYv27lsOtVLKHHvQWPh2Cf6akIU1NXCUkdOQ2T4ukhr8Bx/GITlAhS+PKy
	Vsrw2/aqqDsTEIxDcZqTgwxTw4fAcIABBJ0kA36T3ZB+z9WrDVRNGTaQLpQaXyUi7Ru16PI4QVF
	RhytGX3MGiC25Wkv+ZCyr3zoyNDdjHnyGSzq8/Qd/vQZXrAcJFzw4jcD6nKh0hn5ZhC9luqCDZS
	PWooId3PSQXxxxbZA/VUDkor38IAB9eynoj5GY7jLLFioIMTG5c8lr3DJRXHkpieV2CQOzek3Xk
	RuoBNOJX/CAeN7ytQq9tpqM33cvy6RiJjU+rya+sQAfGbbrcTv0vyJhyy0zTrmp+fesw4yVkY2E
	iBec6aJkAq/2a+sqIPiPmwJ+qCueoB09gPoaJ57PF5EkRlr8AgSKutCfMaQLwlKU+UPvIAZNuZy
	rM4rs4jZ2kCIdXpiofThiaI5D2b2xF0EVcDf4iGsJ2UEdM+cYeVfhVs4/8RLqFnIWzPmiWHqewp
	J38yui7DrgDPjwLe6wmAjxGanKfyWJNqXEZ+u9O1f/RlhQ/9aGhUTUE3kMTEx4cs9G5T/vP1i0h
	Upyu0RA==
X-Received: by 2002:a05:600c:524c:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4a35ac8bdc6mr172427815e9.8.1793092875361;
        Tue, 27 Oct 2026 02:21:15 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 38/61] python3-setuptools-git-versioning: Upgrade 3.1.0 -> 3.2.0
Date: Tue, 27 Oct 2026 11:20:05 +0200
Message-ID: <20261027092028.782979-38-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131502
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.2.0:

Features:

- Added support for dynamic-metadata 0.4+ through the
  setuptools_git_versioning.dynamic_metadata provider.

  This enables automatic versioning with scikit-build-core 1.0+
  and other compatible backends.

- Added new prefer_tag: bool = False option for
  :ref:version-file-option.

Deprecation:

- Deprecated the setuptools_git_versioning.scikit_metadata
  provider.

  Migrate to [[tool.dynamic-metadata]] with provider =
  "setuptools_git_versioning.dynamic_metadata" on scikit-build-core
  1.0+ or another compatible backend.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ning_3.1.0.bb => python3-setuptools-git-versioning_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-git-versioning_3.1.0.bb => python3-setuptools-git-versioning_3.2.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.0.bb
index 581b57c10b..aa274a46f8 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-git-versioning_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://setuptools-git-versioning.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=92e79e3a844e66731724600f3ac9c0d8"
 
-SRC_URI[sha256sum] = "612dfcf184addac9e1c2216f4f229724b2390e5bf613fb925ae80b84f2529172"
+SRC_URI[sha256sum] = "27aa1ad0409b632ee49947ea592cc27e16fbb2a1605cc22efeb7c353fd790b31"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

