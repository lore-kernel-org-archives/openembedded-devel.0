Return-Path: <yisooan@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 69834606B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 06:34:15 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id l81-v6so2794977pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Oct 2018 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=RV3wYKITFuLykY4jJ4x3uKqJnDZVjC81+GzNp2ZbMV0=;
	b=UREFk9YPM0YL1bjSqo/GdJ5qSpoisuqqjH2UaZg71QqDHO2e4VyHodxvnKRFWt2TFy
	oLnZ4oMScJmakA9rAi9fXmsJ09S8ZeZgB/Hl+p3GQmrxoMnbH5D7jrcLLxUyK8gJ2daS
	Sm77Gqr3JH+MGNWvNG9oCOW+D6yWVaWrJg50N+fo82cH8hMaTWE7UVpxcjiXv9u8ntFS
	HcSdT/a6LPsD3sqdWtU0OkiuYiHpgxQJCgJSD61V0OCQ/XPlKR++RH4FuCMezZ3ldDTJ
	7kWk0kBvkPWlVjFVUq6zr6Yn8GDkt++VyiJalQYBwF4j2J5sryXZtwPszsiSAR5SCp0z
	CqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RV3wYKITFuLykY4jJ4x3uKqJnDZVjC81+GzNp2ZbMV0=;
	b=p4CeGZ47heXy/RNRQnS4U3DOnaBANiZnaUbrujqQNO0ha8u9CNB1xC9tOivWkLilW7
	ba/DFzGKb0eaZ+vpBF6P8xxx33As1SwEWFmQqEQKZ8ayB0nEuGp9I8f51JbYEqk0IXC0
	4ata+N2UKN5l0JpNkHoUSlBVXb55M/C/Ym6EcrMIqeEEAgwsIsI+qbJc/nReqYcqip8M
	Om/Ot2gXE8brZn1FF7rIC/XMfA9emYKSke19GdAAgH/0bhOX8K9ggYWWRRe2ZoXVnF/Y
	rcZNGjYUFrTJRMPnPFVwEVQXC0gR7FGyhL/+3aNtnMyc8U1DOwb0/sZYxJvu2yRs6xTd
	KQug==
X-Gm-Message-State: ABuFfogT+dM6H6CEv9svfjJzHwegzVbc17cvgXL/D9YL4cXd1e+HBFWP
	SDdgtmMjpalQ0lIoZiC5D6b9XZnD
X-Google-Smtp-Source: ACcGV63YcRdRTK376StTBL4oiueHiCTu75jcXHgjPr6SCw3XRKIrWIkH9X9hw+rUKjbKK1+eXbQuMg==
X-Received: by 2002:a63:b08:: with SMTP id 8-v6mr19708291pgl.130.1538980455921;
	Sun, 07 Oct 2018 23:34:15 -0700 (PDT)
Received: from localhost.net ([168.188.236.44])
	by smtp.gmail.com with ESMTPSA id
	l83-v6sm39516942pfi.172.2018.10.07.23.34.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 07 Oct 2018 23:34:15 -0700 (PDT)
From: Yi-Soo An <yisooan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Oct 2018 15:34:05 +0900
Message-Id: <20181008063405.5107-1-yisooan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][sumo, rocko, pyro, morty][PATCH] libconfig: fix SRC_URI
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
X-List-Received-Date: Mon, 08 Oct 2018 06:34:15 -0000

hyperrealm has moved to github and it is maintained there.
The current SRC_URI is not available any longer.

Signed-off-by: Yi-Soo An <yisooan@gmail.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.5.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
index fb6e50e51..a8adebd4b 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.5.bb
@@ -1,14 +1,14 @@
 SUMMARY = "C/C++ Configuration File Library"
 DESCRIPTION = "Library for manipulating structured configuration files"
-HOMEPAGE = "http://www.hyperrealm.com/libconfig/"
+HOMEPAGE = "https://hyperrealm.github.io/libconfig"
 SECTION = "libs"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
-SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
+SRC_URI = "git://github.com/hyperrealm/libconfig.git;protocol=git"
+SRCREV = "f9f23d7a95608936ea7d839731dbd56f1667b7ed"
 
-inherit autotools-brokensep pkgconfig
+S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "a939c4990d74e6fc1ee62be05716f633"
-SRC_URI[sha256sum] = "e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6"
+inherit autotools-brokensep pkgconfig
-- 
2.17.1


