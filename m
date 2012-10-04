Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJcrD-0006pJ-6T
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 06:16:19 +0200
Received: by mail-gg0-f175.google.com with SMTP id v1so13582ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 21:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=VcHCxu3YuWY9ykIa7zkQDwqRKRP4gcvqGMxW/rcy7Zc=;
	b=vA6SZeTSj4r0/BGEsu33fXopNnVxkwJFMAHNWaNAKYF0axbleuCOvFYzC8OWhraHG9
	lQyO/j0Wzot+L6DWFS9KKOsY+dMcwFmW8yvGbgHKPLB9VxOvoDGJqm9xKeAy3K6OFPU9
	SIJLWMZTVe5ADw8rZxg/cMh4ehJmMPwJmw7m6+p7dy1MGlJWCqrRZ3giVbfQIrhU+ORs
	erAfP2AC7xDyXkuzeWEHtdnUAD15WCLJu8aQVqD8MzClShktnGuXtk/wk05Nistyrhqq
	YDggnyUPdS5uDVRL3KixWr284qxKDE5J+39KofEG4kkctj9QYSpSv16VK0DMEIwkGRW8
	6eVg==
Received: by 10.101.166.38 with SMTP id t38mr1218546ano.23.1349323398315;
	Wed, 03 Oct 2012 21:03:18 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h22sm8519798yhk.13.2012.10.03.21.03.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 21:03:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Oct 2012 01:03:00 -0300
Message-Id: <1349323389-16520-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 0/9] libav update
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
X-List-Received-Date: Thu, 04 Oct 2012 04:16:19 -0000

This updates the libav to 0.8.3 version and bumps the packages
depending on it. It also refactor libav.inc to use dynamic packages
when splitting the libraries so it is easier to read.

Otavio Salvador (9):
  libav: Convert to use dynamic packages to split libraries
  libav: Drop 0.6.5 version
  libav: Update to 0.8.3 version
  mpd: bump PR due libav update
  sox: bump PR due libav update
  gst-ffmpeg: bump PR due libav update
  mplayer2: bump PR due libav update
  vlc: bump PR due libav update
  opencv: bump PR due libav update

 .../recipes-multimedia/musicpd/mpd_0.17.1.bb       |    2 +
 .../recipes-multimedia/sox/sox_14.4.0.bb           |    2 +
 .../gstreamer/gst-ffmpeg_0.10.13.bbappend          |    2 +-
 .../libav/libav-0.7.4/h264_qpel_mmx.patch          |   57 --------------
 meta-oe/recipes-multimedia/libav/libav.inc         |   82 +++++++++-----------
 meta-oe/recipes-multimedia/libav/libav_0.6.5.bb    |   22 -----
 .../libav/{libav_0.7.4.bb => libav_0.8.3.bb}       |   18 ++---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    2 +-
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb       |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |    1 +
 10 files changed, 52 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav-0.7.4/h264_qpel_mmx.patch
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_0.6.5.bb
 rename meta-oe/recipes-multimedia/libav/{libav_0.7.4.bb => libav_0.8.3.bb} (68%)

-- 
1.7.2.5



