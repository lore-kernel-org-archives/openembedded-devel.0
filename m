Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3899F7FBE4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 00:39:15 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p9so13597340wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 16:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4xL3895dUTt7xkHJhm6NECB3ld1h8X2nUoixraR8t50=;
	b=qjbkIZed7UBGFgYYtNvDA+SkxrSPulprdPddhaYi5FR+VWuvoZn2h/kS6t+meENFgn
	R+fbuYM9RypDV9s416kgtlWN1J1/gXLz9IqdIO64AbfYfPjoa7GnDmmD5KprRaBxvODP
	BFmhALiwc39M7vSB6AT+Hap7ID6DKKH5LuN8ibG8lfxqoz5HH//nMS7Hhrx7ZND+X8/t
	HvbIvr3eimEVUqscx7C49RmLCNw1A99HfozvpWm9Ft/f6wv2pIrZdFgEnrb7lcheXTd0
	Cw/f85jYRpykSt7BLBbJMw0UuWY8GYyuVBXzGU2UjBBQF665dK74xoc6RExa29IK+1Tk
	roVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4xL3895dUTt7xkHJhm6NECB3ld1h8X2nUoixraR8t50=;
	b=H7DoF0cWRhx53Hbpl9cVgxFSMSkqjVuvZjmlAaT6xNHKAEZMYNpCCMx7RdEZcdWznV
	NxhAY+oX6AW3W+OHE+nfoTbW2gjTRD5a/Q+ikTa5lDQHZstkjjgb2BjpedX4m5/UblXs
	WRx17HtTAzj/81elZDAots4nlqpn/otC5QDZ6LSBmPGmAAyPTCZu92f/fxH6CQmfdxCB
	UwqlJlwFRzb62cOtnCgU9NTqz4554nYtw5xtoIBAv2kWZO+xSk74iyehF4t1RL8vJuCM
	HPOxr1gaOl69cfIDIogFmw/PQ9H+/dtj+A2KGDbFopHKqJt/qnZJfk6WfWUtxDzSeZeJ
	s/bA==
X-Gm-Message-State: APjAAAV56B7jZ0YZXj2NbmHNoj8Nn8pcKikcB/YSr+eE2CiGdrpwakKp
	EKY8w7vuYqjJL63rybzR4eCGcNkO
X-Google-Smtp-Source: APXvYqxjJAuYdamh86zxsPzNUZlg6Rzzw1ro0oqZRhdZWKdwbltHGg0a1w08hkiwAczxRcw9zUJ15Q==
X-Received: by 2002:a05:600c:2254:: with SMTP id
	a20mr21880762wmm.97.1575851955907; 
	Sun, 08 Dec 2019 16:39:15 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0A9021072C1E15EE839E10.dip0.t-ipconnect.de.
	[2003:f0:7f0a:9021:72c:1e15:ee83:9e10])
	by smtp.gmail.com with ESMTPSA id
	n30sm11403575wmd.3.2019.12.08.16.39.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 16:39:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 01:38:34 +0100
Message-Id: <20191209003840.3383-24-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209003840.3383-1-schnitzeltony@gmail.com>
References: <20191209003840.3383-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 23/29] stalonetray: Add x11 to required distro feature
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
X-List-Received-Date: Mon, 09 Dec 2019 00:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It depends on virtual/libx11

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
index 8851729f5..7db70ec96 100644
--- a/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
+++ b/meta-oe/recipes-graphics/stalonetray/stalonetray_0.8.3.bb
@@ -11,4 +11,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "ae95dbbacc2620e032acea8abab8c9ef"
 SRC_URI[sha256sum] = "36548a588b2d466913423245dda6ffb6313132cd0cec635a117d37b3dab5fd4c"
 
-inherit autotools
+inherit autotools features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.21.0


