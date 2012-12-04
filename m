Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi8S-00040y-5E
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:24 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1926936eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pO9r9IvumrZQmAFYeU85Ls2laXz3UureN3AcobGc9xY=;
	b=nKzi7l9KehRyUPN6eDrVdxvhwAADNl4gjhqOC9kUXie/TTaOolhkOs5K8fSB9350Eb
	s4urQ71TeNj3/Nr4WqWBv6rtNBeDNyIPt1f8IT6zd4nJ7PXN2FI7vCMH2yFbQ+AnrMjD
	ce6THFUlZRLL9m4DosJYGvyT1cq7B3XYcffMAka+mj4tpcGsdsT7TvEsgaC6jXgcm6X5
	Wp0UrVldcDexOvqBtw+22UuynG+Swa5gF4pLoNdBW0lC+G6eIAoGCmEQ4/Dl8vVdPgR+
	eDYlq7m8xwhWmR58EhTpVttpe/dERAFpQ5dlwFubdRQJPv1CXyALDpVg6R79SX94hEC4
	vZ8g==
Received: by 10.14.214.132 with SMTP id c4mr42837682eep.18.1354586824561;
	Mon, 03 Dec 2012 18:07:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b49sm18593970eem.16.2012.12.03.18.07.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:07:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:28 +0100
Message-Id: <f7c5854ae182f409e2a4e1b34d433a89030cae08.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 55/58] lua5.1: fix packaging QA warnings
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
X-List-Received-Date: Tue, 04 Dec 2012 02:21:24 -0000

* Fixes:
  lua5.1-5.1.4: lua5.1: Files/directories were installed but not shipped
    /usr/share/lua
    /usr/share/lua/5.1
    /usr/lib/lua
    /usr/lib/lua/5.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb b/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
index eca7755..0dc81db 100644
--- a/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
+++ b/meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=90c3badc6055c699194c4a7cea583296"
 HOMEPAGE = "http://www.lua.org/"
 
 DEPENDS += "readline"
-PR = "r10"
+PR = "r11"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz \
            file://bitwise_operators.patch \
            file://lua5.1.pc \
@@ -38,6 +38,10 @@ do_install () {
 		install
 	install -d ${D}${libdir}/pkgconfig
 	install -m 0644 ${WORKDIR}/lua5.1.pc ${D}${libdir}/pkgconfig/lua5.1.pc
+	rmdir ${D}${libdir}/lua/5.1
+	rmdir ${D}${libdir}/lua
+	rmdir ${D}${datadir}/lua/5.1
+	rmdir ${D}${datadir}/lua
 }
 BBCLASSEXTEND = "native"
 
-- 
1.8.0



