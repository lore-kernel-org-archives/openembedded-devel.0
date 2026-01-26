Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EBECF65DF
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 11:23:26 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17458.1769426605001832944
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 03:23:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=G/+Huqw3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so50579005e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 03:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769426603; x=1770031403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TqvtE1RwH90BBV5jQno0VxWTM3bZVRSni/hImT56+Ek=;
        b=G/+Huqw3WWdj59BjbeyeSBfx4+pf2i8KWltxCxxUt8LBYk7uyUOuvLPUtWng6OVeBr
         jpAf6XIbDfKi+BsB1Xy5y6z9yFKwXY0hFAXdhvBE2/3oNkCp4JSdDmApC+Xq3p6AUTaV
         QnrtUd7TSIdqiBz/h6PdBdo9u/JSIsQDLXS8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426603; x=1770031403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqvtE1RwH90BBV5jQno0VxWTM3bZVRSni/hImT56+Ek=;
        b=aaYPlNLtQ204P/i5+ArsFRRfCrokPQMb+BJ4pMUgzMAyZB06wpIJGOUTsDxtgmbYG6
         XGTPvo+pDtqYuGq4FsOoyMsyDJEYZH5FiYsRr/rSqBi1O8UvoslNR/6oO12fL6960i6V
         LblSrPEeEdCbkFcPEoCr1NgbPyrbxJ9qyptP1gHciJhEl7PmgVnGu28Y0zddNbkkfd60
         EY5/CKtud5F3GGZhtfIyNW+XY+kCIqLgwUYGooi9wLgRGPnlKY94cXFy9bnKsTgVBIaC
         KkWOIPOI+96p73TkhxtWQKC2e9GqrfHxdUuGoC/fFNTNhXq3WUFhLk1dgq+O56fbwmyI
         Wamw==
X-Gm-Message-State: AOJu0YyDO8AkhBC5Ize/E+HH+Gt9bB0U5FDzGpXm4mVVma33UEcdqw44
	eWmFRhvtPt5daDFN4rj44w3nmAhX17vdk1qirEW20SUtxTKnhRDRP7G1QrWF7BHH9vN9d/fkugt
	YlWLj
X-Gm-Gg: AZuq6aJGTZpw4FzcwDAIljFNhBQn3RdiM+MZCA2tOm4B7ash8u9KJkJPLSyDy8b81Is
	3JduvrNsXxA1emUXMLmAaJY8Ja/IhF2wYWZy4YuyZCDwqHqbUqN55cz/In+tV/VyuGHdFjS3w8e
	+UkX4UDPKOmydmOaPoa/lRgjLzAufaeAgFbwxMJSX/r/CLK6l4wdFQ2+/OFKcNKbf7Wzbae4npX
	JMguwVs+r70lWtpKEIqdh8auz51a1HwqyBxCaBeIkanRuVPy9+DrOAu/MfFarclUPXFQtsjCSfD
	shXLRPDLpahMl5UaKo8EGdr6DEPszqVuaBxNHzjVgwnP5c59GgMJ4xrx4eQZG9+zJT0ub4EaNkB
	65pM3YCp+ecQHBHixVaz1Jj09/03hwtOalJ391YzZ/Dd38zJsnakHAK8bAW/o1yJVP4WDxQ2nOf
	Z/x/MOlLovJq0odH5F+rpB/3xHlfPcreyWDR0=
X-Received: by 2002:a05:600c:6215:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-48066116ecamr1427715e9.16.1769426602615;
        Mon, 26 Jan 2026 03:23:22 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm267390205e9.15.2026.01.26.03.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:23:22 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-rich: Upgrade 14.2.0 -> 14.3.1
Date: Mon, 26 Jan 2026 13:23:17 +0200
Message-ID: <20260126112318.3443568-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123868

Upgrade to release 14.3.1:

- Fixed characters out of unicode range reporting a cell size if 0

From release 14.3.0:

- IPython now respects when a Console instance is passed to
  pretty.install
- Fixed extraneous blank line on non-interactive disabled Progress
- Fixed extra padding on first cell in columns
- Fixed trailing whitespace removed when soft_wrap=True
- Fixed style new-lines when soft_wrap = True and a print style
  is set

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-rich_14.2.0.bb => python3-rich_14.3.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_14.2.0.bb => python3-rich_14.3.1.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.2.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.3.1.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_14.2.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_14.3.1.bb
index c51d55c633..1164a6be2b 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.2.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.3.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "73ff50c7c0c1c77c8243079283f4edb376f0f6442433aecb8ce7e6d0b92d1fe4"
+SRC_URI[sha256sum] = "b8c5f568a3a749f9290ec6bddedf835cec33696bfc1e48bcfecb276c7386e4b8"
 
 inherit pypi python_poetry_core
 
-- 
2.47.3


