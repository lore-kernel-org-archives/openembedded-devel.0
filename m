Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E654D65CAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 20:13:13 +0000 (UTC)
Received: by wgen6 with SMTP id n6so128248154wge.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p3k2YzGAEBJPt2crQlU84y/frrzOT0S9WaiequHfn00=;
	b=CjNVKUBxEKhwJijePxLBqR57nJmB5YuT85qXDmwsRc7WMQjxlyJhebN6rLvQd8XQqM
	HSvkJ7i8AriKxfCwA/I+/e3fnfOGIAc4llYNKrpPdKnCCiIkhRuKf5LqWR8pNhRu10pa
	qqwXILq794i4xosUOcggrAOV8sdcr3GZV3kxF1pr68ANROwD1uvQGDyrgn5d7X4lt1Zo
	hyWGX1x3FBu29+AFjzcrHxuY8ciXt00F7MfBc7gqvskVB+XM1d06zIyqz8H9UvBwuhdX
	sb9tViMhXWBFkMS7Pp/fQkCjIWBs5316kWcE3QhDhEFil/hEykQ6rwhWlUc1Itc02JNF
	WCYw==
X-Received: by 10.194.60.4 with SMTP id d4mr26123993wjr.72.1430165593946;
	Mon, 27 Apr 2015 13:13:13 -0700 (PDT)
Received: from ubuntu.ebenfeld.local (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	cf12sm30848805wjb.10.2015.04.27.13.13.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 Apr 2015 13:13:13 -0700 (PDT)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 22:12:56 +0200
Message-Id: <1430165584-5634-2-git-send-email-sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
References: <1430165584-5634-1-git-send-email-sven.ebenfeld@gmail.com>
Subject: [meta-java][PATCH v3 01/10] icedtea7-native: Add attr-native and libxslt-native as dependency
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
X-List-Received-Date: Mon, 27 Apr 2015 20:13:14 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 1f193e1..b29fd34 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -4,7 +4,7 @@ LICENSE  = "GPL-2.0-with-classpath-exception"
 INC_PR = "r1"
 
 DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
-           rhino-native ant-native \
+           rhino-native ant-native libxslt-native attr-native \
            libx11-native xproto-native libxt-native libxext-native libxrender-native \
            giflib-native jpeg-native libpng-native \
            glib-2.0-native freetype-native zlib-native \
-- 
1.9.1


