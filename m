Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B234FEC1127
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2759.1771874341123328894
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3K/Ewhf;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so48793995e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874339; x=1772479139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHoeOL6q2LszKnVmU2Y5EdvDKKLCzXqwEOq9rHWThxI=;
        b=d3K/EwhfVbbAMe28MSWEhJ67QVQ/E0bQkYkalt7DBBoNB+6zTsQlfcYsD/PF0OCNfZ
         6BEWlDapijJYee3zK0IV5aZijnNrMwbuj0obMTmWYbEUF7l3tUlXfLLSP9xHzKKAJ7vI
         RJsqg0na1bLvwvpAcHkf1WxVMdpha97h8Fk9BeA7cCi29QXkQvtPs4PDbXNUKp0JcsSM
         CY7Hsn1hgHbtTAjH/QZxzDOJDX074Wir8WLtR9EwN7yhRah0g8WpBSQXZdrtHkgJwN7M
         +wL56JrFMcIfc79Kaz+7cDyQI6jt++ny76JbkuBjh9Lj66zRINFRIj2QALYMOj7EHxYp
         Eanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874339; x=1772479139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PHoeOL6q2LszKnVmU2Y5EdvDKKLCzXqwEOq9rHWThxI=;
        b=a+3jnKe8IZ4IQ0XoeONakEUoL1YOWyjp8lSsWzng5R/bpuGJcYMpMqLChLuUFatBlO
         KnzX2swUgCEC6HlUpehI8yjZM2H+s6C5M+ZnfxKY/0xd9O51Dx4Wi1dps4Eg0zcauY1G
         CbmuwG1+szNhbrohJq/UEHNXYpO2iaSG/eOwXE98i9fUbfFDfxXxtC0RE/IY2mFUWBsF
         4MalV+dKJnjCoWntbUsldFaPhAWcSPcBw3sJMA4eSekNtAYjwl67HTkGJE6JO/pHZm/V
         mSTAcbtqLZeSYVhRTWDCnQegQINuKyjLq5GdTIDYeusrHLqNCvUUJQPl6/roM/ggDR5w
         po5Q==
X-Gm-Message-State: AOJu0YxH/ezmmIRP1qidPoMKKLFwVcieOL9VATx8D9fBRbZGRw2pqkUt
	aTQRHk6U7VgRiUlWH9cY/AqHc+gpK0plXhyY6GIcRAbYIlU3J8qZ3mlBwjlF/Q==
X-Gm-Gg: AZuq6aJcxiMttlinuo8v7EOTjxOloadqE5bArB4/iPscUOruDx6JBaNvk0lZkXOuhlR
	KFzHt048Lutlm4j3e/IJXoRkJGDbY34J4us9PlT+1uZzt1D7TvPFJyOMzFvgNr5WFLKoylObiwd
	faheVb6rEqA0TS20VVqmoWE5oJ5MQX18L7jJ4N3LjA3atZ/DsZAJ4mlCteXB+YZ+kyLPcXQAWK4
	kiFaghCxcTm1L02/2G5XGqobOwoAKeP6Mz2v7102H3Tk4CA+Nz8d8e9iHmH079zcXF9zmxjc4iL
	UeZNNWyuMCQGTk6oOqrfscYZVr2DGqDs7C4nSbceCSK7e7u1o78N9cdY/jLCdo0kVrj+yLslzEQ
	z45cHwLZF+YywcqqBL/UuTQMniTIX10Rc0I+wprwNEkTXXTj/o4tv0Ac0Oi/Udr5+CwNRLoKPOo
	C0+cAVnezPeNkm5OCPetoUcMz0JhsQxlE=
X-Received: by 2002:a05:600c:8716:b0:471:1717:411 with SMTP id 5b1f17b1804b1-483a95e9a7fmr167967125e9.24.1771874339364;
        Mon, 23 Feb 2026 11:18:59 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 12/13] python3-werkzeug: upgrade 3.1.5 -> 3.1.6
Date: Mon, 23 Feb 2026 20:18:49 +0100
Message-ID: <20260223191850.1049304-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124566

Contains fix for CVE-2026-27199

Changelog: safe_join on Windows does not allow special devices names in multi-segment paths

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
index 1df88b78d0..edddca72e0 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "6a548b0e88955dd07ccb25539d7d0cc97417ee9e179677d22c7041c8f078ce67"
+SRC_URI[sha256sum] = "210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25"
 
 CVE_PRODUCT = "werkzeug"
 

