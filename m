Return-Path: <potin.lai.pt@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA862ECAAD6
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:11:32 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.32706.1661479886992426956
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4dYadPX;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: potin.lai.pt@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u22so372112plq.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gN+Dw7lCophMPQwxAgpaccduATksJjAA5KIcKcwoEjg=;
        b=S4dYadPXNIXtkcIXZgr5LK2IxS3lQ8Bj5UPbGtn+hhaPtGMOUX3BJe71cdvEWfKW4E
         ohWfjEpX0BXjbYO7lKzYLnS214aea+on2QBxne/KUs5azcIbxbDdviVQf+ZmZdL2/feW
         2jgb3nd2c1XES/Az1I1JW0Hj8UgnUGAwvTUOpZZpnRzSFKTRQegAN2tZOW3dmwNH/g/U
         kOS0ahDkuZW+p9+QTPU/3PXN+OgQ1OkgYOlsvHi6CDF9PuAYXEVXIkbGVX8VQWffTXk7
         0v+b66wN+oC3gdpqJSNdUKKFQt078wqWEvyuovi02yvRS1AD+hPgnCqu9r7x20PAR9KW
         XdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gN+Dw7lCophMPQwxAgpaccduATksJjAA5KIcKcwoEjg=;
        b=5BgwhsIrD9/06P13UTCnafbCRnbghn+kBTHZUn5Kj2yslfumwmr2VgWqD1X2dpgOM3
         /EZCjIX8uwdk6hubWUgFzpHSKrTqTyaW2x0dxjcVTMU1HOsWHdEjQIskzh72wl7iaimv
         8+2TZDwwCKEhvlPxnryccHj6ZEcQlYArXckrsBfysoMOA6xqRvnspFvI92coI4IIk9y3
         ptwrWPCPcGrPdud79iy0WIQyLCI7ZdOyCmSRzK+ZgkHns3iwxtmo8zv+rUMPJ72ZT/he
         Z+ToLhve2JslaMCWk0V5wkwP5b1LvLHcVbaKyPvimJo2Y3jYt5lYTtE9VR8UkAF+35or
         OFdg==
X-Gm-Message-State: ACgBeo3S9iiB+OB+Y3WxIiIaG2Q5IGkj7VtBNAHZ50XwYAtIWamF1zTq
	mDjF2XO1KK+X4Z1tuDn++MC8ND4t6VDZDQ==
X-Google-Smtp-Source: 
 AA6agR4Mvb4+rX8QsX2lUZCVPzbx2LeqQ/63LQQKWUyASTXlJ3q9BTMZ1w3TpO2c98Gq3BKXyv1QHg==
X-Received: by 2002:a17:902:f651:b0:174:3c03:6be3 with SMTP id
 m17-20020a170902f65100b001743c036be3mr560337plg.113.1661479886038;
        Thu, 25 Aug 2022 19:11:26 -0700 (PDT)
Received: from localhost.localdomain (125-228-123-29.hinet-ip.hinet.net.
 [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id
 z75-20020a63334e000000b0041a67913d5bsm250180pgz.71.2022.08.25.19.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:11:25 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>,
	Potin Lai <potin.lai.pt@gmail.com>
Subject: [meta-oe][PATCH 2/7] libimobiledevice-glue: SRCREV bump
 bc6c44b..d2ff796
Date: Fri, 26 Aug 2022 01:32:22 +0000
Message-Id: <20220826013227.181910-3-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220826013227.181910-1-potin.lai.pt@gmail.com>
References: <20220826013227.181910-1-potin.lai.pt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:11:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98443

Changelogs:
==========
d2ff796 termcolors: Rename COLOR_* macros to FG_* due to conflict with ncurses
c2e237a [clang-tidy] Do not use else after return/break/continue
1c7619d [clang-tidy] utils: Fix too small loop variable
c6ae88f [clang-tidy] use uppercase numeric literals
00131b5 termcolors: Add missing stdio.h include

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../libimobiledevice-glue/libimobiledevice-glue_git.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
index 6d872b9f8..7e9299c9f 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libplist"
 
 PV = "1.0.0+git${SRCPV}"
 
-SRCREV = "bc6c44b92091c9587a9bed0ed3f2c3248bfd13b3"
+SRCREV = "d2ff7969dcd0a12e4f18f63dab03e6cd03054fcb"
 SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.31.1


