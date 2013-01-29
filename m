Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0AZT-00061A-2w
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jan 2013 13:46:00 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so204555dad.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jan 2013 04:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=sDlhXZydX3FkfRRSkNPpEWwJ0g0rR5fm1P4yC81c38U=;
	b=sgVNN4ehoHy+izm7UQvc+EZ7taz+g6wkvyuh3+J/u0AfkiClurssgHrj2CA8faepLM
	/aqBa8BGZT4aOFbB4DGx4GJafQ2M9jxFkcXNyut2HA2JZjx5hwdkko3o2JwvfDyaPt0d
	HLeygCk0vm0VsYTu401/wXLRtvdKrjRyNCCZiUriOyvbYXSUm9F656C3UvIhNzJ7NnEm
	/bP++KZ4lWmkrvbkWuK4ClrTFWasfGLblnxtqCCrgPSDNNbR0JhtVfigcqoiQJAO9oal
	abTnAJCJCNp8Tz3kja+fmTV1koo5MTj2YuAenCEmgGlxxkTxnPZD1yv5axq2l+43rYL+
	drwA==
X-Received: by 10.68.228.164 with SMTP id sj4mr1894025pbc.126.1359462610723;
	Tue, 29 Jan 2013 04:30:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id kl3sm8339453pbc.15.2013.01.29.04.30.08
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 04:30:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Jan 2013 13:29:50 +0100
Message-Id: <4f83edb3fa26be204ad57b61e6413d0bf96460b4.1359462547.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1359462547.git.Martin.Jansa@gmail.com>
References: <cover.1359462547.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] packagegroup-qte-toolchain-target: exclude from world
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
X-List-Received-Date: Tue, 29 Jan 2013 12:46:03 -0000
X-List-Received-Date: Tue, 29 Jan 2013 12:46:03 -0000

* add comment why qwt-e is excluded

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../packagegroups/packagegroup-qte-toolchain-target.bbappend           | 3 +++
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb                                  | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
index f379101..f6e5dd9 100644
--- a/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
+++ b/meta-oe/recipes-qt/packagegroups/packagegroup-qte-toolchain-target.bbappend
@@ -1,3 +1,6 @@
 RDEPENDS_${PN} += "qwt-e-dev"
 
+# qwt-e conflicts with qwt, so only one can be built in world and this pulls qwt-e
+EXCLUDE_FROM_WORLD = "1"
+
 PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
index 6a80136..c801309 100644
--- a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
@@ -9,4 +9,6 @@ SRC_URI[qwt.sha256sum] = "3fe19dd5962d705632fc2ef616b009299de6cf1e702538296924db
 
 RPROVIDES_${PN}-dev = "libqwt-dev"
 
+# Conflicts with qwt, only one qwt* can be built in world
+# | Project ERROR: local build will conflict with sysroots/qemuarm/usr/lib/libqwt.*
 EXCLUDE_FROM_WORLD = "1"
-- 
1.8.1.2



