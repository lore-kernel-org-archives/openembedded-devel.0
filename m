Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LRM8z-0008VC-TF
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 08:44:30 +0100
Received: by wa-out-1112.google.com with SMTP id n7so449592wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2009 23:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:date:subject
	:message-id:to;
	bh=j6IMMPJePidB9XvcPQvuekH0Q5XFnM/5CSb3wsF3D4w=;
	b=N6V0b08r0ctgD/KsydPZtxqg3HZ6FR5GBmO3BBlHCi0gR7J2G8WySxPKnNt9lOqWuB
	p5Xc434iEjw+u2WpoFXVtSKUlrSblaEbB3pTA+MGximren2CHpm9FoLdQipt5IW/cTbz
	Z84OsIs0D5mvS5XbU6d302Vw8E3JVTZscKl9s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:date:subject:message-id:to;
	b=NrnP/L5E7Y7oKxU5GVHcwJMiEP+GkPQxxmy+EQ68ltx3t55bVJaBglD/tl3iXUiNqL
	h4G/o3TtJ6TlbA9OIMinjzNsBqxItReyGBkxo8rXKluUxO6OlmdiCJdc8n7R4F++x/k+
	/EP3BwgIzGuFmjKzrhhslFpFO8ZV0QwDPDjXc=
Received: by 10.115.32.18 with SMTP id k18mr2142774waj.98.1232955422547;
	Sun, 25 Jan 2009 23:37:02 -0800 (PST)
Received: from isis.sakrah.homelinux.org
	(adsl-71-146-21-217.dsl.pltn13.sbcglobal.net [71.146.21.217])
	by mx.google.com with ESMTPS id t1sm17956255poh.7.2009.01.25.23.37.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jan 2009 23:37:02 -0800 (PST)
Received: by isis.sakrah.homelinux.org (Postfix, from userid 1000)
	id D4E2E3C54D4; Sun, 25 Jan 2009 23:37:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Jan 2009 23:13:20 -0800
Message-Id: <20090126073700.D4E2E3C54D4@isis.sakrah.homelinux.org>
To: undisclosed-recipients:;
X-Mailman-Approved-At: Tue, 27 Jan 2009 23:05:04 +0100
Subject: [PATCH] alsa-utils: Do not make strl* functions as static.
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
X-List-Received-Date: Mon, 26 Jan 2009 07:44:30 -0000

	* These funtions are provided by C libraries like uclibc
	Declaring them static here causes static not static declaration
	issues reported by gcc.
---
 packages/alsa/alsa-utils_1.0.18.bb                 |    2 +
 .../files/alsa-utils-strl-funcs-non-static.patch   |   22 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 packages/alsa/files/alsa-utils-strl-funcs-non-static.patch

diff --git a/packages/alsa/alsa-utils_1.0.18.bb b/packages/alsa/alsa-utils_1.0.18.bb
index 8f43982..4de9180 100644
--- a/packages/alsa/alsa-utils_1.0.18.bb
+++ b/packages/alsa/alsa-utils_1.0.18.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "alsa-lib ncurses"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://alsa-utils-automake.patch;patch=1 \
 	   file://alsa-utils-remove-xmlto.patch;patch=1 \
+	   file://alsa-utils-strl-funcs-non-static.patch;patch=1 \
 	  "
 
 inherit autotools
diff --git a/packages/alsa/files/alsa-utils-strl-funcs-non-static.patch b/packages/alsa/files/alsa-utils-strl-funcs-non-static.patch
new file mode 100644
index 0000000..db6bacf
--- /dev/null
+++ b/packages/alsa/files/alsa-utils-strl-funcs-non-static.patch
@@ -0,0 +1,22 @@
+Index: alsa-utils-1.0.18/alsactl/init_sysdeps.c
+===================================================================
+--- alsa-utils-1.0.18.orig/alsactl/init_sysdeps.c	2009-01-25 21:12:40.000000000 -0800
++++ alsa-utils-1.0.18/alsactl/init_sysdeps.c	2009-01-25 21:12:56.000000000 -0800
+@@ -18,7 +18,7 @@
+  */
+ 
+ #ifdef __GLIBC__
+-static size_t strlcpy(char *dst, const char *src, size_t size)
++size_t strlcpy(char *dst, const char *src, size_t size)
+ {
+ 	size_t bytes = 0;
+ 	char *q = dst;
+@@ -37,7 +37,7 @@
+ 	return bytes;
+ }
+ 
+-static size_t strlcat(char *dst, const char *src, size_t size)
++size_t strlcat(char *dst, const char *src, size_t size)
+ {
+ 	size_t bytes = 0;
+ 	char *q = dst;
-- 
1.6.0.4



