Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id EBF2274C0D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:32 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id i7-v6so5096943pgp.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcB1L5TRCNewAQHOat9sDedTrDPv+IWnazBFRRl41ds=;
	b=aJlAhHSOroqvd/+O9GXJ7EvIcIk33jbZ8enIAua9b3lH/Ihkzf+b1nXUVgPtWgyt2t
	59TdtzZ15iamUeVLpHIvQyHmVAlJyZ2cNilgCszfMGDGey2ZTNytKmSoPvIjA/9QpGjE
	RxKKZDlQ2cqCK1+nHXiknKS730uhxH/TELRZZQ7U1ioWrumzMts9s3abX6sWxy+7DmV1
	rofzh8FKGjXk2hIjvlfsxi8KvtUKzluhgKkHtlmehVTRymqf8ynprh7eZfPV4/bw7FR2
	yYLHzlnaI6tCdcM6/We5bEi+3gwb3fk7BIKGOxvJOzrioekksv5I+TfCLGxYf1hOzqVI
	Z8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GcB1L5TRCNewAQHOat9sDedTrDPv+IWnazBFRRl41ds=;
	b=WYUGR9mOE4SwYRamJ/J5U0v4dcEeul86C781Q6W3+OVQAwGDoC+jW5GhCB+7ZV1yZs
	ozYiN3Yr6qV/8MHMFZ7piZ2dIy3KIVwfY8w/RojzORTbdpRLlDHabJQoD0QP8Nj+hbo3
	MfsSztAY7otULNNMO+frqbwsk2hIorDKq4ZdJNbvIEk4Upy2Qz0dzHZ5vtKvIvUjzsyh
	l8PiZc5P4vADb9rzlRmQDWfy6SRcsteK9hI31rIUD5s1V7Nv/t1xuDuHzgl0dfSIlvSO
	pOr1KCmGiFfD8KHzU9D4nALohb37lFTOvSc+lIj1z5UpkJu7tt0X8XFHS8NWpbsrgl4A
	AFVw==
X-Gm-Message-State: APt69E3jKndBs3zvqMk85rgT6QQmOLuIF5SVTLeXXvzaU9re2iCiZ9LP
	G+oySTKYD5dLfq1w2+vdWCHkmw==
X-Google-Smtp-Source: ADUXVKKmZqURABXrjp5pZrzRhIJilfAv1FbquBrzE/QKc6zj57J9hb/BG1OjyOKJa6uQka7HOd+WWQ==
X-Received: by 2002:a65:508c:: with SMTP id
	r12-v6mr3757120pgp.115.1529867973637; 
	Sun, 24 Jun 2018 12:19:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:30 -0700
Message-Id: <20180624191845.31082-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 05/20] libdc1394: libglu needs both openGL and X11 but not tvirtual/libgl
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:33 -0000

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


