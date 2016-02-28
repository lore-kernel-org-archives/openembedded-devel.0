Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id E4CAA771CF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 22:08:32 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id l68so38359428wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 14:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vU2AvHbX8U1bYjoCvKME6nefvdHSSZ/zHjZ0Zus9tAg=;
	b=Lo3eU5Dq+dUsC6ilkQdMpFJ98wB5MWzWFVS1ZxucX9vucyhbo4aFeh3872CGmv5vy4
	b2Izu7ZpRDT9JhgpYvRTGpeSLi2m44HBhS3apMjLxV5YYJdZJkjhX+3+MCY1HzPt43Dk
	zL4GCGt7T6eRxRI8ZqF7DazutDV/eO+hOD6SdCmK386jgw4p/xc38UCqEKQJXWVzP6Zv
	SOLEINh1R2IUQioFgp57TEdrYeMxm8+q+a85C7jAWvzfBrkp7foiYbfLxXhehAru1L0a
	ZTHV1+VftDodNpoYixUB05VcUtkiqUEwmLD1dRvd1Of2Nk6JzaaRhPHlihnYRIel36H5
	bGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vU2AvHbX8U1bYjoCvKME6nefvdHSSZ/zHjZ0Zus9tAg=;
	b=eW/P9Me1bY0WOwd4NYrbze+edbRgxcQ7FqOgpyh7tbLlHn9Nww7X5fzVUSQQqfeAgn
	xZIry21yFVfaItTVyM7a68o2wgRYphiDoG51EhQI+Pu4TcpHUOk6TSBTaGG6h71LQE09
	Kh1ezS6UUIoxYHd379gL5dUQqJV3zqvqnQMYA6ChiinopXL1NgkJb4TzXdNOOgn2tiJU
	WRopAOBe6FjRDx9yjd+n+sc5wFBBr7LxM/OwIDHuXPWnTON7DUJStVR8lPwlbMbVxOet
	cI+hkqWBvF3ksqWPoSl6IcTj6QD9kAN3z4bwG1M0MHjz4XrxLNkXCNJ+bYVffEFTFU4/
	2piQ==
X-Gm-Message-State: AD7BkJJ6JLiPujt91MHCkN7VCslAEsf6xB2ZVHKI/8i7HvdgDAIyL3+6dl7vpt0MJ/2LEA==
X-Received: by 10.194.8.38 with SMTP id o6mr11795549wja.31.1456697312541;
	Sun, 28 Feb 2016 14:08:32 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	bg1sm22915940wjc.27.2016.02.28.14.08.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Feb 2016 14:08:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2016 23:10:03 +0100
Message-Id: <1456697403-19772-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-browser] chromium: fix parsing with wayland enabled
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
X-List-Received-Date: Sun, 28 Feb 2016 22:08:35 -0000

* d.getVar now takes 2 parameters, not 1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium_40.0.2214.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium_40.0.2214.91.bb b/recipes-browser/chromium/chromium_40.0.2214.91.bb
index dd42903..0942d7d 100644
--- a/recipes-browser/chromium/chromium_40.0.2214.91.bb
+++ b/recipes-browser/chromium/chromium_40.0.2214.91.bb
@@ -174,7 +174,7 @@ python add_ozone_wayland_patches() {
         d.appendVar('SRC_URI', ' file://' + upstream_patch)
     # then, add the extra patches to SRC_URI order matters;
     # extra patches may depend on the base ozone-wayland ones
-    d.appendVar('SRC_URI', ' ' + d.getVar('OZONE_WAYLAND_EXTRA_PATCHES'))
+    d.appendVar('SRC_URI', ' ' + d.getVar('OZONE_WAYLAND_EXTRA_PATCHES', False))
 }
 
 EXTRA_OEGYP =	" \
-- 
2.7.1


