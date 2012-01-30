Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1RrzW5-0007jZ-CO
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 23:16:03 +0100
Received: by eaal12 with SMTP id l12so1299170eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 14:08:08 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.213.14.193 as permitted sender) client-ip=10.213.14.193; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.213.14.193 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.213.14.193])
	by 10.213.14.193 with SMTP id h1mr4153131eba.44.1327961288614 (num_hops
	= 1); Mon, 30 Jan 2012 14:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yGRU8I4fnEaJd7XC72Fsjpyoo5WS4aVhxLOnZbnGztM=;
	b=N3q5RIR0u2W7eStbT4R5fnlLg5Wub/eH01DoG07LfBcV0c3a9050BZ/bfgSRPnSg/f
	9NjaepwqBYuh+fUh/nW4Cs80qefgqu0Md8Z/r+aH90mfpqD7TbWpaYTjjiu/VzJjjRxJ
	prQqMJDWwgCGsYQYH2zM/pcPuG5sfit7BMkpE=
Received: by 10.213.14.193 with SMTP id h1mr3156254eba.44.1327961287969;
	Mon, 30 Jan 2012 14:08:07 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id t11sm50971852eea.10.2012.01.30.14.08.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 14:08:07 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2012 23:06:04 +0100
Message-Id: <1327961164-19614-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-gnome][PATCH] libgsf: remove empty, unused packages.
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
X-List-Received-Date: Mon, 30 Jan 2012 22:16:04 -0000

Current version of libgsf recipe passes both --without-gnome-vfs and
--without-bonobo to configure. Because of this libgsf-gnome &
libgsf-gnome-dev are empty.

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
index d856c6e..6119f86 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.21.bb
@@ -3,6 +3,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc7371b50816c96e145fa0f8ade8e24d \
                     file://COPYING.LIB;md5=61464cfe342798eeced82efe9ae55f63"
 
+PR = "r1"
+
 SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
@@ -18,9 +20,4 @@ EXTRA_OECONF = "\
 		--disable-gtk-doc \
 		--with-bz2"
 
-PACKAGES =+ "${PN}-gnome ${PN}-gnome-dev "
 RDEPENDS_${PN} = "gconf" 
-
-FILES_${PN}-gnome = "${libdir}/libgsf-gnome-1.so.*"
-FILES_${PN}-gnome-dev = "${libdir}/libgsf-gnome-1.* ${includedir}/libgsf-1/gsf-gnome"
-
-- 
1.7.3.4



