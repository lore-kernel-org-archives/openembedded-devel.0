Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id AA8C66A5AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 21:52:43 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d49so981900eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 14:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wo7F2sCPA3/ywozeNvxVB61C7Kv+w7cNE4GvfDie66s=;
	b=NldB1m9u04ND83ST9jqvFKlLX8kZ6SCiOremHKQeM7P26VUDvXnS+gS5nie+UwGGLL
	Hke2lPbe6PYJWldrY1zlWeLSyk9oA7xrcuzCLznloEvCX5Xo8CBxHhWAbP06qI4sjXM0
	dRSHyoArMnPmWJzlSFOtQS6na4b2wk5/R2NmTh/pAeHxYIpD3rpbjMYOP8xCUtI3d7Xc
	qnVeHe4ciDvWjcWGjjIaYa1B9EDSKkh5Zmv0cRANUlX7EPfYJQbZ0Bm/Du4VbLD6hbZG
	zNn4gON1Ti2ozU8Oc5E3Sqls0ilihxQCK9B4D1amHgjeAhJe6P5uV6JVt6vO8kIsrl1q
	78Qg==
X-Received: by 10.15.110.197 with SMTP id ch45mr8665528eeb.149.1372974763275; 
	Thu, 04 Jul 2013 14:52:43 -0700 (PDT)
Received: from mizar.localdomain
	(host69-50-dynamic.0-79-r.retail.telecomitalia.it. [79.0.50.69])
	by mx.google.com with ESMTPSA id
	ci50sm8418690eeb.12.2013.07.04.14.52.42 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 14:52:42 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jul 2013 23:52:35 +0200
Message-Id: <1372974756-24764-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/2] linux-yocto_3.8: use 'require' instead of 'include' for compliance
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
X-List-Received-Date: Thu, 04 Jul 2013 21:52:44 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto_3.8.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index c74d8c1..5423210 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -1,3 +1,3 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/files:"
 
-include linux-yocto-handhelds.inc
+require linux-yocto-handhelds.inc
-- 
1.8.1.5


