Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CDFC17199E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 16:12:38 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b132so13851306qkc.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Dec 2017 08:12:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iayD+wIBNgVOoi5SZEomkXX/vnKe1k4XrYEQ85V03J4=;
	b=fhMMSvTyzUMOWqI58DNuLWdt1l0YA7zVT6h1fFw34tyD30MNpN1pPyIQTHIHggSSrc
	9EG5NDAokyA8GAtZSoOSzT37Ja+a5/hW0vs3CQ4VTG1gpkdVyZTWg1YJuWXhJ4ZYPf7h
	jaL1M0Qq1mF+ZKFKZ1cDR1r1btzN1LF043tmgb/IwmYnPwmvfNas7sMtsxzeQiavA/Jz
	enu3GQEcX+Hwei5ugVav3fpO2cb+AboYFQ/qqzT5/8PQB9N0hgW7GyGBa8CFWzxJrKXN
	49WxYlfeWtGiCff4WlK2ct9eY+3jn+tQXPxGon+6Yvv9MoMoEJXBbUNCP5BXdbiVFUyW
	50xg==
X-Gm-Message-State: AKGB3mJ0NAdITIriR64Es9w+yeyQcGOXmMgbsO7tCygOAoLt3qja4KNc
	03jpqeXH7JNbBAv+L/OgOYfV35kJ
X-Google-Smtp-Source: ACJfBot3K7fMEnoyBKuBAxI/L0EnsUgN8SbExSIB7V1b5jKdFT85zQplSY5gTVV91yto5cmyPx6fzQ==
X-Received: by 10.55.80.7 with SMTP id e7mr8964668qkb.230.1514304759372;
	Tue, 26 Dec 2017 08:12:39 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n30sm19517256qtb.56.2017.12.26.08.12.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Dec 2017 08:12:39 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 26 Dec 2017 11:12:29 -0500
Message-Id: <1514304749-5938-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyperclip: add an initial recipe for version 1.6.0
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
X-List-Received-Date: Tue, 26 Dec 2017 16:12:39 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyperclip.inc    | 13 +++++++++++++
 .../recipes-devtools/python/python-pyperclip_1.6.0.bb       |  4 ++++
 .../recipes-devtools/python/python3-pyperclip_1.6.0.bb      |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyperclip.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyperclip_1.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python-pyperclip.inc b/meta-python/recipes-devtools/python/python-pyperclip.inc
new file mode 100644
index 0000000..c712fdd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyperclip.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "A cross-platform clipboard module for Python. (only handles plain text for now)"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=1ed92115c8f96b19ec34ed09df586e51"
+
+SRC_URI[md5sum] = "d2f6a3129cd6f2518b52bb0b8deeeda7"
+SRC_URI[sha256sum] = "ce829433a9af640e08ee89b20f7c62132714bcc5d77df114044d0fccb8c3b3b8"
+
+inherit pypi
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-subprocess \
+"
diff --git a/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
new file mode 100644
index 0000000..6e93b81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyperclip_1.6.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-pyperclip.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-contextlib"
diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.6.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.6.0.bb
new file mode 100644
index 0000000..ee6f88b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.6.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pyperclip.inc
-- 
2.7.4


