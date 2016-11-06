Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 423CB6AC37
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 07:15:58 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so12686328pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aGYn92IobpcaHdbiHMTA2GuZCb7f1/A2Bx5400RBGZQ=;
	b=Oo89aNMC7ivx3ZVbJ60NtjN2iX4CtpMbp40Wy6FW6LLi+qOK8dQjibjmcJP1IXhqvZ
	xjxDw0HaqJLvNeZ0rR9Mj5kMdIQBfho02wAmxfQJ6q4UJJiTf/u/Mc0mVq/f5t/X7r6J
	D0h3dRUfYiG9bUkTAPM9KNfT6iEP/q+7hCyrgzhE7PucVBIoPUZFQ7MRjlkmzJ+a7Xpx
	VsQZzeQF9lnYXDzQbaFTt/xmFzjcKXjeRDuCZvO9HHfdCO+iRS/0AaesbvWTmTxP5bdh
	JMK11lLDhpbiHSVNSmd7Hu+uccAkqjLRN6gy3UEurHvfNXV85Pel+Cw6PpeK4AZd4Aki
	NCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aGYn92IobpcaHdbiHMTA2GuZCb7f1/A2Bx5400RBGZQ=;
	b=FODVv1XPg/+AETxDozn8JZ/kri87WcbYZ4/GeX0DXvpiLx5mbM8wnn4mpAimjaB98K
	wUuLLopIqcSchWgrWv/pd8ASAI0HtU85QlregR3JsUlvqT8rLVebf1lVJKBD7iztPYNn
	rq8SUqG24gf9ZDj9lSbdH4n6jxmODyNvw6KkQqAutR3gjQttwx4PRD1XLsk3eVi3liO3
	BFE2Pmtyt7Lo0T5A3S6pmFTr5HdaegKVkklcMUTsbK7G4Fc/tfELRp0H+MpPj/UPar7l
	DPrLVw+jIjQrX2DffPJx2rTvvV33drp2wvK5vID9ZDfPenZ2H3fPlPv+XtwzPgFNlVhT
	xI7A==
X-Gm-Message-State: ABUngve0galK4jCzxhaF9TPxcVbKnzI3bLTEFZRTrj3lPCJmYoP8gJ8lmfa2MuXvZuJoIQ==
X-Received: by 10.99.67.7 with SMTP id q7mr1909278pga.74.1478416560359;
	Sun, 06 Nov 2016 00:16:00 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	z9sm31423810pfd.29.2016.11.06.00.15.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 00:15:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 00:15:53 -0700
Message-Id: <20161106071553.2260-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-multimedia][PATCH] kodi-17: Add packageconfig for lcms support
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
X-List-Received-Date: Sun, 06 Nov 2016 07:16:00 -0000

Keep it disabled by default, makes builds more
deterministic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index 22b23c6..05d9975 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -95,6 +95,7 @@ PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,libxinerama libxmu libxrandr libxtst"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
+PACKAGECONFIG[lcms] = "--enable-lcms2,--disable-lcms2,lcms"
 
 EXTRA_OECONF_append_rpi = " --disable-openmax --enable-player=omxplayer --with-platform=raspberry-pi2"
 LDFLAGS_append_rpi = " -lvchostif "
-- 
2.10.2


