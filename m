Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93B7E78704
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:18 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id bd8so7439179plb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kGkddZ1WVgvnKXVofreLBRwAXxMTduMKo4HvGCKhUkw=;
	b=qARuhHjURrde+r1AMcVABFistDgYUYzl2f9lwUlvkHyNPWEQjRK5o8Ycor4dMRggwo
	4Y0O9X5cN+TgbxWDvD91lRsq+0/0xzNOnKI5Cwv7HbJsZtNG3yTKdgH032X8VgGp7a6c
	kU2e2TzSgWyHLXhPSsfiHHCnn/GdMZ8vKIHxwcBzeaJ1xTseCs+gzJ25zBz7aKTHNCKX
	Ev2IwcB3QR/X43qPaPvHkq29vls5GvQKfeqKc3wbSqjthpbOncxCNO44ybAn3O0fKlkQ
	DUUtmheByQTMVNEuKe9iS/IotH6TST24gQAy7a56BZHlUz3c6/DsUhv4rlipyNLktbbG
	eDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kGkddZ1WVgvnKXVofreLBRwAXxMTduMKo4HvGCKhUkw=;
	b=eEmnB6s+5x7cBJBRYh0ItCeEQvl33kcfnDBJun76vdN1TvqGz8mf7fIMKfksEZUKvb
	9arf24IUsWFabZ2ytnaPlBOVAH1HSkNvZl7yExx8WNq0DrHFV8SbqR9CDoqTD9ElgTq1
	3DApWa/G8bjwvx+QYyGsnwpQ/pMul2gJqpWQ4Ply+gFZzle+Q4HJSiGDtOTnP3OSC8n0
	5V5qz6NG/UvCjvHFSjmBqDZRAZuk3HjukaHXuAqP8ag+KpTEb4u0T/IQuJ1kbhfNMbaR
	TCUrTH93MAy9plhhF5yseFwyHbYRKre84a0bP/sSCpK94Nz97fwre+3Y/AjuwS8xbgTX
	99YA==
X-Gm-Message-State: AJaThX5//v95KJp+moEw2CxEd59bh35yaRQ+/P/a7O+GcaV9ulM1o8lG
	Pkcg6OPVvRc5ksAt1tck20P6AA==
X-Google-Smtp-Source: AGs4zMbax3/lRUsJ6nzkqBVL1kRDpF5cTAu/VolujdmIysHPq31mrWwYo0tM90CWYdwt53P0EU/oSg==
X-Received: by 10.159.198.70 with SMTP id y6mr8453798plt.334.1512191599854;
	Fri, 01 Dec 2017 21:13:19 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:19 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:54 -0800
Message-Id: <1512191576-2302-12-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 11/13] python[3]-xstatic: new recipes
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
 meta-python/recipes-devtools/python/python-xstatic.inc     | 14 ++++++++++++++
 .../recipes-devtools/python/python-xstatic_1.0.1.bb        |  2 ++
 .../recipes-devtools/python/python3-xstatic_1.0.1.bb       |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python-xstatic.inc b/meta-python/recipes-devtools/python/python-xstatic.inc
new file mode 100644
index 0000000..f7c7db9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "XStatic base package with minimal support code"
+HOMEPAGE = "https://pypi.python.org/pypi/XStatic"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README.txt;md5=36a1e7eaa71e1bd07b8d2247839f228e"
+
+PYPI_PACKAGE = "XStatic"
+
+SRC_URI[md5sum] = "7064b5ea7fd1ee990e0ae0538301d9bc"
+SRC_URI[sha256sum] = "0ec93d7c66ebb9e0d31b664753437dc8634cb66e13310cb47c9eb1e0bc66d726"
+
+DEPENDS += " \
+        ${PYTHON_PN}-pip \
+        "
diff --git a/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb b/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
new file mode 100644
index 0000000..8073037
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xstatic_1.0.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-xstatic.inc
diff --git a/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb b/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb
new file mode 100644
index 0000000..76cb702
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xstatic_1.0.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-xstatic.inc
-- 
2.7.4


