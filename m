Return-Path: <joe@deserted.net>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id DEE206E666
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 20:59:55 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id s2so24945986iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=79DfDRBrtAG2YU7UEKhIfe/cqqylGM8R6Da4Q4qDOEo=;
	b=RM51w8LOw22JZwIeUpCkEtr3O8GVZlzRNftqgY1KIZzR1OOPcHK2a1ZYCRfJLjghW/
	jKNXTND+dxjM27D27iSEu0yb+VBAXiF54do8DqjS7d0ZpokZEw+wrklRpO170+hkHY5b
	OLvy4hIYbXWdcoiSSqzRm8m203N5YHl+N4IICn5z4bLD8E+ZEk1Lf0dMszj8fcsgBqD7
	xc1sLChDM7IhP3zLqLXNgR44ybArPOIE7z4aFpXyiy2njLtsBGbbET0ZAdAzXviezzRc
	FNz+lOVRHup0YFxwcqbqCgGnlCDQuMPw1JAaRb84pNM2vNNyIrOF/NvOeQsaFd0FdjxA
	KgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=79DfDRBrtAG2YU7UEKhIfe/cqqylGM8R6Da4Q4qDOEo=;
	b=PTlHW+0BO1eulRp2yct4aL75d4YlYryvNa6F/2Z3Rnn6KKSQo9mFJTqipgnF7Gox1M
	mt93YcvdWza4+CX2WSyEeOBmDZkJq/nl8pTnSX+jKG46/QqblEZTIkyomUWBRlxU+lGZ
	pd+/k6g1DhwzJULNLiUft/WdRMTBZMUsIpD683nCz2x+5dCjsIh7pPdWtVlBQfLpOkB0
	VfiULpp6iSLrPCCCJG6Zpqz1IvLzM1amTw3M2iRmYHxs5lv3QUwRlfAPdK/ij91NVfR9
	zAxTGZ56xC2jqQ1lhjF2SW0p0doJvn5SVO8YGvAFoN6mIaaU8Si1dzwejbRum6sZ0cff
	mLDw==
X-Gm-Message-State: AOPr4FXSr+c/GrwRUjhApWD0bZBZAyIia1OZrI/cH1DVSIWVSkebFt/oZGwfMSbYLN48+g==
X-Received: by 10.107.19.42 with SMTP id b42mr37765977ioj.75.1461013196626;
	Mon, 18 Apr 2016 13:59:56 -0700 (PDT)
Received: from mir.deserted.net ([23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	207sm22442437iou.33.2016.04.18.13.59.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Apr 2016 13:59:55 -0700 (PDT)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2016 17:00:49 -0400
Message-Id: <1461013253-2350-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
References: <1461013253-2350-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 1/5] libtalloc: Update to latest stable
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
X-List-Received-Date: Mon, 18 Apr 2016 20:59:58 -0000

The update of Samba requires a newer version of libtalloc, so update it.

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../libtalloc/{libtalloc_2.1.3.bb => libtalloc_2.1.6.bb}             | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.1.3.bb => libtalloc_2.1.6.bb} (91%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
similarity index 91%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
index 8209264..8937311 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.1.3.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.1.6.bb
@@ -9,8 +9,9 @@ SRC_URI = "http://samba.org/ftp/talloc/talloc-${PV}.tar.gz"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-3.0;md5=bfccfe952269fff2b407dd11f2f3083b \
                     file://${COREBASE}/meta/files/common-licenses/GPL-3.0;md5=c79ff39f19dfec6d293b95dea7b07891"
 
-SRC_URI[md5sum] = "3e285de2228ae67ff0a0f5cec658f627"
-SRC_URI[sha256sum] = "7aa5f75b22d4ef9c737b25515f2a2837ddc13014ff4ac6e58dd9e311f41f2cb0"
+SRC_URI[md5sum] = "707010c6ede5821fd34397f5d9ec6ab8"
+SRC_URI[sha256sum] = "3b8e1a50bacb359d99942e0dd9941cef779ae4b5eb20f138873bd8270cb1d47b"
+
 
 inherit waf-samba
 
-- 
1.9.1


