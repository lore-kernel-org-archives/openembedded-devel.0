Received: from [209.85.221.124] (helo=mail-qy0-f124.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwneJ-0001Mq-Bf
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 03:22:47 +0200
Received: by qyk30 with SMTP id 30so632189qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=g8xoZhgyq9tDQfJ/AvMGZgn8gFXxQODXKs2RNXK/ieo=;
	b=bJR8hSXEdqqHHaV9p0hXcketAQ288Sg+g1pJoeLsd49NEqYMCH2P0hMQkjDxJ5lb42
	h9UKzuh5nuH+EKIAzTPF0ishGwecpDYw4H11QlSc5JV0zHUQZJUimDeP6hhB2/YHEgmo
	Uqq73AcglCsVp1mtAVeHwxm0z4L0CGWSy6esY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=HLi/gyw1chVhjKOoJQeNNiJIMmzUSj5AzSAWWY45yUajY+mFMjq8pzkOgsysxDX+1f
	E2YKJgTLO2tl8yYffOW8G9ByuPCUqYLteF3JtDJVgpOWnIVnjM3AtLRoCIsz0GAIbmsN
	yn3+4jark56EihvUnbarJ1JFSPd0ETnQR1zpo=
Received: by 10.220.98.197 with SMTP id r5mr846786vcn.69.1240449490848;
	Wed, 22 Apr 2009 18:18:10 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 7sm1715545ywo.17.2009.04.22.18.18.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 22 Apr 2009 18:18:07 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 67BBE61003E; Wed, 22 Apr 2009 22:17:54 -0300 (BRT)
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Apr 2009 22:17:37 -0300
Message-Id: <1240449461-26116-3-git-send-email-otavio@debian.org>
X-Mailer: git-send-email 1.6.2.1.303.g63699
In-Reply-To: <1240449461-26116-2-git-send-email-otavio@debian.org>
References: <1240449461-26116-1-git-send-email-otavio@debian.org>
	<1240449461-26116-2-git-send-email-otavio@debian.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/6] gtk-engines: add 2.18.1
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
X-List-Received-Date: Thu, 23 Apr 2009 01:22:48 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 conf/checksums.ini                        |    4 +++
 recipes/gtk-engines/gtk-engines_2.18.1.bb |   30 +++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gtk-engines/gtk-engines_2.18.1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 69b45fe..27b7eb6 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -9738,6 +9738,10 @@ sha256=15aa3a926307b4b3e40f3a9b05c604df6811eb48814b1534db32aed414aefb0c
 md5=060ea25c471e5f4cf5c1baeac27d0345
 sha256=0d8b6630c546327ddc67c700859731036eebdf77e51ad8b71e4d19d28ca2ff2c
 
+[http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.18/gtk-engines-2.18.1.tar.bz2]
+md5=5dc748cfb0587bb412adc49b666fb6f8
+sha256=d7e2672fcf80f5c35d481c24e0ab5b7d0f6526dcc3d8821ab76468c1816dc3bc
+
 [http://ftp.gnome.org/pub/GNOME/sources/gtk-engines/2.2/gtk-engines-2.2.0.tar.bz2]
 md5=78e9276c28b509f3203de4873c20a263
 sha256=140541cae8b003d2f7210e2ef060ac328d7e45a04e2cf5fa943fff73c9955dd6
diff --git a/recipes/gtk-engines/gtk-engines_2.18.1.bb b/recipes/gtk-engines/gtk-engines_2.18.1.bb
new file mode 100644
index 0000000..177c5b8
--- /dev/null
+++ b/recipes/gtk-engines/gtk-engines_2.18.1.bb
@@ -0,0 +1,30 @@
+LICENSE = "GPL"
+SECTION = "x11/base"
+DESCRIPTION = "GTK theme engines"
+DEPENDS = "gtk+ cairo"
+
+RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
+RDEPENDS_gtk-theme-metal = "gtk-engine-metal"
+RDEPENDS_gtk-theme-mist = "gtk-engine-mist"
+RDEPENDS_gtk-theme-crux = "gtk-engine-crux-engine"
+RDEPENDS_gtk-theme-lighthouseblue = "gtk-engine-lighthouseblue"
+RDEPENDS_gtk-theme-thinice = "gtk-engine-thinice"
+RDEPENDS_gtk-theme-industrial = "gtk-engine-industrial"
+RDEPENDS_gtk-theme-clearlooks = "gtk-engine-clearlooks"
+
+inherit gnome  gtk-binver
+
+PACKAGES_DYNAMIC = "gtk-engine-* gtk-theme-*"
+
+python populate_packages_prepend() {
+	import os.path
+
+	engines_ver = ['gtk-2.0/', gtkbinver_find(d), '/engines']
+
+	engines_root = os.path.join(bb.data.getVar('libdir', d, 1), ''.join(engines_ver))
+	themes_root = os.path.join(bb.data.getVar('datadir', d, 1), "themes")
+
+	do_split_packages(d, engines_root, '^lib(.*)\.so$', 'gtk-engine-%s', 'GTK %s theme engine', extra_depends='')
+	do_split_packages(d, themes_root, '(.*)', 'gtk-theme-%s', 'GTK theme %s', allow_dirs=True, extra_depends='')
+}
+
-- 
1.6.2.1.303.g63699



