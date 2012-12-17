Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkYlp-0006cH-5y
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 12:22:08 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 03:07:23 -0800
Received: by mail-la0-f69.google.com with SMTP id w12so4022374lag.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 03:07:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=6Lu7/BJQ/5tnKWdufcSebqdl436/jHNf6NBS7he4sUw=;
	b=ULC5OTY4G6zMxVq2+WGlhG1J5z4FzoJRToQuQvJB0aaehEFe1d7UVhctY1yK4yCbDh
	Kdsj/TvlUcsHOZd44FNGMdd/D2WSt1l2Q05gzC/z8w1fja16qvLLxsFZAVtY/1p/UfNG
	in0okHnSKV6YrhHjdpkxFfBjWN+PIi8BbgZSKRlPn9GS6jvDn+JvgLiMLtsBQx+uixhg
	SBbZpexVQdR533eODb+BvcTLPiI3xQ9NORZ2X/bADHA/k9YpZPK8kt3NVf14xngqoXLa
	Q0zDXoIEXAjOu69xRuF3TgAV0YypwW2fyfeBIKCd2TPjtvkX8ae+P9+wB9ZpUPgJ0ej+
	aXQg==
Received: by 10.180.81.232 with SMTP id d8mr14930139wiy.14.1355742441107;
	Mon, 17 Dec 2012 03:07:21 -0800 (PST)
Received: by 10.180.81.232 with SMTP id d8mr14930132wiy.14.1355742441023;
	Mon, 17 Dec 2012 03:07:21 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cf6sm11923688wib.3.2012.12.17.03.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 03:07:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Dec 2012 11:05:39 +0000
Message-Id: <1355742339-15037-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkmi5Wq9utm91X837YTU5kSSN9tm2l+o0Ifaxnt9v6HseV0705sZzNxYwzc72m5ndMZADeMI5E4BktM2aIOQ8pBF/QxTCQ+OXJf7H0bNk+/MM+mOubm+rfHdVriWhrd8WI6hKdkDxy259Rbn57bXPk4SBPKxqiSRepCu8maYiZzhTAff7mEFuVb+fLJ9/K7hDDXT9ap
Subject: [PATCH] python-mako: install standalone, not as an egg
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
X-List-Received-Date: Mon, 17 Dec 2012 11:22:08 -0000

---
 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
index 9113666..d2222d6 100644
--- a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
+++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
 SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
@@ -13,6 +13,10 @@ S = "${WORKDIR}/Mako-${PV}"
 
 inherit distutils
 
+DISTUTILS_INSTALL_ARGS = "--single-version-externally-managed \
+                          --root=${D} \
+                          --install-lib=${PYTHON_SITEPACKAGES_DIR}"
+
 RDEPENDS_${PN} = "python-threading \
                   python-netclient \
                   python-html \
-- 
1.7.10



