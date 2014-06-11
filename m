Return-Path: <eduardo@monkey.io>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8349465D32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 23:21:15 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jw12so956965veb.25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 16:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CVuXBVpICOaIFBSqVAQOSa5mR8Fn1tFUt7OogfWqssQ=;
	b=aUzQPoOBhbG1pNW4mm0T0rknnXotXRDd3biIWwsn582UbcczIJqdC7A/pF//YbBiNn
	dEB265wtL/qNVJmW4hKar54SIOT9vg09+345BoXWWhL+nFigZq9diAaozys+pqn7HEO7
	sN9/vvbVz4yJRumf3UC69Rxj7949NXnLdYzCGYhmPnrqm1VaeQqJNL9KVSudIlpAoY7J
	tEs5FlIluK8GK6THU10F+6jgwXTJGc9jjXXw+Ot5Y26v/3ymbDOHQ/o+dzCOx3LV86WL
	rAOh+LAO9nw7No3takLprCuIt4N2/7f7i4xHPiux9HGUx7m8yOeUIwl0oQesPLvekXz5
	zoyA==
X-Gm-Message-State: ALoCoQmhIZYerkegl+NAipPfk2cbVKbqfkwL0W5MZIp8FPLSHTJI/zqIW62B+cErRD3XbrgQ3gEq
X-Received: by 10.220.69.72 with SMTP id y8mr40616776vci.21.1402528875968;
	Wed, 11 Jun 2014 16:21:15 -0700 (PDT)
Received: from monotop.amnet.co.cr ([186.32.221.184])
	by mx.google.com with ESMTPSA id av3sm49050649vdd.6.2014.06.11.16.21.13
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jun 2014 16:21:15 -0700 (PDT)
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jun 2014 17:20:46 -0600
Message-Id: <1402528846-26715-1-git-send-email-eduardo@monkey.io>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] monkey: fix broken separate build with workaround.
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
X-List-Received-Date: Wed, 11 Jun 2014 23:21:23 -0000

This patch make use of autotools-brokensep on main
recipe to avoid a broken build when using a different
build directory.

monkey-yocto/f15c9e7cd9143ce8486ae5e78db9092238c3d0ec

Signed-off-by: Eduardo Silva <eduardo@monkey.io>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
index 07a202f..6fa1b77 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
@@ -24,7 +24,7 @@ EXTRA_OECONF = " \
              --malloc-libc \
 "
 
-inherit autotools pkgconfig update-rc.d systemd
+inherit autotools-brokensep pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "monkey"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
1.9.1


