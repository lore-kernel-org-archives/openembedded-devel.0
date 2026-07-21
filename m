Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AEDC44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:11:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23821.1784643070942718969
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SlQHvebV;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso40030595e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784643069; x=1785247869; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JMUlJ40drepd5hXAuOQYcEze/V14Ij8NvazAK50CCeI=;
        b=SlQHvebVPJFKa2CUzJPOlZ3ac1rGritO0OJFKaZxUCSxFoY0I6t/qnirroMbnU6O70
         XVuHMckak37OzQhWQ36Uzl9lz9hBV39dQkR/7u5xuWpszyLxY9yWXJarFT7QYs/uvpJu
         dSvf00JY2ktyEJeBGcDR1ClTQJk3j6MyMxlok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643069; x=1785247869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JMUlJ40drepd5hXAuOQYcEze/V14Ij8NvazAK50CCeI=;
        b=dIuhowT5eQnzhGsyBoj+pAOLLXs9q89VTElJuyWDD+9gm+1/J3RLvvXEygZWCah6pf
         t1VpfjAau9MxPyqOGX3MPCtb349WhHZZG0SDndwwD3tQ9ujmBHFbE6U21GeAh88KgKNa
         KxYE6UXxOnbuBpKQePjxmp2u58IV93AK4iNPBFG4fD1I3dqv9PNQWHlOgs9yTuc3dt/i
         2TUK0XV+TX3MxIPWgzagxuulifl6iUXu5jcE49oELWAf6p5tDVqUkl77GOnpDNXuhD6R
         gmr8OfEstF/Z7AWZ/Hh+VsOcIa5I0hT/7bbN73WcTHcLLRyxAVW4FKDN5cr+qEzkY5U3
         d/LQ==
X-Gm-Message-State: AOJu0YxL+oVMnDgwOtaV3sH5Ps+8cvMgN/41DBCG7+FJx8+uHkHl7lQa
	OPWLy6wDDuwkICrhzkl7NAHfH2eGQtFNOHGkN/xtvbayXYPGiw9lXhyr4v6FKhnocsE8I3S49fR
	62szB
X-Gm-Gg: AfdE7cnp/CJGaLtpTHyzeqpd6QqNWTA1O55Bgm1JsV6mpZ8mIUr95F9piFIYuY2rF26
	n4F0UhbeO6o2XGROa+Et4f4MTm9dNe8N5cXrWl7kRD2vt1g/CP2cY4S1wnRlX9uoJ7V1BHgGTsp
	4mK5y64kCBlqEnZ7W0YPrAszR1l0t7PyI240o/dfxzkqSv/uB2P4N/2SJ/N03ZIBPpmklyYS0Gn
	bzxoW0jeE1xCg2nhH6ISDyEPyOVbcpWRqZkcMsah8wslrFQ3fvyO6VksTDMXyWS/uAvltMAJvzZ
	Zzg+TrE+qMUE4bLncMp6SyLJE7OB634DzzYC8bdujFAwhcH2ni6FcKN/lletM3ndulG8Yhl3BHr
	Ts79MpCYw6brqjO2joeIhh/NdoQGbTddCsn/13N8kIaSX2GHfz01mWqzqUmrA2fccY4uFbXO/8D
	bfr3xyx0amWgHS5yPcCfi0a43mcH73CxlpWnu0vFwRBk2UIL4/9pjkRQSO9qX/rNVRTy1o2Oo5W
	U8Np70x8to8wM3qfojIj5gnAcr3Bg9qxxiaD0MOTA==
X-Received: by 2002:a05:600c:354e:b0:495:4811:7998 with SMTP id 5b1f17b1804b1-4954a3eabb6mr227808965e9.17.1784643068982;
        Tue, 21 Jul 2026 07:11:08 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956546de4fsm75401085e9.1.2026.07.21.07.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:11:08 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-invoke: Enable tests
Date: Tue, 21 Jul 2026 17:11:05 +0300
Message-ID: <20260721141105.2648468-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721141105.2648468-1-leon.anavi@konsulko.com>
References: <20260721141105.2648468-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 14:11:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128352

Inherit ptest-python-pytest and include tests for invoke.
Use -s because some tests read from stdin while output is
captured. Skip tests that require a real terminal.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-invoke/run-ptest           | 19 ++++++++++++
 .../python/python3-invoke_3.0.3.bb            | 29 ++++++++++++++-----
 2 files changed, 40 insertions(+), 8 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-invoke/run-ptest

diff --git a/meta-python/recipes-devtools/python/python3-invoke/run-ptest b/meta-python/recipes-devtools/python/python3-invoke/run-ptest
new file mode 100644
index 0000000000..7487702f2d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-invoke/run-ptest
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+pytest -s --automake \
+  --deselect "tests/runners.py::Local_::pty::when_pty_True_we_use_pty_fork_and_os_exec" \
+  --deselect "tests/runners.py::Local_::pty::pty_uses_WEXITSTATUS_if_WIFEXITED" \
+  --deselect "tests/runners.py::Local_::pty::pty_uses_WTERMSIG_if_WIFSIGNALED" \
+  --deselect "tests/runners.py::Local_::pty::WTERMSIG_result_turned_negative_to_match_subprocess" \
+  --deselect "tests/runners.py::Local_::pty::pty_is_set_to_controlling_terminal_size" \
+  --deselect "tests/runners.py::Local_::pty::spurious_OSErrors_handled_gracefully" \
+  --deselect "tests/runners.py::Local_::pty::other_spurious_OSErrors_handled_gracefully" \
+  --deselect "tests/runners.py::Local_::pty::non_spurious_OSErrors_bubble_up" \
+  --deselect "tests/runners.py::Local_::pty::stop_mutes_errors_on_pty_close" \
+  --deselect "tests/runners.py::Local_::pty::fallback::can_be_overridden_by_kwarg" \
+  --deselect "tests/runners.py::Local_::pty::fallback::can_be_overridden_by_config" \
+  --deselect "tests/runners.py::Local_::pty::fallback::overridden_fallback_affects_result_pty_value" \
+  --deselect "tests/runners.py::Local_::shell::defaults_to_bash_or_cmdexe_when_pty_True" \
+  --deselect "tests/runners.py::Local_::shell::may_be_overridden_when_pty_True" \
+  --deselect "tests/runners.py::Local_::env::uses_execve_for_pty_True" \
+  --deselect "tests/runners.py::Local_::get_pid::is_top_level_pid_when_using_pty"
diff --git a/meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb b/meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb
index e9d19da088..a5e6198ce8 100644
--- a/meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-invoke_3.0.3.bb
@@ -3,16 +3,29 @@ HOMEPAGE = "https://www.pyinvoke.org/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8815068973f31b78c328dc067e297ab"
 
+SRC_URI += "file://run-ptest"
+
 SRC_URI[sha256sum] = "437b6a622223824380bfb4e64f612711a6b648c795f565efc8625af66fb57f0c"
 
-inherit pypi python_setuptools_build_meta
+inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 RDEPENDS:${PN} += " \
-        python3-fcntl \
-        python3-json \
-        python3-logging \
-        python3-pprint \
-        python3-terminal \
-        python3-unittest \
-        python3-unixadmin \
+    python3-fcntl \
+    python3-json \
+    python3-logging \
+    python3-pprint \
+    python3-terminal \
+    python3-unittest \
+    python3-unixadmin \
+"
+
+RDEPENDS:${PN}-ptest += " \
+    python3-pytest \
+    python3-pytest-benchmark \
+    python3-core \
+    python3-io \
+    python3-pytest-relaxed \
+    python3-icecream \
+    python3-unittest \
+    python3-unittest-automake-output \
 "
-- 
2.47.3


