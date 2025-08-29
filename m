Return-Path: <marc.ferland@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954BECA1000
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 13:06:51 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.13151.1756472806417877355
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Aug 2025 06:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=idV1RB5D;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: marc.ferland@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b7d485204so12861215e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 06:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756472804; x=1757077604; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m4YkaKN6GveqKBUxRwKy5FS5ji8DVTKgdz1kvN9eMgM=;
        b=idV1RB5D6OWiGI9F/amoij0/yGhA0DHK0ohDsdiOKFGjo7iTXUjzFrxXk/cJRVT6gz
         XfHdHXUyBIfyEWZRFVmx3k1N69KAlqLupYyJ6HvMIffPmk+/R+fQYbfG7+31QG/xkiGi
         yF//3JVXTgpQvnmOxHncOa3o8LMX0s5c1K8ZI9sK0LVLoz1bukLSkpxxXSb9lBMmP7Zs
         OBX+4gP+GiegBc67MOWiysTNx0UXCoP5cwMmaEG2Q2cmQM66Fugm8D7UBk7rWkU62L5n
         4AKPSA0w2L51DdbbnI86Lmm8NKO/lN2wXJ4Gn1YAgnH6fmCf5yKom8k9hzgbJM1fih1O
         m/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756472804; x=1757077604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m4YkaKN6GveqKBUxRwKy5FS5ji8DVTKgdz1kvN9eMgM=;
        b=R2YKwplMRV8aqEwyvmVO/HecCVWIHkvaF3mrWgneRtEQVpUtsqd//Kbgimza1CnJad
         VuSN1pvcciUpVFfdgjX7d1bTR3Q4KhxqHAInOS1y8A0LFmF1B8HN2YTqPKTYw4LmNSl0
         yMbQ6ZHouUlD62MwW8BbhAyFebVucK/j54io/D5BjB80scVI5EekMzowkkWTBTO2RFqc
         ieK8KJX+R6lWOIhbykmy9YoCh55PvHIwJsPNi7CgWWI1LGwMz08DLVspsot2YEfBUHqd
         oqVfTvlerzB5NVlVQ4pk7qjzNqrcown56dPTb1MIM22asNuU9YQ8iDVymmj8WxOrAwYO
         JHcw==
X-Gm-Message-State: AOJu0YyPOgFYggil8mxkVc6gU+IY2QWsjtkSHy8RtBu6Fbxcx2gOsw3u
	THHRnUpyjnr/b4WBXInqJJBUHIAddqS+YQXu9oJCEC9LOJsupTYC9wOJMh0AQQ==
X-Gm-Gg: ASbGncuMxNrrn4h83Ht/SXnZBRCOYKkLVZ4Cn7mFHly7mdAvg9RaTsik7LJe5vkl4m6
	CW64GNVkLuZ67OBi19mo09yQAiuWFND9U0HvPgIaJQzaJgo085S/asdrHHP4AN6k4cBNGDQpWBt
	WSEhe0qEw2kLZ/n6FS1Hdc6GhnfYada795NFI2a6c5Ad+zF46dl3wzWYtvC9wx2tuQMQJOfO1E4
	4Y2Is/gjngRmYIUNcqQOpVoAeKKFb7DZ2Ty9Cpo+zMhItLJWnXpdrovRY6UkTECnm2mAObAArxq
	VseN4Vj9GMFhN51o407oCbpeG7zfd+M3zusF/4nDKL8/Ihm61ugYuxwuFh+aknp00HiaysMOprJ
	r6uXED331iGcnt7tx110xLzQl0Fi20zejcENcd7XnQpva88V0KcCKaUlxaOf4iul5tGPkS77KtJ
	Yvezz1qD99hw1oAVYoPNZXTv3xxiduoyjlmTQEYaI25Palwct7peTLkMK8
X-Google-Smtp-Source: AGHT+IHtLDjxn8j2v5wDYz42kkKiNEYt9ujKj15n9KvxyCxrBmZ9AJbGdk13Y80Gusq94bt9xp9Tiw==
X-Received: by 2002:a05:600c:4715:b0:456:13d8:d141 with SMTP id 5b1f17b1804b1-45b517d2700mr214217355e9.27.1756472803784;
        Fri, 29 Aug 2025 06:06:43 -0700 (PDT)
Received: from mfe-desktop.Sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm3407413f8f.27.2025.08.29.06.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 06:06:42 -0700 (PDT)
From: marc.ferland@gmail.com
X-Google-Original-From: marc.ferland@sonatest.com
To: openembedded-devel@lists.openembedded.org
Cc: Marc Ferland <marc.ferland@sonatest.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][walnascar][PATCH 1/2] freerdp3: add bindir to SYSROOT_DIRS
Date: Fri, 29 Aug 2025 09:06:37 -0400
Message-Id: <20250829130638.2227550-1-marc.ferland@sonatest.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 13:06:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119138

From: Marc Ferland <marc.ferland@sonatest.com>

This is required in order to build krdp (KDE's remote desktop
integration).

The do_configure task for krdp expects both 'winpr-makecert3' and
'winpr-hash3' to be present, failure to do so results in:

| CMake Error at /path/to/krdp/6.4.4/recipe-sysroot/usr/lib/cmake/WinPR3/WinPRTargets.cmake:98 (message):
|   The imported target "winpr-makecert" references the file
|
|      "/path/to/krdp/6.4.4/recipe-sysroot/usr/bin/winpr-makecert3"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      "/path/to/6.4.4/recipe-sysroot/usr/lib/cmake/WinPR3/WinPRTargets.cmake"
|
|   but not all the files it references.
|
| Call Stack (most recent call first):
|   /path/to/krdp/6.4.4/recipe-sysroot/usr/lib/cmake/WinPR3/WinPRConfig.cmake:44 (include)
|   /path/to/krdp/6.4.4/recipe-sysroot-native/usr/share/cmake-3.31/Modules/CMakeFindDependencyMacro.cmake:76 (find_package)
|   /path/to/krdp/6.4.4/recipe-sysroot/usr/lib/cmake/FreeRDP3/FreeRDPConfig.cmake:2 (find_dependency)
|   CMakeLists.txt:45 (find_package)
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6c30f47645c3c16b81801d4427d04c2385daa4cd)
---
 meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
index 109b2b599b..956a627859 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.5.1.bb
@@ -61,3 +61,4 @@ do_configure:append() {
 }
 
 FILES:${PN} += "${datadir}"
+SYSROOT_DIRS += "${bindir}"
-- 
2.34.1


