Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8107.1795739775085743211
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gQ1cGMDp;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f01f296937so56561155ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739774; x=1796344574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Euv3TP/msjGFb8R7+dDSdwXI4gcOGvUbHK21LzQPZLQ=;
        b=gQ1cGMDpQuqS5SZLwPAkFhJR+AIaoEO4S3e8DBKOTIfxqTgjHXel6plIJYXcVlz93E
         PU4g/R6whuWqGWPnWRJ0xtv22r8A+fDHeQ6G+gwwE1FsGBhDBJ7uXONsHBNP7rzxZmXx
         PZ8vAKGNYKFYIo8juwyyfkesReGju90pt/UQw/Vh5rvuEH9a9HVc9zSxJfivzOGX8EdS
         lUC+CezLa/WWfPxm9YUTCBJXKJ4DLwocSep8FrrX4YEuh9XxlhoVtYX2yX5+UVwje657
         Xd18zuyp7qcmsZfUjdEalUlGQmSwWFoD20+iZVP3NKG57q1dPkWaWTxRtq52pqp9kueO
         GMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739774; x=1796344574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Euv3TP/msjGFb8R7+dDSdwXI4gcOGvUbHK21LzQPZLQ=;
        b=V2+11tmhryzz8Q9iOMIfQpwdIeQhIx8GBmJ5T/PCA4UuvglNZUmx7VR7kJgmnbkKDn
         mZyB9rvGoYeoETCfCWZe5ZeiWD5lcujsxUByHk/Wud1QbnW5Y1vozLcgUIHmsbbVr9Il
         Kab1IA2Oed6TJ2E4M0hK+vKrx8J5YgLuotWr7HeMa+fPLCJNdAY36Qk/vLTl3ctI0wZy
         bILTiejD3PVqqEONnIP/BTZ8FJcnGiy45000DFcP7GdDrtqUhAXm75TLLV0I1NO5x+Xm
         wX0KFZ/CDm+PMKKk+HK/TgSXEzErrvP2VhCSaL3O06RiXV0K/RUpJxUkHm7j6mzP26CP
         oz/w==
X-Gm-Message-State: APuU4Z/15vPQPpxr0HVMASlcHHN7nOK8TVrHdPdTgQao/ekSb4g9KKbf
	zye/l+roSWkPj2iauYL245pOehqcgh4DPMuz1eKIotJN6e98XSDmkHwtRoDtadKl
X-Gm-Gg: AZFdTZfndvNoN4oaAv/GOMLD/6P/hERdPr5irXtYhLJf9HU9on6iCSIki0A5Ow6bj7B
	h94pS+kEhJtmb0K3aQFJFlj6x2SCe7U/cTjEVlzwwzjRc0wU/GSoT8JNR+7WIlyAoKst/KjXeO0
	K8JSVqrls+Illzx3s0+gkjAzunI205K7FVfimQB91Ii4T95Ot9/5IRIhg0XWyubeJVLHMbvUVIS
	m+5ceMXiS1B1yl9c4kFsYTYrF2O/mr/d0MlPyHfbB5ucp9savqOjkPSEGSak1wiZ569qPVLVFnC
	XBP+0Fs+uR7GDd8GMtNjg/QBQJqzrVft8d4tmEQDIjQ/R0zlcHbqW97eOaY74pszcSUJ23/1MX/
	IDjUzABlYaAt7thRs7zpJWw3+IjAhx47L7b2hDrMvYFjsQBQs/AqjDraoaRhXsXdRy2QPYFq/HW
	11VjXO6zdSdFTky/jIU78xMWPW17Y2qCN1e3uYvj9L3Bc4vnjKCHKVsb+Rn+44Ser15T1H/LRwE
	SCf1Zr/56LKPNmjtLqRuFVeKaI2VQuEE5BEqI0DB0Rj80/VPjHMfDgivf+QQYfV/rXHLYaaf5kV
	wk2Xpve0nr2JMt1PyjlW9rbxxNIFoCdy3F7dr40FyJboMWdhOwoyjY7Qw8x3QGf4ASRlEwJcLAS
	DEIFvPTWcKHXpSzlS4cwIC9L0LNe0knkob425Eq86E0bCKqvYPLJmpZQ1kyjeVc7FXTzfW8LtDv
	04Gc1YbN0mONxeL1UvAwWz+7UvuozEHELqTcVomo4EK55gx0mR1jdZ+0f3LygUvi+ys184DoSoW
	CLZYavuiCjaWhtC27g5fKzPAZzYNuDWGUbXN4IpO1pgShWlc9g7G7w7bP75EfphKLPPEDjjgOCD
	ZZUw
X-Received: by 2002:a17:902:f642:b0:2ef:da10:bea3 with SMTP id d9443c01a7336-2f03f1cf4c1mr233437015ad.11.1795739774480;
        Thu, 26 Nov 2026 16:36:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 09/39] cjson: Fetch by tag and add upstream version check
Date: Thu, 26 Nov 2026 16:35:13 -0800
Message-ID: <20261127003543.2167775-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133179
Content-Type: text/plain; charset="utf-8"

Fetch the v${PV} tag and match the vX.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index 6f169b1724..5527e785e4 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
-SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https;tag=v${PV} \
            file://run-ptest \
            file://0001-allow-build-with-cmake-4.patch \
            file://CVE-2026-87933.patch \
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
          "
 SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
+
 inherit cmake pkgconfig ptest
 
 RDEPENDS:${PN}-ptest += "cmake"
