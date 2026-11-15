Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3858.1794729118015925158
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:51:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=H6Oad46c;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so6973397eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729117; x=1795333917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HjQpNfB8xJvApidTb9WF8FFcEQxsWy04RnVqNyWwic=;
        b=H6Oad46cdGwyO9LQqcytM4fgaE1dZuA5+C55BBBviy5bFsSbcDd8Ip0TvkeWr8xZxo
         X3vWrzeNtsI2+HYuc7LBYVqaCI3Z4XvYuqTsBzlkqLXLzc6l9fc8bqDMfqR2tmI3+IAD
         ubJMC76Ht3Kvbh51b5Whl2sMnqCsRbRkkRNLXzMnstP4kEogwTLVMrPWJ+0MEBaP/fzv
         MH8vEGeUH8byhBH/gTTrBwvfjBopn/oCra4PWHQykOXfwWlmClKRtOjFuo+BjwKovu30
         LaSf0fcWDwhk0imu1NScsvtxqwaRPWeqQYWurxpXrOqelgN3R6B0Di0uKXNcoQKRPsB+
         qZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729117; x=1795333917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HjQpNfB8xJvApidTb9WF8FFcEQxsWy04RnVqNyWwic=;
        b=wy8atS33wta+aUcJr62lT5vldhpVTU5yivDv8f3hVRlC9Ar/ENopgAmFcH3lNcGpp6
         iNxWLGJjMxSNT83/vmUTS/U0oMTztj3Q1GNxEnAp9wb6fx29ec05+eOfak5ENUcJiP6Y
         dVjWoQUOp6y3hMdyisja0t4prj8uvvVGlgDr85jbFNdsXSFvgubB1taNI+jbRQrprC5h
         yXj9Cd3rlITmVhRsaSPcYCK6td/lm7MEf3tKvXFQprm0j32OxshyB3gpZ+VtjiNn94ts
         ww4c6B50oMFZOU80Vg3kh7Ag1h4ctyyydml8raPQH47b7wSjGmPh0GI9fBcTCexMIOZt
         WbWg==
X-Gm-Message-State: APuU4Z8PiH/5BKumXuwJBiQtIPevqoY+aObptGKBoq5ID2nXGI/hqM0P
	jjrK8z4JNtrpHeJ7Epu0HF3Mv5Z6Lh5/wjRL6upsJn/JCUQaSIuKgoFBSV4tfBnx
X-Gm-Gg: AYBFou1IyqpsvUplSR4hPZc2M1mFe3Eh7QNTkEAxIzcgCE4HINmIr7I5RifdKYwfJaj
	e4P1k85NeH9wrKQBMZZfMWGaukUE67NqTVDv1wuOXvokjCJRmb4sb+QnIl2RFscWTl8ReayDQXD
	AYCqXjVrbCj6QR3gQgEm3aNHjn6QWpFHepHY1+4N6aYQhwCE5BppfiGbKG0Mj6IbqbXLtONX8Id
	eY2h0fbe/h/zdDqe7IOnAJRtTW/h8HEIVq7TcwMtbIL5I9QpzspZlgXY438Y/k+q0SIJwhbZVMU
	CT8D144FYxtFbAcvnL7klX6WLkrxzayEidHNooB7+D4mFTw3U4NRspPQD6A6YOScYFyHASEFw6Y
	hNRlkVjygCiiNleficE0n3IaxH6c3sKRNlJLsZsv0nO0Bg67/vgshFt6T9qpZ3cpGUyJEGG/YXf
	DEBU5Ak1kZuSVq9w4uVGBjHZbCtnJo7Un5Uq/xZA5SdHF7IwbYBCQ+QecDjtJyrxG1KUhtz8kVT
	DLqdNBjq5XIy3Qd1jaWh5XX6r2Y0aIj8r6NkOltb2XfEZMhV8nI9jAZ1Q2aE3eMKyzRVHe2NFxX
	vG95SnKlKiCv+6I9ZPP35+sWonyR+2Dgyx1Jxk/vk+ePYYKcr3wPaQI+yQBiV9bEAWnwLETi6jg
	LQfChP5zwddWhGddKcE1rvbtUscE62FuyhQUqUlSeKK9OySOANxXIAweSOB3ZfRHliTpKGCCtaC
	tf5mESdiJsemHDpmeTPGL7fkIok+QNlDm7UXjJyEXsftA5c28OISyW93MNKT8jTM/Lrw3HypDuO
	UhjnnJYaLXxu2oLkEjVD4bIT+K/6R7RaZ8jhud/RKwAh3Xxki5LgxPElbNvIwlNNRDqDh6NrFzm
	+Jd+6w==
X-Received: by 2002:a05:7300:d718:b0:36a:12c1:3adb with SMTP id 5a478bee46e88-37966b52740mr10950038eec.20.1794729117375;
        Sat, 14 Nov 2026 23:51:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:51:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 96/96] python3-pyzmq: Fix racy test_log ptests on loaded hosts
Date: Sat, 14 Nov 2026 23:49:14 -0800
Message-ID: <20261115074918.2932593-96-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132366
Content-Type: text/plain; charset="utf-8"

test_blank_root_topic publishes right after adding a subscription, so
on a loaded host the message is dropped and the test hits its 60s
timeout. It then leaves a handler with a closed socket on the shared
logger, and all following TestPubLog tests fail with ENOTSOCK.

Wait for the subscriptions with XPUB sockets instead of sleeping, and
remove leftover handlers in tearDown.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...or-subscriptions-instead-of-sleeping.patch | 104 ++++++++++++++++++
 .../python/python3-pyzmq_27.2.0.bb            |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch b/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch
new file mode 100644
index 0000000000..6ee1a1b91f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyzmq/0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch
@@ -0,0 +1,104 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 14 Nov 2026 08:57:25 -0800
+Subject: [PATCH] test_log: wait for subscriptions instead of sleeping
+
+The PUBHandler tests rely on short sleeps for the SUB subscriptions to
+reach the PUB socket, and test_blank_root_topic and test_root_topic
+publish right after adding a subscription without waiting at all. On a
+loaded machine the subscription arrives after the message is published,
+the message is dropped, and recv_multipart() blocks until the test
+timeout.
+
+Because handlers are removed from the shared 'zmqtest' logger only at
+the end of each test, such a failure also leaves a handler whose socket
+is closed in tearDown attached, and every following test fails with
+ENOTSOCK when it logs.
+
+Use XPUB sockets where the test creates the socket and wait for the
+subscription messages before publishing, and remove leftover handlers
+in tearDown.
+
+Upstream-Status: Submitted [Pending]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/test_log.py | 29 +++++++++++++++++++++++------
+ 1 file changed, 23 insertions(+), 6 deletions(-)
+
+diff --git a/tests/test_log.py b/tests/test_log.py
+index a9cd40e..43d24d3 100644
+--- a/tests/test_log.py
++++ b/tests/test_log.py
+@@ -21,16 +21,33 @@ class TestPubLog(BaseZMQTestCase):
+         logger.setLevel(logging.DEBUG)
+         return logger
+
++    def tearDown(self):
++        # don't leave handlers with closed sockets behind if a test fails
++        logger = logging.getLogger('zmqtest')
++        for handler in logger.handlers[:]:
++            logger.removeHandler(handler)
++        super().tearDown()
++
++    def wait_for_subscriptions(self, xpub, n=1):
++        """Wait until n new subscriptions have reached the XPUB socket
++
++        Subscriptions are delivered asynchronously, so messages published
++        before they arrive are dropped.
++        """
++        for _ in range(n):
++            msg = xpub.recv()
++            assert msg[:1] == b'\x01'
++
+     def connect_handler(self, topic=None):
+         topic = self.topic if topic is None else topic
+         logger = self.logger
+-        pub, sub = self.create_bound_pair(zmq.PUB, zmq.SUB)
++        pub, sub = self.create_bound_pair(zmq.XPUB, zmq.SUB)
+         handler = handlers.PUBHandler(pub)
+         handler.setLevel(logging.DEBUG)
+         handler.root_topic = topic
+         logger.addHandler(handler)
+         sub.setsockopt(zmq.SUBSCRIBE, topic.encode())
+-        time.sleep(0.1)
++        self.wait_for_subscriptions(pub)
+         return logger, handler, sub
+
+     def test_init_iface(self):
+@@ -62,7 +79,7 @@ class TestPubLog(BaseZMQTestCase):
+         logger.removeHandler(handler)
+
+     def test_init_socket(self):
+-        pub, sub = self.create_bound_pair(zmq.PUB, zmq.SUB)
++        pub, sub = self.create_bound_pair(zmq.XPUB, zmq.SUB)
+         logger = self.logger
+         handler = handlers.PUBHandler(pub)
+         handler.setLevel(logging.DEBUG)
+@@ -73,9 +90,7 @@ class TestPubLog(BaseZMQTestCase):
+         assert handler.ctx is pub.context
+         assert handler.ctx is self.context
+         sub.setsockopt(zmq.SUBSCRIBE, self.topic.encode())
+-        import time
+-
+-        time.sleep(0.1)
++        self.wait_for_subscriptions(pub)
+         msg1 = 'message'
+         logger.info(msg1)
+
+@@ -91,6 +106,7 @@ class TestPubLog(BaseZMQTestCase):
+         self.sockets.append(sub2)
+         sub2.connect(self.iface)
+         sub2.setsockopt(zmq.SUBSCRIBE, b'')
++        self.wait_for_subscriptions(handler.socket)
+         handler.root_topic = b'twoonly'
+         msg1 = 'ignored'
+         logger.info(msg1)
+@@ -109,6 +125,7 @@ class TestPubLog(BaseZMQTestCase):
+         self.sockets.append(sub_only_info)
+         sub_only_info.connect(self.iface)
+         sub_only_info.setsockopt(zmq.SUBSCRIBE, b'INFO')
++        self.wait_for_subscriptions(handler.socket, 2)
+         handler.setRootTopic(b'')
+         msg_debug = 'debug_message'
+         logger.debug(msg_debug)
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
index c2230a49b4..539d610317 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.2.0.bb
@@ -28,6 +28,7 @@ PEP517_BUILD_OPTS = "--skip-dependency-check \
 "

 SRC_URI:append = " \
+    file://0001-test_log-wait-for-subscriptions-instead-of-sleeping.patch \
     file://run-ptest \
 "
 SRC_URI[sha256sum] = "54d4259d1bfae24ecdb5ca79f7acc2eac6c286a02d6a0ae617797cb45f0726d3"
