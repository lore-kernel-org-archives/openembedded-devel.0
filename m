Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02801C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:58:49 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.101.1744650030642292244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 10:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I4Qowt8O;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-739be717eddso3531899b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744650029; x=1745254829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b48n2NnOjE7uTadvnU55qGDqVJwcu8G9l7GdDqIVX1k=;
        b=I4Qowt8O8AK4f+j6EdBYLX2lmZ8+uA/Ml3vh/J272aKh9z6pQ/Cd5wj6VpgTlqR2TE
         9zL9Ym/kFJ5HP7Xl3m3s4lGYFeSnNBaaLFi6m/7UQIHMEjVG+MaObHF70Sl2SjDs3gHC
         hm44lKqubxqN+MVzneyiiI5VstXPeNyhTCSkjfXRZ7p/8uV4q01ZubGHxVnxQx3HM/ZZ
         YMBzKC/8/u3KPexIJTuDJqMJNYXLNt725YAR2jrsJ28lCd0/6IBWEPyTdhRLpkZw2lYD
         bV65xPfcLmT3YZ/mqXnGXrhTihlpB6eCY2Pt/ZybWKySfKCfPjLAH2qZm+70YFe5nxo1
         k7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744650029; x=1745254829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b48n2NnOjE7uTadvnU55qGDqVJwcu8G9l7GdDqIVX1k=;
        b=ipKpSdJ7IyCnFATunFa0meO/jHjL8guCM4AUDw+5kffYbzrKoo+ZKJ1IqwEdC/jfKy
         AQmlamct+u6zi95dG/iYkcoFIwHkCGDjveZs6/FJoz7W5stNCRQFcxuLLLBgu3NMarwN
         srpCK0RdJLPj00HAZeHYinATJbvCOTN5BCoyJo4qlYgRUyXmXRgQUciPpe/FY10ooH5d
         C4UT+iH6mghYrl53gr4dbaQ98x4pDr42CemDPH5s85NHucy5aFVZ2yCVDVbq0SOYqW8t
         YUg68lANpnL19Uk0KDcIGt5L40r82a2zvu6/4nEiD+wc6JxasV84OWAAfEJNY05U0JdS
         gB9Q==
X-Gm-Message-State: AOJu0YwARks7YvFNSC2dnLRJVLWBb9GcFZ9rQdpL2CaE0gtSP3GjfIpN
	8JpxAsOLB57YAbxZn7auGvCYnCp51RVvWhAW04Q2IeHuWOtYilogsXEOkQRL
X-Gm-Gg: ASbGnctwie2CG83WsgB5iYF69EBR7SExxJOohcsMQbm7nMh9j4b7aAIDqkFNtpLI8Az
	mp1wwKoFWtZQhyLveSBznGz5TUffUf1AGpD+fN8KKTjqmldl+q3ZnOp7efRcqhlLxUz9dBAovqE
	X6Dxi6SD1lvWSmRLq/772YRw6VmwosKmwCRy/xJJotd1atamRxoq9lCPr87trZ2DmfFpxOBjCbH
	G/pAWhZvkNowj2iIe8pi6pii2eI0ZB3S1kJLy55U51ZAf2pRaV4yZKRDgjIyBwE9SoSCyhVvHbN
	s+OiUKNelssnYNZoBKCMnYMU1rUhdrmOlYW7CwbQ5PT56Y2m4/4seEkABJXGV57c4E22
X-Google-Smtp-Source: AGHT+IETJ3Dcjql+6FBPC8IMei6Vmzt8xhtTS5tVc5OvkESqHjwfUb0Y8GmzeapYsz2XuMjKxWsU+Q==
X-Received: by 2002:a05:6a20:12d4:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-20179969b8amr21059539637.34.1744650026018;
        Mon, 14 Apr 2025 10:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:90d4:ea0:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a12c8ac4sm9555445a12.46.2025.04.14.10.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 10:00:25 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] 1. libsimplelog: add recipe for lightweight high-performance logging library
Date: Tue, 15 Apr 2025 00:00:15 +0700
Message-ID: <20250414170015.90559-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 20:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116854

2. libsimplelog is a portable, minimal, and extremely fast logging library written in ANSI C.

3. It supports multi-threading, high throughput (up to millions log records/sec with PC 8 CPU - see report from README.md)

4. And works on embedded Linux platforms without external dependencies.

5. Follow KISS principle.

6. A Tribute to W. Richard Stevens (1951 - 1999).

7. This recipe adds libsimplelog to meta-openembedded under recipes-support.

Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
---
 .../libsimplelog/libsimplelog_git.bb          | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb

diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
new file mode 100644
index 000000000..0415bf485
--- /dev/null
+++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
@@ -0,0 +1,21 @@
+
+SUMMARY = "simplelog-topc - Simple, STABLE, powerful of logging library in ANSI C/C++. Ready for billion records."
+DESCRIPTION = "Async and Fast C/C++ multi-thread logger with topics. No external dependencies."
+HOMEPAGE = "https://github.com/thuanalg/simplelog-topic"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
+
+SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https"
+
+# Modify these as desired
+PV = "1.0+git"
+SRCREV = "ff30ba71807db1d7e1962dd014c2bb0a060572a3"
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


