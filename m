Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C85D5B877
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 04:25:08 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.11999.1730175903641505793
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Oct 2024 21:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dVP4COPg;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7180e07185bso2262193a34.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Oct 2024 21:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730175903; x=1730780703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqo2b3qUsP7FuK9XGZkGMQQD31+e15K8NDQ/+zsT95E=;
        b=dVP4COPgAERVxeUph/tOoHjH6fTKNGYRK44Dp7FpkXvin9oSN33rgp8LyUzwZzU9VF
         Tgemz0UxcKWVBuqTNoBpsppnc6nie1mZv0zJ5xShxUW3KsU2E9EJOee7iAWvONgPMUxL
         EtnuTBgGOUe6iEaTCInXF+c7vqjicGxkAwrGb49ayK5fCX3nEbS30Tn2KTSfBM0MdJpA
         cQgKH/qPkQmauk+YKqytoVgNkRun2/xtrwGXybx8ujp/gbYAZxjCE6CvNciLKwF8zUrN
         Ky9dLSVHx1Gy0b7n2EnxhUNcR0yJ7pkhNN7MH+fvr7eaUKXp2y6L2AorsnOgXlxSfhrU
         Kt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730175903; x=1730780703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqo2b3qUsP7FuK9XGZkGMQQD31+e15K8NDQ/+zsT95E=;
        b=pZsBjhAxuCzGAnGjcqQ6tJYfI5lGgxLEbzO73m1z0iChc1ha9vEhqmt1o4yC8hfisS
         KLA6XS8Y4pAKbi4bEkiNNriVTBEzuojgQTt6tD1JHO6l1k/pjWMFme+vwFL7ZBZ62MD3
         GGWebNHOQGJ/hOdWKRAJBsov98ZddKJw4Gt3Dkn6cGHj0ysxfmCCXfxcdMBr598LpWfI
         11RtayGUWOFanbvXmEgU6W9Hdcbs5RYv05+HG71hNGSvPitLNzSYjNDwjtpUeFOMk59P
         fmHhnTu+/7ToWSXvAozW6QpT9OTAnpx0kVix5VknJ22G/jbQyGc+Ws8Co5b3M5FPOzNb
         T+CA==
X-Gm-Message-State: AOJu0Yw/2TB37nF/lgI29VnGlG2BKvGhHWh+KTnl4I3GzkA3+XqtDap/
	rW8PH3HwsHaw2f5FCE6Thu1AQBBURsAX2qUoCwwTD8HkXDVoWQIQELhCV0Pp
X-Google-Smtp-Source: AGHT+IEqaPbnlsNPdDHcdW7Jwc9Bk4jHXkupi391iksH7Z73F1nspQL2F4Y/aYjwMK0GDEXYeTDSiA==
X-Received: by 2002:a05:6830:314e:b0:718:41b8:5d6d with SMTP id 46e09a7af769-7186828d782mr7156121a34.24.1730175902594;
        Mon, 28 Oct 2024 21:25:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::8085])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8679cbesm6710198a12.24.2024.10.28.21.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 21:25:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-eventlet: Add new thread attributes from Python 3.13
Date: Mon, 28 Oct 2024 21:24:55 -0700
Message-ID: <20241029042457.4125617-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029042457.4125617-1-raj.khem@gmail.com>
References: <20241029042457.4125617-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Oct 2024 04:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113319

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d6cc086684ee74db250f5fd35227c98e678a.patch | 27 +++++++++++++++++++
 .../python/python3-eventlet_0.37.0.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch b/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
new file mode 100644
index 0000000000..f8a268309a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eventlet/d19ad6cc086684ee74db250f5fd35227c98e678a.patch
@@ -0,0 +1,27 @@
+From d19ad6cc086684ee74db250f5fd35227c98e678a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Miro=20Hron=C4=8Dok?= <miro@hroncok.cz>
+Date: Thu, 6 Jun 2024 10:29:29 +0200
+Subject: [PATCH] Add new thread attributes from Python 3.13
+
+Does not fix https://github.com/eventlet/eventlet/issues/964 yet
+Upstream-Status: Backport [https://github.com/eventlet/eventlet/pull/965]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ eventlet/green/thread.py | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/eventlet/green/thread.py b/eventlet/green/thread.py
+index 053a1c3c6..384b3c290 100644
+--- a/eventlet/green/thread.py
++++ b/eventlet/green/thread.py
+@@ -118,3 +118,10 @@ def stack_size(size=None):
+ 
+ if hasattr(__thread, 'daemon_threads_allowed'):
+     daemon_threads_allowed = __thread.daemon_threads_allowed
++
++if hasattr(__thread, 'start_joinable_thread'):
++    start_joinable_thread = __thread.start_joinable_thread
++    _shutdown = __thread._shutdown
++    _make_thread_handle = __thread._make_thread_handle
++    _ThreadHandle = __thread._ThreadHandle
++    _get_main_thread_ident = __thread._get_main_thread_ident
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
index 84de0d8e44..df23162e05 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.37.0.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
+SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
 SRC_URI[sha256sum] = "fa49bf5a549cdbaa06919679979ea022ac8f8f3cf0499f26849a1cd8e64c30b1"
 
 inherit pypi python_hatchling

