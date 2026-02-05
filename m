Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D859EE91274
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 07:00:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15255.1770274804253137403
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 23:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XNPYjjD4;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so5823495e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 23:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770274803; x=1770879603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xzwTi3mZMjMHE440nZCJfFvigTxW9L+9yR4YDwrtmDw=;
        b=XNPYjjD4FjNbUel5U4FDWDs4U6vIzAc7BmKiqWOVBb72dAF0zbhGVdUK4M0Ha4k4xK
         R+2wGGKi6cZWIpgkKUuJ4a4RKpwhJfg5n+gANZe4xmZ7pNuzn3QTu1Yos5NHAqdjQVsO
         ISIzQ6NqofzwgQPSZ4erytpAgia1LvspCDix9/h6nQzK32oV6KHfVSPFChxT6n/RWae1
         JUKP99zzP9kOYGW76K0jgxBL3WtcRk6cOAQr/Z5+2pAEgOBpkX8WSzfEoh1CwGq1rUWO
         4nDzcrTWraT7Ntzr8ZVTrcoFhXVO1EBwkFFhBfqj8fk9i2UMk9MrGhVl0G+mudTmb/5K
         JxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770274803; x=1770879603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xzwTi3mZMjMHE440nZCJfFvigTxW9L+9yR4YDwrtmDw=;
        b=GFaMElVR1tXNJQDfoNIXrObaPDUhcAAo3ukj2Lu2+ZseMdvuYZd5hICzqujj9LKE/m
         SpnNHxUE9bVO4G0hdL8WIWu1yc1btNfdPpYN/NGXZwMoQKBgqNzt0ciQaZxaBCBIGHYa
         PRdiQQic0mK3tfnU915YZkj+4b4DnUWPo6ukBeJDj3A7aPZnejBkB6FHMZ0kBfaCgOoc
         287oD0VAN6la6U9mWdEUrx5oPkKMVFY56/os1gWzeN4h1zCUfbx+3O5KCTL/2wvl7+Sd
         tcyLRHQe6D+VN8LUSAVm4ztXsrxaKfS99TcaA+lU3vI2j4Sx3ogkvz8nbVtMF+m7FYrX
         W7IQ==
X-Gm-Message-State: AOJu0YyE2EKTZ2vNq2RAMtcA1zQ0KcM/9ipoAJUa53+y+HeLfhmVKz1l
	tJNA8FDWljRK4UcDYmLkRnMDqddwqUwTEkkChIvXqq/x/eXQhoLa7xe/8IFGxQ==
X-Gm-Gg: AZuq6aKXJkOLuerx0SNer3sYCWJeWyZt9Hnu4YqxFX/on/Trr+Nvmx/MQsAKEu1hZx9
	SZxBPEA2IeTb+DRDgYBef6+jhHTHGnA/gmTaunI9CTrBCscOVlhQyo92zsQ4yrBW76mvYLyorXT
	/8EGmyfe6CN9Pw7oQEDTab7XnsZgLFl3o1V86qMGY+fpzujVJe0FVTOsjFQK582QqKrr6YkfIm4
	lpfdqTXxZ4uHG8ia9w/uNDrficUCaFVEdmwFg8Ri76vrjU2lhq3UTO/H/ay+nkbFfIF6rQgJgDr
	KGYMBKovHeLuYwWE29ylRnKWs0Siwl6q7LP16CDEB0zorFsP7DT98q6RncQ/9chuGp3+csfRPCQ
	IfK0dzUpgsOmN7elnkqfPfLZ3CKe1RuSNzpSTXmIwgcqR14AwgmWEWgH289469+YDEyl+w2s2QG
	lN+MCCGfFF
X-Received: by 2002:a05:600c:19cd:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-4830e950d34mr78036245e9.16.1770274802088;
        Wed, 04 Feb 2026 23:00:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86bebsm34545505e9.10.2026.02.04.23.00.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 23:00:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][whinlatter][PATCH 08/20] python3-marshmallow: upgrade 4.1.1 -> 4.1.2
Date: Thu,  5 Feb 2026 07:59:43 +0100
Message-ID: <20260205065955.1267785-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205065955.1267785-1-skandigraun@gmail.com>
References: <20260205065955.1267785-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 07:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124184

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Merge error store messages without rebuilding collections.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 54691ea40a98cc617d374d8368c665d103ceaf07)

Contains fix for CVE-2025-68480

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ython3-marshmallow_4.1.1.bb => python3-marshmallow_4.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.1.bb => python3-marshmallow_4.1.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
index 2919897dc3..f3a905a36c 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.1.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "550aa14b619072f0a8d8184911b3f1021c5c32587fb27318ddf81ce0d0029c9d"
+SRC_URI[sha256sum] = "083f250643d2e75fd363f256aeb6b1af369a7513ad37647ce4a601f6966e3ba5"
 
 inherit python_flit_core pypi ptest-python-pytest
 

