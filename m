Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8944.1793358219537239757
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=U4udwjna;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso409649f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358218; x=1793963018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fcgb7Tokl0que5wWspLqETGGickv3+zhuI89Gzp5fiE=;
        b=U4udwjna0t/8iRyi5m4KfkLc61TVNpZVoVQoM4ACrdvKGoSHYhNpmswmlnrgZHRgs1
         9Bi4EOYwCSTFKAojZDW2DRs2eXyOVdKliYV8zCgtxULDcNWJQHHFaBjlPGYJJlqS8eYs
         hDbwC0KyavMTDAHeq/AKb2TBioW1cH9CKNNt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358218; x=1793963018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fcgb7Tokl0que5wWspLqETGGickv3+zhuI89Gzp5fiE=;
        b=qaIgTf+Fj6tPjh6fHMM8VVjUMi/tlBdfkA5PufCYYrztWZvbf4D2s3NQAn43T6cYDs
         /5nxw1fAg6W/YQsUXkHyeGQUMIjXbZb/hjmWUXNt1fLGfhjXhe4cbaIsKPeHQYXtvbKe
         KMyx9nptZilVY51iNJK+jGvKxHjHjDZfUUG8D9JM77NaZqcZnWxncbAdp3QQdmb5TUnd
         mYuywqTd7jvrTFJRm0gwdAirLoogxAhvpHSwfLLT8o7r6qskSzTKLNmzT1GUXQ7T4LcO
         LolyIFi56LTx02n0UIv+vuMA1dV2OPfIF60+dE6VZGCwoWCx/+7609jCWmfPmvLRr4oF
         r/fw==
X-Gm-Message-State: AFq9FYK+TyexGxwKqqd6u1G0gxDRmQcZ0YDhqlEyb0X+5AVlNRqS1ItE
	Dx9Y8aeVvfStYGRpiGFi2mqIKgHvbYDcidfXrEjooe0qW2DETDl58CLZ47ebYsIY3oFeTtqrobB
	Js7BV
X-Gm-Gg: AYBFou0fTdfQ1hM9CN17o8DMU7utQ/38sKf3W3vMQZz45Z4V4MfawvUF85dUcea+ORQ
	wBxOvhJ8C+8+QZDa/i8AAJ5TvjfBmg/JAE3oI//L4O/bca+fDyhlOEyv+jg9Q8zNzoENCi9PUCh
	0HZKw2f7YricRWQnw7nHgzSuSh9TmHHakgPiA7YvUwE1yzCyNkw3gWQbT8YzoRTRQCw2dbalnaT
	YeiEqLV2tQRQMizgaBZZWaswj3e1+NYXrzXeZDmWWBUvxox23Km3KaNnQz48Sn9Mx5IpheF521P
	QX56/bNBULF5ylRq/QdCBBkyTg9WJGfHuaV33+au3DOWrymKYELMulY15oB9uds6/4LfyZSjtJV
	r1Y1UiEZKQkU0VOXiAPUOYNvOHyiVaZ7Q8ZIjC4D2eW0uWVJ0gR31/zfAFs+bDyQVEIeG4oAsVI
	1M7Oumh0LkKPiRe1dosjMsA/jIEeNPi2XHzsCMj7MLv1JZOtN0nLXo/0Ck0qr0SxDp28O3Ek4GK
	NzpKabET37rGm9TVUAMu4N4n/kJn1/Y4dYk/2is3NGZFaC58goIqM9Nb3DeEhdwsV3l4s7OmYOM
	ZvenDEUDl8rr/CAHlZ4hXcBhyd+xu89MLpxyej9lZAcXpSCqOgvNSQ1jPXRBn+yTshCJasKM0wA
	pfLaSMpwHMXjh25CnsBFMxvWeaxhqvIp22+dqNpF/Yr5D+d/5s3oeYeTtlqjzFxZHKtIg3XDB9g
	8=
X-Received: by 2002:a05:6000:1842:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-48e6e500962mr4967121f8f.40.1793358216781;
        Fri, 30 Oct 2026 04:03:36 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:33 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 18/25] python3-asciitree: Upgrade 0.3.3 -> 1.0.0
Date: Fri, 30 Oct 2026 13:03:02 +0200
Message-ID: <20261030110309.1124614-18-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131700
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.0.0:

- Configurable layout spaces through BoxStyle.gfx["SPACE"], with an
  ordinary-space fallback for existing palettes.
- Declared the existing public API stable, without breaking changes
  from 0.4.0.

Fixes:

WARNING: python3-asciitree-1.0.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-asciitree_0.3.3.bb   | 8 --------
 .../recipes-devtools/python/python3-asciitree_1.0.0.bb   | 9 +++++++++
 2 files changed, 9 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb b/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
deleted file mode 100644
index a3185a9c66..0000000000
--- a/meta-python/recipes-devtools/python/python3-asciitree_0.3.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Draws ASCII trees."
-HOMEPAGE = "https://github.com/mbr/asciitree"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a985ccb0df374f2a8cab75010bf8db73"
-
-SRC_URI[sha256sum] = "4aa4b9b649f85e3fcb343363d97564aa1fb62e249677f2e18a96765145cc0f6e"
-
-inherit pypi setuptools3
diff --git a/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb b/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb
new file mode 100644
index 0000000000..086fc07392
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asciitree_1.0.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "ASCII trees"
+DESCRIPTION = "Draws ASCII trees"
+HOMEPAGE = "https://github.com/mbr/asciitree"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a533ab417405f77f9a3d236d35cd7069"
+
+SRC_URI[sha256sum] = "0c396808c13cab27b60cbe402b99ef37fa681c6b59d337a008719efa201cdd07"
+
+inherit pypi python_setuptools_build_meta
-- 
2.47.3

