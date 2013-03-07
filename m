Received: from mail-ye0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1UDfve-0000Ez-E4
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 19:52:37 +0100
Received: by mail-ye0-f175.google.com with SMTP id j12so117201yeg.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=UKwQs2rrsJ8qfeW+JJpLWFldpxaelBjvyOV3UScozTw=;
	b=UyQHly66iTdjq9ekp1W108ljAgfxD4Kp8sNtIfoX2taGtQRNNDmddVvUiQwZhDx2DL
	+cu64z+iJt/tzu3mei/QSc2eKMAs35kDrlZGsQvvU4xVCI4Ln6t0QcXKd9UW/W49BHnm
	iCQJWBetgkeweWDlHfGNuPbFN32Q8ZvSLdlIzQ+ahFQJfjpIpp2bjRC66UasRdLZunrO
	RrUY7SB+1KtiZF8H+B0D7tDeadEQQBVbYjZZd/SKv6NuVfhEAeHdjevjNqV6qeitnXes
	bijJrgMwKHJgLvZAPR4FegBOBdn0TVvaHZnigD6y0Ok0SPR96Yl2tirE4aZKAhQUpMxV
	TtoQ==
X-Received: by 10.236.179.37 with SMTP id g25mr25035303yhm.47.1362681361605;
	Thu, 07 Mar 2013 10:36:01 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id v43sm3351276yhm.11.2013.03.07.10.35.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 10:36:00 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 15:35:43 -0300
Message-Id: <1362681343-430-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH] libdvdread: update to version 4.2.0
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
X-List-Received-Date: Thu, 07 Mar 2013 18:52:40 -0000

The previous version (4.1.3-10) was unbuildable due to this issue:

WARNING: Failed to fetch URL git://git.debian-maintainers.org/git/daniel/libdvdread.git;protocol=git;branch=debian,
   attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository <snip>/downloads//git2/git.debian-maintainers.org.git.daniel.libdvdread.git...

fatal: Unable to look up git.debian-maintainers.org (port 9418) (Name or service not known)

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 .../libdvdread/libdvdread_4.1.3-10.bb              |   16 ----------------
 .../libdvdread/libdvdread_4.2.0.bb                 |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
 create mode 100644 meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb

diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
deleted file mode 100644
index f17043b..0000000
--- a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.1.3-10.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "DVD access multimeda library"
-SECTION = "libs/multimedia"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-SRC_URI = "git://git.debian-maintainers.org/git/daniel/${PN}.git;protocol=git;branch=debian"
-
-SRCREV = "e465b500c12be5b4c0b6918a9b98038611f66c57"
-S = "${WORKDIR}/git"
-
-inherit autotools lib_package binconfig pkgconfig
-
-do_unpackpost() {
-        QUILT_PATCHES=debian/patches quilt push -a
-}
-
-addtask unpackpost after do_unpack before do_patch
diff --git a/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
new file mode 100644
index 0000000..d5695ca
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libdvdread/libdvdread_4.2.0.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "DVD access multimeda library"
+SECTION = "libs/multimedia"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=64e753fa7d1ca31632bc383da3b57c27"
+SRC_URI = "http://dvdnav.mplayerhq.hu/releases/libdvdread-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "ab7a19d3ab1a437ae754ef477d6231a4"
+SRC_URI[sha256sum] = "0bea15da842a4b04a482b009d72dcc6d9c9524ccc1bf67e5748319ec5ada8097"
+
+inherit autotools lib_package binconfig pkgconfig
+
+CONFIGUREOPTS := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
+
+do_configure_prepend() {
+    # For some weird reason, libdvdread only provides a `configure2' script...
+    cp ${S}/configure2 ${S}/configure
+}
-- 
1.7.2.5



