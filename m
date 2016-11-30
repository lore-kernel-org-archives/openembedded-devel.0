Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id F1B4371AB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 19:32:58 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id x190so221018418qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 11:33:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AuECO+PcXfzeYRlzvJi/4yRA+/0veYtpCBW34egCyRg=;
	b=Aub0zcgACG0nSUinx9CU8ssq1l1Ti8IN4ezdMcxE7/FACA4RUtCPW1uhoZqwnCZSfn
	h1B4NzhG+cDPCB2LMpq0LDzZRqXO1e4BRPXT9i1BRc9sxpHU1XusrO6OCuugGbdgsSJM
	MKO1WefiB84FqZ8NnSR/d4BhhI2tAwCVeomRx1OffG8B14f+kFpM+poY8qpSTFSCqvE0
	XjiimbBu0VNdDXxSmruHqbSIKA5GJ6Cvyn5L2LHiCj5Ul1GtWAxyuhCBY767lRPjgg5k
	/Nv45flgmb6vtFUk/gP1cXklxIQo8Kvryu0SxJg03JDEzKvY/ai6QHjIIX08f18SCwua
	iQuw==
X-Gm-Message-State: AKaTC03y0Te5mDUeIrAl0TrBasF1Gs0E18fs4ZSuloIW9QyXlkqenaUwqyupgUGgz5U7yg==
X-Received: by 10.55.50.213 with SMTP id y204mr33191876qky.146.1480534380064; 
	Wed, 30 Nov 2016 11:33:00 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	n188sm34028450qkc.30.2016.11.30.11.32.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 Nov 2016 11:32:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 14:32:47 -0500
Message-Id: <1480534367-21523-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymisp: update to version 2.4.54
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
X-List-Received-Date: Wed, 30 Nov 2016 19:32:59 -0000

  * Verified license remains the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymisp.inc        | 6 +++---
 meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb | 2 ++
 3 files changed, 7 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb

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
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb b/meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb
new file mode 100644
index 0000000..1b1fbe9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymisp_2.4.54.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pymisp.inc
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
new file mode 100644
index 0000000..4523d9e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.54.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pymisp.inc
-- 
2.7.4


