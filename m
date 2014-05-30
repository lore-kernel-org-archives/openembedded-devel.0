Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id BFF6E6FE1C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 17:15:06 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id lx4so2050756iec.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 10:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=0+SwiWinHQG854kDjYzbYwKHRp2xBCnK6Rd9CWbnWzw=;
	b=R5sZlRjhgWWrdu29HK+lkcyLPd/+ecRumoCoGyDp3h7PTsdG7tcCtgZxmJISvV9boc
	uBjLYdjz8ZiH7V3k4gmG2A8y95LbAmE4O8vSoIpJ0dt0DTEhDI8uBxyNUs2dclyyT2wF
	PMI/RSQN2B+OH306pPHL7fBNzy80phT0DxEZ3nQ3PSheOzkNTV4mzWVRtV3vKOHRsrkv
	OS+kCVk7wBB7Y75zCjgcLhz6wNiArBlQTOkmjDxzmm9pNE5DDUNLjES1XNKGC8m532Bx
	GHPtKPCkPrhP1fPru+FKzS0VQ3BxnWL2rzIrOLMc0Cj4KR/ZbWoUkyZNnGFFCH7YDHuu
	v3vA==
X-Received: by 10.50.92.42 with SMTP id cj10mr7642470igb.34.1401470107287;
	Fri, 30 May 2014 10:15:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Fri, 30 May 2014 10:14:47 -0700 (PDT)
From: Chris Morgan <chmorgan@gmail.com>
Date: Fri, 30 May 2014 13:14:47 -0400
Message-ID: <CAAPegz34Fsyo7D01LMkr4DybaCYrvYZjUJ9oHVoV581eV1yO+w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] dfu-util 0.7 recipe
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
X-List-Received-Date: Fri, 30 May 2014 17:15:08 -0000
Content-Type: text/plain; charset=UTF-8

dfu-util 0.7 is the latest release of dfu-util

Signed-off-by: Chris Morgan <chmorgan@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
new file mode 100644
index 0000000..c4c030d
--- /dev/null
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -0,0 +1,6 @@
+require dfu-util.inc
+
+DEPENDS = "libusb1"
+
+SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
+SRC_URI[sha256sum] =
"f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
-- 
1.9.3

