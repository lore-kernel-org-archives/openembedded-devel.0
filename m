Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B3837F7D6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 14:20:15 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id r14so3133805lfm.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Jan 2020 06:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fkZKgxQ+hZUMpTFK+wjR1asbzg6kBLL0NY3NyCQm7z0=;
	b=efI0gFzmEWLw0WRFhEOQqgLeRC2yRhHfA2YHk5XpibRkjcUGvVZdRMa32qansvWYOE
	djYG3ls3SN2BH7yry3p0jB2mpp7uWwh0ZwhJSqjuMfpKhU7Q2EI2ySUrHWZP+1xyic1x
	hjHRnRt3A/oCCGwg7TMBNwkDWADX120Xz3Nt6eoj3fRhjw0qTmetx5E31ivyHlE+kEdb
	tJX4tq+X3mX8K5Fe8MwFyPZhymOSXuU/B4wOBSes0FDRoox0vdK2MvQy9Arjxxv0FWiH
	AAX0Gq0qzRYfmUNDfaW2BkSiWc3W/66KR4zI9bZC746lNkhxuz4xNTuQPV1R+YMclRAy
	nmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fkZKgxQ+hZUMpTFK+wjR1asbzg6kBLL0NY3NyCQm7z0=;
	b=sgPz1TiRBLhPreUEusTtcIjm2BWznBy721yENgiGVheeDZ7as2yquv9dXzKOSaj3eQ
	TgcPfQZxJ0mAKsGS0g7W+l12J3fgQ/xFxZ8LZNEPFgTigSzJi2/qVkYIQIkdANuURt+r
	MODw6GTqaeG8vHz4f/69kBz4uV1u1NX23M6oPKnctC4mg4GFq8aQ756VB19niexglpPe
	C3fWIjRlV07BUY1oRbENaylZjv8pbUYqA1KJHUfHgzsCly8O34cusZv42ojxKRTlJ5C3
	p2f5j+cHpCQbaeBGIkWz9L18alNDHr0sG11it6T37Z2kfdIBrMPx9IWXUCjmNHt0pX9B
	zwJg==
X-Gm-Message-State: APjAAAXw57GSicLyy4kw0ZpzCLNptDHSgoqwg9xGJ6LSUGoOMtjIWFVW
	x+ogIoIuS7SFgEhDpIuhrRmCvbpTM0o=
X-Google-Smtp-Source: APXvYqxulwXBBWJWqYyZjgC5r6ww7kLVcrKzXdFuuJdtKEC7yR1+IOgDQuQR4zxH/DxvWOuJ1P21uw==
X-Received: by 2002:a19:7015:: with SMTP id h21mr3812932lfc.68.1579962015383; 
	Sat, 25 Jan 2020 06:20:15 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id
	g85sm4723391lfd.66.2020.01.25.06.20.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 25 Jan 2020 06:20:14 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Jan 2020 15:19:53 +0100
Message-Id: <1579961993-19996-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [meta-python] [PATCH] python3-pycrypto: drop time.clock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Jan 2020 14:20:15 -0000

From: Ming Liu <liu.ming50@gmail.com>

The use of time.clock() is deprecated in python 3.8, change to use
time.process_time().

Reference:
https://docs.python.org/3.3/library/time.html#time.clock

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...Replace-time.clock-with-time.process_time.patch | 34 ++++++++++++++++++++++
 .../python/python3-pycrypto_2.6.1.bb               |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycrypto/0001-Replace-time.clock-with-time.process_time.patch

diff --git a/meta-python/recipes-devtools/python/python3-pycrypto/0001-Replace-time.clock-with-time.process_time.patch b/meta-python/recipes-devtools/python/python3-pycrypto/0001-Replace-time.clock-with-time.process_time.patch
new file mode 100644
index 0000000..282fdd3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycrypto/0001-Replace-time.clock-with-time.process_time.patch
@@ -0,0 +1,34 @@
+From 1d90727ff2368012d6e2f91b1a3198f626495b7f Mon Sep 17 00:00:00 2001
+From: Ming Liu <liu.ming50@gmail.com>
+Date: Sat, 25 Jan 2020 14:36:16 +0100
+Subject: [PATCH] Replace time.clock() with time.process_time()
+
+The use of time.clock() is deprecated in python 3.8, change to use
+time.process_time().
+
+Reference:
+https://docs.python.org/3.3/library/time.html#time.clock
+
+Upstream-Status: Pending
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ lib/Crypto/Random/_UserFriendlyRNG.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/Crypto/Random/_UserFriendlyRNG.py b/lib/Crypto/Random/_UserFriendlyRNG.py
+index 957e006..d2a0259 100644
+--- a/lib/Crypto/Random/_UserFriendlyRNG.py
++++ b/lib/Crypto/Random/_UserFriendlyRNG.py
+@@ -74,7 +74,7 @@ class _EntropyCollector(object):
+         self._time_es.feed(struct.pack("@I", int(2**30 * (t - floor(t)))))
+ 
+         # Add the fractional part of time.clock()
+-        t = time.clock()
++        t = time.process_time()
+         self._clock_es.feed(struct.pack("@I", int(2**30 * (t - floor(t)))))
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
index 02d634c..a20eafe 100644
--- a/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycrypto_2.6.1.bb
@@ -1,6 +1,8 @@
 inherit distutils3
 require python-pycrypto.inc
 
+SRC_URI += "file://0001-Replace-time.clock-with-time.process_time.patch"
+
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
 # provide a "make install" target.
-- 
2.7.4


