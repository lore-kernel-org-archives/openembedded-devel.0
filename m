Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id E6F5578685
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:30 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id y6so6176254pgp.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=thTZ1UnxW4ggbViAy3irrZxVvRO80hpB0fj9a2/piLs=;
	b=E96dOpehi15OURMvJLuLeSOq52aTftL4KbHu3gI/UCUo5r8NG6n1ZXZUAfGTr+PQPf
	7/ETATwKdeEBITcRFR+Q62cGDZy8fTasKpI9IMoiAjhQR78090VWbBNHGdGIWfiomw7X
	P8Mcl/KPmOJYbzUuDuhpA2iUZmv4PO7JF6Yy6H5nnWEkWhex8yqMTmRIPQNcZcQaaMI0
	wF4xY+7rq0fwBFjSDk3EqCkjenIC1NPIYwjxqUSCAdNwPEkWokNJg7LLukrzX0EE7VdV
	l+vEUrC53VdlVEJ/KEmHCjr7OMT8s0D3gz4SM6R7344YuPfvSHl6vXcgd/9wHl25rd8t
	F+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=thTZ1UnxW4ggbViAy3irrZxVvRO80hpB0fj9a2/piLs=;
	b=q4F/PBCzu2N3iQT7QVa++lRgOPTcPf9jPo2qMEgktiL4FJraL1G7OGkZTiAeGvElGw
	lBDqptZ5z9KvXrTtlRTWdh3RfWUcEyvLQDVledop80b7uxEMGii0UlDDVpIhIBQgyfRs
	uhFbhMvVLCS/JIwDxAAnyfATvbypsPnLNym1Nv95hXRmITmm2TKLfA7FAqlcY/TWAGJe
	iVcsnsNzTB83xQpKxxq726BryoNFZK9k1kc6Y8VSfGRRDbNIh3PLPJhV/VX5TDpJxnCE
	QL1MkxhEHT4sZKxGBa5l4qsuPdMzs/V0fxVmq/rUabbI4K30ecVyZjuT3ADDzmMh3prO
	UT7Q==
X-Gm-Message-State: AJaThX6CCFzyxw/rf03W4nT2QqiobgEtaOBzmdAzdMI4WnLPa2BlLgUW
	ysVxJPj6HmD55eHCHx3NdCu3Hw==
X-Google-Smtp-Source: AGs4zMZBM1/Gs50PLYzSFca0GwMvBVJE2GQBH8AzxNhtUmNyYv+Rc2uRZacKO6odDZGCqFDy2AjgkA==
X-Received: by 10.99.126.6 with SMTP id z6mr28884188pgc.305.1512712171575;
	Thu, 07 Dec 2017 21:49:31 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:30 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:05 -0800
Message-Id: <20171208054911.27014-8-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 07/13] python[3]-flask-mail: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:31 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-mail.inc    | 12 ++++++++++++
 .../recipes-devtools/python/python-flask-mail_0.9.1.bb       |  2 ++
 .../recipes-devtools/python/python3-flask-mail_0.9.1.bb      |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-mail.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-mail.inc b/meta-python/recipes-devtools/python/python-flask-mail.inc
new file mode 100644
index 0000000..bb08703
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-mail.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Flask extension for sending email"
+DESCRIPTION = "A Flask extension for sending email"
+HOMEPAGE = " https://github.com/rduplain/flask-email"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
+
+SRC_URI[md5sum] = "04b35a42a44ec7aa724ec8ce55e2e08e"
+SRC_URI[sha256sum] = "22e5eb9a940bf407bcf30410ecc3708f3c56cc44b29c34e1726fe85006935f41"
+
+PYPI_PACKAGE = "Flask-Mail"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
new file mode 100644
index 0000000..8324da8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-mail_0.9.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-mail.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
new file mode 100644
index 0000000..0b963be
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-mail.inc
-- 
2.7.4


