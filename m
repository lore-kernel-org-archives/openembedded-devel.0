Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQJgQ-0006NB-6W
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 14:03:46 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 1030A314B856
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id CnVqO58-8hmc
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:12 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 90D58314B02B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 14:02:08 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Wed, 08 Dec 2010 13:02:08 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Dec 2010 13:02:00 +0000
Message-Id: <1291813320-24770-8-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291813320-24770-1-git-send-email-obi@opendreambox.org>
References: <1291813320-24770-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 8/8] vlc: depend on virtual/libsdl instead of libsdl-x11
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
X-List-Received-Date: Wed, 08 Dec 2010 13:03:47 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/vlc/vlc.inc      |    2 +-
 recipes/vlc/vlc_0.9.2.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/vlc/vlc.inc b/recipes/vlc/vlc.inc
index 943e6e5..6129cac 100644
--- a/recipes/vlc/vlc.inc
+++ b/recipes/vlc/vlc.inc
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 PRIORITY = "optional"
 SECTION = "multimedia"
 
-DEPENDS = "libfribidi libtool hal gettext libgcrypt schroedinger libsdl-x11 qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
+DEPENDS = "libfribidi libtool hal gettext libgcrypt schroedinger virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
diff --git a/recipes/vlc/vlc_0.9.2.bb b/recipes/vlc/vlc_0.9.2.bb
index 97dd079..7dd6a75 100644
--- a/recipes/vlc/vlc_0.9.2.bb
+++ b/recipes/vlc/vlc_0.9.2.bb
@@ -6,7 +6,7 @@ SECTION = "multimedia"
 
 PR = "r2"
 
-DEPENDS = "libtool hal gettext libgcrypt schroedinger libsdl-x11 qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
+DEPENDS = "libtool hal gettext libgcrypt schroedinger virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
 
 SRC_URI = "http://videolan.mirror.technotop.nl/vlc/0.9.2/vlc-${PV}.tar.bz2"
-- 
1.7.2.3



