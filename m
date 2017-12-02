Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 33E71786F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:17 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id x22so7414507pln.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7h8eKOfzn1TsobKPphOXcfuW0KA3NDXCa1nFc247oQ=;
	b=RfH85Jljr2LrhZ/vAEW1Xax6TdZzxt9b/ZgmQGd6lqIQCPKjHS4EtebCPe80XrH8ik
	U/AgvcO1dKAf21WzTCaz9n5Gxv4DF158cgLPP6bM+8KRdF0fkt2SQGeYvqWPCHOX9D95
	UdDgk1HjIq8yjBG9G158l8hdb78cQryoHJsbRnRsWv0YrfAZa+0O6mnyMYMaAVtU6dCu
	QeYTh21RHTfj/p9pFXxb2ZcbCD9QQ97AUt917THoec3AORuROJP4t6p5ILeOGx54Git4
	KN2xl9twM4lCcXQAcA4XTI52aBHUt7H2MPziegRnIL/hzIl0WbLx+xcR3jq4CIdl6U4q
	MlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7h8eKOfzn1TsobKPphOXcfuW0KA3NDXCa1nFc247oQ=;
	b=XNH5TnrXSUvsB2dDbqX9HpKX1n/2AXinlFSWrQDUsRAo6u59P+ER2NllmjysuP/v2X
	iz+2ZnvYilu+NCYLBdLPSm7WuHY2VYt4flAhK1rggPWS3iG3BXzTaftaEfxH6A52XHmZ
	miMqrNO5qBhsrGuiZZRYVLiHhCekN3RWfYgcHE0+8PqNjktAmZ0rLP0XAa5y/0l9bms2
	A4EXlT7eICZPusCQOXO9wmru7tjOmeLG1vorvhVbBj5xBLiB6DS276+YkjN3hRN/h4z3
	kNS3XQpHieWSuu+82EdJw4vy7ffJWQcelhBpbwFp1Gz33+3vojL9wArUVDn77PKkK8ZH
	eoGw==
X-Gm-Message-State: AJaThX6j2LHUatDQgg029BATlWhN+oOAOwuMIHht0WKKYfFuyvbFzBDJ
	Tqz+Cw8LQH1OEGzKEZIBbUVujQ==
X-Google-Smtp-Source: AGs4zManmi0ZXTZNbe8RsQFFwU90aRsygdykMRm0IlCeqMo2kdeR2zE8BY3fhc/zCvkhLsBufxT4GQ==
X-Received: by 10.84.174.4 with SMTP id q4mr8441702plb.306.1512191598849;
	Fri, 01 Dec 2017 21:13:18 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:17 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:53 -0800
Message-Id: <1512191576-2302-11-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 10/13] python[3]-flask-babel: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:18 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-babel.inc       | 16 ++++++++++++++++
 .../recipes-devtools/python/python-flask-babel_0.11.2.bb |  2 ++
 .../python/python3-flask-babel_0.11.2.bb                 |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-babel.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-babel.inc b/meta-python/recipes-devtools/python/python-flask-babel.inc
new file mode 100644
index 0000000..b60ee17
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-babel.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "i18n and l10n support for Flask based on babel and pytz"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=51917f3e8e858f5ae295a7d0e2eb3cc9"
+
+SRC_URI[md5sum] = "07803453743f139309021572a799c6b3"
+SRC_URI[sha256sum] = "c0d75710bd4b0fe866f9f2347de6e19208712f9cec006436b4c1c15d4cb0c939"
+
+PYPI_PACKAGE = "Flask-Babel"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-speaklater \
+    ${PYTHON_PN}-babel \
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb b/meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb
new file mode 100644
index 0000000..38e78c7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-babel_0.11.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-babel.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb b/meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb
new file mode 100644
index 0000000..104e7c2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-babel_0.11.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-babel.inc
-- 
2.7.4


