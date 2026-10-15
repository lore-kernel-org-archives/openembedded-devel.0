Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C73CC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32850.1792043090512042850
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l5sJzzoS;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e6038cebefso36462285ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043090; x=1792647890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bEDQS+kx9VMgq5JbOjminOwY+7UtO3rsA4XnZSG/ZsI=;
        b=l5sJzzoSYUbN/VDfivt4vIU/zfzNfDTSbo1HcNRyckCZ/4r82V6XkqGPiba+8j9yU7
         eB5Kr/dN1JF/VDfxk4op0tz3So4umHnXFXyeXXZetcRzPutnU3309tHX/POZov1+JCzv
         9LKssJlcVWVkiPiZBGuIalnP/7XvHKlXbNgtPWM7B817Pft66dO52N4s6osgNR0YbTVU
         Y1F+4e4JkFPokZ3XOw9OlsWINoaYq2T5vM+MMfStc/TFJbPuUI4w3M4jXnlh/cuoqhYh
         vXHPxhCqMxYXwx5Ec9nIKijqeEpAfj86J11AWsqO6Fj5RYVLBU8OPDqE+fwhp4vKRMBv
         FNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043090; x=1792647890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bEDQS+kx9VMgq5JbOjminOwY+7UtO3rsA4XnZSG/ZsI=;
        b=mGXhAub/N24dLkqIM3RgpazU9NCcmx3IXDFMBD5qgvT+HJi31+5R0vmo2Hwa8qOPAm
         0QJSrXEeMuOp1TijuM54L3922c1WZu4aUKkWXkFznX40Os1C6S8YbuG840ysGrnGor8Z
         gnNRfArxEH0yhR7k44JhJYlaZ2awQhVO91499OC9uYg0Qjer0vvI4GzauZzSRb07/6ap
         +Fn9vgHZmdD80gtZQuwtgUuVgN6ne6GNzuFedi9yTPmqpehs0Kw3DX+mezCrfTqftW3p
         B/OK3zupG/fwdbHAkM/CbhcNFDxKNGlPT7YR+2Bb09E8eUnpBQEiOBbe8tYFWFhp+VhK
         nSbw==
X-Gm-Message-State: AFq9FYLd/WRNFlU9giVoGS840127riGr3bqvCJ4kxpzLxJncPAM51LBJ
	JlAB97WDABONFu2Fg8Vo7JquC6LM9SLLUC0o2WAMzUuLwRMl7F0eNX4T43h0kw==
X-Gm-Gg: AYBFou2zJTt5kxyHrvlxJWMTo8luEtdOcXKCwn7fwq3w+SuOvcUT2rNFyLihDRfhybY
	80B7otOnEbvzU4pvPNFBOmRuciFOQtbPeD9BwBmsU1uNzfYa5IkAeci6UNOFHckkPp3NlkOE8/q
	wlD533IVehdwt4dBt7l5GMbiY8MQnjOImv7quh7e6fgL6hWslDiFbFqB+d9m2Be6CRUgcJJxdrY
	2mDDlfIOCRt93tUuL8+MW9PPH0Mf2CkqY5jGOb62I/lGt2ybLThd4b8zzzQk2Z6fZi4Cwkjqs69
	Ebaq5mqb+PSbX4diqhcrzQnxpDDERDC12MbtDgu8wVss3obyLxeU1vCnFbsMByjEC6/V3l+czS9
	tq+o5gtEXdBkeUSjFSUBUCH+sWLllpCpRLX4z07mWOkkai7RNHemVLzG1P19MGhWyVjxMTt0i9Z
	I+Xqr1381c+NTgOOSy3hl3UzD/p6eALOMK/Y6SMfaXphR1XCZl4/hK50zWQvK/UJB30ucAEe6m5
	7+lwxzHy3vMV76vbtoIDt4=
X-Received: by 2002:a17:902:cec2:b0:2e6:1715:e48d with SMTP id d9443c01a7336-2e842ac8863mr172177035ad.35.1792043089753;
        Wed, 14 Oct 2026 22:44:49 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 56/82] python3-eventlet: mark CVE-2023-29483 fixed
Date: Thu, 15 Oct 2026 18:41:44 +1300
Message-ID: <183033afe8737f3bea8f7f864bb3452fc30142c0.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130976

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix[1] for the CVE is part of the upstream version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-29483

[1]https://github.com/eventlet/eventlet/commit/51e3c4928d4938beb576eff34f3bf97e6e64e6b4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 47b2ce9cc77297c740ecf50d00d6956f5a867144)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
index 3292950e2c..67a69b1478 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} += " \
 	python3-dnspython \
 	python3-greenlet \
 "
+
+CVE_STATUS[CVE-2023-29483] = "fixed-version: fixed since v0.35.2"

