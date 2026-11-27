Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10339.1795753008760375443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fUDHOvjs;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b5786e099cso6418057c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753008; x=1796357808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRLKk/2itbPdHIqNf696y1sZqdQuVCvqc930meK2YBk=;
        b=fUDHOvjsADYlXHxm0aMYlLMGht0k6FsOdvgAyphqtLG6H/IxklduPRM9wkWvr7TdM6
         Lfwcnq061cfd37i5M7fDcG1YjRVO6lTATMCJ8NThialU3B4qOV68CYXBV2S5jEJS/61i
         hbVEbhZ2aimD2thl5zNeY2WXXahiDcHc9rpC2xfB2dnGjPoacvgtqLuyapoMGcG5szAn
         txC787wO/emDn6kHjqcNRtv3vg0jztv+zMgIMFTQJ4ApeBf0o+GmvckF9ih+Z383YbUp
         1LsZR1FtQPRR/R+H384+yO/uMgVJVK4OqZlBf6JNfhgtfJNGLzNAdZjITN2rFoW4R+u7
         XzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753008; x=1796357808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRLKk/2itbPdHIqNf696y1sZqdQuVCvqc930meK2YBk=;
        b=ohuB6t3dgAoPRPRHTj3n+huTjwA6WJ24J45cq3t5/fh+0SGQ/Gk5hUML4lW1yeCakI
         ACohaMRs0iO+/WR1FAzO3M2GnISvRIId7EuT8eDlmWu4r6UvhcwjWxe4Qjw5wwEHHq7g
         Wv4Vig5TblF87vJW8Z66a4lLjzAHhOEdpE5XvHJhdtrjcZRvXN0MnE2dyM+bbaR2PL24
         BhOGsxeUwP2w6K67vKgz0iXv7ebT01BcztBTR6hbWF7ZOqpBwFvSvPaoEGoC1XmSHAUm
         YtaBHcrf1XG4F4TyJU0K0nIQtdTAxdZ8FhIr0aJqrtBdXXsMq8VG4vi9U2tFebxcp16u
         zupQ==
X-Gm-Message-State: APuU4Z/codbnrTvvoV/hy4+jNyCk89UNJXqTcVSJulQS9Ux+uHFeeV9T
	prySaUHK9FfUlIPe2DLLLRvv3bhdXD71EWTSTOfHAnm68OGSGNaHGymxZVJb3mM3
X-Gm-Gg: AZFdTZeYeOV8xMc9WZcm9wLvkXMrlGg90jO2rIU7tSlnxeQs4RUd9KO+dPUiR2ZwFFT
	XA1/lUN2cn2XAXA5F50zkD+4FsMCQZjoqEdTcQpHcWI0vUqgOIVBf5SeHNdK4AMetc4tSVSxUvC
	injNOC2VkfUYv5oHr7LtluZ9eCugJeHc4JUIokEPAfBK7zrYX3ervM5iRKDcWJjs6eKzMEwUbcf
	4F+6BUdksshnVsO5vJIpP01FxFmnpJ8Br9CFWZJdob4kIQ7ddWZgIcZA8v1Hvv1pmvlXUKU5/j4
	SsTCXTDGKMPtyD0WILHW/ktyD3bbsRKAftP4Q9w9LAyDSP/3u4RIvxsd05Eh/8DC1PmG546JbfN
	zvyVx+AaEjJ/C2e2tqjJRKawYvsH6OGCJxSbhFNsL/ujYPUp4FG5Hk5GteHqX6JaZAWL/BS4EVm
	xPUd7wY2Xl9WBilJoSCEKe+P6+rsOCyQzJ8qFN9xK7efIPPHiAD9IPIxRxAA7foclJxc9cmAgDD
	cL96FyDfRKU0e+oV0YxNoVVizUz/vQJmEECPTPrNkIjcxBM105B+H4fkfMwUSOQNM4R9bUuzsdo
	gf/Vccvmwq+mLr4e8Pp+dKytX5oMaoUgFc7VfNCBJqNklAfNcrSEhAa/lua5f50Xed7k5cT4XFk
	133qO2Gxh8Qqjvth06qYBi2f3Frk5uWi8djMv1LXTV9/mDwYpurLEXN3odsE2dQonRhnBk8czhr
	7Zmb4vpqKhfxLvAr7FgUxW7gUwwXQZpuEMDK+AyUwxSqhnKY88XvGitjDqoz22l+WdzvwRhQ2Hv
	GrlOrAA/kixZzr9X9pIKHbdAIcR+LZ0+hJz5y7LkBf30Z+t4zTgOVcdvPf64z84H9NlqfI+fBmc
	Iowi
X-Received: by 2002:a05:7023:a8b:b0:1b0:430d:d81c with SMTP id a92af1059eb24-1b5568feb77mr23188578c88.25.1795753008124;
        Thu, 26 Nov 2026 20:16:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 29/32] python3-pika: upgrade 1.4.4 -> 1.5.0
Date: Thu, 26 Nov 2026 20:16:11 -0800
Message-ID: <20261127041614.1775064-30-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133248
Content-Type: text/plain; charset="utf-8"

- Add pika.Connection, a connection running its own IOLoop on a
  background thread with a thread-safe blocking API.
- BlockingConnection, TornadoConnection, TwistedProtocolConnection and
  GeventConnection now emit a DeprecationWarning (removal planned in
  2.0), which fails under warnings-as-errors.
- Cancelling a consumer no longer rejects deliveries still arriving
  for it; they are passed to the callback.
- Close the connection when a callback raises BlockingIOError; refuse
  messages larger than 64 MiB; URL ssl_options now verify the broker;
  reject non-finite floats and invalid channel numbers.

Upstream moved releases to the main branch, so use branch=main and the
commit of the 1.5.0 tag. The build backend (setuptools) and runtime
dependencies are unchanged.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-pika_1.4.4.bb => python3-pika_1.5.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pika_1.4.4.bb => python3-pika_1.5.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb b/meta-python/recipes-devtools/python/python3-pika_1.5.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-pika_1.5.0.bb
index 096f7c57f8..940fa1de7a 100644
--- a/meta-python/recipes-devtools/python/python3-pika_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pika_1.5.0.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=678ec81495ba50edf81e84e4f1aa69f3"
 
 # The PyPI package omits some files for testing like tests/__init__.py
 # so use the GitHub source instead.
-SRCREV = "60fee4203a30d5dfa0500857cea6a65ef571d46c"
+SRCREV = "b26d4a5541a002dd6c1a9643b8db452977843dd7"
 SRC_URI = "\
-    git://github.com/pika/pika;branch=1.4.x;protocol=https;tag=${PV} \
+    git://github.com/pika/pika;branch=main;protocol=https;tag=${PV} \
     file://run-ptest \
 "
 
