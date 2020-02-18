Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1477C613E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:49:23 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id c23so8307772plz.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 08:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9RzmgiBIUDEe/LhuOR+Gy/xS6+l2SeHJbTTRCMlAi38=;
	b=hY+5iVJnlIYtW709rfkvIuahrc0GR9hvHjE8AdB3nCSsKBSf169+AFLxWyw2PhGjVQ
	OmP7daCPxv1/4Wlcw0jWjk8ABFvHc7yQgyOMUZIftsUGrDqNXzFgafW458f1arJlKYTd
	2A2dBPFmQYQUtEZuVmbs2WGbgRV4CJdrIR6NVBFsgaOfLhtRjRFUnsj7FQejm1Ao3Nc2
	9kwg68bE5WOD+X+jHwBrexTR+O8xcPTyWEOpuYGHnlvUqJ4aHWIOSE89+mBv/nx/h9KY
	eaiPRkkAsd+c8QkbMFVfbMb3LMWraos4FRQhiKJZVwP1Ak/GNZ270JA86xqC6BpykO5e
	pvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9RzmgiBIUDEe/LhuOR+Gy/xS6+l2SeHJbTTRCMlAi38=;
	b=hZgJed2D1vyFi6lvcnOuBjuIvCNgEFIb8gx+fd9RV6tKtDhWw2T+Az/CMegzw54ecS
	G+Wx5npSzVSaUkzftWZy4Krz39DRxP64ADCR1wDpF/zgJ+cXTeOSfEGm3M75u4ma9Wga
	6g84tyrkp0M0PsAT16/K+l73gxOHyFl1vQrznWrcdfaewcPyIy0UFaU2h+gOV2ouOCCF
	xdFuWPYTYsAfbb37u6DixrARRK5Jp8WoowIUJfpLMPynV7CupP4n4D2wlV4L/SKZ4/EO
	tuyH3nBFsV+DvYZS9PVZWS10Iekgga/LyKO5nyIN6UgM+82nJTLaBxiCz2g/JUrD+2Rb
	T2Xg==
X-Gm-Message-State: APjAAAWDGLrXsDGNBazvetKHrvKZ/slOLdGNEh9V4jffMBlHkb6Djmqs
	LOvKxlvitzeOIwC5xy4YlimaqxIL6IE=
X-Google-Smtp-Source: APXvYqwmwop8r52Ex/SHd12rPda7Z2WIear83SsIANhVmBhmWOPGVY9Ahrw6GhIz0pynItAOKijyVg==
X-Received: by 2002:a17:90b:3cc:: with SMTP id
	go12mr3670509pjb.89.1582044564732; 
	Tue, 18 Feb 2020 08:49:24 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	r13sm3751667pjp.14.2020.02.18.08.49.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 08:49:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 08:49:18 -0800
Message-Id: <20200218164918.4095105-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200218164918.4095105-1-raj.khem@gmail.com>
References: <20200218164918.4095105-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 2/2] dleyna-server: Bump version to support 1.2 gupnp
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
X-List-Received-Date: Tue, 18 Feb 2020 16:49:24 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-server_0.6.0.bb           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
index a8e5406d0a..e31b7aea2a 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libxml2 dleyna-core"
 RDEPENDS_${PN} = "dleyna-connector-dbus"
 
+PV .= "+git${SRCPV}"
 SRC_URI = "git://github.com/01org/${BPN}.git"
-SRCREV = "776950d5d96ac9dbf5c5c47bde8ac06f50a3cf46"
+SRCREV = "eb895ae82715e9889a948ffa810c0f828b4f4c76"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.25.1


