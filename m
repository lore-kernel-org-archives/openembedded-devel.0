Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f51.google.com (mail-pl0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5117477C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 17:55:20 +0000 (UTC)
Received: by mail-pl0-f51.google.com with SMTP id c41-v6so3823869plj.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcB1L5TRCNewAQHOat9sDedTrDPv+IWnazBFRRl41ds=;
	b=NyRBR9MH2vatgs66S1wX2ikl0rdCtmNrtAFrIrM23HGy7lHNysPi9+QxA567WjjDOQ
	2o4rHfE+5QyGXNUGBoopZbVwHa5uE3HvX9/nWDOvzCYpCz26TGtm0ZW80M7dTn+ZSfch
	U1HHUPxUSshtrCwOmL11k4Esg3pA2qGb1o/XkRhi08rLzTyEa/I+UWqxYneDFPhZuQ+y
	BYZlPSlVP6pUyR8w/d+kUeAFTlEbQbCglDa+eJH9OeZsbCWzp4mLxrPbIfAXcZ8nDW5u
	b9NNS88Nba1hPbmRhYYRPm7d6BU6kaGAJHcRCSXR1GCV6EFdsFrqj47E1mVmm53U3j3u
	ZDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GcB1L5TRCNewAQHOat9sDedTrDPv+IWnazBFRRl41ds=;
	b=BqutDIrX9su58YWfPZ/laAL2Qnh/9T1KdgIKo2NutApvQoCFIdnwtcSNPa2WbRSAca
	iyWU//GNnvSuAdxUNcUx4ly7IWpHvG7PCxjTeBsycOIu00bH8C0QaS2bttIzxxshyYJs
	+KMifYKyQPK82WsLmHNCK/O08JLa0t1MhRB/vpepo/iPXRNcXRlYFdkAEwJ/+fzVf//W
	uz+YkzKAEgsAb2NYwT4S5TNxj8cOyDGpUv4puxHz3Rgck3SDTQC6bqKkHluRyxxLAfcw
	7hUdc/UMHZf0onhfIJtYcdKm3SmMlRLQST0WWJ5csq42swjjz+g0G1EPvzJ5bg0/CpzV
	WLZA==
X-Gm-Message-State: APt69E2bGnncoNN8+/efca7zQRLKqFzs9qUbPbZb11f5W9PJb0oAkAiD
	a1itKUjfo7Gm4SDX7eab4F80MQ==
X-Google-Smtp-Source: ADUXVKLj4v48ErzfB+Mrk32HOOe0lQdPwrWUh4zdTT8uZBj7VKps7vfMVR83geYGws0xH3+qy1I75g==
X-Received: by 2002:a17:902:ba97:: with SMTP id
	k23-v6mr2681803pls.259.1529690121069; 
	Fri, 22 Jun 2018 10:55:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm23758992pfi.147.2018.06.22.10.55.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 10:55:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2018 10:55:19 -0700
Message-Id: <20180622175521.21628-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180622175521.21628-1-raj.khem@gmail.com>
References: <20180622175521.21628-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 3/5] libdc1394: libglu needs both openGL and X11 but not tvirtual/libgl
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
X-List-Received-Date: Fri, 22 Jun 2018 17:55:20 -0000

Epxress this dependency accurately

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 8a9e9a1d7d..b6bb447bc2 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
 # libsdl to provide sdl.m4 with AM_PATH_SDL
 DEPENDS += "libusb1 libraw1394 libsdl \
             ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv virtual/libx11', '', d)} \
-            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'libglu', '', d)} \
 "
 
 PV = "2.2.5+gitr${SRCPV}"
-- 
2.18.0


