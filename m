Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D35DE9127D
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15344.1770274807212606650
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tps+FI40;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-482f2599980so6286305e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274805; x=1770879605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3y0NuSZqzH0vvj4XtJpZi8GiCq6BPP24adBeJlooZY=;
        b=Tps+FI40p4zRy/fQnHijfasXLq4O3BDuigZ06aeL+d8QflJRD3MuBk/3J+Zbge6wyU
         sufBZxwqeNjAYJ+AWp9N8nFxxTfVuW5HmWX2D7QIbdWGUfh2BPX31eaZ2Yi52J2lHDpo
         tl0gQniQ9DZdHB0pUZXjPEPCmBpgWwWRQkpGLJNBUDXOkUmO6ICEjAvbgt5GDqjOBlot
         0Ke0sPMmvDtJoLRmt8OtESLJPn5uF0o57FrHS9Cm51y5wj7TM6fIGiunQfVSy1UcE28I
         p5PezZ91HzHruOFbBEquenzTYtzcE8AFTeszxbsjJkYUUlaiCSxXJsCoI2RiIJDzjM8q
         kpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274805; x=1770879605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T3y0NuSZqzH0vvj4XtJpZi8GiCq6BPP24adBeJlooZY=;
        b=MnfA3BXWOpoFr1Wt2r5jeo99hEs3SCqhudEp0OqHr5NGQrEvCBKR9REqJy6EK/Ll3/
         2xsALk4tEHDXBCwKkBDUpo93q/a91zjOfg0qCLaZDaezrNqPMZo7ARSVOBoK+KBj4FJJ
         n9q+356Bg96Q7jQX1KM63aWdaALtQoEbz9DeaE1umLIGRgEoRNPtAeFV34hfV+/7vLx9
         RZiq8evW86fSM8Txld4hRMdT7xLInq1h7dJczQVm35WFsTPlv2rC4LYJlaSoVk7wtnKm
         Df54OD+0fIJ60GuylgtumzLgslZPfYhsQR+5rBTX6gh9QiAaVRiCbC40gF+f2InvnfD7
         0GTg==
X-Gm-Message-State: AOJu0Yw970tvwiKsrXXkOD7QdWMZGrxoAVgyqzNkSI3ZeZ2niGKuuex4
	r4Fa9HwViqGPH7vtb+j0301DliqVPnTOMXUnlvMgaxd7N/LfhuPRdvjEPD/P9A==
X-Gm-Gg: AZuq6aIfAHljTHEdcsgIeHfPkCKJEH5nmuEwdsX6qltf4CGvPfg8icnLHxCg6jlX5eB
	XVzWXuxARcY7Yz8hsldxdnE/2YIjb078B+jn2aodSiyvqRs+L5bCwKgTYG76kB/2U43wJ4LgrRa
	Lwz0G425XhsvNESoUpQQ58Ead3gLmen2uiSJV5EMTXPOKbvEcZAMdtJnGiDyPg+FI/xkZNkP3vl
	Leh325S0NrX56enMhCySvE8kOADuA1GWLofIQjZh8Yg5zcQ6T4Kvkg8tlb0PeTTOYEl6GGymcO/
	rjH4JNUF9H9Wfsg1R9CGsSWZ884yXE/nOOLYK0S0sQGfNsEbr+thvpiMmq8gBO/NkNSrY5DBddk
	cmK/HZkQeAmp/oA1tqjqGibnKt/Q/Mce7dGZKx6n/3+yYQNrARapxf7s54fYcx9ZDROnyeqshXM
	I+wdOqLoPQ
X-Received: by 2002:a05:600c:8183:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-4830e93ea30mr82938845e9.7.1770274804854;
        Wed, 04 Feb 2026 23:00:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 12/20] python3-tornado: upgrade 6.5.2 -> 6.5.3
Date: Thu,  5 Feb 2026 07:59:47 +0100
Message-ID: <20260205065955.1267785-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124188

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8ba97b66461e6dc9c8b073e43286932394d53ed0)

Changelog: https://github.com/tornadoweb/tornado/blob/master/docs/releases/v6.5.3.rst
- Fix CVE-2025-67724, CVE-2025-67725 and CVE-2025-67726
- Fix open redirect vulnerabilities in demos
- Fix path traversal vulnerabilites in demos

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-tornado_6.5.2.bb => python3-tornado_6.5.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.2.bb => python3-tornado_6.5.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
index f915dd5658..fedd2700a7 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "ab53c8f9a0fa351e2c0741284e06c7a45da86afb544133201c5cc8578eb076a0"
+SRC_URI[sha256sum] = "16abdeb0211796ffc73765bc0a20119712d68afeeaf93d1a3f2edf6b3aee8d5a"
 
 inherit pypi python_setuptools_build_meta
 

