Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A465CCEB2F7
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 18:18:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13792.1763230692952751064
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 10:18:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OhToBi1i;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so2049502f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 10:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763230691; x=1763835491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRoJhrYJvHPc33u+XCGsF7+PtCkTwN4T6nCg0XN/B4E=;
        b=OhToBi1iGPRHmhhIMJMLS4JUl598E46E8jzDSAv8abD1AaV6e1j8zY+xo9QazLbaBJ
         jbrwzhgvb4l0YVf9+cRQVRzTOqIYU+76jazIA9e+lBqlAflHppXCjQUcc+s0DdEJHCy2
         eY34YoFNiogOl/RWAxoeFXXnCzF63DN6Es+lQzNGG2PIJdWYh0LKPo0TsyuPjs1TF0Q/
         5tLdfUf9r27XM4/dxz8vxR1zsAGRY3GytERRLDrf+tRg9x8r3tVXnVJfbeC+QBJJ3b9P
         iupLgW57N6QBfD+OUaULfCqK9pWrN7khwvG/aZT9nHd/iD2dsbqC3U8XbSNgkndQ24c8
         2qwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763230691; x=1763835491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRoJhrYJvHPc33u+XCGsF7+PtCkTwN4T6nCg0XN/B4E=;
        b=nNQz1deZCsdeGawvhnMxZDcRUoQVtNpOhe4qrkv7NvBDBf3ZBQQxSdmMax8Kxu2ADs
         5LJB9jHK2fccP0YSov+LB2RMLO7odvGZ1+Ns+WJIuzfrbZvmAXfV2U3zie4d7Y5mP2Lh
         1rnNRXY4wArT/rR5KEJgnosTM22NQbvwmo0oV6F3L9L4EDTUkGuyUusWN3wD5ZVYm5h5
         PnBQg8ZlkNUaG6C9F1aYLOVip0Ob7nPw3KJ3ZwV2JDMslaQy/gS6Oo0PcRTBiPGZQYSV
         yOBu+l4Coj0PFIQh2aM9E8SufdvoL7qlVL4jGMPNSMtden6fiTJHG2pTbPLK46xtZLTi
         3oAw==
X-Gm-Message-State: AOJu0YytXPpP0kKsrcTWa9fNJz7osTHhI2ZbKHZc4AJ0VUYhGgQ4aBaa
	XoYX6hMYAJzpoLuTEmzEFxPfTHFSD8Fo7ikKxdt1J3uicHcUTFwSVRVKkcuKE+gb
X-Gm-Gg: ASbGnctfJmF1lB/qEb/XgK42DG02Ta5x15DZoQKNi5heu9DWFsbiTdFdKO62aRYE6cA
	cj/E0kcmW+/Q6rUwbkSQ/F9ajaGoU2x5yDnjyiq8FJEVDktTcLRYNF0jZULSUjfGuo74HQiI5xk
	X5jKqvSG29Eauzympvoy7t+/euFr9fhTjAXgyJ/sd8/9inZDwtrupUSiJWRDWwHQWlWVHJaeQq1
	KsK6523to329Qlo+b0BxOdV5qwA/e5jvuIASLQ41oVenrhoP4EsY8ijqtkBmrhFDvZpEA1F+UyJ
	+Lah9TG35Tu/5cFIGMeWusQS9Y7ZX4iIKsgfwfxUjzi50a9YSsJjcj0cMqAgpQOO3B9A7gmUYAG
	ktQtF6Qoiy2a24bEk5Txr4lF9jx048/qB9S//oBx/+1Lamb8mIp5bWZ0YplwZU3ejQfR84UJzFn
	JWbeqiB7Ar
X-Google-Smtp-Source: AGHT+IHzUN6xJBFg83ljx/rNlj0dJGVxV4XJ87tihhfFC7+HajauYDc9Zl0YOMoedcHK7hswFAy04A==
X-Received: by 2002:a05:6000:400a:b0:429:d170:b3ca with SMTP id ffacd0b85a97d-42b5939b17emr6432538f8f.55.1763230691201;
        Sat, 15 Nov 2025 10:18:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7b12asm17344186f8f.10.2025.11.15.10.18.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:18:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/4] yasm: add alternative CVE_PRODUCT
Date: Sat, 15 Nov 2025 19:18:07 +0100
Message-ID: <20251115181810.1262158-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 18:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121738

There are multiple vendors for yasm:

$ sqlite3 ./nvdcve_2-2.db "select distinct vendor, product from products where product = 'yasm';"
tortall|yasm
yasm_project|yasm

Both products refer to the same application

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/yasm/yasm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index 68895a1697..abaeef4db3 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -33,3 +33,5 @@ do_configure:prepend() {
 CVE_STATUS_GROUPS += "CVE_STATUS_HASH_UPDATE"
 CVE_STATUS_HASH_UPDATE = "CVE-2021-33454 CVE-2023-31975 CVE-2023-37732"
 CVE_STATUS_HASH_UPDATE[status] = "fixed-version: patched in current git hash"
+
+CVE_PRODUCT += "tortall:yasm yasm_project:yasm"

