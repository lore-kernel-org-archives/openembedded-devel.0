Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D681065D31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 20:32:42 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id kq14so3726395pab.32
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Apr 2014 13:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aguKWIYatHUDeK9O+EQftgOqrNn+Wt28haNdXFNlLM4=;
	b=xtHBjiud76u78cZTq0Dqr/5Qd4+Bh1zy5tysuhgx8ukuB6GsoIYjgLvYKirDjep803
	7bPhQauvct2ADd2NAmxxnP/GjJvyWKgyH0yt+d7Vl1C3a7rHvGiAtOtw/qoXaPr8V518
	1lPizrI5QlcgBA4Xfq+t1uDGJ+NBtD3L7+or5RmQLAizey9haHEiUwXoy+lUt7A6vIWa
	wJSXwNsM2H6lvY4sJqiefVRscJHquvtbqEgw63+JbgrrA9KEYt/UjByu91Ml9qeqBfw4
	/NdDzvvdKH3YC/4Ih1GuHjbRl5ya1nE1BoHJ9nGW+JNEahnIt09oIdH08bawIG09h0+0
	L33Q==
X-Received: by 10.66.171.76 with SMTP id as12mr16010066pac.52.1398544363818;
	Sat, 26 Apr 2014 13:32:43 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	ci4sm24455471pbb.50.2014.04.26.13.32.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Apr 2014 13:32:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Apr 2014 13:34:28 -0700
Message-Id: <1398544484-27299-5-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
References: <1398544484-27299-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH 05/21] xfsprogs: Do not do out-of-tree build yet
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
X-List-Received-Date: Sat, 26 Apr 2014 20:32:43 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
index 1dc6f09..4c3f8fa 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.1.11.bb
@@ -14,7 +14,7 @@ SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/${P}.tar.gz \
 SRC_URI[md5sum] = "de9f1f45026c2f4e0776058d429ff4b6"
 SRC_URI[sha256sum] = "adf4980177b5c890c1ca86b9c0e3e4d69a3f95bfc01746844280c2393cf4d6be"
 
-inherit autotools
+inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs libhandle"
 
-- 
1.7.10.4


