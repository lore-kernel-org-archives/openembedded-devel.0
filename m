Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Q23HY-00033L-1F
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:14:04 +0100
Received: by yia13 with SMTP id 13so2904437yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=TpQXWbnNtdRtuBe0IcXgASbHfcMLY2RvxccOvv3WgvM=;
	b=dDniEaU+trJic++6MLVsfpGX+FJLMpW13rkH9yccIDjFkROZ6Y/reJxfRiRNqeeg5b
	xjdcQhaMZfNySXpmIrArgRytYUcqEL56+5bWDJAUczfwJ2i1AKLvX9eI+qUWx/TETFBy
	58T265TyeSy01BmFZefKtoKyYRCbayqZDPc/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=ETv03EZj0U9zmjY3Asg5rUMXyAJxTgVv2rKuO6wsSFonhB3Vin+i/PUtLicfvnUJgv
	LRWnuTuuRak+c/D6Roaph2JZmTXRAMV+C2BEXPe7OVW9QSj+iz1LtiWJE9euyR/cS92A
	L7Lm8SoNvfZAg6q8bTqpStnDA9Ge3YBTigOWE=
Received: by 10.151.137.1 with SMTP id p1mr5321172ybn.73.1300806733404;
	Tue, 22 Mar 2011 08:12:13 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id o2sm1732487ybn.21.2011.03.22.08.12.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 08:12:12 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Mar 2011 15:11:22 +0000
Message-Id: <1300806683-17244-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
References: <1300806683-17244-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/4] vlc: use INC_PR
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
X-List-Received-Date: Tue, 22 Mar 2011 15:14:04 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/vlc/vlc.inc        |    2 ++
 recipes/vlc/vlc_0.9.2.bb   |    2 +-
 recipes/vlc/vlc_0.9.6.bb   |    2 +-
 recipes/vlc/vlc_0.9.8a.bb  |    2 +-
 recipes/vlc/vlc_1.0.6.bb   |    2 +-
 recipes/vlc/vlc_1.1.4.1.bb |    2 ++
 6 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/recipes/vlc/vlc.inc b/recipes/vlc/vlc.inc
index 6129cac..0435e87 100644
--- a/recipes/vlc/vlc.inc
+++ b/recipes/vlc/vlc.inc
@@ -7,6 +7,8 @@ SECTION = "multimedia"
 DEPENDS = "libfribidi libtool hal gettext libgcrypt schroedinger virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
+INC_PR = "r4"
+
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
 
 inherit autotools
diff --git a/recipes/vlc/vlc_0.9.2.bb b/recipes/vlc/vlc_0.9.2.bb
index 7dd6a75..bc24a75 100644
--- a/recipes/vlc/vlc_0.9.2.bb
+++ b/recipes/vlc/vlc_0.9.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 PRIORITY = "optional"
 SECTION = "multimedia"
 
-PR = "r2"
+PR = "${INC_PR}.0"
 
 DEPENDS = "libtool hal gettext libgcrypt schroedinger virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
diff --git a/recipes/vlc/vlc_0.9.6.bb b/recipes/vlc/vlc_0.9.6.bb
index f34ff6a..4b5cc20 100644
--- a/recipes/vlc/vlc_0.9.6.bb
+++ b/recipes/vlc/vlc_0.9.6.bb
@@ -1,5 +1,5 @@
 require vlc.inc
-PR = "r1"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "cd71276ed867029a6d077a40bccd4d05"
 SRC_URI[sha256sum] = "ac091ba9b2e2e9aff293969b3405b145c09789e59ac0caab2247211a19e09a8a"
diff --git a/recipes/vlc/vlc_0.9.8a.bb b/recipes/vlc/vlc_0.9.8a.bb
index dd131b2..b846466 100644
--- a/recipes/vlc/vlc_0.9.8a.bb
+++ b/recipes/vlc/vlc_0.9.8a.bb
@@ -5,7 +5,7 @@
 
 require vlc.inc
 
-PR = "r3"
+PR = "${INC_PR}.0"
 
 # ffmpeg from git (library version => 52) is required
 # libtool-native must be >= 2.2.4
diff --git a/recipes/vlc/vlc_1.0.6.bb b/recipes/vlc/vlc_1.0.6.bb
index 12da530..4f98cfc 100644
--- a/recipes/vlc/vlc_1.0.6.bb
+++ b/recipes/vlc/vlc_1.0.6.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "f521933e7a1021746d8ecde6caa2f9d1b43187ab2e13df6abc07540e41
 # ffmpeg from git (library version => 52) is required
 # libtool-native must be >= 2.2.4
 DEPENDS += "libdvdcss libdvdread"
-PR = "r1"
+PR = "${INC_PR}.0"
 
 EXTRA_OECONF += "\
 	--enable-dvdread \
diff --git a/recipes/vlc/vlc_1.1.4.1.bb b/recipes/vlc/vlc_1.1.4.1.bb
index df8f17c..6d4b877 100644
--- a/recipes/vlc/vlc_1.1.4.1.bb
+++ b/recipes/vlc/vlc_1.1.4.1.bb
@@ -5,6 +5,8 @@
 
 require vlc.inc
 
+PR = "${INC_PR}.0"
+
 SRC_URI[md5sum] = "ce17c335b38b322949694313173fcd49"
 SRC_URI[sha256sum] = "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696d7c2aa"
 
-- 
1.7.2.3



