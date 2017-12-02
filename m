Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id A711278744
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:19 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f6so7442996pln.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wj0dOG1X4GZkEloCY0lhSFF848jFCenCeUXxaf8dPNs=;
	b=GRoReY5xqo53YOfppbdQELedvyC5pNyfVN/fcK8JhRD4Jgkbe/CJBZcHFMU2V2a9Vv
	B49ZZCFS7AQ0BM/7FauuuGnOEH7Mg43oI9EjMYRZ6ArJWZcdKE4nd0p1im79+q8VtUcG
	ZW0UvxWBp706HwanOBelJVID3uX4ud+QDnTbrT8N7SceiRK2R2h6DkvEyeI7hdQuf9zv
	UPeUjS7UITZP8TeGWb6UZb8GCt+JT/x1SCSOGVfDQAM5jbajlpSRbIOY+w9oMdxKbc3Z
	kBeIVLna7oxZe+80vDVknO0nIzMjlpn2nG0KpHCiVoew7Jr0A86r1kPyCqfcUd1JJLBG
	E1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wj0dOG1X4GZkEloCY0lhSFF848jFCenCeUXxaf8dPNs=;
	b=jbiloewNr7HovVa9d4CzDm9Gd89JOCOATVODAxR//1TwzglexkWAyADaahoT3RkRTT
	f/OumEJgF0ip65Ic7YVOn0SYwVeHoZxuwgzhnSMJT30V7heDlgm2lS0LdNN+rxeD8WLz
	wH5xDcCOk/MOUf04oxSBg+oOp2pIucJsWt9suli320F08x0ZErYlnetmbnLEP6XsnMnK
	vxCI++Ddj/tfh2fQtFDqgdDfSiMaeik5fYN0QmC8/MJJ7SivE7pd+OqT+2gyKsuke1qm
	m0mmySbGo0/UF3m8Zfy1VoBATkGbJptxtR2No5SaKF+SmkxDcyyHvxc1wpi1UnxRI0tv
	y9oQ==
X-Gm-Message-State: AJaThX7dq8tmZycA62yPmixk45g8qK45yCrXBx6YKo9FkOJKiDxeUC8j
	zXlN1+vLsj6E5h65WmQF+BIjSA==
X-Google-Smtp-Source: AGs4zMaaN9Zf/+tDMQ4MaKsXxuiSuM5XwevpxI3EZyEO/9gyzZqfdvWmiayJRuCdtc3YcP/6atiCbA==
X-Received: by 10.84.130.6 with SMTP id 6mr8589531plc.402.1512191600909;
	Fri, 01 Dec 2017 21:13:20 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:20 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:55 -0800
Message-Id: <1512191576-2302-13-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 12/13] python[3]-xstatic-font-awesome: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:19 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../python/python-xstatic-font-awesome.inc              | 17 +++++++++++++++++
 .../python/python-xstatic-font-awesome_4.7.0.0.bb       |  2 ++
 .../python/python3-xstatic-font-awesome_4.7.0.0.bb      |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc b/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
new file mode 100644
index 0000000..d13cb83
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic-font-awesome.inc
@@ -0,0 +1,17 @@
+DESCRIPTION = "Font Awesome icons packaged for setuptools (easy_install) / pip."
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic-Font-Awesome"
+SECTION = "devel/python"
+LICENSE = "Apache-2"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=313d021898694cd2b0ea6508bdfe51a2"
+
+PYPI_PACKAGE = "XStatic-Font-Awesome"
+
+inherit pypi
+
+SRC_URI[md5sum] = "141a0e9a7e21e82f922573a00ae0c166"
+SRC_URI[sha256sum] = "e01fb480caaa7c7963dcb3328a4700e631bef6070db0e8b685816d220e685f6c"
+
+DEPENDS += " \
+        ${PYTHON_PN}-xstatic \
+        ${PYTHON_PN}-pip \
+        "
diff --git a/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
new file mode 100644
index 0000000..41e85f4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic-font-awesome_4.7.0.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-xstatic-font-awesome.inc
diff --git a/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
new file mode 100644
index 0000000..639f80d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xstatic-font-awesome_4.7.0.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-xstatic-font-awesome.inc
-- 
2.7.4


