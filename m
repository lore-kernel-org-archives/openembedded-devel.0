Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UOFwU-0006pw-EQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:21:18 +0200
Received: by mail-ea0-f173.google.com with SMTP id k11so1499270eaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 16:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=MtQUY+RK7+2e5s4pXtYnxPj7eXP9GE0QKW5FlqPk7iQ=;
	b=WibN8EKILYzZmgGeghxbceI+jKKSKIztgEuDKYgKJ8Ael7/GSFOMElYMBKG6IHn1uv
	qUzeQVfDMsHfubBRudzDGZ/mLKy5EPaVHYOhgwmWHS8jpQnTUjqYq7yrfKUaCVbz33OT
	zTgMKOgGhsQM2Bet0Lda+t48He3sH2lJAKHD8urLVt8lRaOZTl8kOj4FEGUN84vsaKz5
	XGEH2Ze2ALic/0jxF0rZS+CzXXBG5+NIRlQ36C766W+kucdFjTGdoOGZYhyIhTZ1XJir
	xO0Yta236VmRVwjIjNZF3Xtvkyuq36r3xnLI+nMVh/mCCg+phxIDn7R2UBKw3a3nhqc9
	jKcA==
X-Received: by 10.14.218.71 with SMTP id j47mr23649839eep.28.1365203035892;
	Fri, 05 Apr 2013 16:03:55 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2C0A.dip.t-dialin.net.
	[91.10.44.10])
	by mx.google.com with ESMTPS id a1sm18010579eep.2.2013.04.05.16.03.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 16:03:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 01:03:36 +0200
Message-Id: <1365203016-17804-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
References: <1365203016-17804-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce++ 6/6] pngcheck initial add 2.3.0
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
X-List-Received-Date: Fri, 05 Apr 2013 23:21:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb

diff --git a/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
new file mode 100644
index 0000000..59f22df
--- /dev/null
+++ b/meta-oe/recipes-support/pngcheck/pngcheck_2.3.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "pngcheck verifies the integrity of PNG, JNG and MNG files"
+HOMEPAGE = "http://www.libpng.org/pub/png/apps/pngcheck.html"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://gpl/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "zlib libpng"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/png-mng/${BPN}/${PV}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "980bd6d9a3830fdce746d7fe3c9166ee"
+SRC_URI[sha256sum] = "77f0a039ac64df55fbd06af6f872fdbad4f639d009bbb5cd5cbe4db25690f35f"
+
+do_compile() {
+	oe_runmake -f Makefile.unx INCS=-I${STAGING_DIR_HOST}${incdir} LIBS=${STAGING_DIR_HOST}${libdir}/libz.a
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install pngcheck ${D}${bindir}
+	install png-fix-IDAT-windowsize ${D}${bindir}
+	install pngsplit ${D}${bindir}
+}
+
-- 
1.7.4.4



