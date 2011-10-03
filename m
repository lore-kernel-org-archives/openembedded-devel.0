Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifN-000507-GK
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:45 +0200
Received: by dyk17 with SMTP id 17so79142dyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bX7sN3VrvLeMbSL73jQisNQK/Bhst8+vJ4UgEy5cvbM=;
	b=po91d1cJoy0pfAHc/hgXBs7JN0WkMCTap7qjF3apF4CSbQ3I1nKUVJfTqKbFcGONZW
	oJCG2mqtZWslQb6TRzEm88F1xSjtEOgigaJr/kc65rJnBYV2OlH3WBQOU4EJOl5oM9T7
	PYECn4zyNpydWZT396/0rM/RucrMfPPq0/1Tk=
Received: by 10.223.45.140 with SMTP id e12mr16555232faf.27.1317648552756;
	Mon, 03 Oct 2011 06:29:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o16sm21262808fag.21.2011.10.03.06.29.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:12 +0200
Message-Id: <90bee924fcc8bc26e02766bab7a3870f8cb8e5bf.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 14/25] poppler: upgrade from 0.12.3 to 0.18.0
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.12.3.bb |   10 ----------
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.12.3.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb

diff --git a/meta-oe/recipes-support/poppler/poppler_0.12.3.bb b/meta-oe/recipes-support/poppler/poppler_0.12.3.bb
deleted file mode 100644
index ce1952e..0000000
--- a/meta-oe/recipes-support/poppler/poppler_0.12.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require poppler.inc
-
-DEPENDS += "lcms"
-
-EXTRA_OECONF_append = " --disable-abiword-output "
-
-RDEPENDS_${PN} = "poppler-data"
-
-SRC_URI[md5sum] = "d0ca8344d8d94e27aaba6d432688365d"
-SRC_URI[sha256sum] = "7a4ffe6d2950c446c285700d3b2dc399540a27ce635dd712aff646f02f8dfbcc"
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
new file mode 100644
index 0000000..463b544
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
@@ -0,0 +1,10 @@
+require poppler.inc
+
+DEPENDS += "lcms"
+
+EXTRA_OECONF_append = " --disable-abiword-output "
+
+RDEPENDS_${PN} = "poppler-data"
+
+SRC_URI[md5sum] = "4cd3bf2a0a13fa8eaf00d31368915f77"
+SRC_URI[sha256sum] = "9019b15ef10a878e607e4088a27fb4967f61cdfada7806d0fee97954f76648e8"
-- 
1.7.7



