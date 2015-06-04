Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3C38A75811
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:23 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so23014128igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=unt2DIsMCqZhYNCD6LLM0HhAd5xwu5a4RJbQmRuwpyk=;
	b=ldzY/lFcNGFifLrTQy+dmL6itbF1H/VHubrWAHmYhE150/otYVwJJPb96BPWO9mMjH
	YkLZ//LZN/KGfMelKtYfMUZ9GUawiazs0fuvJhRtmXtXKe+yQORcLwxPWQvGN8LA9fYm
	mNcAYH5Jsrg2DmrllW49kLhF0oD11fl4hhbTAIy2W5U9QePc/6KqPIwTMb3vUdsS9JjO
	2zmuI3AAUWtKPzWiwacFrBa7mceGl3MdYMar+dp+qDRsjjmZY83XvzG3W7HU5SkXq0c0
	ciHfFfB+V7mhQXPIzvNzFbcnbiE0o6aHrzrxrC2LLh4itC9IqBUN4eTgThEk323mkIOY
	D+8w==
X-Received: by 10.50.112.73 with SMTP id io9mr36651513igb.18.1433445684078;
	Thu, 04 Jun 2015 12:21:24 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:22 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:01 -0700
Message-Id: <1433445666-7207-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 2/7] webkit-efl.inc: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:21:23 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-efl/recipes-efl/webkit/webkit-efl.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/webkit/webkit-efl.inc b/meta-efl/recipes-efl/webkit/webkit-efl.inc
index cf919ec..aa91572 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl.inc
+++ b/meta-efl/recipes-efl/webkit/webkit-efl.inc
@@ -52,7 +52,7 @@ do_configure_prepend_armv5() {
 
 # and disabled LLINT currently isn't supported, so restrict to armv7a and x86*
 COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_i586 = "(.*)"
+COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
-- 
1.9.1


