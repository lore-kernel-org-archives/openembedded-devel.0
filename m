Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6E458779C1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:35:03 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id s66so49894580pfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RGIFbxHV4OsoMTGKgYvDU/M/YJnvcfR3ayybvgTCOXI=;
	b=TpcvbPO7vzYlCFSkwF3jMHq6IRQyQwm73VXJOxLOWsQ0VX3t/hbaftQcwz1HwWr4lF
	0RaoqRDxITzjIQOZSZa4GFDTwIaxkwSAKvBqAfnmms6FLkBYbxCySIOCK1CdB8PdUA5k
	KQwmfYOyKc9Z0pidS1s7RUuyjpkY0vLyYW9/3PpXqBx+ZSS3hN/7jMjF58Wr9Hce7vnK
	BlmfsllixCQLP2hgbifUKz+rx1Yk4YggJkQYzgzZdL/bPB+XXpoaOG72rYosRb+ydpBa
	pK7BB2X7V6GCBq6wz9bTh2aVfJdIf+owLymIHVQr/QlXU3GY6quMeAxE6ltPuIYRnYDO
	y+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RGIFbxHV4OsoMTGKgYvDU/M/YJnvcfR3ayybvgTCOXI=;
	b=LbJ7b5jFADoQ2wHr6jzJVEJ0b/BYw0GmyX7QjFqxAh7Z2unR4IO/qGhng/DxqeovD+
	T3DXckk4SpaJzbKgoq0OoBseeQB6szMoymRFja2vuYOkQuQEMic7mBKSjWRDbvAt4ri6
	oRonX9dX0YZT3WnVETcj+9+erRleYVFon7KfwakpkEkKyurIa+vv6oGdCgA5ZqALpcWD
	8MgDjyXxEtb5ax9+vE1bOSptCIZkIiYpaIn2OvMfgGtf2zlMDrv3k04QdOyKXnx4ptxH
	SPjEwNW7EfqmMdJ+SumZ+lgGCEUdqPtKsvL9u076TJ5DYrg1VfdLa5FIcPpNUgDFUxvL
	0UyA==
X-Gm-Message-State: AKS2vOwmxVfJucnU6oJIAMMDd4irgylezN5bBM4EoHKTH0Fgvbg0XSYN
	tsN8I7LQrZK7sG46
X-Received: by 10.84.133.69 with SMTP id 63mr18935865plf.225.1498455304781;
	Sun, 25 Jun 2017 22:35:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.35.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:35:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:44 -0700
Message-Id: <20170626053446.37959-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170626053446.37959-1-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] hwloc: Inherit pkgconfig
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
X-List-Received-Date: Mon, 26 Jun 2017 05:35:03 -0000

Fixes
| checking for LIBXML2... cannot check without pkg-config
| configure: WARNING: --enable-libxml2 requested, but libxml2 was not found
| configure: error: Cannot continue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
index 16cd507e6..1194af0d2 100644
--- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/downloads/${BP}.tar.bz2
 SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
 SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac90698782bb36e5504f4bac1bba2394ba14dbbad24"
 
-inherit autotools
+inherit autotools pkgconfig
 
 DEPENDS += "ncurses udev zlib"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
-- 
2.13.1


