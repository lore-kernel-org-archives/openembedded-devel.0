Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UbdTd-0008OW-Bk
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 May 2013 23:06:47 +0200
Received: by mail-ee0-f42.google.com with SMTP id c50so176763eek.15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 May 2013 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=vXatZEP7jzgzDA0QjlRfbmei5WHW0DOD5pBOCplorb8=;
	b=cOXGgAUEx75yEP94rwhL7+KlN2wDG3CvHOMgRWrwGoTay2tpVUpe09IgR5cpj/KzqM
	kM8Kmw8vhlZ6zCj5PENZc+ziKY28pfSqVoqsPqV8oSmaFnJZIUIVeaoRUwa4DbisahTC
	nz9f7Sgy9kNwCIgDcpOU5GRAojSij8hrk33csb7pWrdjPwpSZSOW66HP935hcpq6lg1q
	2TZDHHEvbjXiVwbbcFeia+Y3F0EYoQk0FiWPw50cESoNWYCe+UPC7Fg/RDenyhKpZ62Y
	Zfy3r0KdBs2jT2QDZN2rWYgs1Ge05cMIWo9nsbtVJMagh9IBN3bZzDVpIoLk72/5k4W7
	va0A==
X-Received: by 10.14.111.5 with SMTP id v5mr70904827eeg.27.1368391712796;
	Sun, 12 May 2013 13:48:32 -0700 (PDT)
Received: from localhost.localdomain (p4FDF06B8.dip0.t-ipconnect.de.
	[79.223.6.184]) by mx.google.com with ESMTPSA id
	w52sm18480626eev.12.2013.05.12.13.48.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 12 May 2013 13:48:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 May 2013 22:48:16 +0200
Message-Id: <1368391699-1402-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368391699-1402-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-network/meta-gnome 1/4] gnome-terminal: add gnome-common-schemas to RRECOMMENDS
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
X-List-Received-Date: Sun, 12 May 2013 21:07:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

without libgnome gnome-terminal crashes for missing font assertion:
| ERROR:terminal-app.c:1451:terminal_app_init: assertion failed: (app->system_font_desc != NULL)

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index 1afd334..0f44900 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -2,6 +2,7 @@ DESCRIPTION = "GNOME Terminal"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
 DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte gnome-doc-utils"
+PR = "r1"
 
 inherit gnome
 
@@ -13,3 +14,5 @@ EXTRA_OECONF += "--disable-scrollkeeper"
 
 SRC_URI[archive.md5sum] = "74c4528f00067072c2bd867d1f8fe844"
 SRC_URI[archive.sha256sum] = "2c7af2250698b9f9f53c6eaa93211c1118cf2c7e29cbbacfd1e8a6a10069e07a"
+
+RRECOMMENDS_${PN} += "gnome-common-schemas"
-- 
1.7.4.4



