Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11F3C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:06:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.3586.1744876435136532671
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gX1+TZeW;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-226185948ffso5069075ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 00:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744876434; x=1745481234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eDkRBCjFbKAvpY+TfxKq/WhFfxQtW+Q93EsFx1ZkF0I=;
        b=gX1+TZeWRAMLvRYMO2HtENS2hdWBKG+Y5QJ597RVudEMnC5HQjNygJx97H33KfCTc2
         Wx6SpNm7sbgQG0Dy6aoNZxEKFB9JQIOLip6/a+rsHM/9N2jHoxFwNbtVyhgHPvym7XNw
         CncYYJnxSot+GKg4YfrtvcKYH+E12LmFHGbT8tqcbi9d0Z4OsELLqrx56WHOv5J9zJmC
         5X7MDLQwE9XzXM3mpnblt8P94X6aURcYvZuzZ09yyoWdIe+2oUX1knvAEXCp9zoHXg3C
         OnnSShJHh2tSJSyuR/LZvUBkag+EwnDRw9afBDMGBMISbi1aQ9IJlBtQCMQkRH9xPKF1
         jMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876434; x=1745481234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDkRBCjFbKAvpY+TfxKq/WhFfxQtW+Q93EsFx1ZkF0I=;
        b=jkjMiMkNydLXrNx8+dMy+jNJHEms4O/A4SCt0cazBeCBdlEvauIEMP23f83zOnjTv3
         q5bTNaxnA0ciN7wBq4uNjwzE4sdLNXEU7bojEwc3mWw7pm1Q40K6U7yzwXfUKOBOjAp7
         ZoRNn38cERPlduC988bmurGQwgUNDCWarpy8MoUqfvIUoiQ4/WNjBJ4wnxQ/MbX+urJ2
         WgwY6JJwNN8Zm97gH863Uq3CqNo2TFZBfwuzXJwTULYRN9eklwpSkypgRLjRMLzRkQkJ
         76c/1QeLyY8Dm562F6/evJ8mTvWM+B39x75+GeqtP+QO2tuiw+SJmYhw3WGZgJ8jI3UJ
         TbMg==
X-Gm-Message-State: AOJu0Yw4/RcXvmr2L6JVx/Wlfs8+AA48ovoV0oJPwJdmtJhZfSav4XyW
	20oik4rvaABV3UGeqpHHeWs23wGZ+xfHLIA9WCC9UvVnEOsoJ9NOlWWWjO4n
X-Gm-Gg: ASbGncucBOZrl45qvIv4ns9zSCbzPeGBhQ67NyJuH3uZQm02Vew66j+1ip+sYEyQEOO
	dAYH9DsATaWs5JWe46U4RXcUNzpuq4OnvtSFTNaWBIyaMuHfFOrjw+4IZdndf7KpNJwkSzeGAxl
	S2CNf2Vall4Azj4L8GzRTWFjrkYjqo6lZeCx1HWlyUeKuu6YaTgO3hYPmTkNdQJAVu9v3GZTUhA
	1qEYFqinq7awlEdIkT+3OjXxOmbeDIpBk4xZr77IuRNFDR6ffshKfd6TMKI/a8BCoNX66WuYaDj
	nfYGbXK8ZHsx+9hcTVxwgxbrckgExLch16f+eZT6gFJsy7FSAyFYZ/AEVHFF8opOoBin
X-Google-Smtp-Source: AGHT+IEf6XN5f1+qn110Vhbz/9vXaEER01h0h8zoK8UBwHOsuoOzU+V/pjiPp/PKUz9bBWjv1oDhDw==
X-Received: by 2002:a17:903:46cf:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-22c358c2a2cmr73690335ad.9.1744876433932;
        Thu, 17 Apr 2025 00:53:53 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1d16bsm27217905ad.58.2025.04.17.00.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:53:53 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] libsimplelog: Add C89-C++20 logger for cross-OS.
Date: Thu, 17 Apr 2025 14:53:42 +0700
Message-ID: <20250417075342.7405-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 10:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116928

- Edit CMake
- Re-test Windows, Linux, MAC OSX.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_git.bb          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
new file mode 100644
index 000000000..461b96035
--- /dev/null
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -0,0 +1,20 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+
+PV = "1.0.4+git"
+SRCREV = "781f5eaa1713e7f60e9ee79ab5143c0bacfcccef"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
+EXTRA_OECMAKE += "-DUNIX_LINUX=1"
+
+
-- 
2.47.1


