Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C47CFC53B
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 13:22:20 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8853.1763817737515128521
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 05:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eoTJoVJG;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b739b3fc2a0so413001066b.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763817735; x=1764422535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9ekERPhQwRCcBIUIFG4zT+h9dDXHplT9lpn2FM3vbs=;
        b=eoTJoVJGKiaSLmUHHtp4zSJ3ltb+yiysYA4S/D2m61QrjYBYajaDh89YQzzfC5Awv2
         gcie+CiCEaGslv6HsfSL08yIAzIc57kFB3mkpgKuC2M8/JlGbGQ0H+hKXp7dqBB1jCzV
         Um24oikMXXECeEZbCk4yMQoV7uZI9Bar3asCIdapfZX8GBJEMIqGa/2hpOm/rbA+Zz9c
         e1IsahJqJuyzmp3PCOmLzLErTGXeAFIy+r7r+P1OqRplurpAPrNu/hJPJDINY11E4fiG
         SjnRAuuhMat0bRT9EPfI/F1UlyP68h+PFaPzRpRBnv4HkPD6yZALP/b+NUJhaHJEDJ11
         ghxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763817735; x=1764422535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e9ekERPhQwRCcBIUIFG4zT+h9dDXHplT9lpn2FM3vbs=;
        b=RBmikW25P2TKFlu7jobUf8udVKSE+Y1eRTMKujzBhZ1bLwvYcSrEatDDAiLoPYQbmD
         CLmvy4SnertGNuXkPZxepirW8HJUEU+VY4Jw1s3QhZPgJJIoANDcZxc/t4+NYj8lqNqB
         Qo2Ku2PWER7NzEmTD7bDgxLrENLYF/+OvK3Tq25WN9othcahDmAqDZsMl9YNDADioztk
         BGjHTkH52r1zmI6/nffR8z/Yo0VFVKvnTSC8mHLcWzLoDzlXEkh52zmFP3+hYUl68bvQ
         RYJytBXrl/Cx/Z82xI+PD7bc2c6LF3a3k+49j9sBMKiAajVCa7TPup7AiVWWU0ACodE4
         6ZuQ==
X-Gm-Message-State: AOJu0YxUMY6wtBzlWVECUblhFj7exSP8qWbLnvsdgLdxP8HmyGT7QixG
	/XcrC391UY5IUH6T2OqA9Z9bqAJqRnSZcAny5u6JvyzbCoDUL3Ln26XJJAzrEw==
X-Gm-Gg: ASbGncv9SRxdfp4xDVuSGW5Fcix/SkGe0dMXWPkBRzM7pDX2Vq14liYCLjdpQaE8hhz
	prHG8UZmvGwfCZ+fy6HTNWjJk5p3Eo3KvtYebzinH07Zh6PyJ9gV+xmDgpn+8WbQpGqIX3WL2tc
	+LbkI0nc8iEQG596lUCMuTTFAKo5Ox3QhykE6r8kbyM47V6BqLZLFAMliAcf2M6HD0ELZtEVEkN
	4NcZ/4LAbgNVTMHFuFV+oRecpY4oyFpFB3SvoaDPN7bcfuIBnRWgKecfv0lPFdx/q684VQnBNls
	uIy3KsT/rl9gpjPUfXT7LI/rDqHOQfUDvwGFjbSzaICQC2paivNMoIjLiLcxzavcOf7Gm+isvVP
	v1kEliaE2fO8mYk/Y45wWfJpGUepkmgB8m3S3FJZP+LLHHRMvgQ+/NfVO6doriNI9uPoPjjN3gl
	ge/GYE/RywubwrSOqkp3lrxHihaie4bcw//wDQBgGl2mUXBPpFFwAHV1+aEz7b0iPbgyh8kiTPu
	+31Nh5J569KZfD0JjUrlwq+
X-Google-Smtp-Source: AGHT+IGgeZcqNjzfzWKOOqZxLjSzWWFmmZmWUMySr+PD2RY1bq9sok96INjaCoTtCdhfpYqWst4t1w==
X-Received: by 2002:a17:907:8e95:b0:b73:792c:6326 with SMTP id a640c23a62f3a-b7671543435mr527873566b.11.1763817735016;
        Sat, 22 Nov 2025 05:22:15 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43a6sm705844666b.32.2025.11.22.05.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 05:22:14 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/5] packagegroup-meta-python: sort RDEPENDS alphabetically
Date: Sat, 22 Nov 2025 14:21:59 +0100
Message-ID: <20251122132159.1774324-5-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
References: <20251122132159.1774324-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121976

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index dfc35f946f..bd1e760e0d 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -144,8 +144,8 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-flask-versioned \
     python3-flask-wtf \
     python3-flask-xstatic \
-    python3-future \
     python3-frozenlist \
+    python3-future \
     python3-gast \
     python3-gcovr \
     python3-geojson \
@@ -216,9 +216,9 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-kiwisolver \
     python3-langtable \
     python3-lazy-object-proxy \
+    python3-ldap \
     python3-libconf \
     python3-license-expression \
-    python3-ldap \
     python3-lockfile \
     python3-lorem \
     python3-lrparsing \
@@ -356,8 +356,8 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-pytest-tempdir \
     python3-pytest-timeout \
     python3-pytest-xdist \
-    python3-pythonping \
     python3-python-vlc \
+    python3-pythonping \
     python3-pytoml \
     python3-pytun \
     python3-pyudev \
@@ -421,8 +421,8 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-texttable \
     python3-thrift \
     python3-tinyrecord \
-    python3-tornado \
     python3-toolz \
+    python3-tornado \
     python3-tqdm \
     python3-trafaret \
     python3-trafaret-config \
@@ -508,6 +508,7 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-prettytable-ptest \
     python3-ptyprocess-ptest \
     python3-pyasn1-modules-ptest \
+    python3-pyasn1-ptest \
     python3-pyroute2-ptest \
     python3-pyserial-ptest \
     python3-pytoml-ptest \
@@ -522,8 +523,8 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-soupsieve-ptest \
     python3-sqlparse-ptest \
     python3-typeguard-ptest \
-    python3-ujson-ptest \
     python3-u-msgpack-python-ptest \
+    python3-ujson-ptest \
     python3-unidiff-ptest \
     python3-uritemplate-ptest \
     python3-webcolors-ptest \
@@ -533,7 +534,6 @@ RDEPENDS:packagegroup-meta-python3-ptest = "\
     python3-xxhash-ptest \
     python3-yappi-ptest \
     python3-yarl-ptest \
-    python3-pyasn1-ptest \
 "
 
 EXCLUDE_FROM_WORLD = "1"
-- 
2.43.0


