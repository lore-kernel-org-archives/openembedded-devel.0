Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAifF-0004Yv-T8
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:34:38 +0200
Received: by mail-yx0-f175.google.com with SMTP id 17so3397593yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=dnrJmpUp20FAH+fQiw2stIrAJJ0suw9JYhgzbZ4Y17Y=;
	b=mOJyny+G+Ug8u2Xz+XQncxXkJhjLZfSk5WYgV7u1YjHgtIkLbMGH5s5he6m20G9+LY
	JaA510CeY3cN14ENbFFEfI79PnysB5qR9waVvaa2C+fg8IKADgBoKXAAzpD6GRGnGfCe
	XkLfOj6lHcaq7indyCF+ov9fi87FMQvw3Z6wY=
Received: by 10.223.48.69 with SMTP id q5mr5575602faf.80.1317648545127;
	Mon, 03 Oct 2011 06:29:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm21287188fai.8.2011.10.03.06.29.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:29:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:11 +0200
Message-Id: <77d555b85e36443009435ea7ea91a2fd1dd49afe.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 13/25] poppler-data: upgrade from 0.4.0 to 0.4.5
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
X-List-Received-Date: Mon, 03 Oct 2011 13:34:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.0.bb => poppler-data_0.4.5.bb} (77%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
similarity index 77%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
index c59cc73..cbb02b4 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.5.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4870b98343f0bbb25fa43b9d2ba59448 \
                     file://COPYING.gpl2;md5=751419260aa954499f7abaabaa882bbe \
 "
 
-PR = "r2"
-
 SRC_URI = "http://poppler.freedesktop.org/${PN}-${PV}.tar.gz"
 
 do_compile() {
@@ -19,5 +17,5 @@ do_install() {
 FILES_${PN} += "${datadir}"
 inherit allarch
 
-SRC_URI[md5sum] = "6975bf8e9ea2cfb42b9ecdbcc257cf57"
-SRC_URI[sha256sum] = "5caf7e10b7b0c6a4e1e753af09be52224e88bb8fbcb47794ad72b99b9e24b109"
+SRC_URI[md5sum] = "448dd7c5077570e340340706cef931aa"
+SRC_URI[sha256sum] = "3190bc457bafe4b158f79a08e8a3f1824031ec12acefc359e68e0f04da0f70fd"
-- 
1.7.7



