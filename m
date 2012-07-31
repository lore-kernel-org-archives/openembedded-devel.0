Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sw8k5-0003tp-Fn
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 11:27:53 +0200
Received: by bkcik5 with SMTP id ik5so2467236bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=6UPss7yKaIcJakW9AZVsV56DemAh37dv+/ctYp7Z5Og=;
	b=l8pX7bye48XPDajyufjdkEs2m1fP2rP7nBgDIIOqqKvFQWTB7QeXfMA5OgRvYAzpho
	tO23/5Tr55i+9vUOSYbNywQ8OxK8RNsHyAnoNTTq13glA3Fw99P3eJdtII0Zh+G8Pdvv
	T8upBcwP55JuvaH0I7OVM3ZBJ9s1PqUjB34EPCah6F0xb+74cl3tS14kTRLCRkEqY/RH
	LPW1ZWjL8ETKN+3sntxyGh01N7UCvYVIh34TsIutZZViZeMghnPENNEiYgHplqvXOX4k
	g78yjqP1UtgexEnpd5QZ81cdVhHFZgvpCKNdkaDBZkRNjdAcdEkFtWcfTXn7igc3k9YV
	AChA==
Received: by 10.204.10.92 with SMTP id o28mr5159157bko.39.1343726176795;
	Tue, 31 Jul 2012 02:16:16 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id 14sm4887550bkq.12.2012.07.31.02.16.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 02:16:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:15:40 +0200
Message-Id: <1343726140-27289-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-gnome] gedit: unbreak build by adding pythonnative to inherit
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
X-List-Received-Date: Tue, 31 Jul 2012 09:27:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was '/home/andreas/tmp/oe-core-eglibc/work/armv7a-vfp-neon-angstrom-linux-gnueabi/gedit-2.30.4-r0/gedit-2.30.4'
ERROR: Function failed: do_qa_configure

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 92c6749..24ce245 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -1,12 +1,13 @@
 DESCRIPTION = "GNOME editor"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
+PR = "r1"
 
 DEPENDS = "gvfs enchant gconf gnome-doc-utils gnome-doc-utils-native glib-2.0 gtk+ gtksourceview2 iso-codes"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit gnome gettext
+inherit gnome gettext pythonnative
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
 
-- 
1.7.6.5



