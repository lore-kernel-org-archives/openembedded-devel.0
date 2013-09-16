Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0A14860E7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:32 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1869871eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=vlls3s2WwtX6eMyNMVRuXPsTvcKmgWiOZNab8+4bTB0=;
	b=d63xBUp8E3kV4xOQW8Mhl3TBormYmp5pYNY6603H+4dOiyc1e10f3sWSzSrbuH+p8A
	r8zKXWNPa97cfl5CR16Eu9zA4CbM8q5BD1AzPKvJIzvjb9PmAz32QljM+RNy+OjoUKzB
	pmwFHBJpFyHsJiCYZyHTaAnOMV8ngj9ufSHsLJG+vmDDeGESmeiasKMF1/8oanlCS3NO
	nDutu4xOy8LtfYU5TSXwnh4bVOLP+eTrOBvnFT4xuFdBPpNRC82GcVczBBtZZ92bTVC7
	YPts6MPflptDgdHWz/xJD67n7kVjKBEm40JTEJtP4gVAAyipwOVQt5Cu3Cn6dSF8PYvu
	AcsQ==
X-Received: by 10.15.45.8 with SMTP id a8mr41968431eew.1.1379322274634;
	Mon, 16 Sep 2013 02:04:34 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:12 +0200
Message-Id: <1379322259-3831-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 2/9] libcanberra: remove r0 - it is of no use
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
X-List-Received-Date: Mon, 16 Sep 2013 09:04:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../libcanberra/libcanberra_0.29.bb                |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
index 378fddc..6bb974c 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.29.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
                     file://src/canberra.h;beginline=7;endline=24;md5=c616c687cf8da540a14f917e0d23ab03"
 
 DEPENDS = "alsa-lib gstreamer gtk+ gtk+3 libtool libvorbis pulseaudio"
-PR = "r0"
 
 inherit autotools
 
-- 
1.7.6.5


