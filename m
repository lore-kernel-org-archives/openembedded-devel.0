Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 91BC66A566
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 21:57:46 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id k11so2057551eaj.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=7JR90t6cP9F6DMy83s1RjlKSNQMrN57ft7Qkp6fgcgI=;
	b=SPHw7w4t6KfwnMrFhikBi0wxPrBc8aeJxh5uRj2ETlwCPbITJSq+G1i7jMR4Z2Sy6c
	B8wxoIZ/ZZBkV7+hidjychRDeSKFuoHM/4Q9YLbM1gLogfLnRSQVQcvc4DWlheaGJ13V
	jrwkG/ruXqYhLM6U+Rhn+ArxXhNYYRTPo5hAtdx+mvKaDhwolXJhbgDTOLOuaBurjo4H
	6cqqHdq5dyKsz8IrvuKCQyu/jijlvbPa6mKRQdTYouM2ruE8WnfUtSKgiD73njE7D8g3
	R8BPlGYlCQB7Gja5Np4rkymGbCBLM9Dh2RK+B4xzrqWTku83IE7PKo3JeCVj6iY5s0Mk
	snWg==
X-Received: by 10.14.194.73 with SMTP id l49mr14524277een.99.1370037467381;
	Fri, 31 May 2013 14:57:47 -0700 (PDT)
Received: from mizar.localdomain
	(host199-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.199])
	by mx.google.com with ESMTPSA id t6sm33508991eev.14.2013.05.31.14.57.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 14:57:46 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2013 23:57:29 +0200
Message-Id: <1370037449-6982-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1370037449-6982-1-git-send-email-andrea.adami@gmail.com>
References: <1370037449-6982-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-yocto_3.8: unlock linux-yocto kernels 3.8 for Zaurus
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
X-List-Received-Date: Fri, 31 May 2013 21:57:46 -0000

* after removal of kernel 3.2 we are obliged to upgrade
* note: testing needed
* known issue: large size

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto_3.8.bbappend | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_3.8.bbappend b/recipes-kernel/linux/linux-yocto_3.8.bbappend
index b81a67d..1637c0b 100644
--- a/recipes-kernel/linux/linux-yocto_3.8.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.8.bbappend
@@ -2,12 +2,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.8:${THISDIR}/${PN}:${THISDIR}/fil
 
 COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
 
-DEFAULT_PREFERENCE_akita = "-1"
-DEFAULT_PREFERENCE_c7x0 = "-1"
-DEFAULT_PREFERENCE_collie = "-1"
-DEFAULT_PREFERENCE_poodle = "-1"
-DEFAULT_PREFERENCE_spitz = "-1"
-DEFAULT_PREFERENCE_tosa = "-1"
+DEFAULT_PREFERENCE_akita = "1"
+DEFAULT_PREFERENCE_c7x0 = "1"
+DEFAULT_PREFERENCE_collie = "1"
+DEFAULT_PREFERENCE_poodle = "1"
+DEFAULT_PREFERENCE_spitz = "1"
+DEFAULT_PREFERENCE_tosa = "1"
 
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
-- 
1.8.1.5


