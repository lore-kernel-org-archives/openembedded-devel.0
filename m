Return-Path: <ashcharles@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5396C6FE24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 20:45:51 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rp16so2505519pbb.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 13:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x3yFfezfC/yQEuVm4wDv50/1famfl9DVMpraiLZakTc=;
	b=sA2mGOiMNjYoot+YiEZNGZmKgm4W3ZkSLaxOk161YwuZBLSaw0yblwcyViFGUOvaXN
	FoWcLj5qO0zsoYZoZkmjk/BwmTfMmQOJhsfbf0fN7i0o71aGS9duYpkna9mjxKWtKiUE
	wplNn0iOhXxlG3AGwLNb3piCi2Zvdid5s4Cr8pIS78rfkBTK3yZzG1WsSXEwSmopzbia
	S/Ow8ZJPNp5k2zMA21w1RNkXEzzelaWEn6S1selgRguW2yEBfiUcR/v/ByngPg45+6Mh
	hA9mJX/UDSYlDSLbF22uQ3zObnlXDZCW/trcN2ZjixGXiTyPgd+WXSSZhBt2WMm7fT9L
	tIzQ==
X-Received: by 10.68.221.42 with SMTP id qb10mr6124364pbc.65.1402692352995;
	Fri, 13 Jun 2014 13:45:52 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	fu12sm26248720pad.42.2014.06.13.13.45.51 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 13:45:52 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jun 2014 13:45:36 -0700
Message-Id: <1402692336-7688-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <20140613144746.GJ2428@jama>
References: <20140613144746.GJ2428@jama>
Subject: [Patch v4] eject: copy po subdirectory for out-of-tree build
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
X-List-Received-Date: Fri, 13 Jun 2014 20:45:54 -0000

The po subdirectory found on the VPATH for an out-of-tree build so we
copy it over. See [1] for discussion.

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/096052.html

v3: only create and populate po/ if it doesn't already exist
v4: test to see if we're building out-of-tree

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index c47c653..9534577 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -16,6 +16,14 @@ S = "${WORKDIR}/${BPN}"
 
 PR = "r1"
 
+do_compile_prepend() {
+    # PO subdir must be in build directory
+    if [ ! ${S} = ${B} ]; then
+        mkdir -p ${B}/po
+        cp -r ${S}/po/* ${B}/po/
+    fi
+}
+
 ALTERNATIVE_${PN} = "volname eject"
 ALTERNATIVE_LINK_NAME[volname] = "${bindir}/volname"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
-- 
1.8.3.2


