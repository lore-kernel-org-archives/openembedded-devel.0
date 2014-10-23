Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id D028065C88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 18:11:35 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id p10so1463573pdj.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 11:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DyTMytziFww89MhI+fMSuRBZltt4JYD7U9mc0Bl0CZg=;
	b=fzcsoHavryoMb87bWUN+CtHhCkJo/egF33YRSc7aRnDxmb8Hqpdr6TnmdpNWldRwS0
	d1EY+CLszEUrohJBKZ0Bpifza1Z6ag2Ue9KFozbn+5uXJ3OCWIjoAxjH3/BzsiyN03OZ
	Y6L40SwAEF9S4kocwCBraKwZqhF5cFvSRXtL8RQT6aS45DmHD8lK3XG73T2LVxHIbqFc
	m9eCQe2kRO8X9AgAMUtwkvOfPWnX5rNfCWgXVIjyhnrnvEex5AFGyVKAGY5NMKA3s9v0
	73T38S0zUpC0ukUUYwndkNnX1cIiUUcao7RJ6aflTIDm5WpHKKdfqIYYvwVBxmU/Rdg9
	iCDQ==
X-Received: by 10.66.244.137 with SMTP id xg9mr6402098pac.113.1414087896208;
	Thu, 23 Oct 2014 11:11:36 -0700 (PDT)
Received: from localhost.localdomain (c-76-103-58-225.hsd1.ca.comcast.net.
	[76.103.58.225]) by mx.google.com with ESMTPSA id
	fk10sm2056243pdb.49.2014.10.23.11.11.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Oct 2014 11:11:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Oct 2014 11:14:33 -0700
Message-Id: <1414088073-14497-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH] audiofile: Use gnome mirrors for SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Oct 2014 18:11:42 -0000

original uri seems to be down now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
index ecfc988..6188659 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.2.7.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2 & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://www.68k.org/~michael/audiofile/${BP}.tar.gz"
+SRC_URI = "${GNOME_MIRROR}/audiofile/0.2/${BP}.tar.gz"
 SRC_URI[md5sum] = "a39be317a7b1971b408805dc5e371862"
 SRC_URI[sha256sum] = "a61c4036c2600a645843f16bec4be166093a9df5f15b02c85291213aa9cf15a2"
 
-- 
1.7.10.4


