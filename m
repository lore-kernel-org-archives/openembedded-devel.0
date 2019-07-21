Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5B8437EE4F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 16:39:30 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id f17so12210842pfn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=VoR+vteDj56TjcVBqUj5yjbOLbWgGEhed0GwNwccZHc=;
	b=AFhy7iZlrgElD5dMr5knY7sD8yckVBvR+ATCx5YuJQPwkPPIFObDjLXrQA18Uw3PJA
	7xp0yKeqMhDhbJuNrzC9ovgpBo8AchsN/u0JT3pDO0P9jyd7dQBLPj0J+SDipm/RYgt/
	Gik1cemtV3UBvdz5bFhQezvRR2hhwOQG3OilazsATtJaB2aLCL6tjS4HT4rpa8+NC66y
	3iLtKqQMqxlHSDtoZDwczi3fMRx4kneQ8ANbyAiSa/jAdcU0z7RnDqhBA91MkRC50YFz
	B8jygGS7PzTpymRaQxm3FP2/7VFYURzr9mxf6rTue5ZuLPEV971k0PFw/0f7Zr5h6WUS
	Ml0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VoR+vteDj56TjcVBqUj5yjbOLbWgGEhed0GwNwccZHc=;
	b=S6bPH1iIv3n5mBohcaGTcqQhCd6pOcPU58HmBEKMN11BFTRSmrklvRcZzwjripokTy
	cURVleUNvs5glIax/6EBobam1SFpk9IXm3z7mn3J2VZCm41ynfjPSoGKOwQcHuLS0+cE
	Lp25QvkZhRReQ7m6qpMRvdhrqdjHAL+QAztPlMySbnHJKnzDEAqfVoO1BQqZAzJvTF1u
	m1Jh0ijyfdWUO3Gszjk4NQNH8CSxXKdzo7snYhGEMH8R8DCHlUod2CRAmlBAE2i1vxDg
	ylaZqX5gnb1stQ/CoKSfhMRCyY9aOSyOJPEDgfcyKcE3meoWanR7pvzN2uAmBUXG7hKy
	sRlA==
X-Gm-Message-State: APjAAAVb0SXojz5wSRJzMAz7W/qBvGlb1/eg+LAtZXT1XCHDaG+aDZv8
	M8/QDKVnhpZwI5GNXy0q6wxdpRPc/fQ=
X-Google-Smtp-Source: APXvYqwQ2VRjhMVYmfOl+RquWP+pILS0KdrEtQgGh+UP8ZzCLdg3xtIyaxn7ygt2oF2q9l4scbn5QA==
X-Received: by 2002:a63:c508:: with SMTP id f8mr68597156pgd.48.1563727171007; 
	Sun, 21 Jul 2019 09:39:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	35sm38763285pgw.91.2019.07.21.09.39.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 21 Jul 2019 09:39:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 09:39:08 -0700
Message-Id: <20190721163919.32659-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190721163919.32659-1-raj.khem@gmail.com>
References: <20190721163919.32659-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 03/14] sthttpd: Use git SRC_URI instead of github archive
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
X-List-Received-Date: Sun, 21 Jul 2019 16:39:30 -0000
Content-Transfer-Encoding: 8bit

Fixes
SRC_URI uses unstable GitHub archives [src-uri-bad]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
index 8632b97f44..560dd9b6e4 100644
--- a/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
+++ b/meta-webserver/recipes-httpd/sthttpd/sthttpd_2.27.1.bb
@@ -6,18 +6,16 @@ LIC_FILES_CHKSUM = "file://src/thttpd.c;beginline=1;endline=26;md5=0c5762c2c34dc
 
 DEPENDS += "base-passwd virtual/crypt"
 
-SRC_URI = "https://github.com/blueness/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+SRCREV = "2845bf5bff2b820d2336c8c8061cbfc5f271e720"
+SRC_URI = "git://github.com/blueness/${BPN} \
            file://thttpd.service \
            file://thttpd.conf \
            file://init"
 
-SRC_URI[md5sum] = "3cda1b6c8c8542b1510eadb8e540d8b6"
-SRC_URI[sha256sum] = "a1ee2806432eaf5b5dd267a0523701f9f1fa00fefd499d5bec42165a41e05846"
-
 UPSTREAM_CHECK_URI = "https://github.com/blueness/sthttpd/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
 
-S = "${WORKDIR}/sthttpd-${PV}"
+S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd update-alternatives
 
-- 
2.22.0


