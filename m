Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6FA5F77140
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:25 +0000 (UTC)
Received: by wmll128 with SMTP id l128so4833114wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=cVLyW2awV3t7delrzf3b3Eo+YxSloOvVZKatCuA/uek=;
	b=yn3VuYm98xxVj4YiPwt7729+d0WelqG6+ErcoxBq5kEPHq48Uigd15OID+PIpZKWE3
	l1QZOjLr/Rb93hpbfTjGE6pXUlUvt5Nzg2aTYlL66mvo82L5X2S6xFwUNV1i3NXsbkve
	lQG8tzZsMM6/5Hhf0jtfNfVhvjRD+jaoqVocUqbMBu/FYyskN3NjtH8vDYm0h3sfcSq5
	gsXrzLEbqHTti7Y1wclxgOsE3Ro/VxfwrwsmUyZW4UrnxVcuPBNRw2vVe3nX19hniUkh
	hU8ClILjiLncbYTKbuxuPtKP09lG3EKX8Jq7s4Qn9NPihPGZEoXYoNE3iwdUGbOYJL7T
	aP6Q==
X-Received: by 10.28.21.17 with SMTP id 17mr29696937wmv.82.1446680665366;
	Wed, 04 Nov 2015 15:44:25 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:50 +0100
Message-Id: <1446680640-31722-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 08/18] autotools-bootstrap.bbclass: initial add
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Nov 2015 23:44:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bootstrap is another magic script which is intended run before autotools. The
class created runs this script at the right time and ensures that sources of
gnulib are not cloned during configure.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/classes/autotools-bootstrap.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/classes/autotools-bootstrap.bbclass

diff --git a/meta-oe/classes/autotools-bootstrap.bbclass b/meta-oe/classes/autotools-bootstrap.bbclass
new file mode 100644
index 0000000..8d7af1b
--- /dev/null
+++ b/meta-oe/classes/autotools-bootstrap.bbclass
@@ -0,0 +1,24 @@
+# Class to inherit when you want to build with autotools after running bootstrap
+inherit autotools
+
+DEPENDS += "gnulib"
+
+do_configure_prepend() {
+    currdir=`pwd`
+    cd ${S}
+
+    # avoid bootstrap cloning gnulib on every configure
+    cat >.gitmodules <<EOF
+[submodule "gnulib"]
+	path = gnulib
+	url = git://git.sv.gnu.org/gnulib
+EOF
+    cp -rf ${STAGING_DATADIR}/gnulib ${S}
+
+    # --force to avoid errors on reconfigure e.g if recipes changed we depend on
+    # | bootstrap: running: libtoolize --quiet
+    # | libtoolize:   error: 'libltdl/COPYING.LIB' exists: use '--force' to overwrite
+    # | ...
+    ./bootstrap --force
+    cd $currdir
+}
-- 
2.1.0


