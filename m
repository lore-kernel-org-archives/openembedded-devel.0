Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 471B860173
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 May 2014 19:02:05 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id pn19so724764lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 May 2014 12:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=18U1I02WvdYDEIcspfPea3+GuoVATCR/Rcv6kBofsko=;
	b=LbE1n8BKeQ5SpQman7zbtk9ASSU1njK9mE4YrwiGe9YiTBo1yPWLQtVCFb0SUnhKR1
	j2XlkxnfNN2FN0l1o8ok7MB79P5Q5JrycQVTgq9z8Ct1sg7GjYAJziV2KAM1ZsSheoeM
	Ar4niR+a0IIpBSujySXB6FUmj5XOCycG4BPPlqJW5GquYP28I5YHTuHRYDvjMRepQT+B
	eufVWHe4Y/d8Ez0L0YoU6XDe8zaJvThVR0PecyIZWjeJqsLUpklETcpP00Gx3hHlgdNd
	62+I4+1Z+IJnV17pz0ROxPDzauVSHiI72opRmrzSi0AwP0xLBvehUwiWlHYivX6EVB1F
	lMFw==
X-Received: by 10.112.13.72 with SMTP id f8mr2692678lbc.40.1399230125699;
	Sun, 04 May 2014 12:02:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u4sm5878141laj.2.2014.05.04.12.02.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 12:02:04 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 May 2014 21:02:15 +0200
Message-Id: <1399230136-12456-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
References: <1399230136-12456-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][WIP][PATCH 3/4] coriander: add tiff dependency
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
X-List-Received-Date: Sun, 04 May 2014 19:02:07 -0000

* otherwise do_compile fails with:
  thread_save.c:858:18: error: 'SAVE_FORMAT_TIFF' undeclared (first use in this function)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
index 4b1302b..0311551 100755
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://damien.douxchamps.net/ieee1394/coriander/"
 SECTION = "applications"
 LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv"
+DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv tiff"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/coriander-2/${PV}/${P}.tar.gz \
            file://cross-compile.patch \
-- 
1.9.1


