Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECEF66E668
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:12 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id z67so13855283itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Gj7/I0xigbKwiz6HAWgWh+1Usv7DClcBv6cFbHnsTWw=;
	b=ktvAvr/a8Ja4R6IA03H7bFZF1xQ8uYceOJCWmkh68LNiQYAGLuDRD2Nfaw2cVvG/9e
	cts7sqk7ezJ7W28H7VBl2dsV/Zdcme2gz4Qfq31XhkNJwH69F2OMbG5WCHyBLzazLJRo
	MHNku3Lru9Sz6fquG9QdkdvTenZLU3m0ab5oyZLdL1Jva3QFEw7WPd1YYNSoQsnX0UXG
	/Un99oD/sq6+m2efe0cqnINI4mvPcczmILuoWeJRKNPD5KUNMbwm4biXxj3RzqjX6XJz
	cmQIblSoSRssQM8qE3s3Ol1Xvtknhm71Fgy1WXiaSX3QT5rB3+kl8EtVDLxCjVvlXqXB
	1lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gj7/I0xigbKwiz6HAWgWh+1Usv7DClcBv6cFbHnsTWw=;
	b=WISQrGDTaAKR01Oe4peIMAF1l8RrHjoJi0LEQVSw8ceBPAs8yND9D4nlz+K6mM8LeK
	Txe23xNkTt22ttKz3UNO/DSGjYYm9CMGVaKfAuA0cEuAWapGHC8uJK6ieYi2t37usYm+
	cSLsazrKdytlxZYLgwnGw4L8c7uDqwbuMZmWDaLtHiZQiT+bYhmblOZsS979fhdB+aqv
	YP/CvE11h4ntjLvZkwx3xd/wj1NNbY5s6Qn1zzAXgLZjhM+Vtz99WYRIVGGiNSPOhCQg
	/epNJc2IWfLGoMWzd1AUAGUjNEEYqYCeAp3JqgK+aEplKDYNrt3NZLQVHkUfCu2S2R11
	aAhQ==
X-Gm-Message-State: AN3rC/76pk54dPP2x0Lor30JrXCSUM+Dd3hrlP4ayM8IQYTjmZWl5y9P
	kX/IkQkVKocgmA==
X-Received: by 10.84.135.34 with SMTP id 31mr30001072pli.99.1493011273750;
	Sun, 23 Apr 2017 22:21:13 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:42 -0700
Message-Id: <20170424052058.4952-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-multimedia][PATCH 01/17] musicbrainz: Upgrade to 5.1.0
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:16 -0000

Drop uclibc specific flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/musicbrainz/libmusicbrainz_git.bb           | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
index a6a4f6a8a..250c5f14e 100644
--- a/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
+++ b/meta-multimedia/recipes-multimedia/musicbrainz/libmusicbrainz_git.bb
@@ -5,17 +5,14 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "expat neon neon-native"
 
-PV = "5.0.1+git${SRCPV}"
-PR = "r1"
+PV = "5.1.0+git${SRCPV}"
 
-SRCREV = "0749dd0a35b4a54316da064475863a4ac6e28e7e"
+SRCREV = "44c05779dd996035758f5ec426766aeedce29cc3"
 SRC_URI = "git://github.com/metabrainz/libmusicbrainz.git \
            file://allow-libdir-override.patch "
 
 S = "${WORKDIR}/git"
 
-LDFLAGS_prepend_libc-uclibc = " -lpthread "
-
 inherit cmake pkgconfig
 
 do_configure_prepend() {
-- 
2.12.2


