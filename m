Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671CAC4332F
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:50:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.17039.1652622595642501101
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JtyL2ims;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id p12so11824364pfn.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mRLj8QoIv7DG9TB13L7q0N7gFulplz8+TfepXawjDjI=;
        b=JtyL2imsCMDm7ChP6UuwR/uXXz6OUHnnzaUMqSDvAZrUQJz5h0/kB+yBEce7dWU25+
         wkV+0NBAXBxXgCvQjygfUjdBh5UbaQeTeqtiQCzGs3jzFdSd1DTpofPZ/LJOxApAAeG6
         Z9dH6QDzzbRfzisXoarg1bpYbWUmq9bHA6pn1h64xzTQ4L+89/WqQGirY7al70jXJ/If
         3Ne6ODzbMFUGw0E9sCzbqwH7U1oP2ie33wp6LEcsWzVG21n4rGJhmdBV5EP4HhJC4ZnS
         fU0gnGp6Ck1IVVH650RI09QG7LeYtx5DCpiyEdkRJ8Z06XoKgaq8+XbQKMj7ZRoMU+TT
         E1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mRLj8QoIv7DG9TB13L7q0N7gFulplz8+TfepXawjDjI=;
        b=t9PSlpTLzCzvE/0TjpXsHBFphUfU1AwHw6FsaSG5NabClOv1/EeveoPYCRPYIQYzwu
         SME8X9chJj/qMaXgge+M5Fpn4KpVSQjWlvGjjc/V9MoKTef7lNZ2LFmF/ukzubGO4g1d
         Qi3f6xsfss5Ll2WYfGg2n7fdINGwFKo+1gPyFRpwhSDtjScTj78pHQWIOsRDR0Cc9Hvr
         BNuw3gF35FIby5Q8z87w9htXjT50HTBWwG3L/LJO/c4yo1jCH/aN246nRfToczxdye93
         16TBJmCizCLikxfaEqm8xi01keXEhNCGNE3QU125GyzWeuQ+nRsWklVeRjYGmyWCog9V
         vwdg==
X-Gm-Message-State: AOAM533ZMA0HkfbrW7mG4ULDr4mFUQIYKsBFTJlF7sASAVQ3XKLERR4N
	vcGBrGhwWUquPjN80oIIFSP2jm2uFwRa9A==
X-Google-Smtp-Source: 
 ABdhPJyWwZGHSJ0ooZVKIXB9cLEFpysG9uwamQ06KZRWyxJ4t1NIKPTLM4c5nfxawabv+WYkkqrZng==
X-Received: by 2002:a63:da13:0:b0:3c6:4c0:e2f9 with SMTP id
 c19-20020a63da13000000b003c604c0e2f9mr11749308pgh.493.1652622594863;
        Sun, 15 May 2022 06:49:54 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 21/22] vboxguestdrivers: upgrade 6.1.32 -> 6.1.34
Date: Sun, 15 May 2022 06:49:21 -0700
Message-Id: 
 <316fd1b35653bd6267ec4270d2afb7dcb5220eaa.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97118

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0716b34c88e47458ef2d068474ddabfdca7fc779)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{vboxguestdrivers_6.1.32.bb => vboxguestdrivers_6.1.34.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_6.1.32.bb => vboxguestdrivers_6.1.34.bb} (97%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
similarity index 97%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
index a8cf32658c..5e0accb237 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.32.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.34.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://0001-utils-fix-build-against-5.15-libc-headers-headers.patch \
 "
 
-SRC_URI[sha256sum] = "5d11384200b4e943ad0056d2cf75980ae4bee852c89650e2914e1b34eedc2d2c"
+SRC_URI[sha256sum] = "9c3ce1829432e5b8374f950698587038f45fb0492147dc200e59edb9bb75eb49"
 
 S ?= "${WORKDIR}/vbox_module"
 S:task-patch = "${WORKDIR}/${VBOX_NAME}"
-- 
2.25.1


