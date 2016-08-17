Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 148EB73285
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:38 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o1so9434209qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=skD390nvkmWiQr65ejORG6IGszGq9nSFdSljJNzWK8g=;
	b=OWmXu9E39fivz4qg0tVvxthT3uBVuAO0yFcj4zIKTreZyHf41gJhJIQLUdjt4wvZn/
	vQ6CZEMOf18BJOdH0tAaKWe6cNzZEUBl/4kJn/qgfGZREQH2XJIfKRkAfaNVslkkgIy2
	ZSgiirg0Ww3ezxej2PFiD3L/Yzv5NGwUkRFDCP6+gBSXeyjhBWVN+M1mYDZV5q1E7H5X
	sDo/+yOKU0vPCmpLuQQls+YOzINnpVH52f42f6G+SE504jgHkr3AJxGyZ9uVAB0lgqWo
	6lxOSt1YST6UfafuOmtS+hh8K/BmnX8GHQXKfLkGLXsF7RS7hu6UaIchCWvid9PA2BMj
	x1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=skD390nvkmWiQr65ejORG6IGszGq9nSFdSljJNzWK8g=;
	b=VHisNLgQVQlFO118MiwIUb94HqMrgeKz3H9a4oLM8mVHBneu/3dRYQimazrviL1m41
	BBigea9B5+TdeXq5kmW+4D+BDonUWpI//xoGi+deqhg/7N/fURyUPZWlunrGJEL129fw
	I3oSqQ4BiChjfzyk+KytjsFclFLsp1MxbOwNnbYrQwO0RRLlT+1d/PUaV942qvzmjncp
	/2KybU7W20UxRMObjI73SLiQr+/pSm5fN7m3mDP6cnYZAB2vGNivCCr8tAdNQ9NQryku
	Hc+5jdUU9uJmWg/tqbaPd2dJbaPjO/xtVoSYUVSeKW5lwUwM5tYm497F7EmuxXSGV44U
	GTtA==
X-Gm-Message-State: AEkoouu5OsZkUDx8EwoX0dcZiXyP1PXpMZLH1bRS14wVf4dBbtWnypRBdX3Tt+iryCyfXw==
X-Received: by 10.55.42.169 with SMTP id q41mr43790586qkq.250.1471439919340;
	Wed, 17 Aug 2016 06:18:39 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:38 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:45 -0300
Message-Id: <1471439868-10118-5-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 5/8] python-webcolors, python3-webcolors: Add recipe for version 1.5
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
X-List-Received-Date: Wed, 17 Aug 2016 13:18:39 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-webcolors.inc     | 8 ++++++++
 meta-python/recipes-devtools/python/python-webcolors_1.5.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-webcolors_1.5.bb | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-webcolors.inc
 create mode 100644 meta-python/recipes-devtools/python/python-webcolors_1.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-webcolors_1.5.bb

diff --git a/meta-python/recipes-devtools/python/python-webcolors.inc b/meta-python/recipes-devtools/python/python-webcolors.inc
new file mode 100644
index 0000000..ae91c62
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-webcolors.inc
@@ -0,0 +1,8 @@
+SUMMARY = "Simple Python module for working with HTML/CSS color definitions."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0c764ddee13cfbe0564c201d76ff19d6"
+
+SRC_URI[md5sum] = "2e9da1bbb7a087c6108e05be64640afb"
+SRC_URI[sha256sum] = "b3b1c3a41e9c69d1982b76b6531239115519f91cc034a24e975749832dc51b8e"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-webcolors_1.5.bb b/meta-python/recipes-devtools/python/python-webcolors_1.5.bb
new file mode 100644
index 0000000..a0b6708
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-webcolors_1.5.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-webcolors.inc
diff --git a/meta-python/recipes-devtools/python/python3-webcolors_1.5.bb b/meta-python/recipes-devtools/python/python3-webcolors_1.5.bb
new file mode 100644
index 0000000..fcd9f70
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-webcolors_1.5.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-webcolors.inc
-- 
2.1.4


