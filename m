Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmsF6-0002u2-Ng
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 21:33:57 +0100
Received: by mail-ea0-f176.google.com with SMTP id d13so2715960eaa.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 12:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=FopXVKR6mwdlwi2hTIqyYJM3KPoskhR57RorSj+Q2aU=;
	b=JMj/JaMqltgUZNsJuCMPraRieK4pFvdX+gAhdoEytDfGkVHo45eOn6YsxcmOMrbT7w
	zHophR1TB6Fxh9kM3K5z/TxeEP6/fKnSoLtDvfL4ednmgoOFpoQDbNycqiFAVYHc2od8
	XbtpUapFp0DKysrzdd1FCJVl3yqYCeK3OSpP7DcpxK4tZQg9pIQvI+pong/pndab/zPy
	U/O+Ea9agFiI3NarVDoyyw1p1yzP+vTSGdkefynzKjjvzPIcsajaaXqpGanSgQT2PYLT
	oAooBItPrOfYvV1Hk6TpeUMtJJSnpaSsYOuGmoB48PeSbQOt7JvTMPhPOaSHk6D/ehyr
	uOpA==
X-Received: by 10.14.0.71 with SMTP id 47mr49641926eea.19.1356293943992;
	Sun, 23 Dec 2012 12:19:03 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm36864561eed.10.2012.12.23.12.19.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 12:19:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 21:18:41 +0100
Message-Id: <375cc13d2a0fcfa8516828fddc8abbb7a1a9c263.1356293852.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <c0cc8c325b1bc9f0010d37a282a11d3bf74f5d69.1356293852.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
	<c0cc8c325b1bc9f0010d37a282a11d3bf74f5d69.1356293852.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356293852.git.Martin.Jansa@gmail.com>
References: <cover.1356293852.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 33/33] zenity: fix typo in do_configure name and disable scrollkeeper
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
X-List-Received-Date: Sun, 23 Dec 2012 20:33:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index b4a9a47..a1fa786 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -2,14 +2,17 @@ DESCRIPTION = "Display dialog boxes from the commandline and shell scripts"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
+PR = "r1"
+
 DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
 
 inherit gnome
 SRC_URI[archive.md5sum] = "aa66ec35451b16e424519b4973082170"
 SRC_URI[archive.sha256sum] = "8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
 
+EXTRA_OECONF += "--disable-scrollkeeper"
 # remove -I/usr/include from zenity_CPPFLAGS
-do_cconfigure_prepend() {
+do_configure_prepend() {
 	sed -i -e '/-I$(includedir)/d' src/Makefile.am
 }
 
-- 
1.8.0.2



