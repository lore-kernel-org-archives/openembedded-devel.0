Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 246FA75470
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 12:45:12 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id v17-v6so8952630qkb.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 05:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9F8rUlHojpQqJNY4aIOkkpPJdTiYGUQXrnW5zyLybmg=;
	b=MWy+i/876w95d8AQaLLs6DXC2MroaYh68r1GHVkgT6ppjD8UWjgcNDYuPSdk/KlyeE
	Z+gW/kGmIZx1yoSDycNvaQ/oCdxrkfuYQ0gSFrOnCQ0D5qvlroa2TSAyO2CvMbRSD8ST
	aVffU6xazFwYyjx5/+h+ZXkjZdlkVkxJxqeH5aDxyJDR7VmWATMiaWNz2upxCyI2SArj
	rFyI2ezunj/nhMQj846rELpVEnlKuDVd+AXC1jS3+c8sbfKizP/wU3R5vDiG9Db3jLAv
	yxTk07eja4y41eYlSAGUxpLuy48yKO03/JFVHc/9hfs5s4iIxUcqu+zhedSrF0JDjXY8
	nKcg==
X-Gm-Message-State: APt69E1RRPZBIkEikmM1PjwCDbm75+Z5dDrMkPQEAnsYIPuYas/3mS1n
	/f7ppCE6YAmRV7q91gkLnl3lM4wL
X-Google-Smtp-Source: AAOMgpc5Ua9k57tTPkrGOTzPP8aLlqME0XySOW4Wl2CFy5sxDX6ImiLGzUvLT2MCra/PCeuBCBwvUg==
X-Received: by 2002:a37:d98f:: with SMTP id
	q15-v6mr21710706qkl.167.1531226713627; 
	Tue, 10 Jul 2018 05:45:13 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	18-v6sm13824906qtw.43.2018.07.10.05.45.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 05:45:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 08:44:58 -0400
Message-Id: <1531226698-12693-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] hiawatha: use the correct CMAKE flag to disable TLS
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
X-List-Received-Date: Tue, 10 Jul 2018 12:45:13 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
index 4c3ca55..a6926d8 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_10.7.bb
@@ -23,7 +23,7 @@ inherit cmake update-rc.d systemd
 EXTRA_OECMAKE = " -DENABLE_IPV6=OFF \
                   -DENABLE_CACHE=OFF \
                   -DENABLE_DEBUG=OFF \
-                  -DENABLE_SSL=OFF \
+                  -DENABLE_TLS=OFF \
                   -DENABLE_TOOLKIT=OFF \
                   -DENABLE_CHROOT=OFF \
                   -DENABLE_XSLT=ON \
-- 
2.7.4


