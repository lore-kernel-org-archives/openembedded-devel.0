Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id E67D06BD59
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:58 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id r16so347388ead.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=FuiVmDM6acPUtfXi7XM9dpfg0nOkbWFdl48Aye/g2pI=;
	b=yw5/qgoN/b4KKNyr7Ju59U8ci5uu9qSwuTdUqm5leD/jUMhjbjgw97lJD8MF0uXHz4
	O9emhsVgF4ad8wqYq7PyCBYpDYZbzoCxnBN/jL0rruWdF45T6viAm5fHLOj3kMJy7cVi
	Cmtb2yaNWQV0+8fy+nO7kjCXVa+qa7ZVM4ZZpUc5jnYXJSiu6r2N5jk4+Hu68y+aQJdB
	0GWg7kPYo/wg92lng6gjnn4mMfNp++QGRRLY5Z/lkfioxia6JQUx30166eDGp9SsRTrN
	nsi7K1Mn3j2BD3SvKJ+HEl+ay67tkyXDG+ccYs8yJsf8elVGyiMuyXsKI5YOe1Dwo1ub
	/pZQ==
X-Received: by 10.14.115.133 with SMTP id e5mr5411617eeh.27.1377791459315;
	Thu, 29 Aug 2013 08:50:59 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47158466eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:01 +0200
Message-Id: <d0c2908a4096ee12c9e77aa0609497a53e5b9983.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 08/66] libxklavier: Add libxi dependency
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:59 -0000

* libxi is autodetected and configure doesn't allow to explicitly disable it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
index a769a55..c81d21b 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Helper lib for keyboard management"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
 
-DEPENDS = "xkbcomp gtk+ iso-codes "
+DEPENDS = "xkbcomp gtk+ iso-codes libxi"
 
 inherit gnome
 
-- 
1.8.3.2


