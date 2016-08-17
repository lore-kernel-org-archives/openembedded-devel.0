Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E5B3B73281
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:48 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x189so9444809qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=LzMnfyguEwpcd3i1A2XBFcGrZauwbwPL5oD0wTYcixk=;
	b=KyvwYFYGe6uSHf9ur9Do2CooPhJyIRbOGL0bKUfhix0gKe4yP1aQiSXZIcBR/1Dc46
	wNIr2gmBfC87yHInNSS0GPXciWFZck1EOoLelmrnabZQGk2jIZV+yG/N+J9kltM1Ohda
	I0iViuWDwFoPzlD6rPbaAt13Kl3VqBmVocgeYTLk+8Q0Ouu2uSAuGtVz98tzftGKPHcx
	MafLqm/RiAvPkYIgROPR+Mj6GFSPHX7CzdTxGBTepjIY57l3yXUy9nClTe/HQp5Z/N+2
	0XydObuBEZjDlTbdYgHT8qh4C6SPHi6xYZIlZRx2ilbzaGRuw/9PkWN216U4Bz+lCcwb
	gIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=LzMnfyguEwpcd3i1A2XBFcGrZauwbwPL5oD0wTYcixk=;
	b=F2VuG8fXdZOyyyn2xrxQ7qt7Ls2nYjaNe/GGQCmLZXyRPPhYqSwEEGUNNprtBGMv8A
	7O/mNKtGXLbI+DSWPUTy81ubC2cE9Av4UOEEPTyBZiaFd8LFuEskZBNOUmtc7amQjYdf
	IQKP6k1X95KrIlj2QQZ3Ms0LThit0HT53bNPVde6CZJ/hmZvZFaox5P2I0TW+qDH08qg
	UHxZu2ivIMXwQccpylPVLtjRPI8fqSeAH/JxtzjtKhXQbm2J+muKo5Sv4zAORkotn2a1
	HHpCb8nq5KIDFiHyNZuK4ktRFNBeUKGLh1UEW9wgLBIHi6Dgiekz9x50bh+FYtiXwFf6
	uvBA==
X-Gm-Message-State: AEkoout1rl/Xz86qg+Lm5rBRxCAUjEKs+KjxP22vIL9sFI31oIf93ZpEqS7AQeNF9NDaTw==
X-Received: by 10.55.45.131 with SMTP id t125mr46050315qkh.179.1471439929457; 
	Wed, 17 Aug 2016 06:18:49 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:48 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:48 -0300
Message-Id: <1471439868-10118-8-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 8/8] python-jsonschema, python3-jsonschema: Add recipe for version 2.5.1
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
X-List-Received-Date: Wed, 17 Aug 2016 13:18:50 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-devtools/python/python-jsonschema.inc  | 26 ++++++++++++++++++++++
 .../python/python-jsonschema_2.5.1.bb              |  8 +++++++
 .../python/python3-jsonschema_2.5.1.bb             |  6 +++++
 3 files changed, 40 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-jsonschema.inc
 create mode 100644 meta-python/recipes-devtools/python/python-jsonschema_2.5.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
new file mode 100644
index 0000000..3466457
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -0,0 +1,26 @@
+SUMMARY = "An implementation of JSON Schema validation for Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
+
+SRC_URI[md5sum] = "374e848fdb69a3ce8b7e778b47c30640"
+SRC_URI[sha256sum] = "36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-lang \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-pkgutil \
+    ${PYTHON_PN}-pprint \
+    ${PYTHON_PN}-re \
+    ${PYTHON_PN}-rfc3987 \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-strict-rfc3339 \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-textutils \
+    ${PYTHON_PN}-unittest \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-python/recipes-devtools/python/python-jsonschema_2.5.1.bb
new file mode 100644
index 0000000..3bb5220
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonschema_2.5.1.bb
@@ -0,0 +1,8 @@
+inherit pypi setuptools
+require python-jsonschema.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-argparse \
+    ${PYTHON_PN}-contextlib \
+    ${PYTHON_PN}-functools32 \
+"
diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb
new file mode 100644
index 0000000..5aaee68
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb
@@ -0,0 +1,6 @@
+inherit pypi setuptools3
+require python-jsonschema.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.1.4


