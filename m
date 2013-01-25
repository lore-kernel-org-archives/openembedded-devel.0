Received: from mail-ea0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyryS-0007dr-Ky
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 23:42:16 +0100
Received: by mail-ea0-f173.google.com with SMTP id i1so363021eaa.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 14:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=TES8RpWrN11GYT7RVvcnqSgvEdhmw9wWs0z01R1uAtw=;
	b=S0WfP46El+HIG9f6kJeZwfcFJJ6iZw6DTkXx0ttIl2xO0Aqwi+VMLhgEW0uEZH0INp
	pSDlcHVrFsnTetRwUF2C45sbwGfmDEjD0Vlb61FmyMbMs6DiCcbU6VsONADRTps6RCVO
	zWdBFCXqz4jynj+j5A6rL+fstmw6Iv+gsXZnkkNpuKumlEuCejWdqk/TWYai3Sd8xi/f
	ZnGFnezevhNobTQ/TsOz8bJrwZfdrFTstQGCcTz1hyCAXY6C1u5OXezR/+QuWu2sRjar
	0g7L4nSLvfYkkFrbB59Nr6oROjyvqwVCLjdL+nsMLJJiV0cgOa6D9+HSA64kEiri5j/6
	+NYA==
X-Received: by 10.14.184.134 with SMTP id s6mr22393641eem.43.1359152802185;
	Fri, 25 Jan 2013 14:26:42 -0800 (PST)
Received: from localhost.localdomain (p5B0A1952.dip.t-dialin.net.
	[91.10.25.82])
	by mx.google.com with ESMTPS id k4sm3566723eep.15.2013.01.25.14.26.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 14:26:41 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 23:26:22 +0100
Message-Id: <1359152782-23743-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359152782-23743-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd/V2 5/5] lxdm: disable screensaver by default when starting X
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
X-List-Received-Date: Fri, 25 Jan 2013 22:42:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/lxdm/lxdm_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
index 3308e26..be83146 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
@@ -15,7 +15,7 @@ LXDM_PAM = "${@base_contains("DISTRO_TYPE", "debug", "lxdm-pam-debug", "lxdm-pam
 SRCREV = "65e7cc8fdc150c2b925eb348ce82de17dee5eb0b"
 PV = "0.4.2+git${SRCPV}"
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "cairo consolekit dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango"
 
@@ -30,9 +30,10 @@ SYSTEMD_UNITDIR ??= "no"
 EXTRA_OECONF = "--with-systemdsystemunitdir=${SYSTEMD_UNITDIR}"
 
 do_compile_append() {
-	# default background configured not available / no password field available
+	# default background configured not available / no password field available / no default screensaver
 	sed -i 	-e 's,bg=,# bg=,g' \
 		-e 's,# skip_password=,skip_password=,g' \
+		-e 's,# arg=.*,arg=${bindir}/X -s 0,g' \
 		${S}/data/lxdm.conf.in
 	# add default configuration
 	oe_runmake -C ${S}/data lxdm.conf
-- 
1.7.4.4



