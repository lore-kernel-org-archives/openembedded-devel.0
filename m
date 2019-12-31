Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0317F7BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 19:07:45 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id bg7so1502033pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 11:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fjtovnl8QmfDi0CLcL4ZHYkcn8gCi2EW6+XcAquvU8I=;
	b=V3D26kXjYhdAkukFMoexh/m3V0Y6eE6wm/D5QTkv5raVsFFyCutJaDjfHq1cs/HwFl
	y93HHorYda6ojnmM6J+e5/J/rGa7cSaCiInQTkX4oH0X7e3WC64bSQGjHdDKzxqbZipp
	1Whwlu+o8fIgxw04C1xxvzwFGw3a27l/AuWneTmwyGlBHonTeGGLv5lwi+odbKgBqzIa
	DgGOkU166OYez137fxy5ccTBIrho1btvHI3uI2RUP12iynQe7SnjnvqR7JQFE8mtKh0L
	BtNFBcdXT+dVyggLYi+Cv/FW+YtvFo7SCKPKWtVhkBpC9sWIH8xZpdf2ZQqdSXi9uebJ
	H6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fjtovnl8QmfDi0CLcL4ZHYkcn8gCi2EW6+XcAquvU8I=;
	b=ens7rYxmxVLwRRyW+sN+tnnqiD5Uof5h11i04InWdbnCAuxq2y/X6I87W9JrE1Ty82
	JqrdA9S0X2FmrPjJHYrnvlpiUq3JEQe4xPg5Vb7b2WmZEoCLdH90yuJMz7JAACq5inz9
	a0cu+Zqu4PV0L2sS+Kjtk6y1t0AWynuR3nHx0+WcsXJb1Cn7b+20EL2V0k+31NmJPtkx
	8Xs6gAkYjVeOO/ytN2HAKFgesh6TIfz9ub1Eyv6BRc2XyIpXCNP4OHEkgKjx03iLnMh3
	fWTCLp+7nOEh/ph6HCibKXEkx0TZ9weeYgWbeyibvZP+jA39IbK2a6DtotoX7BEYmyuo
	VOog==
X-Gm-Message-State: APjAAAV8+byDCildHO6omVmaaXztP+OUfurTnKmdTdwH0zDS/3sLzPrr
	ZkUY9DgxK0sDRse52c80aLAE3VEo1vc=
X-Google-Smtp-Source: APXvYqyBu7xdygEq8Zc7gQMbwnKgJNL4C/8REBLN5+fbpAskqd7/V5bXNOF5G4ILWxt7BcPe0oAZ8g==
X-Received: by 2002:a17:902:bf0c:: with SMTP id
	bi12mr48865966plb.208.1577819265819; 
	Tue, 31 Dec 2019 11:07:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::fa4b])
	by smtp.gmail.com with ESMTPSA id
	c18sm32283997pfr.40.2019.12.31.11.07.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Dec 2019 11:07:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Dec 2019 11:07:39 -0800
Message-Id: <20191231190739.1277128-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] glfw: Update to latest
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
X-List-Received-Date: Tue, 31 Dec 2019 19:07:45 -0000
Content-Transfer-Encoding: 8bit

Disable docs which needs doxygen
FPIC is needed for arches like aarch64 when building shared objects

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix commit msg and PV append

 meta-oe/recipes-core/glfw/glfw_3.3.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
index 0ceeba1f19..0fcf716c8e 100644
--- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
+++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
@@ -10,11 +10,15 @@ SECTION = "lib"
 
 inherit pkgconfig cmake features_check
 
-S = "${WORKDIR}/git"
+PV .= "+git${SRCPV}"
+SRCREV = "781fbbadb0bccc749058177b1385c82da9ace880"
 SRC_URI = "git://github.com/glfw/glfw.git"
-SRCREV = "d25248343e248337284dfbe5ecd1eddbd37ae66d"
 
-EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON -DGLFW_BUILD_DOCS=OFF"
+
+CFLAGS += "-fPIC"
 
 DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-- 
2.24.1


