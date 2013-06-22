Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 867ED6ADA9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 13:29:04 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id x54so7082232wes.18
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jun 2013 06:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=CEumNAvkVxz5GUgudRj8g+CjUiTLGxf+q3+706CYUig=;
	b=Zxk1pIA9K6FC65WYTREzvvlmA7KObbRKUevQHZXRDKGr4qZ1jApA5xrhOgyGKpia5h
	N8ZF3ehTRvBEsFCE/WFYuOA9TE1k1DXBQl41fKaBKyS4E5WM5M+vGZ9Ocg+ctCag+GBO
	IuhHG0R82WCDjO2Ewe+STq/vLcPYNgswpjSk1/+HMVOW7JdYil+XicZ1Eq1chz2240lt
	r0U4rW+oXLigL2MWfHwkvFxOyq4r5v+FOJIwh1pn9DE4lEFY+0wfX7ImWKReObAWNM1t
	LIHOdq40SvsbtpbzmLDxDXCZCvWQXA0Syj6Vg9ss9oAwjwOapsrgRAMr5josMw+2RVgU
	6oWQ==
X-Received: by 10.180.91.107 with SMTP id cd11mr1641817wib.12.1371907744755;
	Sat, 22 Jun 2013 06:29:04 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id nj19sm4038847wic.1.2013.06.22.06.29.03
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Jun 2013 06:29:04 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 22 Jun 2013 14:28:35 +0100
Message-Id: <1371907719-8868-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
References: <1371907719-8868-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-oe, meta-multimedia, meta-efl][PATCH RFC 2/6] libsdl-mixer: replace ENTERPRISE_DISTRO with PACKAGECONFIG options
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
X-List-Received-Date: Sat, 22 Jun 2013 13:29:05 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
index 00c7ec8..5307535 100644
--- a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Simple DirectMedia Layer mixer library."
 SECTION = "libs"
-DEPENDS = "virtual/libsdl flac libmikmod libvorbis  ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
+DEPENDS = "virtual/libsdl flac libmikmod libvorbis"
 LICENSE = "zlib"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a37a47a0e579e461474cd03b9e05199d"
 
@@ -16,7 +16,9 @@ S = "${WORKDIR}/SDL_mixer-${PV}"
 inherit autotools
 
 EXTRA_AUTORECONF += "--include=acinclude"
-EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor ${@base_conditional('ENTERPRISE_DISTRO', '1', '', '--enable-music-mp3-mad-gpl', d)} LIBS=-L${STAGING_LIBDIR}"
+EXTRA_OECONF = "--disable-music-mp3 --enable-music-ogg --enable-music-ogg-tremor LIBS=-L${STAGING_LIBDIR}"
+
+PACKAGECONFIG[mad] = "--enable-music-mp3-mad-gpl,--disable-music-mp3-mad-gpl,libmad"
 
 do_configure () {
     # Remove old libtool macros.
-- 
1.8.3.1


