Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239FCC44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:31:37 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18681.1784626290850868163
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hJ6LPZUk;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4955158f26aso17988335e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 02:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784626289; x=1785231089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fgJESMCeUAz68L3K0C3bhbguKVuqq/poqyBND7zeylI=;
        b=hJ6LPZUkIA5qqn4ZPmwKXXHoiRnNgO3W2unhZ31FoPXUxExkUReVg/bUel6NSL+sFY
         KPj7SEe5qV8XlIlBd7N8R1XW18MPWjTlfl2PVfp472og5ISgBN9bjdcYon1V1ok1nPiB
         x+g63FcpZigZpqVhd5/FOql/9Rl1+rIdOTvU97ihAvzvt/v9bJVQa1yNdxEN70HLR0wy
         /yK+icqCcd8QXl+F52au+AHqdIzSUZxUJpwhhKwsPtgj3OzORoNx+erVl3e0FIOIAjyO
         WqTbu7Ug3tpT1PATlbyOgp+MbY/T3FehqnIALT8a0bDGZvwR8XttNMgFOdKv4ClDn7yS
         n5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784626289; x=1785231089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgJESMCeUAz68L3K0C3bhbguKVuqq/poqyBND7zeylI=;
        b=ZGdmBjpIc4SqBTbOjTw98qBAmJQvGegZjh/Y5ujSc1Bm8xTp4atnMrOQIjtpjJbdud
         KB1zJ7TIWgtLv5UXDIB0+wJw2WqdaVGT40tQd/EzYLWjNot97D0/BGf7m8UliOyCgMn/
         64XhwS/6G+DROq5lCMEeK4Axaj5lT4SU2j48OQF7JGRLVAxFgXuoG/dD1CFrE7M8Y5VR
         3olhw7g+y+YgPnj5ZS5mGOCr2BfSWyeEbeyilmoCrENSGpQGXNM43kSEDc/6luMk5pDr
         2O3Sf1lSKp1Vw+TCkkO4yA7AMqpePStOcqu8N8+CwVhVO3RDnVoUTzA1Ysd53dTVKkWX
         GQWg==
X-Gm-Message-State: AOJu0Yyd0DIibd+qWmOsFyt5WERKgSFZtkVP6NJqkemBBFr3lHImiYAo
	BHEAtfqe3dhJGBzCX5PaCogAFvWt/Rd3Sc1PyECfkfwQiKuuhuS/C/hYxZJN/V3O
X-Gm-Gg: AfdE7clcT8Jv5C/IgTq123jg3lTDkRqqcWLnIBRZ8OOn7Cya9Mv33URmWU1xQFd7iFK
	UtPgh8DmFfTyFPHlEiY5oy2MOf4P9i9umr++SjAdDTOvYit3vIfbuP/j7HPkx6LWsKQIu8KGEcD
	DIZQivh0YBACjxb0dAmMeB/o/cZKDfya/on55qsdHZuaQZlvy1LQvkg8hDcSI2HfPDciC8Y85Cs
	wKlLjgAJsVwVTxgitZAInYP2TbNL8RsFXMEZqQeJcvsqjDw0+KS2FUozn6ReTEyfXWx2Oy09w/J
	f9K0wKI8ExVcsQjb0ihMphgLko8S5J6wlF36dcQLoEZZ5z533qDctI34AXW8jVPuTXEx3neAQBr
	Vbm82CN93DQpw/gXSvYq3cVOoEzmpBxDOmrvvw4keseyuCPVM+E3d5jxdzkAOPrlGUu9XrpDDza
	EnAv9pgvs7icRBpEDBf/Dq1WjKllVH7zgCozLGSUik5tMGgLGoYzjCEqrqSBykUwzoAihY4Ok=
X-Received: by 2002:a05:600c:4f93:b0:493:e404:3727 with SMTP id 5b1f17b1804b1-4954a40ebe1mr207322005e9.23.1784626288724;
        Tue, 21 Jul 2026 02:31:28 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49564011868sm69609025e9.3.2026.07.21.02.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:31:28 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] liboauth: update LICENSE format
Date: Tue, 21 Jul 2026 11:30:37 +0200
Message-ID: <20260721093039.2675786-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721093039.2675786-1-martin.jansa@gmail.com>
References: <20260721093039.2675786-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 09:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128342

From: Martin Jansa <martin.jansa@gmail.com>

Fixes:
WARNING: meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb: liboauth: LICENSE is using an old syntax and should be upgraded to: "GPL-2.0-only OR MIT"

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
index 3e3f9137cf..2bda6542ad 100644
--- a/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
+++ b/meta-oe/recipes-support/liboauth/liboauth_1.0.3.bb
@@ -3,7 +3,7 @@
 
 DESCRIPTION = "C library implementing OAuth Core RFC 5849"
 HOMEPAGE = "http://liboauth.sourceforge.net"
-LICENSE = "MIT|GPL-2.0-only"
+LICENSE = "MIT OR GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.MIT;md5=6266718a5241c045c8099d9be48817df \
                     file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SECTION = "libs"

