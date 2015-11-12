Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id CDE3477262
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 20:17:36 +0000 (UTC)
Received: by wmec201 with SMTP id c201so2571098wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KkJFRvEiuracIm26IdpOVnjpmOVQlveDrHvIJffO5xk=;
	b=tdtXNaZU2h+N1jJ1MIBVHlOqmKPR2c4uq025RXxQ3QETA8xwreH6Qx3mCoKknM8yvA
	rIb8LxtZGejm8hc59aQNgK8gP+JtnLwT6uTNZC+YplgfuDXJEZMSbj+MeRbmn+vq0D4r
	7K6O6Ci9dKL7wYaCmVIyKOVfuSFj4CEB8Sqj9Hwfcb5jARnvNs+HbXfN3nymKyHQZCqI
	JjvDJCOZM8dlXze7M5kZ/nkgmEWGfFyx1Pe/N4kZrAG0htuQVPC6P03IAPSgbm0RLrNZ
	9Tk8VPXQ3ZTmBb/0Mb06LZYrD+njie35Z4odeaFnYMdz/PVDdgRUQC5nbeYZ0nOeDZHT
	WU4Q==
X-Received: by 10.194.190.19 with SMTP id gm19mr21107898wjc.0.1447359456888;
	Thu, 12 Nov 2015 12:17:36 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	u185sm276863wmu.19.2015.11.12.12.17.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 12:17:35 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 13:17:23 -0700
Message-Id: <1447359445-27258-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
References: <1447359445-27258-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 3/5] lowpan-tools: add missing flex/bison deps
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
X-List-Received-Date: Thu, 12 Nov 2015 20:17:38 -0000

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


