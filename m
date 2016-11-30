Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1E43571ACA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:35:12 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so198603571qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C7/HboyhaGaCeiSG88CRz8CquxLjLooznwTWvCokF6A=;
	b=bSJDyyXFUlO6dQ8f8+g2mAzMI9SnQm4L63tmBsal5XVQVjcpB9Ezoc8fSVdu26Yauq
	oxxwsZPZx8TGE9/0clQ4f+G2yEQgeoBg6fOqZLm7X0BzPTS3sw+SUbC2uVfA6VRGMtlg
	bI6DzOzOMQc/Vswb9PgYjbymFBQCZS2WzevRhyLe/ra0NqX5s22rBYT11lcaHeFvFgVy
	wNwJ8lbNXDpJ0m90tdoX67TDMuY6bZjTvVvxQuETEu95SNoiPA6n1h4uyGeypXaGRBbs
	8Xh//QvTSQxWvmGlbnxA0IFmlXVGt10cB3IZehoJk8S+ubXBGl718E8KZKTUfCQVCSEB
	3BpQ==
X-Gm-Message-State: AKaTC02r3xblnB9Nj8PLWt/y85FWwU0UxDRdy5EncgJal/jJJofEDIBFbSs/VSr1DfzmBg==
X-Received: by 10.200.43.199 with SMTP id n7mr33504014qtn.12.1480534514115;
	Wed, 30 Nov 2016 11:35:14 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	e24sm27107154qkj.12.2016.11.30.11.35.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 11:35:13 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:35:02 -0500
Message-Id: <1480534502-21902-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-pymisp: update to version 2.4.54
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
X-List-Received-Date: Wed, 30 Nov 2016 19:35:13 -0000

  * Verified license remains the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc               | 6 +++---
 .../python/{python-pymisp_2.4.51.1.bb => python-pymisp_2.4.54.bb}   | 0
 .../python/{python3-pymisp_2.4.51.1.bb => python3-pymisp_2.4.54.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymisp_2.4.51.1.bb => python-pymisp_2.4.54.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.51.1.bb => python3-pymisp_2.4.54.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
index 2b2601a..574b6a5 100644
--- a/meta-python/recipes-devtools/python/python-pymisp.inc
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -1,9 +1,9 @@
 DESCRIPTION = "Python API for MISP"
 HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=200286bb8d148a5a157bf22abf623cbb"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=ab76fa0012a07b5bb59582601d0b46b6"
 
-SRC_URI[md5sum] = "03b5def47d8fde29f2303ed42ab1e375"
-SRC_URI[sha256sum] = "2bb35c365470ad46f9afbb96408c01894aaa10b369fac0f6b92010190a7087ad"
+SRC_URI[md5sum] = "1a0653688a862a8746dbaae2c5e66207"
+SRC_URI[sha256sum] = "27edaea4e1f7bd978c8d3271371824e320e722896bc7b044665e04e370f98644"
 
 RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.51.1.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymisp_2.4.51.1.bb
rename to meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.51.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.51.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
-- 
2.7.4


