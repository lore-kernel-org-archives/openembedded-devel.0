Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fTX-0004b5-7x
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Sep 2011 17:58:11 +0200
Received: by bke11 with SMTP id 11so1928176bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=avWVk41fLXxBTVjVKAtvNCS91UHIyfTQjTlVOjjhhu4=;
	b=OxnXciZnxnajxzy4BGgmvzaQ86kYzl8u21M1pvIYF6z0VQOlgfWItu+VTu/CbwL5PG
	Wo/la9ADD7ctkQt16UzVYfv0aNyEoX3hEal2IM7h4JkFX0wfNr28hPXv1qJxrfsXuYXe
	NSyMxMWPjaE4DJlrof4fIUlv0L4pX68DmeRxI=
Received: by 10.204.139.219 with SMTP id f27mr8529629bku.288.1317397960076;
	Fri, 30 Sep 2011 08:52:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t13sm3619409fae.0.2011.09.30.08.52.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:52:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:52:03 +0200
Message-Id: <effc9442b8cdb3258cbd84deb5314d841dd84cd2.1317397769.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
References: <d949b79e20616add7118dcc7cb4f5ee08b4fed3b.1317397769.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317397769.git.Martin.Jansa@gmail.com>
References: <cover.1317397769.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/6] poppler: upgrade from 0.12.3 to 0.18.0
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
X-List-Received-Date: Fri, 30 Sep 2011 15:58:11 -0000

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
1.7.6.1



