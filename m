Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 92C30786D9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:31 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id a90so6527658pfk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lMqo8sOZX6ZS/6ZCjdSz+YJN8hNFz2sb6KbiYSwTgXw=;
	b=T00yaNpYwhPZX50LYRvZEyPNz8l17LNW6QdUjNuVWAuv1jQj4jyDXeQca0e+iwKDGL
	MamBbIK1Ksqv83XNjQAYIvJKtdcfTLURrEaNevqHsdhBIrs4XaoQ5b3NgbkYeCnZOwo0
	29pmN/ip/pDy2OxsjBDDfpagKUm6aEakKuEqkw53fA6FTVinoo2oKJAwwiXmfMgnw+rO
	K2Eb3+iEfgUhfNbXSyo9IeASnsENPCxCwWym3jMbp1nyrxmoCGBVtyp0vkVRPSU2q5p+
	oWZSnjgCoum4z75dl5XmRLx36Cw4M0v+sYOI5AkZNCYVZ6EpIYNMhDb1vLc/X3OY2w0B
	p2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lMqo8sOZX6ZS/6ZCjdSz+YJN8hNFz2sb6KbiYSwTgXw=;
	b=uI11UuQLPyV2Wmui9QK29dGHogOn4uMQRzIe/oKHYAKBf5jXykqmE8TdWwlvRMwtJT
	94xYi2kCuqkgljPz01hPnYfKQ+V1BA9C60HXWQbmlFMw+YW8BfHwh7d/0OhJaUo05x4r
	o60FIwBR7vL+WY98o6vCoBilupDvcA9pzc891YHC1xAjSoWtMRinVQoxYkpCMoJQ8+B3
	/I8Jz01E5/G206ZFFf+VpERNWlL4flEUe4dFJwHI0lcy1yfnREofRiPxq8XzvBGUg6VJ
	OXl6dXprJbTM5klKyjcmKwMqwM3b4370SwkPtHDgqWLPc8fl+ZCWdRcnqz+gOCWfE6Mp
	yedQ==
X-Gm-Message-State: AJaThX6/UTJyU5uWluVtRyOHmHh/YIJEz4hrE5+c6GR48rZyPD5kRm9g
	mkfGH0taAWiRUwmyKTrpj1v+Yg==
X-Google-Smtp-Source: AGs4zMYHVM3CYMdcnxPegLaGGHPqdXXDb9rkghGlyt9jHoxkc3pVO6vdG8PXqwWm9fcaD4QxvMnK2Q==
X-Received: by 10.101.86.6 with SMTP id l6mr26766376pgs.153.1512712172813;
	Thu, 07 Dec 2017 21:49:32 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:31 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:06 -0800
Message-Id: <20171208054911.27014-9-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 08/13] python[3]-flask-user: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:32 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-user.inc       | 17 +++++++++++++++++
 .../recipes-devtools/python/python-flask-user_0.6.19.bb |  2 ++
 .../python/python3-flask-user_0.6.19.bb                 |  2 ++
 3 files changed, 21 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-user.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-user.inc b/meta-python/recipes-devtools/python/python-flask-user.inc
new file mode 100644
index 0000000..c2b7182
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-user.inc
@@ -0,0 +1,17 @@
+SUMMARY = "Customizable user account management for Flask"
+DESCRIPTION = "Customizable User Account Management for Flask; Register \
+Confirm email, Login, Change username, Change password, Forgot Password \
+and more."
+HOMEPAGE = " https://github.com/lingthio/Flask-User"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
+
+SRC_URI[md5sum] = "f7965e66ca139c8436896da07e66c21f"
+SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c83b302"
+
+PYPI_PACKAGE = "Flask-User"
+
+RDEPENDS_${PN} = "${PYTHON_PN}-flask \
+    ${PYTHON_PN}-flask-login \
+    ${PYTHON_PN}-flask-mail \
+    ${PYTHON_PN}-babel"
diff --git a/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
new file mode 100644
index 0000000..654d377
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-user_0.6.19.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-user.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
new file mode 100644
index 0000000..251017f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-user.inc
-- 
2.7.4


