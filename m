Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LRMLT-0000Hm-AA
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jan 2009 08:57:23 +0100
Received: by wa-out-1112.google.com with SMTP id n7so450925wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2009 23:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=IBuSku4J/FDwBCunXwqYAawmz0R3gkj0sXbZGKGSqN0=;
	b=MAjcokK1/tam6FlrmbtuIQwDXNKxro5EgspPCmIa4LZKQuCk3GA1bIeevo645wEQMF
	SvgdcfxQKTaSXf+9HKlO7oATfWflvupyek8aYzqYR0vb1L+MAe9bAyRI6hwKMZo0v+HT
	SaCL5PIB1ok2SzhhvVuMuSvYJUYtnKqLtHFS0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=bBmZASrIWdxe/P93l8KbnoI7+p6m6jsZpT+cG3j2HuXXVR14mFMPjgWRYmRxyYjzN4
	11QDwJQ5Guo230X00ujwa8rrIhG27EQyqeWraD/FzItD4UPuabH+De84NKF41ODDOAiz
	3cb1t245A2fr4rxPaMspdeiKLaDC7IuIsZgiY=
Received: by 10.114.80.1 with SMTP id d1mr5368835wab.168.1232956195935;
	Sun, 25 Jan 2009 23:49:55 -0800 (PST)
Received: from isis.sakrah.homelinux.org
	(adsl-71-146-21-217.dsl.pltn13.sbcglobal.net [71.146.21.217])
	by mx.google.com with ESMTPS id m28sm26240124poh.25.2009.01.25.23.49.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 25 Jan 2009 23:49:55 -0800 (PST)
Received: by isis.sakrah.homelinux.org (Postfix, from userid 1000)
	id 1DC0A3C54D4; Sun, 25 Jan 2009 23:49:53 -0800 (PST)
Date: Sun, 25 Jan 2009 23:49:53 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090126074953.GA26318@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: fix for strl functions in alsautils
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
X-List-Received-Date: Mon, 26 Jan 2009 07:57:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


        * These funtions are provided by C libraries like uclibc
        Declaring them static here causes static not static declaration
        issues reported by gcc.
---
 packages/alsa/alsa-utils_1.0.18.bb                 |    2 +
 .../files/alsa-utils-strl-funcs-non-static.patch   |   22
++++++++++++++++++++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644
packages/alsa/files/alsa-utils-strl-funcs-non-static.patch

diff --git a/packages/alsa/alsa-utils_1.0.18.bb
b/packages/alsa/alsa-utils_1.0.18.bb
index 8f43982..4de9180 100644
--- a/packages/alsa/alsa-utils_1.0.18.bb
+++ b/packages/alsa/alsa-utils_1.0.18.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "http://www.alsa-project.org"
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "alsa-lib ncurses"
+PR = "r1"

 SRC_URI =
"ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://alsa-utils-automake.patch;patch=1 \
           file://alsa-utils-remove-xmlto.patch;patch=1 \
+          file://alsa-utils-strl-funcs-non-static.patch;patch=1 \
          "

 inherit autotools
diff --git a/packages/alsa/files/alsa-utils-strl-funcs-non-static.patch
b/packages/alsa/files/alsa-utils-strl-funcs-non-static.patch
new file mode 100644
index 0000000..db6bacf
--- /dev/null
+++ b/packages/alsa/files/alsa-utils-strl-funcs-non-static.patch
@@ -0,0 +1,22 @@
+Index: alsa-utils-1.0.18/alsactl/init_sysdeps.c
+===================================================================
+--- alsa-utils-1.0.18.orig/alsactl/init_sysdeps.c      2009-01-25
21:12:40.000000000 -0800
++++ alsa-utils-1.0.18/alsactl/init_sysdeps.c   2009-01-25
21:12:56.000000000 -0800
+@@ -18,7 +18,7 @@
+  */
+
+ #ifdef __GLIBC__
+-static size_t strlcpy(char *dst, const char *src, size_t size)
++size_t strlcpy(char *dst, const char *src, size_t size)
+ {
+       size_t bytes = 0;
+       char *q = dst;
+@@ -37,7 +37,7 @@
+       return bytes;
+ }
+
+-static size_t strlcat(char *dst, const char *src, size_t size)
++size_t strlcat(char *dst, const char *src, size_t size)
+ {
+       size_t bytes = 0;
+       char *q = dst;
--
1.6.0.4



