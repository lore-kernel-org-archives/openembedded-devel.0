Received: from mail-ee0-f44.google.com ([74.125.83.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Tyi37-00035a-H6
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 13:06:30 +0100
Received: by mail-ee0-f44.google.com with SMTP id l10so149564eei.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 03:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=55mg3FEns+WahbYVBDgUvfDyMEVq5smzZovd2OjxRi4=;
	b=RSlT6BCM0JYnF/8OXdlN7kCxEkXGn5ic1piA5bbcq1eCbPajgYpKr2NOGpPrAL4Z4b
	l0QzM+8KUdXrVactcKgK1GYVOZhFYlfq4f/fe9sttZPVWrQ3Bog7V7uXgYi+Id+6i52N
	7+k/VgX/oQzvaehXRP9XL10Af+hu/ANpKakH91czbwhsAIkHlKR5Z/1RxlicQ0NW8SHt
	aO+oK8TimG7bCsajlqm+Qu5D3s/NqeEsnB1NyUfGa/omDVJE3CAew0I1DxY0L3tGN3iy
	SAUnA+RtdxnSKk6UnP6Wwvauf0yee+vpG0riLcJ2ENIXeHZdNZ2KGeHAdIxeDva9mmdo
	SGUg==
X-Received: by 10.14.2.5 with SMTP id 5mr17192631eee.30.1359114651695;
	Fri, 25 Jan 2013 03:50:51 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id f6sm1244955eeo.7.2013.01.25.03.50.50
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 03:50:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jan 2013 12:48:56 +0100
Message-Id: <1359114536-3823-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
References: <1359114536-3823-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-systemd 5/5] lxdm: disable screensaver by default when starting X
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
X-List-Received-Date: Fri, 25 Jan 2013 12:06:48 -0000
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
1.7.6.5



