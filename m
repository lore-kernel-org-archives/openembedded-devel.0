Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 16F5C77000
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:41:57 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2929334wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 17:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=uudQus3F0J4GlLRHn3vvAeFC2UadRCzPGR6AnOTKLPk=;
	b=pkN9pdQ3kXG0oM1jmjtiNTAWpZjOr0nlVJX+r8dzowfj/htOyxRZNSedKASlFHlvDR
	JGHVZSS8vg9y+IE0Go46LB4igz3gV5g3HQ4nnk9OXnf2mv0+Y40wqWf6KCj1SXTshcv6
	R6Z8xy6ol/c6Vku0MNkuZ9guLF+gO+z+4NThQJzZJcNZFO3ovwzEJrW2Tb3BNH2HDQU7
	xWhNvppk1WqGYdiewAgwYVzDM+cfggOyIveZdH577q3n4cDNdVsZejb+tpAtm9MwZ0FV
	r8JaSz/DSBHgF3DEi721w0B40FvfjpxtTupZ4V/daJLdINItwLt2m9CE+g647cmlE2af
	9pyQ==
X-Received: by 10.194.185.236 with SMTP id ff12mr55298041wjc.49.1442450517223; 
	Wed, 16 Sep 2015 17:41:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0F55.dip0.t-ipconnect.de.
	[79.223.15.85]) by smtp.googlemail.com with ESMTPSA id
	sd14sm393216wjb.36.2015.09.16.17.41.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Sep 2015 17:41:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Sep 2015 02:41:28 +0200
Message-Id: <1442450491-14912-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 16/19] polkit-group-rule.inc: remove allarch
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
X-List-Received-Date: Thu, 17 Sep 2015 00:41:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recipes using this include depend on polkit which is not allarch.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
index 3435e93..b727d00 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
@@ -1,7 +1,7 @@
 # polkit must prepare polkid group
 DEPENDS += "polkit"
 
-inherit allarch useradd
+inherit useradd
 
 do_install_prepend() {
     install -m 700 -d ${D}${sysconfdir}/polkit-1/rules.d
-- 
2.1.0


