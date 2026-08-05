Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDBEC56206
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:56:30 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37738.1785927390151095116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HIJjcNNp;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cee9b74ee1so7308065ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785927389; x=1786532189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AdH4WlU8TeC1z4z4EIggF+SvzNwpOCVYWoPoESNP8KY=;
        b=HIJjcNNp+g816Eu7MYiQKu9h5ZwS4KcGw+hVlGZHyaSIT4tvD83HRs6SU9wWL9mJ46
         9/Ekyv26yLxYlrh0pNF7vwJmayRIo/WXJL9q+f6PaI/RdB3zEM7a6xJMfvhxxE9kcIsJ
         4rNeHlteD2MVKrvMBTEVCsOujZ5lsJQJS0/ZjIXgckIMwV7MgK7jeOxCOwkMgEZlrXHQ
         XGlcs8Ys3NKpYSAoa78Rad4AAjfJnZessNlQ8toJTdz1OfC6nzGWMcpNoYwPOn6zVw0G
         FlAibPl5cMfN3PX3Wbiv/+n+8HEDXxcBFYMVQQhe29MRXwE1zbFcvq9liXXul3SdHYEW
         Vq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785927389; x=1786532189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AdH4WlU8TeC1z4z4EIggF+SvzNwpOCVYWoPoESNP8KY=;
        b=NCWRUi7NYzu9Q1MXRVhkC4BB4aEl25jud7+aT/JWiI0zuTcE+o/fht7U/JtIO6vxYe
         cnnefZ4ezC25ftS6Lo2V7cIqV8UWf0J5a6GYGlfM152dJu3dnodDSUwnfB/1BeXL7XXJ
         dFVUB2migk/UQ4fQ27X6fIO/fXQwJ94vbOs88epxT9on1UeXEtoPzVcLvzTbaQGWDOX6
         N2Rty4FHQpMqpQejHXMJizyITFlJEhQoMQ8YO4zYpUKLpOBd4O4bRIrDebYNWy55OBn3
         vS4XhZidDjp3XQY6CKCrljGO+iZhEH0v4TGssJgcaEkSUjtiO30MaLKijsANuycFT5Kt
         Wa0Q==
X-Gm-Message-State: AOJu0Yz7G/iqIwJWTUqPfQ15eaj0s+bozpMsq5rmB40LjEtC8Pgh/0v1
	/wnyhlWU1DszRBnNnFDOD+Xs+63ExgiWg7YfAc0INFbjJAFB80kiM+FAzMkO6g==
X-Gm-Gg: AR+sD13bBNvniKlYSgREdD/yPdQJQHb4OrssluoMNafPLlaNdiNbOXVnjYjDA0xswdn
	Rvjl/0U4F1iXKXDJqigIwMfiD8/Jf94W6A+UQN8uEglAKg+ghqc2z7m+8w5LulznQxol4/ppwip
	phwJL8xpu55ov/dHUH8yuvQyctPO8SgTyJac3QQvYc6Kh23MCh5lajiSUY3AdO1aQE4pWBd2XHO
	vgCdz8m/Vfgaj7bs/lrmcx726fJl7JvaHgX2KOFd0hQdeynUG1j+6cncNsl9y+utn+qwvsKT+yE
	nHa6IqrDitH1BM/gAgW0bgrs3pnDesUS8KZHmMumgPX6Z2hlUIOIjNZxmzUUCjx5yQwtsXN507r
	G3r3p+/qb3g0ldvUUsOMjTO+QD28SWPuaYzzmhOsE1j1u7I9ylrhCcceFOWqaObxfP7fkhPvv3H
	q5QK4YOcgnvDUo/pnvinExyHfNkzG96ia5udntPTlHn2AS91xoHAZu15N2P7SNvRERV+Jhsdl92
	w==
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr7258754a91.5.1785927389446;
        Wed, 05 Aug 2026 03:56:29 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm16407166eec.24.2026.08.05.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:56:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 5/8] babeld: upgrade 1.13.1 -> 1.14
Date: Wed,  5 Aug 2026 22:56:08 +1200
Message-ID: <20260805105612.1648951-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
References: <20260805105612.1648951-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 10:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128814

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also included tag in the SRC_URI.

Changelog:
https://github.com/jech/babeld/blob/babeld-1.14/CHANGES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../babeld/{babeld_1.13.1.bb => babeld_1.14.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.13.1.bb => babeld_1.14.bb} (92%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb b/meta-networking/recipes-protocols/babeld/babeld_1.14.bb
similarity index 92%
rename from meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.14.bb
index cc69f1448a..925446a1fb 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.13.1.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.14.bb
@@ -12,8 +12,8 @@ SECTION = "net"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
-SRC_URI = "gitsm://github.com/jech/babeld.git;protocol=https;branch=master"
-SRCREV = "3d61ea1e843e2c5f9706c74d1adad4e1d24d44b9"
+SRC_URI = "gitsm://github.com/jech/babeld.git;protocol=https;branch=master;tag=${BP}"
+SRCREV = "118774d0c720cef016c0f3894ef8d24cd9cadd17"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 

