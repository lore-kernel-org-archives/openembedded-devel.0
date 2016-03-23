Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE0E6E682
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:02:47 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id 14so2095805qgg.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WFCDIJHCLqsGA4/4QmtPYE8xmXbJar+JRc4WwxtMzYI=;
	b=arjPZAxKipJTU2jiahtOtZX0zUnn4NknxTxO04r1LSBuVb8cjZ2a94+SYwf3YMnTVw
	bvxGwiE3trqAvjh9izGbh2C4uGAVu4h2AmZJ0MpVsyB00LoMfy+VYigTxs1zP+2ETWwb
	pDykIG6e3PKdaELxxtejnD7UmJky4y1jmTRD4mmhV/f7naV5Pvfw0413GOg+oguG12iM
	aOSC5lOT+2x9znFGTQgj8MINVJuH5xMLNgk6xDE/CuOYPG9I7HoHX34a5IwTjwp3MYNH
	I7oLhKHGGbmLfl5zIbwGlxkV/Yn/iXc9WP/AvBpQYpiUSFWhJpLyDidaYhuMvIloIxFT
	cS9A==
X-Gm-Message-State: AD7BkJLLtzHKvtIknZgP7kWUzcuInsWB+yEKVKZcwxVhh24r4RNYTWKKh1T3V/mqg3xI/w==
X-Received: by 10.140.168.85 with SMTP id o82mr6397592qho.75.1458763367703;
	Wed, 23 Mar 2016 13:02:47 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a102sm1752180qgf.21.2016.03.23.13.02.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:02:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:02:00 -0400
Message-Id: <1458763321-30761-5-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763321-30761-1-git-send-email-derek@asterius.io>
References: <1458763321-30761-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 5/6] python-ipaddress: update to 1.0.16 and use the common pypi
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
X-List-Received-Date: Wed, 23 Mar 2016 20:02:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-ipaddress_1.0.16.bb              | 11 +++++++++++
 .../python/python-ipaddress_git.bb                 | 22 ----------------------
 2 files changed, 11 insertions(+), 22 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-ipaddress_git.bb

diff --git a/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb b/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
new file mode 100644
index 0000000..1e97ef7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-ipaddress_1.0.16.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
+HOMEPAGE = "https://github.com/phihag/ipaddress"
+LICENSE = "Python-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
+
+DEPENDS += "python-pip"
+
+SRC_URI[md5sum] = "1e27b62aa20f5b6fc200b2bdbf0d0847"
+SRC_URI[sha256sum] = "5a3182b322a706525c46282ca6f064d27a02cffbd449f9f47416f1dc96aa71b0"
+
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-ipaddress_git.bb b/meta-python/recipes-devtools/python/python-ipaddress_git.bb
deleted file mode 100644
index 6b7148f..0000000
--- a/meta-python/recipes-devtools/python/python-ipaddress_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Python 3.3+'s ipaddress for Python 2.6, 2.7, 3.2."
-HOMEPAGE = "https://github.com/phihag/ipaddress"
-SECTION = "devel/python"
-LICENSE = "Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
-
-PV = "1.0.15"
-SRCREV = "95adb9f374a1cca5efda08d20d9fc58d955d4a42"
-
-SRCNAME = "ipaddress"
-SRC_URI = "git://github.com/phihag/${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
-DEPENDS += " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
-- 
1.9.1


