Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBD0610E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Mar 2020 17:19:16 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id d9so1297004pgu.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Mar 2020 09:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=icG7d3FnEG1+I/p4BCjyGyfRs+KRIW+AZ3Mmw9uXCg4=;
	b=dNUJYbe/CvfrC2g3kOfJX/vq8VoD7zJ0idwQnHfvqmct+JEEGHQ3wsh3bx51bDGWaM
	FHV7mKjRRNTukHPksV+14Sz6kwtO1IoAVkhFLkQda5TzDBn5hZW/j310QSrM77HBA/uK
	kO9C+VM2KHWJLpge85B9VI+bIf8aW74ujMhLydq7BFAQP+YOR4HQPkorxSYz1NgeP1VY
	p98l7kQ1Ru2OtvrodAoQ5Q9EPFiMplX/fEj2lI5lYZruKMrGacnMjLtbUOOuUhfiMBp5
	0duong4prxO8kXariuG0mf/nXI70K8AK4Vro80z+8wjyxIZ7LIFJr0FuSmglSdgZvnTK
	iuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=icG7d3FnEG1+I/p4BCjyGyfRs+KRIW+AZ3Mmw9uXCg4=;
	b=riaBSxXW8LTODaxwT2g09fJMOvbSPNnqQxYO+LR0K1XoupYnGmi0sHkNj5L9LxwgiZ
	91/TbDOFL7Lnu7cJl+/CYjMMCcym+tRzM/6mODvYN7iuvwy+0eieKuVWeY0o+cCEUNvh
	iqCzXBzyb6SyX1M05DSDhkC1RQJD4FyOpzn/DqShIMGqi0IY9Fnil6cGnBjIZXIxCONf
	L8RrHBnoPjVNUPN/MZt6Q75+DrhPorgnkdEvVWDtK9L990EogzuWtYpqdaOfXU+dSQo6
	noPGjCAFfJ8I3xflTHEAVCA2+AMwYWGrXWMgAWHpPWNyTRg6pM8UiVEVgJ4CEs2zoXwM
	vh7w==
X-Gm-Message-State: ANhLgQ1Q2ObNmpdpvelPN07C4uUqHYawuArfa/IKDgY5N47GYvsvNYe2
	re70K/3Nz8wKw14zqmtVJzZoAKL7BHY=
X-Google-Smtp-Source: ADFU+vt3eneajNlrrN0VMXCr9wr3nzpwZtWfvt1fZyKK23ZuqA9rbJousrRiYGjj/5CX024d9Oxj2w==
X-Received: by 2002:a63:4555:: with SMTP id u21mr3465780pgk.66.1583342357388; 
	Wed, 04 Mar 2020 09:19:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::8ce3])
	by smtp.gmail.com with ESMTPSA id
	g10sm29343645pfo.166.2020.03.04.09.19.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 04 Mar 2020 09:19:16 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2020 09:19:23 -0800
Message-Id: <20200304171927.2068660-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 1/5] packagegroup-meta-multimedia: Purge gst 0.10 related rdeps
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
X-List-Received-Date: Wed, 04 Mar 2020 17:19:17 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-multimedia.bb           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
index cef45f9d6d..e0cb415e3b 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-multimedia.bb
@@ -29,9 +29,9 @@ RDEPENDS_packagegroup-meta-multimedia = "\
     rtmpdump libopenmpt schroedinger mpd mpc libmpdclient \
     ncmpc libmpd dcadec libiec61883 \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna gst-fluendo-mpegdemux vlc", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265 gst-openmax", "", d)} \
-    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "streamripper gst-plugins-ugly gst-fluendo-mp3 gst-plugins-gl", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "minidlna vlc", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "vo-aacenc sox libde265", "", d)} \
+    ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "streamripper", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "openh264 opencore-amr faac vo-amrwbenc", "", d)} \
     "
 
-- 
2.25.1


