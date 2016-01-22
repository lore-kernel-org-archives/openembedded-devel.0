Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A089C77041
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:31:03 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b14so480248wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=vLBeEIGbDbFrJG37gvlm60k+W3ZOG+ygSO1DfFZjgxg=;
	b=zJpVCwE/gfu1Xw1mJbwSqFCAwfk3jvPfn9XxKWQMMg+Goz32k7D7/00hGZYbCSl/Hk
	1dOEgLgbpcDXPiBS+q5rf5rdIjzBpnUR8IZ7F8alX9ejGnK97xCL75KgzO+Cek1FegNI
	cExux8gpJ5mgiHETn3BbweUTYg+1LeGZHIkvwaOeyba1FWLa0PVY6RSDgJ3PbEa9ma/G
	02pNh2zSmwePSSOJHaKAGf279Sy96YzfeD6zSOOp7ThKNgnibGSSeByuPukLBFfNvO5h
	gpOL8Q8Gwky4HOCluSqlXAuEbsYPMqdD3O7M002R9VBqE1vn4+mSdeJBRb+qG3o/8Pg5
	BQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=vLBeEIGbDbFrJG37gvlm60k+W3ZOG+ygSO1DfFZjgxg=;
	b=ZVmLEaXqjBraHFF3EFvYoXnnVflYHIUKVe2p+qn19KNQAuy96SfJWYtwgyY1IVacvc
	iWmZyfpvnLPA+PIr3S/6UdQeWHc3+5+H/ufV7v20+769b2u+jLp089Bpbg5saGJr4Ii5
	7QTMmaC/AC+88s6AvJ8jU6PPm2gFRH5ZIvav2tjI15xPfxD1ye47wpkCFdBo2MAnSLgA
	ABjBslxKlnC3B3KVfSDo1cXlXmjFDXgU7rYsMqlpKcAR6+BnlGo6F0MSQH8+N2kpNF/r
	RTJ9AZyMrZ8j5GY1g9A4mBze07Tc87dDkDn9ZT+mNXyqVDzUioAjYCYHoltw0rqrufJu
	+QIA==
X-Gm-Message-State: AG10YOSe195ALVU4OfXZvVWBubpGu9eHTsfFOnxY0DwiwVa7EewcT+1689Lt9aoK/opKsQ==
X-Received: by 10.28.105.25 with SMTP id e25mr6440594wmc.62.1453505464301;
	Fri, 22 Jan 2016 15:31:04 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.31.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:31:03 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:22 +0100
Message-Id: <935818493bb06c9833ee290f59fa9bc9698c3dc7.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 20/21] python(3)-flask-login: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:31:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-login.inc | 14 ++++++++++++++
 .../recipes-devtools/python/python-flask-login_0.2.11.bb   |  2 ++
 .../recipes-devtools/python/python3-flask-login_0.2.11.bb  |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-login.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-login.inc b/meta-python/recipes-devtools/python/python-flask-login.inc
new file mode 100644
index 0000000..95c4428
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-login.inc
@@ -0,0 +1,14 @@
+SUMMARY = "User session management for Flask"
+DESCRIPTION = "Flask-Login provides user session management for Flask. \
+It handles the common tasks of logging in, logging out, and remembering \
+your users’ sessions over extended periods of time."
+HOMEPAGE = " https://github.com/maxcountryman/flask-login"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
+
+SRC_URI[md5sum] = "c0a7eaf28623f0aeac4929dc05a7a064"
+SRC_URI[sha256sum] = "83d5f10e5c4f214feed6cc41c212db63a58a15ac32e56df81591bfa0a5cee3e5"
+
+PYPI_PACKAGE = "Flask-Login"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask"
diff --git a/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb b/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
new file mode 100644
index 0000000..c6dce37
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-login_0.2.11.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-flask-login.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
new file mode 100644
index 0000000..5d46954
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-flask-login.inc
-- 
1.9.1


