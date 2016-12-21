Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15C706E688
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 22:12:45 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 3so1360478qtr.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 14:12:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5Bv6KquvBPfJVLm7FNb/eDuldBYDtgJdaNsrIlIPdJE=;
	b=n2UCkdtGpNMV2H5aOuIjKuMxS4lXtR/NIORamGf++p3ccptrmqhr+4uAPUult721xh
	N1wG9pmsotiWriG6+xG9ff1Z1vGg/OODDX7MQ+5a9Tlo4gB50Qtsf/CubDKTLLVliHqX
	CAz4P5y01HC9kuZFFJIoKmpKvRh81g40F+e92JtFIUbsUbUxABB+Sh9+Be7e67NboeFR
	xMhRmoYnrpPBFPdSzCol2kJ1B9r/0AH06J5cK/bVRfsx9J44j9520eiAhev1HwvRVElc
	DZ5jcWhKntOchm3u1OCjPdi+VKdJ1ViWa1R6Gohi34J16i6v6+YsoRZwBb3xkqd/GcBt
	76gA==
X-Gm-Message-State: AIkVDXLy+ltcU7aTI26GMkMjPHTkBz/E5pTqiODawNHGOTCYOtXMU1+eIEXPPGkmQtDe1A==
X-Received: by 10.237.33.173 with SMTP id l42mr6778497qtc.271.1482358366848;
	Wed, 21 Dec 2016 14:12:46 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	h43sm16540520qth.29.2016.12.21.14.12.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 14:12:46 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:12:17 -0500
Message-Id: <1482358337-11521-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 3.7.0
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
X-List-Received-Date: Wed, 21 Dec 2016 22:12:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_3.6.4.bb => python-lxml_3.7.0.bb}             | 0
 .../python/{python3-lxml_3.6.4.bb => python3-lxml_3.7.0.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_3.6.4.bb => python-lxml_3.7.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_3.6.4.bb => python3-lxml_3.7.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 7481b98..8319799 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=f9f1dc24f720c143c2240df41fe5073b \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "6dd7314233029d9dab0156e7b1c7830b"
-SRC_URI[sha256sum] = "61d5d3e00b5821e6cda099b3b4ccfea4527bf7c595e0fb3a7a760490cedd6172"
+SRC_URI[md5sum] = "b78e6f7e859c2ff57add7f63a5e387b7"
+SRC_URI[sha256sum] = "9c62eb2a1862e1ae285d7e7e3b7dc8772d387b19258086afcec143c6b7b8a5c9"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_3.6.4.bb b/meta-python/recipes-devtools/python/python-lxml_3.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_3.6.4.bb
rename to meta-python/recipes-devtools/python/python-lxml_3.7.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_3.6.4.bb b/meta-python/recipes-devtools/python/python3-lxml_3.7.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_3.6.4.bb
rename to meta-python/recipes-devtools/python/python3-lxml_3.7.0.bb
-- 
2.7.4


