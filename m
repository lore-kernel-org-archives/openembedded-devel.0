Return-Path: <ticotimo@gmail.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3F47FC98
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:48:01 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id i6so91267pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+kQu/sCsT1Zd66DJy975qAVRc5k9QECEfqoRRyyy2fU=;
	b=Bl/j6j3o6HOW7GXqvrs9xwpA4dqlam/XvMW7W62Tr4EkL1wbztRd3LB4hfjX5bqyOf
	c7jh9HtQd/0ALtBe/IXmUHjlLE6/iUNHJQi4sWogz/93NCRkHz1+NddJPl70wgbiHhSs
	uLxwW1cYBs8wQv58buK2LKViP+x658CGULPbdiAOv1HHCNyEfZlBCwuEYsRAf+5rsbzk
	ubceZ7sEQcNldHFtzXyGGBtMP87U6VCaw5BKeEVpOuZv+n9EqQGnWnz9Vj5cW5LcsSrh
	i/z2ZRkiVWS9vkNttRMZIuB11JCHJ759fJ2kXvkKpMd8ycq+5coMc0B9Pc0RsGCBcLea
	INUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+kQu/sCsT1Zd66DJy975qAVRc5k9QECEfqoRRyyy2fU=;
	b=bQTMuSnkoPZkBm65nrPGBxSedAWJg64MaZi3CzY3QVJp0V3HoE2Dyp+hsuuxlXnX3H
	OL9xuPhpVVSHRVUovmwuhab4MTsM6fEyxMBwE/2/G3YGCV1SmVKTU1XSQuUa4pXEPkvS
	EevHzQQGNEWMUjeZ+pdT0dihflFlm0GO5Z5jkBiGA8YLLlgoo45kI3ckKKy/Ce9Qvl76
	Xrj0S93eXOywD20UX62xlw7hzyLpUMDvR+k1teFwEx85wXxZkFPfaXajbvLY+vXqjAXC
	oy9/iidbRvy6n8vpmB/sSU6xBQWPTFBRFv5AF3pB4Z4ik5r21e+p3hbsSPnK43+qQE1g
	I7kA==
X-Gm-Message-State: APjAAAVMQCTF1smZa44TC0TGJL7E+p010bXVO6i6HLwP1rXbAroKmPzL
	v3O8nUKAccm/trItwxn42gCYukTL1vY=
X-Google-Smtp-Source: APXvYqy8sZVoMsYdICyDGkocdi50INq1NQr8SGZ+e5WYZuSRZrXL+KnsWbprNJeg0r9w/xbPeg2lHw==
X-Received: by 2002:a63:4f05:: with SMTP id d5mr780952pgb.341.1579542482006;
	Mon, 20 Jan 2020 09:48:02 -0800 (PST)
Received: from thetis.hsd1.or.comcast.net
	([2601:1c0:6080:4500:f5dc:646c:4755:5ca9])
	by smtp.gmail.com with ESMTPSA id
	o7sm42400654pfg.138.2020.01.20.09.48.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:48:01 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Jan 2020 09:47:27 -0800
Message-Id: <20200120174727.40278-1-ticotimo@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-python2][PATCH] python-setuptools: copy patch from oe-core
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
X-List-Received-Date: Mon, 20 Jan 2020 17:48:01 -0000
Content-Transfer-Encoding: 8bit

The following patch is needed for python-setuptools-native:
0001-conditionally-do-not-fetch-code-by-easy_install.patch

While currently this is duplication of the same patch in oe-core,
there is no guarantee that the patch will continue to stay in sync
for py2, so copy the known working patch now.

Signed-off-by: Tim Orling <ticotimo@gmail.com>
---
 ...ly-do-not-fetch-code-by-easy_install.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 recipes-devtools/python/python-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch

diff --git a/recipes-devtools/python/python-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/recipes-devtools/python/python-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
new file mode 100644
index 00000000..169d1b15
--- /dev/null
+++ b/recipes-devtools/python/python-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -0,0 +1,32 @@
+From 5bba4f57f048016aa92ce5909e9e372db619554e Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Jul 2018 10:13:38 +0800
+Subject: [PATCH] conditionally do not fetch code by easy_install
+
+If var-NO_FETCH_BUILD is set, do not allow to fetch code from
+internet by easy_install.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ setuptools/command/easy_install.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
+index 05508ce..945e118 100755
+--- a/setuptools/command/easy_install.py
++++ b/setuptools/command/easy_install.py
+@@ -640,6 +640,11 @@ class easy_install(Command):
+             os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
+ 
+     def easy_install(self, spec, deps=False):
++        if os.environ.get('NO_FETCH_BUILD', None):
++            log.error("ERROR: Do not try to fetch `%s' for building. "
++                      "Please add its native recipe to DEPENDS." % spec)
++            return None
++
+         if not self.editable:
+             self.install_site_py()
+ 
-- 
2.25.0


