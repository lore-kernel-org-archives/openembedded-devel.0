Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1P8vI4-0007of-5p
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 15:35:08 +0200
Received: by yxt3 with SMTP id 3so2496173yxt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 06:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Wj7v0hfHf4CZtrXYPXZVE24SEqYZNWMTzyLecFViRB4=;
	b=hxnGt1V7oSn9hP6nmZ9iJC80jUddUIuy3pzpTi3ORxWwRU7oY7A62Oh4revTqdE7ZF
	fRvKCOObSXxB9QgPGh1k9qD3UYaIUJ2t4afs6GfUKHuht74cW2sY7mh3HywSQyLhb276
	+KWWCvyRY9Q7nmhfqPhwKJKGcDFe1wlvqF5eM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=v5NRtjhA091t6M6Nlk3ni7SGkRu630r/BMZ0dztIF1WwplIqE366Uq1REsuF7izgyE
	mWwhw20u0I3/YRS5e3mZpPJUg30ALm5IQhRsgkrL2d4YbGlwm6Jlpbk7cxlfP0n0P/Xb
	P5hOpygs7s3+RNLxq1ivqG76yo9mMTIYhSDU4=
Received: by 10.151.21.21 with SMTP id y21mr3709976ybi.325.1287668044993;
	Thu, 21 Oct 2010 06:34:04 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p38sm7984809ybk.16.2010.10.21.06.34.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Oct 2010 06:34:04 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Oct 2010 08:33:29 -0500
Message-Id: <1287668010-11310-22-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
References: <1287668010-11310-1-git-send-email-Chase.Maupin@ti.com>
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 21/22] x-load: update package LICENSE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Oct 2010 13:35:10 -0000

* Update the LICENSE fields to reflect the licensing used in
  the source code.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/x-load/signgp.bb  |    2 +-
 recipes/x-load/x-load.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/x-load/signgp.bb b/recipes/x-load/signgp.bb
index 8ee36b5..8eea85c 100644
--- a/recipes/x-load/signgp.bb
+++ b/recipes/x-load/signgp.bb
@@ -1,4 +1,4 @@
-LICENSE = "BSD"
+LICENSE = "NewBSD"
 DESCRIPTION = "Tool to sign omap3 x-loader images"
 
 PR = "r4"
diff --git a/recipes/x-load/x-load.inc b/recipes/x-load/x-load.inc
index 553ef58..4e981b7 100644
--- a/recipes/x-load/x-load.inc
+++ b/recipes/x-load/x-load.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "x-load bootloader loader"
 SECTION = "bootloaders"
 PRIORITY = "optional"
-LICENSE = "GPL"
+LICENSE = "GPLv2+"
 
 DEPENDS = "signgp-native"
 
-- 
1.7.0.4



