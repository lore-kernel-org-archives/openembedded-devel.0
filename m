Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.738.1793419256652200823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 21:00:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oyez+A8V;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so2348019eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 21:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793419256; x=1794024056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1eg4F7t1OYUNkigxmAFLZD6w/XsjdQ+ehOaJWVWytU=;
        b=oyez+A8VZ5O2Rni49JxVvuy2JEqvwRX0OYhFhbP3hKUhJ+UTl8Nvp47CqImL2STDsv
         zNdmdKhQH/rO9FHDCJ5tL0GVHgzK2JTpwG0R9XSGbwDk83deiYHOYnaXmVaAZOhJ6L5O
         e6bziJZeimu/1r/aNnGzf7VROnkBYMvEaPw/Zm7O5UaNudC4zet9nf/LddSk5dRY9G3R
         xkCT1hyaJgTvD2PZNOuSvgvU5cdnqXog0DusJIP8tciHOyDxhvAuaeFPe2zsslCp0suJ
         6WdYti6iW4HsVVZc1JsScz2ZmyOFrLJ+t3refwD33MFW139a5civDC+KtuewNXH3SvBT
         FonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793419256; x=1794024056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E1eg4F7t1OYUNkigxmAFLZD6w/XsjdQ+ehOaJWVWytU=;
        b=kis7P9aakzXETBFztJC2q8dkf+Y484nOJWO9HNln+4EyufKmF3xHaXfOwzSedXlPXO
         pZnP14oOEvuAw/+pqc+cf7zAQR/LsEe8uU3KEfp9WpqG6WomFN7M9zQCeLG9xSbvV/gm
         qNMhDN18INCZGzOMDoqmaP0CdEud2s6zrBC7FcKgtLxrQAPtXXO7MIz2tD3tYnT1p8Ka
         eKm35gZv4sMG3lUf/4fgF5bDFNQxq4Q6cYKvrCgyVIdKQSLM3SXv/aOYlKX+e4ekDIjX
         Ps6z0CopEouC/skbEASY1xpAaswDqcBTqmheEcW/slhVmz6q7lzNNxjOmQb/ILE5a/Nz
         UUIg==
X-Gm-Message-State: AFq9FYLFFzVRbdsujdM74uTXQoJjOUvu04W6Q/3Gj9KIsagznoW2IXEo
	9Iox56XFPJ4egFsDkdcFLuzzhzHUl06KK5wXbSpJhnkfo3chcbwkDNjO1F5X6gwBwQI=
X-Gm-Gg: AYBFou2xgzM67kSAmAxHOdUBz87cw3OL+QTb4g/QwoRT+OB++jUZoxQiViO7Y1Am81H
	4e3HRiebrZIE01aYJsj1jp9aFUS3D0Bt1aiQPi9FcwzjlMv53p1hGBFuBnaI3FTsXngVKIWY1Mx
	K8wEFHZ6c57L/mgh1FMFWkkqK4FxAudUdrPFtS5HFozJIK/oxSxMOfDUC7B3hjw5/+V95hYJ/qC
	U0OHIusZa2zdrkPOYEzgSZV+FyVWJ4K40/UOgpUvg6750r4uhJoKpeurw8TNap4sPIgWl+cDRsa
	OEzi6l7xyJN1/7t1uvW+gZSvZ7I6C3WPlUjP8lyMwT0ARelTPbYXr/nEDJZ6+kU5wMCnZFiJ5O2
	uzXgtezMO5HpWsxSTJL9vfTdZIAHxb0IWCbSsWKvtLJv/Zy+kC58OwlUW6pTuTKJtlS/kQwkc4z
	wPdgC7o+mjyx/RndcRW39TFv/BgWo88wxMuvDenWtbP5YUai9f9WzVCx9vDgMnOjnV8Vtru+9DP
	zYz6hlemE1Ok7PIC/lsp+CF60TwPChUdMxxBFwdvGPfjMNeB6/XttDYyl3QzEkP/rxhehpjCf5O
	pwYSiY941hhf3YJywqYpnJ9gjH1nfyi7FyeMGRIjTBBvxn2g5PIxx9NzLgZN744YqI16ACttL1s
	HlZRMvkN+zQftPGQRYuvry8qDSIL2gO24gk70/tpGgvNt2ke2UG8kY6RXm5opIIe6/Sb0HOighU
	Xo9qjB/pCeTj4q9NBWX3szj0aMyVOBa3JEwXbZKdjepdh8SGqpZ6HtorTC8UaGsq3u4rVkagOkk
	VBWl/XknTUp2Ow9NIMbpqqBEYcO4osi3g/UlDV+Ea396teuR0oMYEBUgc37i6M3MOKqCtz2lydM
	HXAC
X-Received: by 2002:a05:7300:ce93:b0:351:5cb5:53f7 with SMTP id 5a478bee46e88-36a42225ad3mr5835293eec.3.1793419255637;
        Fri, 30 Oct 2026 21:00:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a98f65sm11853728eec.28.2026.10.30.21.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 21:00:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/3] python3-objgraph: Fix intermittent test_at_addrs ptest failure
Date: Fri, 30 Oct 2026 21:00:50 -0700
Message-ID: <20261031040051.2131713-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261031040051.2131713-1-khem.raj@oss.qualcomm.com>
References: <20261031040051.2131713-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 31 Oct 2026 04:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131722
Content-Type: text/plain; charset="utf-8"

get_new_ids() keeps the ids it saw in earlier calls, including those of
objects freed since. When the list created by test_at_addrs reuses one
of those addresses it is not reported as new and the test fails, which
was seen on musl qemux86-64:

  {'python3-objgraph': ['tests.py:AtAddrsTest.test_at_addrs']}

Refresh the baseline right before creating the list.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...rs-independent-of-earlier-get_new_id.patch | 42 +++++++++++++++++++
 .../python/python3-objgraph_3.7.0.bb          |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-objgraph/0001-Make-test_at_addrs-independent-of-earlier-get_new_id.patch

diff --git a/meta-python/recipes-devtools/python/python3-objgraph/0001-Make-test_at_addrs-independent-of-earlier-get_new_id.patch b/meta-python/recipes-devtools/python/python3-objgraph/0001-Make-test_at_addrs-independent-of-earlier-get_new_id.patch
new file mode 100644
index 0000000000..15c7458492
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-objgraph/0001-Make-test_at_addrs-independent-of-earlier-get_new_id.patch
@@ -0,0 +1,42 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Oct 2026 08:08:23 -0700
+Subject: [PATCH] Make test_at_addrs independent of earlier get_new_ids() calls
+
+get_new_ids() keeps the ids it has seen in its _state and reports only
+ids that are not in there. Ids of objects that were freed after an
+earlier call stay in that set, so if the list created by test_at_addrs
+reuses the address of one of them it is not reported as new and the
+test fails:
+
+    self.assertIn(a, new_lists)
+  AssertionError: [0, 1, 2] not found in [...]
+
+Whether that happens depends on the allocator and on what ran before;
+it was seen intermittently with musl, and a slight change in what the
+test allocates makes it fail every time.
+
+Call get_new_ids() once more right before creating the list, as the
+example in its docstring does, so the baseline only holds live objects.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests.py b/tests.py
+index 0c7aa1f..1dab8c1 100755
+--- a/tests.py
++++ b/tests.py
+@@ -361,6 +361,10 @@ class ByTypeTest(GarbageCollectedMixin, unittest.TestCase):
+ class AtAddrsTest(unittest.TestCase):
+
+     def test_at_addrs(self):
++        # get_new_ids() remembers the ids seen by earlier calls, including
++        # ones of objects that have been freed since; refresh that state so
++        # that a list reusing such an address still counts as new.
++        objgraph.get_new_ids(limit=0)
+         a = [0, 1, 2]
+         new_ids = objgraph.get_new_ids(limit=0)
+         new_lists = objgraph.at_addrs(new_ids['list'])
diff --git a/meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb b/meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb
index 9ddfe97f53..f4098272ec 100644
--- a/meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-objgraph_3.7.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://mg.pov.lt/objgraph/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e48a556235f55ad7d4234475657f68a7"

-SRC_URI:append = " file://run-ptest"
+SRC_URI:append = " file://run-ptest \
+                   file://0001-Make-test_at_addrs-independent-of-earlier-get_new_id.patch \
+                   "
 SRC_URI[sha256sum] = "b6ef4b244217410509b257970413b01a979d54df48d2d4055b6941e8679ddbbb"

 inherit pypi setuptools3 ptest-python-pytest
