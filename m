Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 337187EFB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 04:03:31 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id r7so42699092pfl.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Aug 2019 21:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HJ2ycZI4SSAd/JW67bqWoq0EUrGAcwwK+mMhYPS1yKE=;
	b=oxizJCDz/ZP6FZ0A+e7pu8qR9Yyd7umCAG1mh0R8KpF82X33Vt0EJnGkiB5QDfo+ct
	l1sD26lfNMwd1jJLM2n9+Xqnro4ze0Zy618TmYS1oox9lPzmmzWR/agsnD32L9pIddhr
	d99yl1URS9lx+/EarblNt+tSduV4DpchBwPsoG4VipcjM72jzE4KBbH52BTvCD8xqZdH
	KQB3heT0dbwC5nwPsKXPLv0sLMitj0EAAaSM6b8GA9KSkLSttnzneAaI/6gGT6L3GrgA
	q3b8//FLegWRDgwhheqrTPxVcWKGeyf4AKXbEL7ODurOce8S02Iv5HWxDtD6rRtis9Vz
	88sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HJ2ycZI4SSAd/JW67bqWoq0EUrGAcwwK+mMhYPS1yKE=;
	b=luGC+rPc0hjySIDeM2lpx2WBFraeu3zxebYhhK5/PjorVBkPQHEh/q80MLl2Ue2J9I
	rpTlD95NjuiaNvi9JSQuT7Zs5l+j8SOEfszWGkv3FewKFBZirVSepefghgmpPLm/DaBs
	QJkXZ2VRzCbc3MMNQC3/yehtM00MtNi9RC6/J+tVBO/a4pOB2mWNduGzwoWs03XYRFfa
	4Aam8/XI6ZtKvv2w0IrBiynplVXMAzbz7aIaB9VIwosdRhnHrLuqWP12XUWIPpnPWnzE
	YeXiuNMi4x4xM+JvHEKWyGdSdAnu4HeGEizqi7NiegvxmuhgmpXuBHaRTBDJgw1RF/3a
	+lAw==
X-Gm-Message-State: APjAAAU7l00Mn6Q1WQkyWjF5WALDs5PB/8WlQMqrdIHDPb4tQTRbRK+T
	yI9EM2i2uzACXif7Dv7a2ZzuoJLyIvA=
X-Google-Smtp-Source: APXvYqyys5+5CW+VzT133QElAJEGlhkGN8Awu6D+gFBJk9iHSvxs2PL+SiJCy7DJwCPT2PfkMIJZvw==
X-Received: by 2002:a17:90a:fa12:: with SMTP id
	cm18mr6415349pjb.137.1565150611631; 
	Tue, 06 Aug 2019 21:03:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	p27sm133054061pfq.136.2019.08.06.21.03.30
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 06 Aug 2019 21:03:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Aug 2019 21:03:21 -0700
Message-Id: <20190807040323.17521-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-initramfs][PATCH 1/3] klibc: Pass -fno-builtin-bcmp with musl/clang combo
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
X-List-Received-Date: Wed, 07 Aug 2019 04:03:31 -0000
Content-Transfer-Encoding: 8bit

clang would emit bcmp built-in for musl bases system
but here we do not link in musl C library, so its best
to disable it

Fixes
git/usr/klibc/memmem.c:38: undefined reference to `bcmp'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 5805448671..7faf0cabbf 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -33,6 +33,9 @@ ARMPATCHES_arm = "file://klibc-config-eabi.patch \
 
 S = "${WORKDIR}/git"
 
+OPTFLAGS = "${TUNE_CCARGS} -Os"
+OPTFLAGS_append_libc-musl_toolchain-clang = " -fno-builtin-bcmp"
+
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
@@ -43,7 +46,7 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'INSTALLDIR=${libdir}/klibc' \
                 'SHLIBDIR=${libdir}' \
                 '${KLIBCTHUMB}' \
-                'KLIBCOPTFLAGS=${TUNE_CCARGS} -Os' \
+                'KLIBCOPTFLAGS=${OPTFLAGS}' \
                  V=1 \
                 "
 
-- 
2.22.0


