Return-Path: <shantanu@senic.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 118137BDB5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 13:43:52 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id k189so215953yba.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 05:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=senic-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=gXgDg2MxcDW4osD4TdAzP6/Gxs6XZ/96l8TVnpgk/vY=;
	b=uNpn+rbrSjI5gXpDAz4w+mpN9Ke4IlZvWOh6ERVso5XJ9xUo3Vtq5afxDhrx9ejfe2
	dunpafD+TuvUbQcBgK8dhX34XNkLU6AKVfLXpd3lSOGTG4lwNsW96iSBVG7PJlqvUFgZ
	MmX87g56/EJuXZ+ZcH1oA9MeSB/I0YNyI5/hiQRZ5YrSo6R4RGgumdYyngyWmT4AP5AV
	y2uLLvulm5J4bqFh4fz4oL6sYA0aJ+vJbpuC8TQcyxZjRDpDmMkpKyb/y+ORVGVNHrSU
	xaQmCecC/vVccJxtTR9kSX8+DEVu+qYFmv4K4mgiCejtioZEBy+LZ8XtC3SCB1EBkfz1
	Mn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gXgDg2MxcDW4osD4TdAzP6/Gxs6XZ/96l8TVnpgk/vY=;
	b=DqgnQ1SfKA66fmd6r1vefJZ6UpRMjNCZ77JIyFxthT/b1ftRPgMP+y6geSe0CE+m0M
	hhHPxCUmMfNCG+y44EapUEHh9B+elcOyoyBf1lBvJQtlVjlKnh9LYySK820T+z5ON9jd
	0VEJGus9+T+14meK/e6ZHZhtBi3l9Wi9m6hWTItP/T6aq86QeH3c3lTYwMoQIhBf0E1Y
	fKHGMy/bI/jHclyLUoEiGBZvMvVqx+pV0A2IE+M9gQdBX2pbqJdNQ1qJ+Otw6uybF29A
	AtFbelQ+H2lga3bMx4JEXPk7gu73J0hdZVwb4JgzrGXy5m/wpFaBInHmeaBGaYLZAyld
	UD5A==
X-Gm-Message-State: AJcUukcrz7eMGxS7bWu3cIGYRGgnecr8e9iPnflzzz/uz33KVoiM1NHo
	kGLNtjeiYXDzZ9zlQcfdu9ciDtDqXto=
X-Google-Smtp-Source: ALg8bN6e8+AQbpAQNxQApMiuBmT5sNvlSioUs59VbF5ZLd2DW0sWzs8lupUZ6GvgexSRKtVuXqNz6g==
X-Received: by 2002:a25:9b01:: with SMTP id y1mr10724438ybn.465.1547905433408; 
	Sat, 19 Jan 2019 05:43:53 -0800 (PST)
Received: from localhost.localdomain ([117.241.130.152])
	by smtp.gmail.com with ESMTPSA id v9sm3187810ywh.2.2019.01.19.05.43.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 05:43:52 -0800 (PST)
From: Shantanu <shantanu@senic.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jan 2019 19:13:20 +0530
Message-Id: <20190119134320.9082-1-shantanu@senic.com>
X-Mailer: git-send-email 2.17.1
Cc: Shantanu <baali@muse-amuse.in>
Subject: [meta-oe][PATCH] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sat, 19 Jan 2019 13:43:53 -0000

From: Shantanu <baali@muse-amuse.in>

Signed-off-by: Shantanu <shantanu@senic.com>
---
 .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
new file mode 100644
index 000000000..4697f0070
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
@@ -0,0 +1,19 @@
+SUMMARY = "pybsddb is the Python binding for the Oracle Berkeley DB"
+HOMEPAGE = "https://www.jcea.es/programacion/pybsddb.htm"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c8796b7e1f8eda0aef7e242e18ed43"
+SRC_URI[sha256sum] = "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "bsddb3"
+
+DEPENDS = "db \
+  python3-core \
+"
+
+DISTUTILS_BUILD_ARGS = "--berkeley-db=${STAGING_DIR_HOST}/usr"
+DISTUTILS_INSTALL_ARGS = "--berkeley-db=${STAGING_DIR_HOST}/usr"
+
+RDEPENDS_${PN} = "db"
\ No newline at end of file
-- 
2.17.1


