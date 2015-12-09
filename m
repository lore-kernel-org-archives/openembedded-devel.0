Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E528D601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 17:41:39 +0000 (UTC)
Received: by wmec201 with SMTP id c201so84564857wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 09:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KkJFRvEiuracIm26IdpOVnjpmOVQlveDrHvIJffO5xk=;
	b=THlRc5sfLiH6qUqppicvdhvybtMY59uyI/J4OBx3FXUUb17LVaDYNM/W1aN1lehuU1
	j0hsE76KCp/WHxmmMAAB1Iz9uPsFNXBRBoAEqmU6wrTsCNy5+AU2fpct8H/y4TigPbbG
	0yMlUmN8Vhw7UrCIUaUd0/NKr4qvFoA1TDnIZcSmenry/kDmDrgXXniaKVg/PnnJgmSJ
	d5EcG8bVnBjeXOuLl+mUXX5kIq3jgvK+krXr4dElXKpNrlG7lI6Yh0Pzpn44CY0OoAdm
	+GXH6acfh2yN/ovD6e6EKxT/2g0myoCjkBhK5wQLvh7ZjctYM9tCGkXz45WUGTSoZEFB
	Wigg==
X-Received: by 10.28.21.204 with SMTP id 195mr12012169wmv.17.1449682900146;
	Wed, 09 Dec 2015 09:41:40 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id h5sm8660241wjz.21.2015.12.09.09.41.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 09:41:38 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2015 10:41:19 -0700
Message-Id: <1449682880-21963-2-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2][RESEND 2/3] lowpan-tools: add missing flex/bison deps
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
X-List-Received-Date: Wed, 09 Dec 2015 17:41:40 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index f57df5d..b1bd926 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -5,7 +5,7 @@ SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "libnl python"
+DEPENDS = "flex-native bison-native libnl python"
 
 PV = "0.3.1+git${SRCPV}"
 SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
-- 
2.2.1


