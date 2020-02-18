Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2E052613E1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:49:22 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id n96so1274215pjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 08:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SSVMG8nlTZz6Wl9HB+Zd6pD14oI2v8+ziUG7hTiKU4I=;
	b=Ayps1XABDLP+QlWqTDKF/YTW/nYOKy7VZvkHgMMmfa9cwSnGRFGLr3mJCUoQOJPSFt
	+wnj74HdduhPo4bXxsL8YJj0kzB9+T6b7QE2EC38yyNtJDWttGjR1v6hoiVk9Em8K7Fs
	oMN4yXtwof1zvLGNJC3wUm3L6hc8kVXdxIbf/DIQPdkRvbaV3hYu5s9Zesz94+A7meeL
	WvUV2RuKUP/YnCvxazev1VlyjIYga1dZnRg9TzPxeVOnMP3VikF87r1LN0oJLHZ82zmu
	1Ut/mDADRArNYWEIbzwu8WRzWDUMIv5uwGllqw48b0xgFdHpQS3jnopBD71/q2/X397p
	DZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SSVMG8nlTZz6Wl9HB+Zd6pD14oI2v8+ziUG7hTiKU4I=;
	b=lV+tekX5ttfqR0sG8tNDB9DtxvuCVwBJx+hvAEgmiJKQ2rA9xAp3yIbuuC+rqOZpmv
	GsLgSJJ3wLD2z8o42+pjqmdfozeFRQhtf0aVgsKuEPmvFtVvi6d9qxuWo7MR60pQvMl/
	fQe/falC442xw8lGt1kCkRQNKVOA+qF1Nfh9jiliOryisPE50x/QiSJn+vQ0F/lVuGJK
	LnHRTkPaoS5Kckubjk2Pr4lzZmW7LEsmLg0Z74/aeO4vkRVduilv1yFphNKEx/XRtfog
	GdNKxmfT0pG3AIon7vkwXdDY/iOH8Q4ttU75PszA/AqjcJEKK4xMnMDHtWyKYVlY4SoF
	YwLw==
X-Gm-Message-State: APjAAAWu8CG4yKNTu/mZaPvo2mo6/B2xfL6yUlFoRa1Ddzy9AfFZR/I9
	Unit9YhjCU7gb4Uwfdd6ntH3NnJkfnk=
X-Google-Smtp-Source: APXvYqyjDYlrt9cPWue4Ry0tG4fMD6n1gaa1MmcLlUnUb3MOmd1jBchUNyQxgMgqizvu9qk7jExbGg==
X-Received: by 2002:a17:90b:94c:: with SMTP id
	dw12mr3580331pjb.13.1582044563557; 
	Tue, 18 Feb 2020 08:49:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	r13sm3751667pjp.14.2020.02.18.08.49.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 08:49:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 08:49:17 -0800
Message-Id: <20200218164918.4095105-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/2] dleyna-core: Update to latest to support gupnp 1.2
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
X-List-Received-Date: Tue, 18 Feb 2020 16:49:23 -0000
Content-Transfer-Encoding: 8bit

License-Update: Changed copyright years

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/dleyna/dleyna-core_0.6.0.bb          | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
index a3b2793721..8939cd36e2 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-core_0.6.0.bb
@@ -7,12 +7,14 @@ HOMEPAGE = "https://01.org/dleyna/"
 
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://libdleyna/core/core.c;endline=21;md5=139cba0c634344abc9456694fbb5083b"
+                    file://libdleyna/core/core.c;endline=21;md5=68602998351825b0844aae34c684c54e"
 
 DEPENDS = "glib-2.0 gupnp"
 
+PV .= "+git${SRCPV}"
+
 SRC_URI = "git://github.com/01org/${BPN}.git"
-SRCREV = "27a3786ec013f64fd58243410a60798f824acec3"
+SRCREV = "1c6853f5bc697dc0a8774fd70dbc915c4dbe7c5b"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.25.1


