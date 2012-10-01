Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TIhLl-0008LI-Qe
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 16:52:01 +0200
Received: by weyt44 with SMTP id t44so2963566wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Oct 2012 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=bZsDwGUygMY4El5qGcENTXSECsiXxAKnRv52tpEWbZo=;
	b=te9ojQ/EcI0taP+Ae76T1N6DRCeWG4F33HgACW0+RiyCAwx52Kq0+smeaMjEywf19w
	ZuRNpy2T8h06ZMdlUPtNNmNxT3oCQkKmXiqx9JZHHPgVBBszYbbcPXxHDBB+XOGoLLqM
	fQSsziGezkGcU5d3SjvsTR4AZTUam/AWJZ8b2WAFmH2lQ59J7+Lb3lwwtuY74uRcMF/9
	ykZIfaE6C9MIMJzPRvEo+99cyNxPrzDUxWY7xaef//2C7+ahiN5ZBAKFySN2Hmt4E8yc
	lCoDN9pyTpz+1zRq0da5D5bwePWV3UadoCMduU+iSzQkGX2ASN7zU+tgssingHEOCH9l
	dz2Q==
Received: by 10.216.143.158 with SMTP id l30mr8089444wej.113.1349102344937;
	Mon, 01 Oct 2012 07:39:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ct3sm16725135wib.5.2012.10.01.07.39.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 07:39:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 16:38:45 +0200
Message-Id: <f48ae47116ea3944c9e7c99b5e35243f8ca65586.1349102278.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1349102278.git.Martin.Jansa@gmail.com>
References: <cover.1349102278.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/6] re2c: import from oe-classic
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Oct 2012 14:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* used by azy

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/re2c/re2c_0.13.5.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-support/re2c/re2c_0.13.5.bb

diff --git a/meta-oe/recipes-support/re2c/re2c_0.13.5.bb b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
new file mode 100644
index 0000000..d87f176
--- /dev/null
+++ b/meta-oe/recipes-support/re2c/re2c_0.13.5.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Tool for writing very fast and very flexible scanners"
+HOMEPAGE = "http://re2c.sourceforge.net/"
+AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
+SECTION = "devel"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://README;beginline=180;md5=822830a2204aef353f2c489f62e02089"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI[md5sum] = "4a97d8f77ed6d2c76c8bd840a43f5633"
+SRC_URI[sha256sum] = "f3a995139af475e80a30207d02728b1e0065b0caade7375e974cb1b14861668c"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools
-- 
1.7.12



