Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BDCC7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:53 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.11461.1685531626674169664
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cKtHLXCB;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-565ca65e7ffso37675027b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531625; x=1688123625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77nuSSdWh8UWa+iD0D3+A1eF8uffA+Xpoh8QHf3Ql+0=;
        b=cKtHLXCBCSotqxYS5Ts+mp2AGSuYqnrAoaUF+1v5nw1714mAItpeAkIeFhlNQSuBwG
         R2QF2/Z/fuHAJ2nZ634zJ4Q3yhK0dP+4pEFRBMHo+1Q0DD6OXohqLTCj5/i72dyXtO6j
         BY4b8Zv6/aKsmFR4rElJFUQ2FLW4tjRDnwej/Mf9LBv87AfyfxcxojBHdABs1NOYLUn/
         aPdq+hJtGcKiqLZV2CQAO+xx2Sb7j9aIZn0k5vitQ67xLrNODyBKbdxmM7JH00KPavOE
         hLIrZbW2iL0zCZfvEexeqGCqPXv+sswa6gY4mI57HdA0d4o7gEK//JwasbpMvyA9zGHA
         1fLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531625; x=1688123625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77nuSSdWh8UWa+iD0D3+A1eF8uffA+Xpoh8QHf3Ql+0=;
        b=EXbtZwM77THmpEGjgs5uKcXIuoQYo622ZIGfjz/lNWczHSEZbpNlw2z4L0g6kLdutn
         lI8zyB/gS5ioC5cGhg/U0PKYu/CTSY9+jszdip4YtXBaubhSFrJQushL9lCfWuFScSa+
         Ajch1ISNZbwSBDWMwLXDd6CW+WHwXdTFBWMIYeR20z+twPdQjP+a9XCNJ9BleVUImwJl
         3kI1E6JQHCb74hZJcvZTs4cC4OcV0kl07lqrCpis0gTz1Wy4NrHti6oDNXTfN4+6GjTK
         T62/gwQ4O8ntUs249a/g1j/ZYjDu+MU+DyCM9YYettZuGvPgbE2OE7FUJqb65ELtRdfE
         rpuA==
X-Gm-Message-State: AC+VfDy84ySYsD8yVOLpEkxscMjDYn2hPgSNVxGrsc3Y6H25kTZW6cmN
	bJcuHnQxt7BrfyeeRRHjcSKAN2MFl0Q=
X-Google-Smtp-Source: ACHHUZ7n4foWxDxMXiEGBjHzXaS0qkFYfXNPtb391NgmwiSGrXhof7nMRYGvW2e8R+M+fVqnRvO+YA==
X-Received: by 2002:a81:92d0:0:b0:55a:52e3:da37 with SMTP id j199-20020a8192d0000000b0055a52e3da37mr5109297ywg.10.1685531624206;
        Wed, 31 May 2023 04:13:44 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 34/36] vlan: Pass CFLAGS via CCFLAGS
Date: Wed, 31 May 2023 07:13:07 -0400
Message-Id: <20230531111309.2454603-34-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103064

From: Khem Raj <raj.khem@gmail.com>

CCFLAGS is used in Make rules which will ensure file remapping options
are used when compiling

Fixes
WARNING: vlan-1.9-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/vconfig.vlan in package vlan-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 26842ecc3b4811fd39a65c55af0711777f41fdbb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
index 035d4946f1..b478692e39 100644
--- a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -28,7 +28,7 @@ do_configure:append () {
 
 # ignore strip to avoid yocto errors in stripping
 do_compile () {
-    oe_runmake PLATFORM=ARM 'STRIP=echo' all
+    oe_runmake PLATFORM=ARM 'STRIP=echo' CCFLAGS="${CFLAGS}" all
 }
 
 do_install () {
-- 
2.25.1


