Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4674172F46
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 21:25:55 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n127so5957038qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2017 13:25:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z9OV2ncAvXujCIUscMBxWDOzdQdO8dcysrM+8DIe2XA=;
	b=B/bPglxvwO9zlmnxghF1VVxoAB07hFmx/QXdZ8xtgtNBkAWwhJlpu6MrIIaHiWGRKs
	GaW4iqfVMOHr7lssoquDd0qoxLxsdqBfKYitpZzGAAK0OHP1oOxAQyMJ76o3nCg7vylt
	d5CfbhXWUGAQIyjwSLXrftCgqvDQFs8GgOSZze6M2MYWIaAyJliFaPufto9ty1UoSWKy
	Y0ft8jaR4k2QOQ0zQc8T9YboqmkYrimDaqdExa9lNmajbjNw5BGjB4bNUATZ4XeA99zg
	N13hzEdVknv8vwPnBMRwAW/MKDHkzryMtkvjlEl9PbV46aSzIsyj8p5ZDEjM65gWMruZ
	X9MA==
X-Gm-Message-State: AMke39kIHu8cKW4dCRjHcJrvphrbnxVskKxMgdgAGYZeyqlcsfgVYL3kQXYCzKFXTwUy8w==
X-Received: by 10.237.32.34 with SMTP id 31mr5465077qta.174.1488317157291;
	Tue, 28 Feb 2017 13:25:57 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	d191sm1811832qke.15.2017.02.28.13.25.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Feb 2017 13:25:56 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2017 16:25:50 -0500
Message-Id: <1488317150-20810-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-ruby][PATCHv2] bundler: resolve build issues with RSS
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
X-List-Received-Date: Tue, 28 Feb 2017 21:25:58 -0000

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


