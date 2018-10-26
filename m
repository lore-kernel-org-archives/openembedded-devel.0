Return-Path: <max+openembedded@blarg.de>
Received: from swift.blarg.de (swift.blarg.de [78.47.110.205])
	by mail.openembedded.org (Postfix) with ESMTP id DB83779C23
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 16:34:52 +0000 (UTC)
Received: from heron.blarg.de
	(p200300DC6F1FD200529A4CFFFE3DD983.dip0.t-ipconnect.de
	[IPv6:2003:dc:6f1f:d200:529a:4cff:fe3d:d983])
	(Authenticated sender: max)
	by swift.blarg.de (Postfix) with ESMTPSA id AA0A922084F;
	Fri, 26 Oct 2018 18:34:53 +0200 (CEST)
From: Max Kellermann <max+openembedded@blarg.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Oct 2018 18:34:50 +0200
Message-Id: <20181026163451.447-2-max+openembedded@blarg.de>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181026163451.447-1-max+openembedded@blarg.de>
References: <20181026163451.447-1-max+openembedded@blarg.de>
MIME-Version: 1.0
Cc: Max Kellermann <max.kellermann@gmail.com>
Subject: [PATCH v2 2/3] mpd: remove deprecated "enable_bzip2=yes" line
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 16:34:53 -0000
Content-Transfer-Encoding: 8bit

From: Max Kellermann <max.kellermann@gmail.com>

This should have been removed in commit
5a06148e58ca5a7558dd4b438a61d22caa8dfffe

Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
index 3c92f8d03..92514d87d 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.22.bb
@@ -23,7 +23,6 @@ SRC_URI = " \
 SRCREV = "9274bc15bc41bbe490fde847f8422468cc20375d"
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
 PACKAGECONFIG ??= "alsa ao bzip2 daemon ffmpeg fifo flac fluidsynth iso9660 jack libsamplerate libwrap httpd mms mpg123 modplug sndfile upnp openal opus oss recorder vorbis wavpack zlib"
-- 
2.19.1


