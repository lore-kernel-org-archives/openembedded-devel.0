Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id EC64E6B867
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:20:03 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so183538eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=XJQ+9+WeJKoYUKHvwsuj+F8MEJ8GXOHVF+1wD9cMDT4=;
	b=Wu1cnSYEoRPahiDl4Ushl6gvs2t5xS0r2tlMAFDObncInCMvOrkvkeJJkWoyvOZ3Q7
	r3T32xdD7vMv+rDGy2rpbA+PzDfTuDSz4CGq/BLUUeo92qjQD1A9ByFsQp3jvrUfH7+o
	JD57ZhsSylZxboIuPi0x2MY5kbhHpUa9EbHT49arSMzMM/tPhqFE4lbBllAHzPSvvTzB
	0OiiUsU7hriZNX0LW3dvpxVuWmvZNfGAwLGtBG+gym6hyYQWILk9DV3wu97VakAAkozB
	yt1RwK6LZCb2IKarSOMyS9HX66YTbWjFoskYMhI911jS18XVneh/BZNDcO32WCmKcNg/
	iUEA==
X-Received: by 10.14.225.199 with SMTP id z47mr20909786eep.24.1376551204402;
	Thu, 15 Aug 2013 00:20:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm81959509eeg.13.2013.08.15.00.20.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:20:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:33 +0200
Message-Id: <5bb3ce134412f4b60a66f88e5467018b2466ae81.1376551136.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 53/60] ntfs-3g-ntfsprogs: add packageconfig for uuid
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
X-List-Received-Date: Thu, 15 Aug 2013 07:20:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
index db5686e..42f7ca5 100644
--- a/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
+++ b/meta-oe/recipes-support/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2011.4.12.bb
@@ -15,6 +15,9 @@ SRC_URI[sha256sum] = "aa8c747f0bfe819b2387b05e12db8d35e4ac96dcb2432873a0b939e248
 
 inherit autotools
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[uuid] = "--with-uuid,--without-uuid,util-linux"
+
 # required or it calls ldconfig at install step
 EXTRA_OEMAKE = "LDCONFIG=echo"
 
-- 
1.8.3.2


