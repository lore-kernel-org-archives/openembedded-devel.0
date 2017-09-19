Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D053878087
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 18:51:58 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q8so343253qtb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 11:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NS5evaG29O6/NDY7Hw+MUolV3B7pgfgusglQ2fMw45o=;
	b=GtcYHCPh9Z4gvC0fG0BPsYR8+LQSpiBQomaScc4X/wcSR2wPdMLzFk6Fin/QvrTS6t
	h4QiMFjDgaoZ/STe/6eIHgasDaNnY0Qpze5Yi59JlYK9KFQ//OGA0DumyEH7sovmmG1W
	NP0GnnZUYS3CBs4J5fjmZWA8Nx6mGrv9lceeTtmm24qUd1/NW0MPPum/avTqd1tlkrdd
	B+HNoRvgicV0K1RtnTLZLao1kllg/ALycS8gtMNHENEOi+qfxh3YtaOzaMtVnF5GSlCK
	0GXli3yPuRxUejJk6jwDm+Yw/a/UAAuJLMjVpc9N+2gZezGDExFpcCam4domV61lPzQd
	BGDA==
X-Gm-Message-State: AHPjjUhiR2p/CUB5Gt+ed+z2P2fv1wXuzr8uD4kQMbODtOQoL/N3G69M
	mkFfAFLICUJh8r32CvjNze6JOQ3N
X-Google-Smtp-Source: AOwi7QApm458rJvk5s2tKrGuAuAnO/EJWYOO3Y4ReBCvCnbUGnrgMZDZDw3gOYMN0fGKpoUbKHbv3Q==
X-Received: by 10.200.8.225 with SMTP id y30mr3557880qth.239.1505847119505;
	Tue, 19 Sep 2017 11:51:59 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id p7sm7265786qke.78.2017.09.19.11.51.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 11:51:58 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 14:51:50 -0400
Message-Id: <1505847110-7896-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-appdirs: add an initial recipe
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
X-List-Received-Date: Tue, 19 Sep 2017 18:51:59 -0000

A small Python module for determining appropriate + platform-specific dirs

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-appdirs.inc       | 8 ++++++++
 meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-appdirs.inc
 create mode 100644 meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb

diff --git a/meta-python/recipes-devtools/python/python-appdirs.inc b/meta-python/recipes-devtools/python/python-appdirs.inc
new file mode 100644
index 0000000..c482672
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-appdirs.inc
@@ -0,0 +1,8 @@
+SUMMARY = "A small Python module for determining appropriate + platform-specific dirs, e.g. a user data dir."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=31625363c45eb0c67c630a2f73e438e4"
+
+SRC_URI[md5sum] = "44c679904082a2133f5566c8a0d3ab42"
+SRC_URI[sha256sum] = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb
new file mode 100644
index 0000000..e9ff9b3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-appdirs_1.4.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-appdirs.inc
diff --git a/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb b/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
new file mode 100644
index 0000000..d24e1d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-appdirs_1.4.3.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-appdirs.inc
-- 
2.7.4


