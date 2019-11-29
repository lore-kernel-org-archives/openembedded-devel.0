Return-Path: <jacopo.dallaglio@kynetics.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DB7A47F819
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:10:56 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f4so302000wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=oRzXiMf41kWFDaLQxLf0oWFihxA9mPA9xZOatA9+80o=;
	b=GeaAhy4gFpwsUgvTsEwwN7jGnT5V74PZKjQxW/RhIRkhacqq+yuZlfFUhfdpI+5gVx
	5b1YIvqcl9hKy9B42bChSu7equ1EXV2Nb5+x4Pj8Ri3+Zke3Mvbqe113wiDRmg2Wd1Ty
	/WcaPe1Q75JsWz+C1unI4GDlo/9bAwur3n1mM2Yl+Q68eykuaY5AKg33LChsBsba2uKI
	Xg1yQMnbmmBf4fC7owfMN41ac3GhNL9appeHZc621RoO3MF5UUYgHRhZvSvFSxPE7zPF
	JlGSBGUFSoluOSRGNRi8FBE0ddDAENQUkdrTzDtBE489AbWLQbAns6/j3Y87qxw4kOMi
	eMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oRzXiMf41kWFDaLQxLf0oWFihxA9mPA9xZOatA9+80o=;
	b=pk5z1l7JSSRuoj/uzeqcOKe5Rimqq3eGsW7jyXikAJzyRk+cxgrssSW6HhSxQtqraE
	3yiVLl8YdFjD4t/auWt42uivOKTRZxPc5Kxbuv7gxAvfrh5EiihSs/6D3LujRqKZtRyz
	MGgpq9ut5Yzfkj5KMzsY8BDqPYrtgaFPic6V4ubmcyCaF7J8v3wWkl2u8WtKMQayYn3V
	4j8atRz6GxCWMSMyY84ty10lD5NBXyfclotOP4zSVOQo3a9lzgNyogXjFyiaZfD2X8QN
	jU9ARg/Bi6MTwghNoU7HTQwL7tl/jMKm2URTM2eU0UdwsKu5l9W+rSWQr6cxTasMc7fg
	pQAw==
X-Gm-Message-State: APjAAAU+z4qUsk09nIwjCDMhTuGI8N5dZms11YB5N8jHu9mKW79CP266
	M6i8W4b013m5stW2HgvalQ5nEbZHFfthd5w=
X-Google-Smtp-Source: APXvYqz8jG/Plmvpclz8h+pHwDdOgI3qojzS5vUYNNJOiPE8rbI4PlgG26uwL23SAskaap61Me+5Qg==
X-Received: by 2002:a1c:9958:: with SMTP id b85mr7004410wme.63.1575033057274; 
	Fri, 29 Nov 2019 05:10:57 -0800 (PST)
Received: from ip-172-31-10-74.eu-west-1.compute.internal
	(ec2-34-244-239-45.eu-west-1.compute.amazonaws.com. [34.244.239.45])
	by smtp.gmail.com with ESMTPSA id t5sm3759694wrr.35.2019.11.29.05.10.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Nov 2019 05:10:56 -0800 (PST)
From: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Nov 2019 13:10:43 +0000
Message-Id: <1575033043-1439-1-git-send-email-jacopo.dallaglio@kynetics.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-netifaces: add recipes
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
X-List-Received-Date: Fri, 29 Nov 2019 13:10:57 -0000

With netifaces it's possible to get the addresses of the machine's network
interfaces from Python. Network configuration renderers such as Netplan depends
on its Python3 implementation.

Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
---
 meta-python/recipes-devtools/python/python-netifaces.inc       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb |  2 ++
 .../recipes-devtools/python/python3-netifaces_0.10.9.bb        |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-netifaces.inc
 create mode 100644 meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb

diff --git a/meta-python/recipes-devtools/python/python-netifaces.inc b/meta-python/recipes-devtools/python/python-netifaces.inc
new file mode 100644
index 0000000..daccc4f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netifaces.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "Portable network interface information for Python"
+SECTION = "devel/python"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=a53cbc7cb75660694e138ba973c148df"
+
+SRC_URI[md5sum] = "de92cc322b4f56047c073f802ad77860"
+SRC_URI[sha256sum] = "2dee9ffdd16292878336a58d04a20f0ffe95555465fee7c9bd23b3490ef2abf3"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
new file mode 100644
index 0000000..c4aa849
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-netifaces_0.10.9.bb
@@ -0,0 +1,2 @@
+require python-netifaces.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
new file mode 100644
index 0000000..69d5c67
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-netifaces_0.10.9.bb
@@ -0,0 +1,2 @@
+require python-netifaces.inc
+inherit setuptools3
-- 
2.7.4


