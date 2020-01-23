Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6B597FD96
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:15:33 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id s7so117738pjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W+Fo98K7oFmZT+hvVq7fPeym5N1Raj7CTWnMR9aJvII=;
	b=U/EFTPtHjXBzid1qVDOSOqKnKOjrDdv3e062nST5DB7n1WRPIofmBczyiD/iZdmGR9
	y6vOl9ttJJ0EM9aAGh0Z/nSK9OO02JdGnjksY8Z+4lCdaso7wdtb+PvHv84XWxJzFnLK
	sTPiqdH6eB8I75IfiS3RIEv9s021qWDv0qSwzF6GNXzmCyZRSu3/cqKCcA52KwkP7ExX
	6tNywoyhDfBeb2RggdZdpsqOG39g3rDDBw0CieeCljfjDieUzdcuOu7IfowT+AKplLb0
	6bX/0zusU5/GtjiR/GzN/fgmGZT/EU4dTDK8m+6y4DFYgYAGFhnH5LO8NTkROgxDJHgb
	pFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=W+Fo98K7oFmZT+hvVq7fPeym5N1Raj7CTWnMR9aJvII=;
	b=RhBy3jEvV5rIaCfNmNzoRv6QHxGTpCVH8TlgXMVEd+dOMCYa7gkIeUbVUESgABXnwP
	lt83xwc3l5YsC9yuAJDjnWGjV+NTs3qh8tz4RbAus/2VuTpc2Qg3AupUtxWCdy1zQjwZ
	acxqLAkgr/9nnqgZeyUfwkaOKtdqg+tqCX2FaRzQP8QZn/FaYkDldguagtDhDxc60n6o
	RV/tOYdBZNIO5UWEOfbVJ9CUHMDdbr3GLXbn1W4IPeZ+F57bWo/lisKyP/w55kAUHYL8
	e1xFS9g7lfIwtro9/txy0Q+EjZsyXQqauxk1XKMjDdLM3kbjm9/04U0Y5SfTCo+IYOZO
	+Gqg==
X-Gm-Message-State: APjAAAVQlqVqarQkBJx2ysULJDLwTOFgN53ziBrg8PyJ15lQSWauROMI
	DFYdE8Wd/kqHLRrBx8vvZVOO83bfuek=
X-Google-Smtp-Source: APXvYqzqjzRlxw7fi6XA1DJHnqGb1p3uBBBT/jAuZ7IRaaHcaDzButyo0q8MMxYCq/xOLSw/VfwiDg==
X-Received: by 2002:a17:902:9a8e:: with SMTP id
	w14mr270193plp.315.1579817734356; 
	Thu, 23 Jan 2020 14:15:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	o98sm3963012pjb.15.2020.01.23.14.15.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 14:15:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2020 14:15:34 -0800
Message-Id: <20200123221534.1581843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Guillaume Burel <guillaume.burel@stormshield.eu>
Subject: [meta-oe][PATCH] nodejs: Fix build on big-endian targets
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
X-List-Received-Date: Thu, 23 Jan 2020 22:15:33 -0000
Content-Transfer-Encoding: 8bit

Fixes
../deps/v8/src/runtime/runtime-utils.h:129:11: error: base operand of '->' has non-pointer type 'v8::internal::Object'
  129 |   return y->ptr() | (static_cast<ObjectPair>(x->ptr()) << 32);
      |           ^~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Guillaume Burel <guillaume.burel@stormshield.eu>
---
 .../nodejs/nodejs/big-endian.patch             | 18 ++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_12.14.1.bb  |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch b/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
new file mode 100644
index 0000000000..529381842f
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/big-endian.patch
@@ -0,0 +1,18 @@
+
+https://github.com/v8/v8/commit/878ccb33bd3cf0e6dc018ff8d15843f585ac07be
+
+did some automated cleanups but it missed big-endian code.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/deps/v8/src/runtime/runtime-utils.h
++++ b/deps/v8/src/runtime/runtime-utils.h
+@@ -126,7 +126,7 @@ static inline ObjectPair MakePair(Object
+ #if defined(V8_TARGET_LITTLE_ENDIAN)
+   return x.ptr() | (static_cast<ObjectPair>(y.ptr()) << 32);
+ #elif defined(V8_TARGET_BIG_ENDIAN)
+-  return y->ptr() | (static_cast<ObjectPair>(x->ptr()) << 32);
++  return y.ptr() | (static_cast<ObjectPair>(x.ptr()) << 32);
+ #else
+ #error Unknown endianness
+ #endif
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
index e9ec500e51..6eb52c209a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0003-Install-both-binaries-and-use-libdir.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
+           file://big-endian.patch \
            "
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
-- 
2.25.0


