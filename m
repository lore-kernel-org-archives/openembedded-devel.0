Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1634C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:14 +0000 (UTC)
Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47659.1790553791699752037
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D7151dZG;
 spf=pass (domain: gmail.com, ip: 74.125.227.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so9837285ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553791; x=1791158591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VaCyQZKmuH0uvEINiOwxhUQZTE6HdX6ph4qUKkBhj5g=;
        b=D7151dZGsfz3xsef1wV6pM3upnPpoQfOyRZKdG9ac9xEAjzuy5dqqgpM+hBt36PhG8
         TXImRIZLYZU5Q07MyjhmbqwEYd57vH8v1j7znOglGKumybxSmdZA93ncQLRIsjFzboLV
         pcWw5QMNyWhPVsq7jdlgOGiKQNyfWaFZXbAllnqSslDDHWat89K3Xy20pl+9Znn9ol9/
         r3gDQk57fDw/lTPZe6tnmAyj71aKvsbiW+vUnKqMAcDMh0OspFWxd2dOKhfd02NHzRLi
         fmWR9ZvJOiGsOyc1CDiab9STSPVRYGdIwpjR6l6i41gkMV2WETRN1xIPT0oeTzaxCKbv
         440g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553791; x=1791158591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VaCyQZKmuH0uvEINiOwxhUQZTE6HdX6ph4qUKkBhj5g=;
        b=iiRcbBUsL7AS260EBpRxSlQ4k3ef2y5/5YrIuU4dwIGo5tTpmMn2ti1Q1fI6hDsZZj
         BgG2oCtzoMoiP2Onl7B5ccUj4u4AG5RkzRCwXJUVeEneq3VDdMX56IRa1FASZMzHgCez
         2KS9nLHgQOffQzVXXxB2GLQT9teB5+Qm/sK3phXG/UZu3hD7cDYQ0zMxD+IpmKn1SCCN
         0fpM5kdvsOeF9Xyb89cPr04/7WkVOomE80pJlMUdAVh//8lq1lzscAQrp2Wqm9n7ytXW
         XPeSJpmHFYpT8YYjPFwIKeo4Pp+EMtA29at2YGxj49R5oXC6yrhvlXNjBHtgeHRUtFqs
         hDyw==
X-Gm-Message-State: AFq9FYLMUX/LWPIV4bU9y7NI73cMC8x/MZAEAt7y4gHKHHAoWHZ+ZNtk
	ksjKcClHmodroZsr942aVOYOb1Ba+fbTwCNfWowcOits53mxbmqd02HY14MiEg==
X-Gm-Gg: AYBFou2YyLyg5QWpf4PsYj8/PUyOsEXjJ7BP5L7OQ5A+NXHYDi34SNddZDEBdn+3qsj
	NYxvIHHGD2rb08oeCye1GJlOWeul5rcTz1eiU5JIz08+DvC7J7hfrQc/snWLvC+h4aaCqygmFYA
	cLDL228I7cG58ROck28Baxzomvn97ygRZaW6V1ktr7EZrr3mj4DmwK6JmcAmszuG8M2XXUz6JuK
	+4dqCqJxfm5tCqgHIBxudxog1mWeWFc0UlPkNeOpBPhoKJ9Jig/8/Tp+zkz+PSNHil9ySFyJwEA
	932akIFtF2hbAz3HCRluSOm7DTKJC4Tlhv2yIQ9//zSbzZCBHEaIiUreC1nlt4+DmGCAZQ0ijxI
	xG+sxsjNn6SejtgYwLL8nLRQCb71I4rrXR3g0joiFE0N7Cd/iQSaSoVc+U9jaKtYb74+5UPq1H3
	tjhYPtJd2bHjMud/f1N39P5iRJQQ424i6fcKhDfjfnnuXXSqFTWCmrTH6JIRnDI4WxbJou8kVp2
	nrBIDEuUBeGJlgd9jA0Gbyt/VstzKpZagg3
X-Received: by 2002:a17:903:1968:b0:2dd:ad73:5b6f with SMTP id d9443c01a7336-2df7dab1f3amr88209645ad.31.1790553790983;
        Sun, 27 Sep 2026 17:03:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 2/30] hiawatha: upgrade 12.3 -> 12.4
Date: Mon, 28 Sep 2026 13:02:34 +1300
Message-ID: <20260928000302.2528437-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130389

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.com/hsleisink/hiawatha/-/blob/v12.4/ChangeLog?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../hiawatha/{hiawatha_12.3.bb => hiawatha_12.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_12.3.bb => hiawatha_12.4.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.3.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_12.3.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb
index fa3d0b7271..8164b3076f 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.3.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha.service \
           "
 
-SRC_URI[sha256sum] = "741c0de4a8055477ae0eca2a32832e8c694d8869e4b53a43a44a2a4e598663c8"
+SRC_URI[sha256sum] = "c80f87b5f9f04520b57af96ac52905198f96de38c3b7d988abc0f758cdd46d2e"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"

