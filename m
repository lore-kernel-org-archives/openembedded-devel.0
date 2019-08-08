Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 009F07F2AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Aug 2019 14:18:47 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id 31so95155446wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Aug 2019 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6WoQEOml8c2Nc7/cE9w09UdezOdD+YIlvJoDGI06T+k=;
	b=VgUPJyCFMYWaQpiE2ZOeZfSaB51hNtw3cdGRkEwbSXvdOv9QN5tsQAJXqpJD1Vx1+4
	6v4y4EvFwA345EaD3obpYZJOgjCbl3YgHLt6dRADPytb9dtvFNvxOzQxO2AvQQ/NTB3l
	7HpgDittoBkWOFZnmsoaf2hGkC4fv8AInpO1hTyqPInrai7hl9BSgZCw40GcgCzFNXnf
	/B8Y+oZvXP4v6ESpkrvbnvCNh+Dnnq3SINq8UuaPBlfF5vG0wkU9+8kiKBmTHeMxo39m
	MaKTylVUdGbQJuJw/ylTWaegGMR7pLifgavejj5tUstipVVGM9LN9XsCUQM8SRm/QVU6
	we1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6WoQEOml8c2Nc7/cE9w09UdezOdD+YIlvJoDGI06T+k=;
	b=LKmymZy5l2O2H94U8WESj/RjkdGm8MH6Hbk4NRr+4cCQWxdPxYeUczZywCIJo3TCB3
	rZpZKnQzAyO1XD95pS9mx5LYXmHA0mRcSHGcHOcDMVygkcFae8acxjUZQ+TOdIuc6uvl
	iyXdyCjA14K4wCe+3+2SbRNgm/uNWNSilwmByNWfxxU48NmTDWWVGk6hFsxbWrcxoErr
	qjmMKe83wKXEmps/E8AuLTi3OmabJyO1ar69qr5Y7MF6r4rJi2V+z9WRF6+wnUjYeu6W
	ZUPxTTvmC05KiDxSConiiayNycFChj/QjZDm/xYsqfWNal2irsl1N2wWEvoSfn77M0aw
	IxOw==
X-Gm-Message-State: APjAAAVo4TGyG0XsZGtaiAb1EBrCxzIvnoW5FAhj+YlE6Wd2zbe8wH0s
	ZoaeFBO/DOUURLv/Hg2+kZFLRlBihdI=
X-Google-Smtp-Source: APXvYqwbxDh+9j7iPt4EPVlZVHkA3m89Fixx0YWeGH4HnDMn9HAbgWDE3pHfM0vPl0RziJrVIWV3SA==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr17260448wrp.101.1565273928383; 
	Thu, 08 Aug 2019 07:18:48 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	66sm16271106wrc.83.2019.08.08.07.18.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 07:18:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  8 Aug 2019 16:18:42 +0200
Message-Id: <20190808141842.99437-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-matplotlib: remove the python 2.x version of the recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 14:18:48 -0000

This recipe depends on 2.x version of NumPy, which is about to be
removed from oe-core (due to the latest release of NumPy no longer
supporting Python 2.x).

3.x versions remain available as before.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../packagegroups/packagegroup-meta-python.bb  |  2 +-
 .../python/python-matplotlib_2.0.2.bb          | 18 ------------------
 2 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 82cda5862..34be9d762 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -57,7 +57,7 @@ RDEPENDS_packagegroup-meta-python = "\
     python-markupsafe python-pytest-runner python-grpcio python-mccabe python-pytz python-selectors34 \
     python-cython python-chardet python-editor python-flask-bootstrap python-html5lib \
     python-singledispatch python-redis python-flask-mail python-funcsigs python-snimpy python-pyasn1 \
-    python-decorator python-urllib3 python-feedformatter python-matplotlib python-iso8601 \
+    python-decorator python-urllib3 python-feedformatter python-iso8601 \
     python-numeric python-robotframework python-django python-simplejson python-wcwidth \
     python-configparser python-epydoc python-intervals python-speaklater \
     python-aws-iot-device-sdk-python python-constantly python-bitarray python-flask-wtf \
diff --git a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb b/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
deleted file mode 100644
index e586ee4da..000000000
--- a/meta-python/recipes-devtools/python/python-matplotlib_2.0.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "matplotlib is a python 2D plotting library which produces publication quality figures in a variety of hardcopy formats"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74"
-
-DEPENDS += "python-numpy freetype libpng python-dateutil python-pytz"
-RDEPENDS_${PN} = "python-core python-distutils python-numpy freetype libpng python-dateutil python-pytz"
-
-SRCREV = "e175a41cb81880dbc553d9140e6ae5717457afa8"
-SRC_URI = "git://github.com/matplotlib/matplotlib \
-           file://fix_setupext.patch \
-"
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = "--disable-docs"
-
-inherit setuptools pkgconfig
-
-- 
2.17.1


