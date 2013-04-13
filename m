Received: from mail-gg0-f180.google.com ([209.85.161.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UR4IZ-0007ZP-JU
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 19:31:39 +0200
Received: by mail-gg0-f180.google.com with SMTP id e5so571289ggk.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 10:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=fSqVoouZnsMojgMzaPIHlmV6GjUw7VX6f+0bmjek0XU=;
	b=X1ydiDFULCmbDtOMhA4B7X1ohQEVwq8uLuolLF30Pu6zqRUXtHB7prbKTnriuxiXD/
	b8UlY/17TZPJEwwaOs9OMnUX/7ou8mWocj82faZ2W0ahVQAxgLitqmDTd2XZYuNJBD9i
	n7Q43Kmvoe4yMyvTA0DzvMDPLlP+lbJv48lzk21+dmdjz6FKTanR41j1rsKE+h4C3l7v
	ntw/3hvWu1y1Yadr/mb8EVyjurQHPAdixz7czoqPrEmzcJ1PvQx5OYkgLu0IK7+RrGlz
	mdoZ00WTWeF6mRyhYJsbEKOSkZtbMG3EFgOgW78701LdhWx9YXl9c8dfH88gBbUN1tjc
	Bcyw==
X-Received: by 10.236.231.71 with SMTP id k67mr9400735yhq.81.1365873249003;
	Sat, 13 Apr 2013 10:14:09 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x33sm18486758yhn.18.2013.04.13.10.14.07
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 10:14:08 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 13 Apr 2013 14:13:48 -0300
Message-Id: <1365873228-29369-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-xfce PATCH] xfce4-session: Add x-session-manager alternative
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
X-List-Received-Date: Sat, 13 Apr 2013 17:31:49 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 6ad834d..d00e466 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -4,9 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
-PR = "r2"
+PR = "r3"
 
-inherit xfce
+inherit xfce update-alternatives
 
 SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
 SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a72c46ce"
@@ -15,6 +15,9 @@ SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch
             file://0003-configure.in-hard-code-path-to-iceauth.patch \
 "
 
+ALTERNATIVE_${PN} = "x-session-manager"
+ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
+
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
     echo 127.0.0.1    ${MACHINE} >> /etc/hosts
-- 
1.8.1



