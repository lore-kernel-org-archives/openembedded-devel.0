Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 45D4A6BDE3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jan 2019 01:12:51 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r10so32144032wrs.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 17:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kRpg0aPFb6Sq5OXQMGTOmA++AGAx1yXcLajKOV9tKvg=;
	b=ujOxfatrgu+k61SxeALA09P2aghTb4A7BcwAR2UTPgjA15kE5RnjwUykyvLUlI0vg/
	Oqgdh42SvAovxdo3DrY4IFBWY/DIWG5kL/xGpSr8Hn60nSd/O/AD1jovW3H+d01pVSJW
	Mjzhiqj3a6mxAGLm5lLf7SWffOCGX5+gmvblbrqEjzGaSvQVvrIC/Sdbhk78rAtprtR9
	XboO4nzSXS4p7dPu57HwNMoa6R71o+DelwaseEDAKXOQXJxAkXjMXGUXeoh2qcB2v+Jp
	HBVX7ugDINPETRYHzZ1/IqJK1qDuGHlPygfV44sSz55DoL8UhHc4hFBwBinXIN2vunmZ
	UROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kRpg0aPFb6Sq5OXQMGTOmA++AGAx1yXcLajKOV9tKvg=;
	b=oV4pVHpNhqXCSdWOOuc7lt017T9vHntSI2wOH4qxCHzN5pSKn5gGqkBUI8WD0aiE/g
	VAH3aSUA90t9G/xen4lfL97hsHnRGPx0xjo/aW0zOTZBeV7PW9O/70fvhjo3pwmoz0qy
	INmz0up80WOcKRmWjCAPa4r/JpaA1CfEMsjaEsGxwCUtN83E6JPvvz7QKYwr1m5sZaAN
	J/ulFAa5ykeTX66BudrWkRW1gWl7tndb9wDeCMGCuymu+DV8c29I6qWRdzcth1uVJ2Lm
	23us7bFC90xgQnlFFiSUVQZg0420ODaDlM36yMP2dx0P8v2nzBnvWb/NlXN2lmn8W4Qg
	XiVw==
X-Gm-Message-State: AJcUukf4B3YsBAt22HYDdLhnhF1GAa+eX37hY8oIfpA/b+hT2Y7ozBjL
	WQnL9fcafi2BoVWKaDjwREl5yX43
X-Google-Smtp-Source: ALg8bN4aBOsOKweCsEIVrWzVx1+XCsaQ5eUXCGxWg9QzJvnyeoWN6qS+tMZc5mRkES7IVBoD7ytupg==
X-Received: by 2002:a5d:4c8a:: with SMTP id z10mr38657717wrs.75.1546477971727; 
	Wed, 02 Jan 2019 17:12:51 -0800 (PST)
Received: from localhost.localdomain
	(p200300F07BC022001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:2200:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	c12sm42400512wrs.82.2019.01.02.17.12.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 17:12:51 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2019 02:12:19 +0100
Message-Id: <20190103011222.7686-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190103011222.7686-1-schnitzeltony@gmail.com>
References: <20190103011222.7686-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] xfce4-appfinder: upgrade 4.13.1 -> 4.13.2
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
X-List-Received-Date: Thu, 03 Jan 2019 01:12:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{xfce4-appfinder_4.13.1.bb => xfce4-appfinder_4.13.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.13.1.bb => xfce4-appfinder_4.13.2.bb} (62%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.1.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.2.bb
similarity index 62%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.1.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.2.bb
index 0336f54ba..e9f6e28b4 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.13.2.bb
@@ -8,7 +8,7 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "9e2a1f9b4ae3183c461b79891224c33f"
-SRC_URI[sha256sum] = "5cabb27bbe0a0864b785e1a38535a91516763e38d6bff41a3915a61d28254b03"
+SRC_URI[md5sum] = "8b4c2ab413748fcd0cc51444418d5af3"
+SRC_URI[sha256sum] = "fd774acbcab08dbb88bcbf28eecf73ec9f55b13e1f2058021b63f703c4989d97"
 
-FILES_${PN} += "${datadir}/appdata"
+FILES_${PN} += "${datadir}/metainfo"
-- 
2.20.1


