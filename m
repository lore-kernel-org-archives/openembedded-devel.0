Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id A16367E436
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 22:28:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id c5so3513058wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 15:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=inwsB8Gpto248bC6zDj1VcSdqmG3uRwGA2pYXlgne9c=;
	b=jPfJ6DShXhJS4hCgsVC1yt0vTyPmQ0/EfOs4QSI2lFxgGU+/Wp+ErCG5vvq2Ez0zP2
	qA3kf4PszmYQcs7wWBLOdf0kMPLRJbB/klEfbXl1XQpJdPuQvkSSLSYx5mSXs1ipp1ix
	mLt+ie2K9HoMxkk3b+VzX9/ua9taA7nUL6vn14zRVTd7e/N1hUQMvuSNdRfItx7izeAg
	Pj3voqyQ0IXC2m2o9XTPqCohjtnhv0f6Q+EJmquHm0strWFtNhHDnxYO4Z8zkD++XSgt
	Q5lmJaV9CYp8V8S+K0ft0QawBW8641pKxc4mM5PdzwoHlT2TIAmueU81Wr3rLdX6Iq1r
	XPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=inwsB8Gpto248bC6zDj1VcSdqmG3uRwGA2pYXlgne9c=;
	b=JgoVH6wWBfbASDrV4W6bb6OyAtJoj9BcPEMGI8Jd2iQBiAUksl+0ihYNXHM62XS/u6
	k8cuJmzl6/lRuLRIMprTf5wf5sm7T6IJYdQyTarMHNExS885Vfa1hku6FQnxZIkIo3h5
	urqB4lmx05BNUDHLARwESXDb16RmQ14XrhvFD0RtPRWzLaxKuFFmuA5weVYwRBI77vwm
	FEozs/cP3/LhiWQrZss1sNFRAntDOrB3xnEfNWrSSeb8u/mqk1zZnNDAvYMz/QZZDW+z
	gV6RanEFMKbkd4UM8hMiQhWgIuY+72ZcxkbKVa2YvH+Y1kWKF3FSNRfcQwR122Cru3T3
	MTMw==
X-Gm-Message-State: APjAAAWnwR2MDyiYBmI5NegF9cEGtS4Br5lHC4Y6pj10sAoMBso3nSxn
	nexOSINUMcJJbMp/OHHcT3DgJz9VyTE=
X-Google-Smtp-Source: APXvYqy5gFFDwGoIJVlxDN+AFnSaysYYVAG9s3TP7D1a4czEopEMupwO+n6sVRzhBtUuUl5vOCWv0A==
X-Received: by 2002:a1c:f106:: with SMTP id p6mr2181348wmh.148.1566426535916; 
	Wed, 21 Aug 2019 15:28:55 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	d17sm22823967wrm.52.2019.08.21.15.28.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Aug 2019 15:28:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2019 22:28:53 +0000
Message-Id: <20190821222853.737-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python-socketio: prevent python2 socketio depending on python3-aiohttp
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
X-List-Received-Date: Wed, 21 Aug 2019 22:28:55 -0000

* enable client and asyncio_client PACKAGECONFIGs only in python3-socketio, because
  there is no python-websockets, python--websocket-client recipes for python2 version
* fixes:
  ERROR: Nothing RPROVIDES 'python3-aiohttp' (but
    meta-oe/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
    RDEPENDS on or otherwise requires it)
  when python3-aiohttp is blacklisted

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-python/recipes-devtools/python/python-socketio.inc     | 6 +++---
 .../recipes-devtools/python/python3-socketio_4.3.1.bb       | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-socketio.inc b/meta-python/recipes-devtools/python/python-socketio.inc
index 7ebc4eac7a..7ee99f8d99 100644
--- a/meta-python/recipes-devtools/python/python-socketio.inc
+++ b/meta-python/recipes-devtools/python/python-socketio.inc
@@ -12,9 +12,9 @@ PYPI_PACKAGE = "python-socketio"
 SRC_URI[md5sum] = "86cd47dddea1785ce7a6c72f55c93fe7"
 SRC_URI[sha256sum] = "506b2cf7a520b40ea0b3f25e1272eff8de134dce6f471c1f6bc0de8c90fe8c57"
 
-PACKAGECONFIG ?= "asyncio_client client"
-PACKAGECONFIG[asyncio_client] = ",,,python3-aiohttp python3-websockets"
-PACKAGECONFIG[client] = ",,,python3-requests python3-websocket-client"
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
+PACKAGECONFIG[client] = ",,,${PYTHON_PN}-requests ${PYTHON_PN}-websocket-client"
 
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-engineio \
diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb b/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
index ce83d09c0e..8ff590bd75 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
@@ -1,2 +1,4 @@
 inherit setuptools3
+
+PACKAGECONFIG ?= "asyncio_client client"
 require python-socketio.inc
-- 
2.17.1


