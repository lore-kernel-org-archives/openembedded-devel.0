Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 786C97E428
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d18so4885532wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vSyKvnI70yUjEpmm+yvvG+B7bclhcSCv/MaCPfsYbc8=;
	b=Mnl6frst67kxB9K1AdasUc5fSRYwtXa+O26DWfwrWWsa2DdukjFjIblWg4Jzp/pp4D
	aFdxjF88GwV7KUIIJSUOdC805JhivxeppM4rozec3Y2OJD3lhI0o/+3khF3hefPYM69r
	vzpIkja/oOsErc9ND+RUZiK8aOTNO9Kdy19wG4A7KVQ8xojzB/W6fJuhQZEmEtBRw5AV
	5/QR+AFxiTbmKoI1YWSha7Y8dUDpYrbst3yL18d546YcVFh0lvNkKog8oPh2z4Q1MC1T
	9N4UsQw45fskbQv8JJZWMi7zMufmGQFTkOth9U9qNhzJ8s7DUGceDAHEpQmfc2VevOsx
	lFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vSyKvnI70yUjEpmm+yvvG+B7bclhcSCv/MaCPfsYbc8=;
	b=YT9L+Xu2kQevFz2vEfo90yz5VteX/HcAnXqUPAr30cdL5VBmLAUxWBIhN1AVzd8Lj0
	F98ynsy5iMgf1HcV83jDalOFoiEH+TBwZkHkMSia76p9rOSpTTI4Y9omUCc5j/ZxL4VN
	0jJ9q4I+Kq0cEXIyPHYajwzjo/gbfMqk53UCNiRkmx3OxgvYzAt9P6+ARw6zf2TlMnGI
	9YzZgQwCfIJgTuca4NHqHCl0MI457NTAmgeNS9FeTeD/uHFtD2JpnK8TgrqaPYIdCjPe
	DEEO1JHmWhRH6ZEZXWO/JV6f8AvA17fn/lffhAAvcXGK+uW2cH8SCVit5MFBEds69ohl
	QqSg==
X-Gm-Message-State: APjAAAVqlotodhOr82IACeQfDW1e/vOud6qzvxY4S7ky2CqiFsaBAidz
	MgaqOqyYkK1OkFf1oOAWirb74Lr6ezs=
X-Google-Smtp-Source: APXvYqycM0dWT9aDVEA2biDH20W5NnKi9P8BKOKYDjwqaM6R+72hZYtHZyByf71p5r3qV6wDZ47V9w==
X-Received: by 2002:adf:9bd2:: with SMTP id e18mr6393859wrc.210.1558594174092; 
	Wed, 22 May 2019 23:49:34 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:33 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:48 +0200
Message-Id: <20190523064859.24336-31-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 30/41] itstool: upgrade 2.0.5 -> 2.0.6
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
X-List-Received-Date: Thu, 23 May 2019 06:49:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* move to github sources: at the time of writing download server had
  certificate issues
* add patch to fix possible segfault

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...on-fault-bug-introduced-with-version.patch | 33 +++++++++++++++++++
 .../{itstool_2.0.5.bb => itstool_2.0.6.bb}    |  9 +++--
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/itstool/itstool/0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch
 rename meta-oe/recipes-support/itstool/{itstool_2.0.5.bb => itstool_2.0.6.bb} (70%)

diff --git a/meta-oe/recipes-support/itstool/itstool/0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch b/meta-oe/recipes-support/itstool/itstool/0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch
new file mode 100644
index 000000000..9783faee6
--- /dev/null
+++ b/meta-oe/recipes-support/itstool/itstool/0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch
@@ -0,0 +1,33 @@
+From 6dbc1d78e83144c425df1f4ec9e293dba64afcb1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Tue, 14 May 2019 11:21:03 +0200
+Subject: [PATCH] Fix a segmentation fault bug introduced with version 2.0.4.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [1]
+
+[1] https://github.com/itstool/itstool/pull/18
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ itstool.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/itstool.in b/itstool.in
+index e64cd34..d79fb7f 100755
+--- a/itstool.in
++++ b/itstool.in
+@@ -1053,7 +1053,7 @@ class Document (object):
+         else:
+             ctxt.replaceEntities(1)
+         ctxt.parseDocument()
+-        trnode = ctxt.doc().getRootElement()
++        trnode = ctxt.doc().getRootElement().copyNode(1)
+         try:
+             self._check_errors()
+         except libxml2.parserError:
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
similarity index 70%
rename from meta-oe/recipes-support/itstool/itstool_2.0.5.bb
rename to meta-oe/recipes-support/itstool/itstool_2.0.6.bb
index 166e95b3a..2caa64604 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.6.bb
@@ -7,9 +7,12 @@ inherit autotools python3native
 
 DEPENDS = "python3-lxml-native"
 
-SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
-SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100d4b308"
+SRC_URI = " \
+    git://github.com/itstool/itstool.git \
+    file://0001-Fix-a-segmentation-fault-bug-introduced-with-version.patch \
+"
+SRCREV = "60f3a955ca047b1d62a1d952beec74afaff7cbbf"
+S = "${WORKDIR}/git"
 
 do_install_append() {
     # fix shebang of main script
-- 
2.20.1


