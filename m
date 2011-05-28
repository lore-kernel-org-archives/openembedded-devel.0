Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQKEl-000717-Dm
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:11:31 +0200
Received: by fxm19 with SMTP id 19so2120968fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=7QewRhgzjaMFWnwH/4kf/vaEbocK9B/b7ny8XeBFbvI=;
	b=q1BBi/UPkndOqEUxZ6FocFUNMNdO/ujSCOwF3p11j20ecFs5hfJVraOlDSmeAEo8JT
	7/6XiWC8DGAZ+0pQ2jRZrcjOTkET85XBz7XfUOioV4Xu535smsV9UqFbT/tloodz7IXr
	q2hEwzrfLgfjkPpRTVbwgsH/2ZTrZtKlV2NC8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ETiXu8E0j4g15nzfKz6gPNLzq3tZtnyHlBE9kKHrTMKWoOKh6/HNFoGF8In/N/UhTL
	o84QRpVdFYfe1YdTDeAdc7mLxiBJP9DzBS+Y9hx/We3octmSvNu1PQuxEDSKaGBpFxxg
	IZMWzIrxsSL4a+NJTp7UXhBP4OvfdNtPAw+2g=
Received: by 10.223.160.131 with SMTP id n3mr3463673fax.111.1306591705150;
	Sat, 28 May 2011 07:08:25 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q21sm171162fan.16.2011.05.28.07.08.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 07:08:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 May 2011 16:08:19 +0200
Message-Id: <923ec41843a1fb2a1de239afbe1a3c4844f0e2ae.1306591578.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
In-Reply-To: <cover.1306591578.git.Martin.Jansa@gmail.com>
References: <cover.1306591578.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] gconf: depend on polkit not policykit
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
X-List-Received-Date: Sat, 28 May 2011 14:11:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/gnome/gconf_2.28.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/gnome/gconf_2.28.0.bb b/meta-oe/recipes-gnome/gnome/gconf_2.28.0.bb
index e167d8a..defb5fe 100644
--- a/meta-oe/recipes-gnome/gnome/gconf_2.28.0.bb
+++ b/meta-oe/recipes-gnome/gnome/gconf_2.28.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "GNOME configuration database system"
 SECTION = "x11/gnome"
-DEPENDS = "gtk+ orbit2 glib-2.0 libxml2 policykit"
+DEPENDS = "gtk+ orbit2 glib-2.0 libxml2 polkit"
 ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
 LICENSE = "LGPLv2+"
@@ -12,7 +12,7 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/GConf/2.28/GConf-${PV}.tar.bz2
 SRC_URI[archive.md5sum] = "ad2aeb9c7d906b274954c51a615caeac"
 SRC_URI[archive.sha256sum] = "d057dcfe2bfb2a80e592349c2a78d7dce12d19542aeced466c64fb701c806ac8"
 
-PR = "r2"
+PR = "r3"
 
 RDEPENDS_${PN} += "dbus-x11"
 
-- 
1.7.5.rc3



