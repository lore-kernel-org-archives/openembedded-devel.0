Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrL-0006qI-G8
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:27 +0200
Received: by mail-yx0-f175.google.com with SMTP id m2so13821yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pFC8dbW8a8HPsGe4vp7AnaabKc/2/gJ4APrRJ/aYJhI=;
	b=pPkuEycr96CeDS7Zio0C8YA4H15FHu2OBVyQurrO97O335hAG0K+pi/XVRx9xI19EG
	v7atij6T1Jcqr5OmQaOz4MzSkrvzi6uo34wWJTzMyl8uyke8S7l4i/RJ/5SENS3YlH1G
	Ncn/L8Zah+Xb2zlrGks8J/7yTyQjiufqC2HFiOWzPCjuUspK75Uzu3rlYBBvB3Nbz9pw
	QekCaLXCArNJTJKYmkzvwRn+1T/PXTDjbFZo1/osNdYRsHURfhLrGT+YIMKamsB0tbBc
	hQmOJoJr0TCF6TQRwsASQaf23evFlHCfOvFCIbg0ifdEYHWhWhIph0pNKwLgHngp2fEb
	YZHQ==
Received: by 10.236.154.165 with SMTP id h25mr3918794yhk.38.1349323406800;
	Wed, 03 Oct 2012 21:03:26 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:04 -0300
Message-Id: <1349323389-16520-5-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
References: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/9] mpd: bump PR due libav update
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
index b3b82c4..2b7e555 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
@@ -6,6 +6,8 @@ HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio \
            ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad lame libid3tag', d)}"
 
+PR = "r1"
+
 SRC_URI = " \
     ${SOURCEFORGE_MIRROR}/musicpd/${PN}/${PV}/${PN}-${PV}.tar.bz2 \
     file://mpd.conf.in \
-- 
1.7.2.5



