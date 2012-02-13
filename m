Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RwyPK-0007sg-Dm
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 17:05:38 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1518703eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Syjk0l2xY35IY40VD4cgxDp8Q25RTIQgvN/2YxTyjcY=;
	b=b1zcBnlVcyWfsA3TCHVFpqtuxhuvzwZP6k26ebcgIKxUvWBe/39K2aPX3i0eCL+LGk
	9eKILRBaQjQfV7Px7cWztm4UvPliWtmV7JxP41lhmhtpnx8kLbkFcGmM/7rfCeyiAjjy
	WDd5vZOA0c2krzzwlQ4Ow+byXBgEd4bWJj04s=
Received: by 10.14.120.209 with SMTP id p57mr5321201eeh.55.1329148651173;
	Mon, 13 Feb 2012 07:57:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm62318157eeb.8.2012.02.13.07.57.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:57:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:56:58 +0100
Message-Id: <6ffed770229216b7e0d31c3cb5657ffc2f5a2648.1329148318.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
References: <2d1d85b8c16b655a71085d45c54bf7df8f84bbee.1329148318.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329148318.git.Martin.Jansa@gmail.com>
References: <cover.1329148318.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome][PATCH 4/4] gdb-cross-canadian: drop .bbappned, doesn't work for me, fixed version sent to oe-core
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
X-List-Received-Date: Mon, 13 Feb 2012 16:05:38 -0000

* see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/017227.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gdb/gdb-cross-canadian_7.4.bbappend            |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.4.bbappend

diff --git a/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.4.bbappend b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.4.bbappend
deleted file mode 100644
index 3bbfe38..0000000
--- a/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.4.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-DEPENDS += "python-nativesdk"
-RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
-			 python-nativesdk-codecs python-nativesdk-netclient"
-
-EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
-PRINC = "1"
-
-do_configure_prepend() {
-cat > ${WORKDIR}/python << EOF
-#! /bin/sh
-case "\$2" in
-	--includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
-	--ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
-	--exec-prefix) echo "/usr" ;;
-	*) exit 1 ;;
-esac
-exit 0
-EOF
-	chmod +x ${WORKDIR}/python
-}
-- 
1.7.8.4



