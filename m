Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 867696ADBB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:08 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id y10so1314920wgg.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Kr2ijChZM7S7uW/Rxi+i0f8j1Sk5ZcpkHw+VnsURVPM=;
	b=iWIGPc4ksCeIIY5P2csyOz+cL/8f0xyYy0uBqQHb0FPMQvY/x1qlpstzB0gBfZikFf
	J2R3p0lkMsX6L5EFSNcbonu02ZB8YvPPs6VSLmFMbmGFnP0B+Z6oCYzv9462oPC6eD5m
	uXtjtHe665aRzYxAYoBD2n+vgL30pKb2cp9blHpUABhDmpNlt1sz8tzUiJRUyzIV1loa
	RIguNv6EoCdh3nRA1X4mnXWAHha/+EbVZD3qRAOLpfZXXN6z1nUeVEklTt1SV53WH6ER
	ZOqq35aFH/J9Akdl3ViQGRweI1bj7le6YbrgZblA/DTLW4yFXRKOEWtZLV8Woq9UMktE
	WtCA==
X-Received: by 10.180.82.232 with SMTP id l8mr282176wiy.23.1371907748845;
	Sat, 22 Jun 2013 06:29:08 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.07
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:07 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:38 +0100
Message-Id: <1371907719-8868-6-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
References: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 5/6] mpd: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
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
X-List-Received-Date: Sat, 22 Jun 2013 13:29:09 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
index a6b8898..6f2a912 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
@@ -3,8 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 HOMEPAGE ="http://sourceforge.net/projects/musicpd"
 
-DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad lame libid3tag', d)}"
+DEPENDS = "alsa-lib libsamplerate0 libsndfile1 libvorbis libogg faad2 ffmpeg curl sqlite bzip2 pulseaudio"
 
 PR = "r4"
 
@@ -21,6 +20,10 @@ inherit autotools useradd systemd
 EXTRA_OECONF = "enable_bzip2=yes"
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
+PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
+PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
+
 do_install_append() {
     install -d ${D}/${localstatedir}/lib/mpd/music
     chmod 775 ${D}/${localstatedir}/lib/mpd/music
-- 
1.8.3.1


