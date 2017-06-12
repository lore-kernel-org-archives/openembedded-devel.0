Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id AF645782C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 19:01:57 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id d5so5126931pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jun 2017 12:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O+d2P+qDmbTmsYt7z/gafromCM9juu2zyPxtx35YKYk=;
	b=dzLqSJxgfcZOiTz589q5hKeG1rOPjOh1yIcgogyOl6xV33ssq7Xh57JNroU0mkxdJU
	2N5BWJpSG5maFYTulEh/AoZ5nSLYnlSJZ9cWrN3ktHm/AIecRr8dNqnDLQJ315P0kFz7
	+s4bYd0jhw5xuO8rsQXueNgLp9NZUCn52/NhS95tQKuYdYnAz6+tiFYZ3y9/jsEnAIGI
	vuRjS8Se4vzqHQXHRsjWt8kr9f29KHDlrVVms2t9k9MTCetI43ADcy7uLZVY/OzFwfte
	GlCR1la3+YzLmIpCoE3bhFturW2Z5TW2s/tPsCXPCZ1aiJT7+PA7+q1Z3q8FUHSFcNxJ
	TMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O+d2P+qDmbTmsYt7z/gafromCM9juu2zyPxtx35YKYk=;
	b=j+i6dlozWzS+MkuS/DFYFwQWRkdoVxxe+pwOpNT+PYf3Pqq2DXDeWW7CFnwWPn/MpU
	Sb1F8XEvJywTe8RzywYk4ERLdqLdMn5047e2AmHAO9wVtviNKo3izOfH47fZf+6OeHMF
	gq3CM6Ma4BnzWaQzJ9+tSqI3C2rIV8EnDjg8mlvyfv3n5yAdOBFreR/rq8cq5+q+Vltp
	Oq+CmpCZCEOJBn1UsCKJTN5QEpM3C2JXsZEIs3XZcx1C7cqc52cueVjDR2V0PsrBn8ZP
	IqoF4RPlVoDizg8tNRVg42nbGCq4I+k2W5NwpPiKVhtp3/f0xd3AxmZ9FW2HRepgnDvy
	Vzcw==
X-Gm-Message-State: AODbwcABkZLdzGSVd85UFsWLEZUdUPXCCvEOG2bjngYfxktRKjtQ7npm
	cTsdDm2Is0Afs459
X-Received: by 10.84.210.194 with SMTP id a60mr49212337pli.17.1497294118403;
	Mon, 12 Jun 2017 12:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	z79sm16726508pfi.43.2017.06.12.12.01.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jun 2017 12:01:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jun 2017 12:01:46 -0700
Message-Id: <20170612190146.4028-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-multimedia][PATCH] libdc1394: Add X11 and opengl deps if distro has them in policy
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
X-List-Received-Date: Mon, 12 Jun 2017 19:01:57 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 8318385b6..8a9e9a1d7 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -5,7 +5,10 @@ LICENSE = "LGPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c848e78d9a4a5cc69906178e4d6fbd64"
 
 # libsdl to provide sdl.m4 with AM_PATH_SDL
-DEPENDS += "libusb1 libraw1394 libsdl"
+DEPENDS += "libusb1 libraw1394 libsdl \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxv virtual/libx11', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl libglu', '', d)} \
+"
 
 PV = "2.2.5+gitr${SRCPV}"
 
-- 
2.13.1


