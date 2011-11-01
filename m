Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9nu-0008GO-1X
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:34:42 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6983168faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Agj5NDfjMKArLhL/s1KeCz83uZxGfV6VSw1Dx+BwvIM=;
	b=d0t00++n30y6wwepJmNk02xmgbUzDrsHtTxAhFyMHeI3ajOa4wkd6e0/GF+Cn/To85
	Hvb7oo5tTekoJ6KCEudvOr1Tgklst+ngkooUwh/vl2Dvmr0XnlyJboMImKjnDkoCazKj
	3HGpKLDIT4lPXswy0JgbEm9SIi36O6Db9oe6E=
Received: by 10.223.75.15 with SMTP id w15mr35785515faj.9.1320136118101;
	Tue, 01 Nov 2011 01:28:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w11sm43355874fad.7.2011.11.01.01.28.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:28:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:40 +0100
Message-Id: <32ed63c4b8b80a4c84d938bd960c8ccac189967b.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 06/15] liblinebreak: import from openembedded classic, version 1.2
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
X-List-Received-Date: Tue, 01 Nov 2011 08:34:42 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

* The License was verified and LIC_FILES_CHKSUM was added
* OE-classic commit 9d612c4bb9bef813bdef9e198efc5949d51905eb

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../liblinebreak/liblinebreak_1.2.bb               |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb

diff --git a/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
new file mode 100644
index 0000000..d64cfd9
--- /dev/null
+++ b/meta-oe/recipes-support/liblinebreak/liblinebreak_1.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Liblinebreak is an implementation of the line breaking algorithm as described in Unicode 5.1.0 Standard Annex 14, Revision 22"
+HOMEPAGE = "http://vimgadgets.sourceforge.net/liblinebreak/"
+SECTION = "libs"
+LICENSE = "zlib"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=3715191da62bafb5cfc4ff36195b2ec3"
+PRIORITY = "optional"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/vimgadgets/liblinebreak/${PV}/liblinebreak-${PV}.tar.gz"
+SRC_URI[md5sum] = "d18039259001ccb24b5dd4648c49c5ad"
+SRC_URI[sha256sum] = "9efcb0cb1afc75ad1e92d2b2dbf4d9c77b072d6656c5f1a150af8b718d0c7b76"
+
+inherit autotools
-- 
1.7.7.1



