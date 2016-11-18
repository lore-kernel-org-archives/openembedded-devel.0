Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1189B71993
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:45:51 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id l20so16132798qta.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 18:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AfWWBlvvDEvLFQhoSfxfSVmnNhAUl7QD5Prl3UBqjNg=;
	b=bKSdGQmPk/m3CNEw4rwmzoX4/ObGTF/rtj60CkuT0yRD+XcltiHgoMsx+YiROxP6oQ
	LgHx6EQJT7xN95dvAt2x0FNVPS4qwo7RU/FYqr4o5JaOz2BvqH1BBubqIJvQ2p/vji48
	5gGrpQbNQ1+VMPuoA7VkiVCHwmDFE1zMWg9Fu6rb4id4vOZv8rsCSwLj4Rz+eghwtZzb
	l6xbmLkKhokovX771I0wL6NWiucgVy+oejUfTFOgcoMRAmAaqjMdPOFoaWghbvB4trU8
	+wbOltbwUH5CIjGgReuygHUxXe2wG4/26eY95FAgYIE0t4QfQ5N4zjS8u70u0B3Xutqg
	Rumw==
X-Gm-Message-State: AKaTC01sPDhJrOhCfs/vVfCqdz+mgY9zRn//6VDZOTNnMeiMmE0ZP8F7IuggUWwzAZ2U/A==
X-Received: by 10.200.46.129 with SMTP id h1mr4676412qta.277.1479437152999;
	Thu, 17 Nov 2016 18:45:52 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	k143sm3018761qke.22.2016.11.17.18.45.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Nov 2016 18:45:52 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2016 21:45:44 -0500
Message-Id: <1479437144-14510-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: update to version 2016.7
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
X-List-Received-Date: Fri, 18 Nov 2016 02:45:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz_2016.4.bb | 14 --------------
 meta-python/recipes-devtools/python/python-pytz_2016.7.bb | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pytz_2016.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pytz_2016.7.bb

diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.4.bb b/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
deleted file mode 100644
index 6cbea28..0000000
--- a/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "World timezone definitions, modern and historical"
-HOMEPAGE = " http://pythonhosted.org/pytz"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
-
-SRC_URI[md5sum] = "a3316cf3842ed0375ba5931914239d97"
-SRC_URI[sha256sum] = "c823de61ff40d1996fe087cec343e0503881ca641b897e0f9b86c7683a0bfee1"
-
-inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-    python-core \
-    python-datetime \
-"
diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.7.bb b/meta-python/recipes-devtools/python/python-pytz_2016.7.bb
new file mode 100644
index 0000000..508fd3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pytz_2016.7.bb
@@ -0,0 +1,15 @@
+SUMMARY = "World timezone definitions, modern and historical"
+HOMEPAGE = " http://pythonhosted.org/pytz"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
+
+SRC_URI[md5sum] = "8660ba7c3c0abd23e6e4efa493b02966"
+SRC_URI[sha256sum] = "8787de03f35f31699bcaf127e56ad14c00647965ed24d72dbaca87c6e4f843a3"
+
+inherit pypi setuptools
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-threading \
+"
-- 
2.7.4


