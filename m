Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D17C47422
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 06:31:48 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.3598.1705473101978911141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 22:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j27DaoE5;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a2ece31f5fdso27950966b.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 22:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705473100; x=1706077900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dadRmejkd+JExWFAwUfAixSyFWXAp04u21U8ob22jiE=;
        b=j27DaoE56mJIgWawVwjVjK0qDB8vuk6y4+iyXnzURa21ZhF/B2j3UOE3onPCvRxBWJ
         oSf40ZlRPWp3ux37gx8dvDa2p6ZbqnHYd4aoddWwVCLto5uNQ6dbxB2MYJtJWkML5uom
         hLLCxuZYlbYkuEzUzsqBFmp0BmKyY5mUbZcJqduQZdeVxPM5j+ckagz53wQxZrj749D+
         5rvh5r1jb4kSCWgkTZi7w3/zRESPr7ok8VyLG83pX6B6i5t7CrbCpvtC/hu6h0NTNgMV
         RsAS0/AM+eT4gc9MQxbLgAkeICg7u8JDb8x68r00djk+Jdd5iqzmUD74+hi+RbG/E8Lg
         zL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705473100; x=1706077900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dadRmejkd+JExWFAwUfAixSyFWXAp04u21U8ob22jiE=;
        b=Z+OZvoo3xbSw5pqPDa2nuECPdQN/9Kzo61PoeQ/rbv+RsMTMhTxOcckhHMmh4OAlR5
         As5tpKRb2t5TBnDsk5hJso8lBz1K+LXlM6TaF2l/7Mt1ABTS+lSbekuE5Wzkdpm7PZEh
         txzjlTNgJ63KIIyiBGH9TAJpsi3KMxLe10/4mhjIiog3KOJqolWYWx8tD3deomre6ZUa
         pxNabviqQ7b2nw+gQwH8cY/nLJGKl0w95D66BKG7PLSxDUOG5EIVnbJ20YV9PstAAFzZ
         yg99W11+yytzfgNY+WYZmbgAIfVhKUHRI18qPc6ZXaC5B8Hie28X1fETwHY+5s7HxMUY
         l+mQ==
X-Gm-Message-State: AOJu0Ywesw5vWD1zkgyzadkirEVJZ8m5EXn9E/PXE1GG0GaXOgLBAw+a
	4JHhx/bifAV0fymNBFiU/5Q/FtShJjbcZA==
X-Google-Smtp-Source: AGHT+IEHWvoZgH8v9dfFIHSGNs4Y24iyOnkGUA8b7s7/c7IAg7X36Ytt2necTmTQpVwxWHFH1eyGWQ==
X-Received: by 2002:a17:906:f595:b0:a28:5d66:48be with SMTP id cm21-20020a170906f59500b00a285d6648bemr4798448ejd.3.1705473099643;
        Tue, 16 Jan 2024 22:31:39 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id vs7-20020a170907a58700b00a2caa85c56csm6446869ejc.38.2024.01.16.22.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 22:31:39 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] lcms: upgrade 2.15 -> 2.16
Date: Wed, 17 Jan 2024 09:31:34 +0300
Message-Id: <20240117063134.58735-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 06:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108323

License-Update: Renamed from COPYING to LICENSE

Changelog:

    New: import .CUBE files as RGB device links
    New: Read/Write MHC2 tags for Windows GPU access
    New: Support for UTF8 on multi-localized Unicode functions
    New: Support for OkLab color space, built-in and formatter.
    Improved: floating point transforms float -> integer are now honored as float
    Improved: MSYS2, mingw is now supported
    Improved: preferred CMM, platform and creator now survives profile edition.
    Fixed: tificc now can deal with Lab TIFF
    Fixed: code can now be compiled by a C++17 compiler, "register" keyword use detected at compile time.
    Fixed: Reverted PostScript creation that corrupted some interpreters.
    Bug fixing

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.15.bb => lcms_2.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.15.bb => lcms_2.16.bb} (66%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.15.bb b/meta-oe/recipes-support/lcms/lcms_2.16.bb
similarity index 66%
rename from meta-oe/recipes-support/lcms/lcms_2.15.bb
rename to meta-oe/recipes-support/lcms/lcms_2.16.bb
index 6c5766a0e..10c1994a7 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.15.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.16.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Little cms is a small-footprint, speed optimized color management engine"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ac638b4bc6b67582a11379cfbaeb93dd"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "b20cbcbd0f503433be2a4e81462106fa61050a35074dc24a4e356792d971ab39"
+SRC_URI[sha256sum] = "d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51"
 
 DEPENDS = "tiff"
 
-- 
2.25.1


