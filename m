Return-Path: <andrej.rode@ettus.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 75E8477E65
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 18:58:38 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id s16so32345483pfs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YnbxikANATpz83r4e9i3ZGykWBRkpC55ON/XkSMMIMA=;
	b=153O8QKk2pzN2ae/QXK9+847P0MsWhi3RAHnDZyt24OmHlE4Z4yPhlhakShaY3XLRa
	K8hXBuWOvMnYAfCBbIEv1VKhtvHbhAH0yxX8OAwFuVvLbdBETnGzoUlFTTb8EJB9KGby
	kSQb+nivhhsHGU+vUakL2ImlKOWKmQ5CY2XHYx5JTUubx6pv5Yf9zuNTuXZF4RMgcweH
	htjxldf/NZ4p/KzhLH7e4zSalLlBmMFlaE7TFaHvYmmzszrZEYJAS9k9Ege4Y7boNZGs
	rJeCwcKLWbTSnft1YpQCpkxNC4KfAwj7O4sv2RpcFVx4meOyBMh5j0+LpbYsUwgY9mFc
	Swfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YnbxikANATpz83r4e9i3ZGykWBRkpC55ON/XkSMMIMA=;
	b=rWVaLXZsDktahn5bIwdgEddHFtZCOQQeb2ukGXe9HnhWhC/Aa3WrQWP4S8/po8aM+O
	jCrBJMnFWUQM89oII1+1FE7c/Bdvp1G/IK/foyoPLh5SP+W9AseMaMT7nBBzn2dlHjOt
	ovZ9uJyjEV7UMvD6V6cTuRaHHT/7eQl1zCkg+OPylKU/yU7pv9QaRaZt3HZZ2E3Y9ThX
	XHHlPhKEpqWvpJZ/FzZ62Y3i5bTNE0FW4xNrllGG51qUAjtgUVDuDGJi9aSwnfgRXdtS
	for8mc4l1uToAm6EihHASBPKorQ0tWFdcbdj3bRql41z693Nxcc7rxLssE3GxW+YhA0r
	/fzA==
X-Gm-Message-State: AN3rC/4PnTgKjjJDXdp4uT9i1BvnADG21id+veWGd2+CCNkV8hzl0Ga9
	ddBbLAoNsM6KlfKY
X-Received: by 10.84.198.3 with SMTP id o3mr5183543pld.45.1492109920453;
	Thu, 13 Apr 2017 11:58:40 -0700 (PDT)
Received: from FlyingDragon.amer.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	w16sm44074964pgc.44.2017.04.13.11.58.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Apr 2017 11:58:40 -0700 (PDT)
From: Andrej Rode <andrej.rode@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 11:58:13 -0700
Message-Id: <20170413185813.25145-2-andrej.rode@ettus.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170413185813.25145-1-andrej.rode@ettus.com>
References: <20170413185813.25145-1-andrej.rode@ettus.com>
Subject: [meta-python][PATCH v3 2/2] python-mprpc: add new recipe
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
X-List-Received-Date: Thu, 13 Apr 2017 18:58:39 -0000

Add recipe for python-mprpc, a messagepack RPC library for python

Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
---
 .../python-mprpc/files/0001-fix_setup_py.patch     | 34 ++++++++++++++++++++++
 .../python-mprpc/python-mprpc_0.1.13.bb            | 17 +++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
 create mode 100644 meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb

diff --git a/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch b/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
new file mode 100644
index 0000000..f5df9b9
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-mprpc/files/0001-fix_setup_py.patch
@@ -0,0 +1,34 @@
+From bda99eab9036d46e7bb06b446d11cab0b1dd8093 Mon Sep 17 00:00:00 2001
+From: Andrej Rode <andrej.rode@ettus.com>
+Date: Mon, 10 Apr 2017 16:49:50 -0700
+Subject: [PATCH] setup: remove find_packages and only install mprpc
+
+Signed-off-by: Andrej Rode <andrej.rode@ettus.com>
+---
+ setup.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 5001d0c..4c0ba75 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,6 +1,6 @@
+ # -*- coding: utf-8 -*-
+ 
+-from setuptools import setup, Extension, find_packages
++from setuptools import setup, Extension
+ 
+ setup(
+     name='mprpc',
+@@ -10,7 +10,7 @@ setup(
+     author='Studio Ousia',
+     author_email='ikuya@ousia.jp',
+     url='http://github.com/studio-ousia/mprpc',
+-    packages=find_packages(),
++    packages=['mprpc'],
+     ext_modules=[
+         Extension('mprpc.client', ['mprpc/client.c']),
+         Extension('mprpc.server', ['mprpc/server.c'])
+-- 
+2.10.2
+
diff --git a/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
new file mode 100644
index 0000000..78df00a
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-mprpc/python-mprpc_0.1.13.bb
@@ -0,0 +1,17 @@
+SUMMARY = "A gevent based messagpack rpc library"
+DESCRIPTION = "mprpc is a fast implementation of the messagepack rpc protocol for python. \
+It is based on gevent for handling connections and enabling concurrent connections."
+HOMEPAGE = "https://github.com/studio-ousia/mprpc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
+DEPENDS += "python-gevent"
+RDEPENDS_${PN} += "python-gevent python-msgpack python-gsocketpool"
+
+SRC_URI_append = " \
+    file://0001-fix_setup_py.patch;patch=1;pnum=1 \
+"
+
+SRC_URI[md5sum] = "449e6239eb5ff07b9cceb86e1ab0c2ee"
+SRC_URI[sha256sum] = "5881cc7fbb8de814e2b4aa5958bfe147c5c301e46749190f0e6abf373cf56d82"
+
+inherit pypi setuptools
-- 
2.10.2


