Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id C2DD26A613
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:02 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so7097954wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sAqGMh3VrPO5PQevLcAs2AwCoLCTNywEmFGYB5UyIjs=;
	b=b1n5y0kOo99Ox0xcddAA5UzWySNCu7ywPHnamCkIyTjV8u6v7uywDif65wNmWoXBnK
	G9uM1amavZbrU1UxstDnStTt1av/KT4nYyo2cBeSTlVLby0KegeUcAN7hMmKy17Ftsj3
	STByfxkSbxh/LGQf94aBmixcLqgRngyZ2+AEPtkQXam5w3P36MeGMGCtuUH7TD+gLMbm
	0VVMEm3KnsiiptYTfyE3pp6IGpMpQhco7DIyTXQMOIXjbiUg2im0zCl6PSOSRnxAUAow
	dnSQPthsV8SR7kh/+vQ15fmXewqiddhDvx9DCuJhJ92Y9P7V5dmz+O/CZAvYFQ7ejqnL
	pWiA==
X-Received: by 10.180.98.231 with SMTP id el7mr1606314wib.33.1371907743476;
	Sat, 22 Jun 2013 06:29:03 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.02
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:02 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:34 +0100
Message-Id: <1371907719-8868-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
References: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 1/6] mplayer2: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Jun 2013 13:29:03 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 2e04d3c..7c1357b 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -3,8 +3,7 @@ SECTION = "multimedia"
 HOMEPAGE = "http://www.mplayerhq.hu/"
 DEPENDS = "libvpx live555 libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
            libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
-           libxv virtual/libx11 libass speex faad2 \
-       ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad liba52 lame', d)}"
+           libxv virtual/libx11 libass speex faad2"
 
 RDEPENDS_${PN} = "mplayer-common"
 PROVIDES = "mplayer"
@@ -132,6 +131,10 @@ EXTRA_OECONF = " \
 EXTRA_OECONF_append_armv6 = " --enable-armv6"
 EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
 
+PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
+PACKAGECONFIG[lame] = ",,lame"
+
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
 BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
 
-- 
1.8.3.1


