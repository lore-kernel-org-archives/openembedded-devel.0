Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820C6F557FB
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 09:33:34 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15574.1776677608983443282
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 02:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=WJwoKPIl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d70c30767so2135756f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 02:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776677607; x=1777282407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfDaKm3Erg4yDWaYdRMkMdMUST6KAYYFoWJQV2cT9go=;
        b=WJwoKPIl/AmpPcMyYF4hq8f29l2qG0OG7l2z4SClIS1E34C3UrM1lx1ZTQRBbIcrHG
         CUPoo1q40vUDiR+hr4CQG5Usoioa5MTxYTbuKLfkI3bU/AJ9Kz/KlQP0fv44OFcyFf5A
         HmM3gXgurqPU1v9dk/ZYYDK5lARl2EgLtDruTIMoAVAHVi0Y/jz/3HxJEn3PGeSLJHQQ
         x23NvQAjnC+GoAUw2TY3d2zoIcgF35aXFAv7vJUMGfAVvCBSKuyTJXUwagllCIpEam4l
         Yk39jjsTHnJb6ynB4QH/n6kf947MNVRXB1vf+/AU5K2oAFcj2O7KTgDdEsBSgI8lTyHi
         NebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776677607; x=1777282407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MfDaKm3Erg4yDWaYdRMkMdMUST6KAYYFoWJQV2cT9go=;
        b=GFKddXZWaLwbSS9T59qb4qxe/NdXk5uJiZv+nrA5G364y7LeHWTQQT50tV7QhnQFId
         nbgH6B55aRptTB2eVRqAaizIXvnDDtOQU+e78M2XBvyOH6Ou1MybrDMzFtfPt9T5z3QP
         Vqb3PUAg8yvUzAGptW1olyIBu/gNJFuPBREUzGtCsesaEn2LsnwAwMojk0dxcpzW2iq7
         mTNbEFxYDiMT0KUVbKPvDGYiQ6CSNGCS1QAuLGOvOraXQOG7crwI35hXRxYlNAsL1z1I
         aaPhzjvohpVWbOm1+F+t7tlQCE7NiXjKub5pvnJ2OWHn3v394jmtMctGKJzNn2o2iU3y
         KM2Q==
X-Gm-Message-State: AOJu0YyIQP4MixoJxq5fZ62UzgUUIzMT5+9gbE5wIDfPmXWwkJtb437B
	eszUL0KTHTBNvU4QwAfHCZ2xxDGVbGc8pujlAT0Puw1YhJyiXMm71j5deDby7A==
X-Gm-Gg: AeBDievIcpKIZv2gf5SD8Gs7oyLLMjZCQ9ahFcKWFWyP6dthMpeuNTupV0uFhEv7u0z
	mGWTEBys0MTL9oQSWf5veQ3G4dRCkebeWJdkw3QFQm1/iojR2MeZXpoNa4sGWoy5OfOB6GCZVfw
	mQLeaeAi3VBp5HfgvAIwXdqUO9OCGIG4KmiXYaD5tGe+08Ye95DGtdeBd6NuY8JmHqZgFhk/BBj
	CgRaYj8hgJLd9aK5DsoWAGzTSGmw67+ZWxNQ9XkW0PYX4qct2hyyc612kQ+0CgHk4xDosUp/d7T
	AdYF6zolufl7nOf3OHt+bmeHtCo2PW+p3AX+MPcMXHOKyvF9H0xxEkhMQQvNnb5fxXFfxryVZRm
	+mWLxly7oaEeWWQ7E40Z7ATgHGvl9lDzCd7Hrf62BWKtKAPYbAkiBT6YH4VLIFafea563aOtEur
	L0oX3zxZJOXr+cUQ8+/lx14Xh4Uc4vct8=
X-Received: by 2002:a5d:6f14:0:b0:43d:7086:b03 with SMTP id ffacd0b85a97d-43fe4032b76mr16197692f8f.1.1776677607168;
        Mon, 20 Apr 2026 02:33:27 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm26577488f8f.34.2026.04.20.02.33.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:33:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 4/8] python3-grpcio: ignore CVE-2026-33186
Date: Mon, 20 Apr 2026 11:33:19 +0200
Message-ID: <20260420093323.357053-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420093323.357053-1-skandigraun@gmail.com>
References: <20260420093323.357053-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 09:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126490

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-33186

The vulnerability only affects the Go implememtation of the library,
not the Python one. Ignore this CVE due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index 6ac6a72d25..d9ec337427 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -50,3 +50,4 @@ BBCLASSEXTEND = "native nativesdk"
 CCACHE_DISABLE = "1"
 
 CVE_PRODUCT += "grpc:grpc"
+CVE_STATUS[CVE-2026-33186] = "cpe-incorrect: the vulnerabilty affects only the go implementation"

