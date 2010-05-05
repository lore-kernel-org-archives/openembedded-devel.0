Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1O9YFk-0000Nx-PK
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 08:38:56 +0200
Received: by pwj5 with SMTP id 5so2109565pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NKbV+kgBtjOmIhGazCf56aIDUtSeoOQAl2Y1p4QOhXs=;
	b=oomslNdWypmiCitfz1FvG3wDFwab2Mhslyx3ZVCTkhZHbOwxmt9StJ8IWzbZqHmUyB
	UqCUuNrdCaAf4jT/BisAIn2UK9EWDnYajWPf/rFhmB4PgXP5dpZah7Dpij6FOeLz0pzZ
	ohKXvhw2o0m1nPa2dCo5Xwb63RnVboi8MVlVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=FYVbCV1yYvw571lKd7HN2Z6ydXHRb8Rv6MtfXhlGIQdjsNqSB7Gyzf3aJHgGs5y2gJ
	DjLAEd+dWq8qFgEWl4rVXijfSRHWH6WzqumpDOIbOHykcIw/noMjPewXAJkkuMmd58Q7
	+0CTSvERySQlmxBShbn2A/Cu06d6HcwGH03kg=
Received: by 10.114.248.20 with SMTP id v20mr4940623wah.65.1273041292510;
	Tue, 04 May 2010 23:34:52 -0700 (PDT)
Received: from localhost (adsl-75-3-207-17.dsl.sndg02.sbcglobal.net
	[75.3.207.17])
	by mx.google.com with ESMTPS id b6sm33019820wam.21.2010.05.04.23.34.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 May 2010 23:34:51 -0700 (PDT)
From: Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 May 2010 23:34:46 -0700
Message-Id: <1273041286-632-1-git-send-email-hvontres@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: hvontres@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 06:38:56 -0000

- added version 0.12.6 of libtorrent and 0.8.6 of rtorrent
- added FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"
These parameters were recommended at the rtorrent website (http://libtorrent.rakshasa.no/wiki/LibTorrentKnownIssues#NSLU2routersandxscalebaseddevices)

Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
---
 recipes/libtorrent/libtorrent_0.12.6.bb |   22 ++++++++++++++++++++++
 recipes/libtorrent/rtorrent_0.8.6.bb    |   17 +++++++++++++++++
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libtorrent/libtorrent_0.12.6.bb
 create mode 100644 recipes/libtorrent/rtorrent_0.8.6.bb

diff --git a/recipes/libtorrent/libtorrent_0.12.6.bb b/recipes/libtorrent/libtorrent_0.12.6.bb
new file mode 100644
index 0000000..075ce40
--- /dev/null
+++ b/recipes/libtorrent/libtorrent_0.12.6.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "library implementing the bittorrent protocol"
+HOMEPAGE = "http://libtorrent.rakshasa.no"
+SECTION = "libs/network"
+LICENSE = "GPL"
+DEPENDS = "libsigc++-2.0 openssl"
+
+SRC_URI = "http://libtorrent.rakshasa.no/downloads/libtorrent-${PV}.tar.gz"
+PR = "r0.1"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-aligned"
+
+FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"
+
+do_stage() {
+	autotools_stage_all
+}
+
+
+SRC_URI[md5sum] = "037499ed708aaf72988cee60e5a8d96b"
+SRC_URI[sha256sum] = "7b02f33164966a05261e83bad76eef537198fefe76eaf57dfd64bb27c7d77129"
diff --git a/recipes/libtorrent/rtorrent_0.8.6.bb b/recipes/libtorrent/rtorrent_0.8.6.bb
new file mode 100644
index 0000000..c765086
--- /dev/null
+++ b/recipes/libtorrent/rtorrent_0.8.6.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "Console bittorrent client using libtorrent"
+HOMEPAGE = "http://libtorrent.rakshasa.no"
+SECTION = "libs/network"
+LICENSE = "GPL"
+DEPENDS = "libtorrent curl ncurses gnutls libgpg-error"
+
+SRC_URI = "http://libtorrent.rakshasa.no/downloads/rtorrent-${PV}.tar.gz \
+           file://autoconf-cross-fix.patch;patch=1"
+
+PR = "r0"
+
+inherit autotools
+
+FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"
+
+SRC_URI[md5sum] = "b804c45c01c40312926bcea6b55bb084"
+SRC_URI[sha256sum] = "8c96c68e1524162abd1fc4b612d0c3d924fccc25159c0b3f208e69281f0b32db"
-- 
1.6.3.3



