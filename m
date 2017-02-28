Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8013B72F3F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 21:25:41 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id u188so5962281qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:25:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z9OV2ncAvXujCIUscMBxWDOzdQdO8dcysrM+8DIe2XA=;
	b=lHMWr9paPTjcnJJXPNX+UBFBnzn+OW2dT7WPYuEzCTN8f0ynCmgSTvE7GzZrZoQSn/
	b6DbHihni5t9YncC62h/6tixPoAKvWsmvqT2O8ItBG3s5mm+CKeB+jNGGUrRQZ2GPP4P
	04B3ta95YMhi6jbVDlWDvKXW1LIG+ptvNXybTo5CwzshnkoOemaTT3EQYVMwFIlEzrdT
	vLl/rjZRDjN4S1f/LOdploj2LiiIMup8PcV1+ZjLD4In5/zZhv6cnkbRjZvBcHHNv7aA
	Kmr6v/uUw7O2V6bg5dG9ezFmOpNDtNBRZx1Q+QkLcFcANehiQyJLDW+CKsUES3PcUWW1
	0EpA==
X-Gm-Message-State: AMke39kAbulA7Kq4cKcGqyfLIuEEA17fUqoGhD0a/TkBT2sLe9sk3w3G+KbiLt6QBarYEg==
X-Received: by 10.200.41.198 with SMTP id 6mr5692231qtt.130.1488317142333;
	Tue, 28 Feb 2017 13:25:42 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	q66sm1768547qkd.69.2017.02.28.13.25.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 13:25:41 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 16:25:34 -0500
Message-Id: <1488317134-20766-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-ruby][PATCH] bundler: resolve build issues with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 21:25:41 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index f2d8f3c..8388cc3 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -26,8 +26,8 @@ SRC_URI = " \
 
 inherit ruby
 
+DEPENDS += "zlib"
+
 RDEPENDS_${PN} = "git"
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[bundler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640/"
-- 
2.7.4


