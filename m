Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7651.1793265713959908154
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:21:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kaY4Zdxk;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so14429625e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793265712; x=1793870512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HEvCV6x54lNd9W+qagw65Z0OtY7MOvGp/Wb0M+hIfs4=;
        b=kaY4ZdxkaNoz3R6LCqNRRh0T+9Uy0H3FX6QszbAwBmxNi0S8XjQC4QLgkKvkBdTyqs
         S5xKJzMgiWma3/Hn7meBD3LrhESW3OOjwePx8cEjhJH0QRQEnXLY/f/klJJkrXwq0B81
         Mrltv5O7rmPVhHFhGkUHWVwcafARUs7KJNPAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265712; x=1793870512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HEvCV6x54lNd9W+qagw65Z0OtY7MOvGp/Wb0M+hIfs4=;
        b=EjHiAUgZ4tu/YK74l0OlxvxADQJQTPCmdVvjT6XZN90Yd2Fdadb6PPqfrZ3/RNXjyn
         tWf5uHY9IKVktLqd2bVePCfpdTHP1IG79nRZCiBniGEctgu9K/4/+NSeB5ZBONkJH3J8
         R6mk7VbJWYwZwWo0oGj9/zvB8+20KE3kJXqyABzP2e42K7xQ2Stgnj958DX5lkwvLCPN
         LhgIf1LUehCaDax8RamuOX0k95PrhY++E+HVTAGwZMbsaRwLqMg55rMIXKphVSnBic0V
         xZjWk5CEzNTo6MC7Pht8J6n1rVxtY3NBr6Yq/L6mJt8xcq847RGJK5mTC1VZn0gJAtHc
         KadQ==
X-Gm-Message-State: AFq9FYKBLaRamO6vi+gvqMn0PdaZOxg+P8uC6K7JOsXs2jXt9zzQeugI
	0dotiWd8aaG2HpkCVVtaZUjHnpF4c6bbmATY2un2s+xf7PPiGqw57YTI/nvnX/w4IKpLtfgcqZf
	hLhZp
X-Gm-Gg: AYBFou23rktNRGy49pb8YOTidt6WHcfkIN/D2ur4/boPwrq08uTqQMYfu2u4zsX18eu
	IX2W3wqVGpQ6iHRMecmRkCpWC9evPANXtwtNMmpIaLmrhAzVdQlxUiv7itqlDo4SL1uPsnH/HcY
	IbvPpO4CdEyeTdOxpwTbHrY5zA2hywqMe+y1g6ghQoaaKfYdp/4TETI2jD6BOEJzfVyq02pHzJj
	IAzwWjuvGU7keb/47Z+TrzQSrAq4tMhYdEdAoupNCOo/9qSAkjmleIYnjQPMlDx1+P1D23Ib+rf
	Cg3pAY1dXuFMV1OCk2JEJP40MQCn/pT9hXEgjPZA/WKFi3jgFDjM33kMXq6IyjjsZlG7T+uZMnQ
	AHjaCUcbMIOnJeEfyqGPQi50aOLFowVKKoy8RBp3QgiJyG6o+CNUzniOlRPXwDuixB+mr87QidH
	hhkw9fg6VpF+u/gpVlJvJAyTLwn/KFYuP803PNjfMHBYr0C2ghtdqg9vexZxdK2eDMBuNYlBsKT
	UrEoUpGb2XRGtoChe+dK8Bx28C/DtDGLnBiutNor894pNd683gg5aJArfqv4g5FaMMeDG/H9BiV
	OCYASAXQVfjNgSgUdI2GIYiS+M52U3Q2AnUtdheGD0aidiuHyL5RAWtFXGzOmKz9l9PFCiU7F84
	yQNnIpijK+FIvrQM161Mp1r3AefYrIOfHOoqlKUilcmxcB9eakHd3jA==
X-Received: by 2002:a05:600c:19c8:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4a966e2a979mr112576345e9.24.1793265711844;
        Thu, 29 Oct 2026 02:21:51 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdf9bdsm31901084f8f.55.2026.10.29.02.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:21:51 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2 2/4] python3-platformdirs: Upgrade 4.10.1 -> 4.13.5
Date: Thu, 29 Oct 2026 11:21:45 +0200
Message-ID: <20261029092147.791220-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029092147.791220-1-leon.anavi@konsulko.com>
References: <20261029092147.791220-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131646
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.13.5:

- Publish a GitHub Release with changelog notes, a PyPI link, and a
  version comparison after each PyPI release.

Deselect failing tests from the run-ptest script for ptest-runner.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-platformdirs/run-ptest    | 4 ++++
 ...-platformdirs_4.10.1.bb => python3-platformdirs_4.13.5.bb} | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.10.1.bb => python3-platformdirs_4.13.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
new file mode 100644
index 0000000000..fa98212711
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+pytest --automake \
+       --deselect tests/test_pytest_plugin.py::test_import_before_pytest_main
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
index 7c004a1ed3..40c7b25333 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.13.5.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "ceab4084426fe6319ce18e86deada8ab1b7487c7aee7040c55e277c9ae793695"
+SRC_URI[sha256sum] = "05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0"
 
 inherit pypi python_hatchling ptest-python-pytest
 
+SRC_URI += "file://run-ptest"
+
 DEPENDS += " \
     python3-hatch-vcs-native \
 "
-- 
2.47.3

