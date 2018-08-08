Return-Path: <freebendy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8F13778D4A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 13:45:00 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f6-v6so1069218plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=22yaKZoix6QzcE2JwxcvkQDBTiierh1wb9mg+tX5utE=;
	b=mGeVN0JtfOOkoov0pF0F5AkA6z3eFYM60mLu+Wo/TejYmcJT28lC70M9H7BS5Ax9ok
	PVQo6kl4DDxU6adN3H6Y8r9wCV3wHqDKeDHDvKIldyl4QygKOBJp9hkFanALBDS/R9W6
	4fOLGF1H4xkMLkfhVmF/sX6zMvS2Bsp5Nnn0rc1WXX7ynqa8Nnpkcq4UPR7hib0ipKfN
	fY8sWdxJgDL3mm2npDZQSaGgmA+nJU8O6SQHqm6joRt9WEFtx6WQXoEVvcQM4OJ+1ye1
	ihpbOTuwO0Gus7+pPgMsTWNIpkQhDOr0ttU/ZcS219W6EessBwLccxMdpIZIuyH14iAg
	AiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=22yaKZoix6QzcE2JwxcvkQDBTiierh1wb9mg+tX5utE=;
	b=eTW4MeMGrP9gkwJ24U0pXpdnQQujjrlWbelq4E6RqhRseZMmiKL1bP0bAtNGsRxp6z
	HoSBBEs9AjABCJBCJDPIGRIofcyJocGs2OmP374kaW8hZG8ANAQiO3MA2iq1xXQZvoa9
	mvSPtos29ZUf4ItblAa+IDEYk4K8bB0CAnO3lj1uKXPBMBvwU0LKHdvCP+CEBQY4Rwxh
	h1UCMriVLYpqo+rFQtD9pAVy7LBlPzqnH6EosnrUlTeoLzNCTvhMUGwoL1PUzxF7ZgXG
	MDlRB8WUMd3SYBc7VJj2XybU61qyJq1MiKZSC1uLo/fhu7m7n1eJkHCuwJIwFh6CbMdC
	Vmdw==
X-Gm-Message-State: AOUpUlEFGpUSX2/gnSN/AFxP1Xlrafxt/8YEiVFnnAeiZyXFNU3yrgni
	EWEO4ztemnFVM4wd8gCuyEKH7ZzgKw==
X-Google-Smtp-Source: AA+uWPz3i05s6SxLWHfwsVVOTvz4zMmdGx0x0lcPW0zUu4IAjv7p6uDmwExUYMYzBM8XfxFv61cxfA==
X-Received: by 2002:a17:902:6ac3:: with SMTP id
	i3-v6mr2707877plt.252.1533735901453; 
	Wed, 08 Aug 2018 06:45:01 -0700 (PDT)
Received: from localhost.localdomain ([116.7.217.1])
	by smtp.gmail.com with ESMTPSA id
	14-v6sm10837793pft.93.2018.08.08.06.44.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 06:45:00 -0700 (PDT)
From: Binghua Guan <freebendy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Aug 2018 13:43:22 +0000
Message-Id: <20180808134322.3996-1-freebendy@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python] [PATCH] meta-python: add python-pycodestyle recipe
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
X-List-Received-Date: Wed, 08 Aug 2018 13:45:00 -0000

Signed-off-by: Binghua Guan <freebendy@gmail.com>
---
 .../recipes-devtools/python/python-pycodestyle.inc   | 12 ++++++++++++
 .../python/python-pycodestyle_2.4.0.bb               |  4 ++++
 .../python/python3-pycodestyle_2.4.0.bb              |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pycodestyle.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pycodestyle_2.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pycodestyle.inc b/meta-python/recipes-devtools/python/python-pycodestyle.inc
new file mode 100644
index 000000000..c0e46b7ea
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycodestyle.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Python style guide checker (formly called pep8)"
+HOMEPAGE = "https://pypi.org/project/pycodestyle"
+LICENSE = "MIT"
+SECTION = "devel/python"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01831ddbaf398471da3cc87f5037e822"
+
+SRC_URI[md5sum] = "85bbebd2c90d2f833c1db467d4d0e9a3"
+SRC_URI[sha256sum] = "cbfca99bd594a10f674d0cd97a3d802a1fdef635d4361e1a2658de47ed261e3a"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb b/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
new file mode 100644
index 000000000..7c736e76f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pycodestyle_2.4.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-pycodestyle.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-lang"
diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.4.0.bb
new file mode 100644
index 000000000..cedcdb3bf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.4.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pycodestyle.inc
-- 
2.17.1


