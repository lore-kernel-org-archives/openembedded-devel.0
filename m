Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 44DB6786E8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:14 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id i6so7418720plt.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lMqo8sOZX6ZS/6ZCjdSz+YJN8hNFz2sb6KbiYSwTgXw=;
	b=RgJT4zgH2zKpuzPCLuUUR9W/D05mJxy1g4jEZHnT5gBhMt5S93KbML4Rp/AzCYjox4
	kWNReULFQtnIyuj5Jt3ct4qZkNDyfp3ucyUox6OXewkXkdwXPh2dZ6kac/EEy7x1JZgl
	k1aVFsr9kt78EZ+dXmCvpEtnVWJ8UAzEMdHE+Qej/Oh8OGRiEYo/1f0xQcP/CzdHhaG/
	XcQBs0rUUFMRWAxKNubTI1XjwkEM8nvhe0WWlETb7zWJLKjg3K8I0WT/ZZiOrl5WRbx0
	HQg+NkEEhfs3rhV85bCpp+9HeP6Gt3MXK2Rm+LCu0g3taCagVEDlPymSS9iQE4AAfge5
	uwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lMqo8sOZX6ZS/6ZCjdSz+YJN8hNFz2sb6KbiYSwTgXw=;
	b=L6yN5ZNERyCzjFBUOlTr0LITZI8paRr9t3Zl66WRo6A4kpD7hLtaJnGwfSRHYtSL+m
	IwbCWjnG3dHubk5APZhlz/dMZFSzSK3jStR5ShlNbDWXiAzK/gkzMTt9cyjB/Hy685i7
	W2r3Nhz+E819dCyLCVL2q3BgehpBVbsmVRhu4dV3i+nqYfjk0i96TsHu5mehL4RyyvPR
	6fbXuToEu9CAw+nw4XccLuODOVfJ8jwWWd/e8YR6wmon8ss2bRICUu81+ISZG/zIyjSn
	kcNfIfOqdGLTFw+nW0s8+CCedIn2Y6G0cO7PE+zGZdgEVEa1PmvieU7ZPcgLZIbtdAFb
	mSCQ==
X-Gm-Message-State: AJaThX4oQPtXsa3Yy7Eauqhpl3NEjnx/desXEizvNKfHwynzR2HuXoiW
	pQVoqblP6AwHn+G0sJPgYZlW3w==
X-Google-Smtp-Source: AGs4zMajw6MfmQmeVBupQHtyQlQM/AsWZJHuJq12VZI762rorMNrtzZdXdzMb8fu4LiL/Ma3tAC8uA==
X-Received: by 10.84.134.164 with SMTP id 33mr8155085plh.292.1512191596060;
	Fri, 01 Dec 2017 21:13:16 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:15 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:51 -0800
Message-Id: <1512191576-2302-9-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 08/13] python[3]-flask-user: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:15 -0000

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


