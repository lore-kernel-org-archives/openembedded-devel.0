Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3328D786E9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id y89so6529856pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p7h8eKOfzn1TsobKPphOXcfuW0KA3NDXCa1nFc247oQ=;
	b=jRgSmZyItjGWhp92iDvm3liv9DxzDBdY0DlJW5C24ZwBWrD+eBmZg4dYvwgxoRnCWH
	Y7QsMGboX/vtSrWz0/L7U7UR+YLRQQBENQvgZvFMlkO3VzvbKXPeS8hyZWp7hjx3o5mT
	tNeoXTwahXLSK7Yeo62tOkdjU0nz6W2YQC+xT7igTmoQpcLZ+odWHQwqNsool2ReA5gC
	qERexLDeMlvdkBPdhrY+rK4kEZL/uJrB+++N7HoAnGZmxUHEz8U7klPqR6rspYEWl73X
	DRaA108nUAysWKZswNIl5eroaei5w6E/usYl06qZJkpjmLVl1WokG4xUuoDp3DhRkmqu
	OULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=p7h8eKOfzn1TsobKPphOXcfuW0KA3NDXCa1nFc247oQ=;
	b=HvtLYA6eiUDWgHzToICJm241R/BK2X3OXPPffrB9ujWggjMfKlXTAdtxuTXRiWGCcm
	+gORtX0H7/JbvHuccQnho1FjeGbM5PUe1RyMwv7rr5qxRSLTxS1aWSirByV3QOl3qByq
	MitRORE4sH+D5NoWbYbtDqxZqRvRtRRxJTNMR2g/1QkmmJEvWqIXHnozVfw3d6Jnv+ot
	JEfZdL0kZqOySnfAAHeMhXSZiWf40z2wnn3VCxHJRqLRA52G7XS2Wmvt1w6JR96SeeXh
	xAv+fbazD0fneOaXgii0Hg7uYMNBT0raZ3C+D9+BNO+5fU86FZHyo87MknzrZBav/qDB
	UYdQ==
X-Gm-Message-State: AKGB3mLI0oOAdK46jmdYp433nPuIOHyfnkNoZkYT/yencOph6vbzoB8D
	Fy55gYJ2Es2F+fPONcKi+NPPbA==
X-Google-Smtp-Source: AGs4zMZAngD76CqbeFhf0QuZsZDz0rpqSEcBtrean2A/oVeXksBEcLomTQGp/MdRS8VAfD+9e9wVaw==
X-Received: by 10.84.246.21 with SMTP id k21mr15412540pll.256.1512712175303;
	Thu, 07 Dec 2017 21:49:35 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:34 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:08 -0800
Message-Id: <20171208054911.27014-11-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 10/13] python[3]-flask-babel: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:34 -0000

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


