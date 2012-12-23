Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRI-0004ca-KR
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so2504732eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=sJ0oKxr/XFqJHIVzNiNvyn9aG4yAeE/w+6wZPY7Uxwk=;
	b=eOtCgTrF8lI3EHijvLukfmJFfolkGTon4vDYLaB6q9iV8zNI4cIRCs4/SH3kdw1eLv
	RPBPLIvnCdgF36KU5AUQsMs/57r5QVqt+TRbybgJJ2xpVND+gX3KGPnlnWbqlCfEtly1
	DlvBPaR3NmEgxFhlC0C28IOvuIVrYeu58gYkmIuoRJELqFOjMmnn/7rz+07kScMb5p6J
	zok3BgRDI/BPvdyMVaB8eOFu49LQ/TPJCHZAQVNP1UI0rvDugTM9NtSkVk+HjM0psIew
	laraBwdciPj1cNR3QsIa1mQLdIbNST41h6zoBw18qfqidd+B6BWbSoTDs1wf+DitygXU
	iQXw==
X-Received: by 10.14.221.65 with SMTP id q41mr47948152eep.30.1356267792323;
	Sun, 23 Dec 2012 05:03:12 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:10 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:39 +0100
Message-Id: <1356267761-15152-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 10/12] lxdm: disable keyboard selection
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Keyboard selection with lxdm is not very helpful:

* new keyboard connected get US layout independent of selection
* the selection is not persistent and has to be made on every login

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index f3d4eff..3308e26 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -15,7 +15,7 @@ LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam
 SRCREV = "65e7cc8fdc150c2b925eb348ce82de17dee5eb0b"
 PV = "0.4.2+git${SRCPV}"
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
 
@@ -33,7 +33,6 @@ do_compile_append() {
 	# default background configured not available / no password field available
 	sed -i 	-e 's,bg=,# bg=,g' \
 		-e 's,# skip_password=,skip_password=,g' \
-		-e 's,keyboard=0,keyboard=1,g' \
 		${S}/data/lxdm.conf.in
 	# add default configuration
 	oe_runmake -C ${S}/data lxdm.conf
-- 
1.7.4.4



