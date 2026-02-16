Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC53E7BDB3
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:30:12 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18534.1771245002804268972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 04:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nhnuDq+Q;
 spf=pass (domain: konsulko.com, ip: 209.85.128.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48069a48629so29703215e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 04:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771245001; x=1771849801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZpJeGWG0A7viEExsRrhZpqk8HIs+pf5pw2jltLBlec=;
        b=nhnuDq+QB+CqAZwSuck5K6hdFR9iflTg/EVM6pj97iDoBRWKgaMoy9HU3l6/rHrEEB
         11S4kY2vX0vbVJ7TsEQTEa02QomrygfNcVgM9oESi9oU+vxoJ2dn+5o+aCsIeIdmhzdA
         U5ytcOpL18nDFa3nkxa9Tk5jcXzSP7u5JugqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245001; x=1771849801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ZpJeGWG0A7viEExsRrhZpqk8HIs+pf5pw2jltLBlec=;
        b=VDdGSVu0fmtzQAHvMVlbt5pCKECqoGREEnr2OYLc66gKumd6YX0BXJX+TojhgX0lOV
         4t6wH7c88CtWuILISawP3XiSBkaBW0ChbR/8JdDanITdBDlHxHSQCFetArBbwsVC2A+h
         MfJLiHFB296sNe2D3ZpHQ8xvQp9Yq6qNjbVydhs34m4RUM/wub7+VKeSYCMAiqnT6/Yk
         RsVisy0Q0BEhkZcUytFy7Pshvx9HQKyRXcgtzU49mNEPMVPT5KVMNijmvwPQlqAGkkia
         rnre6ZwCcVIGowOuqrb7Rq/W0bOCQMuab/byV9y0YZv62p3MjxfiFT1AhEdZJRN7U3S8
         1Hyw==
X-Gm-Message-State: AOJu0YyP9gzT1FTXl51VKTDv0JpkRyrPsqcn2QElNgZyNx3OYcfmJYd1
	kpcTr6XqxKWIpB6R/jSigYIZczETG5Nt0rvQz224VVPvFiNj80I5DLq32CGZ3dGfthOuX9kz7pc
	cBGBU
X-Gm-Gg: AZuq6aK0jUL+C196xoO+rfWNwpMmS6CQOOOc7LNcEgwsT2n1O3BWemTjkeL+J1pSoqc
	YcbVEGbVIPytfEZ9U6cnQ8lrPoA+Z4rlzbjvHJ3WLSy9NDymQfL6ks0/DLaIkfz79xvas90CxST
	CUFDNq13rjULPH54UoTCo1b52V8xKs1SESU0RhWyqYxPoQa1z5JZfsb5PCGhdJwy2pXhWppAN9R
	Uqre5DOtbWiHVq/OcVBiWOQOtcLBPozwLbqaU8A4gNnzke8/dbAV9qwMJicX8sXXMzKYqaDP6rr
	BGY8QU0ch3gfYILT0tivUMVp8eebSKfECjmI+oiOL3mMHcL3dd04ytHKKsE/WxvKFZTUA9nSSyu
	B6uhQmFxw7lAwJ+mf87bBpElaxVXck6Ggt5N2/ChxdyA4UovFf6mJb9VavjLjLphMwP+2OTc9oK
	B8aGLTMqg/0ax4vSmqhOAmxZmQIO8u8bAo2MxN
X-Received: by 2002:a05:600c:c16b:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-48373a546b1mr184303175e9.28.1771245000771;
        Mon, 16 Feb 2026 04:30:00 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm664423415e9.9.2026.02.16.04.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:30:00 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-langtable: Upgrade 0.0.69 -> 0.0.70
Date: Mon, 16 Feb 2026 14:29:54 +0200
Message-ID: <20260216122955.2642743-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216122955.2642743-1-leon.anavi@konsulko.com>
References: <20260216122955.2642743-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 12:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124421

Upgrade to release 0.0.70:

- Add a few dz keyboards
- Add more translations from CLDR
- Get translation changes from CLDR
- Add GS, ady, bqi, isv, kbd, kek, lzz, mww, oka, pi, pms, suz,
  Suni, si_ID.UTF-8 zgh_MA.UTF-8
- Add mdf_RU.UTF-8 to RU

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-langtable_0.0.69.bb => python3-langtable_0.0.70.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.69.bb => python3-langtable_0.0.70.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.69.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.70.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.69.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.70.bb
index 27ab97cd9b..7df58f4e0f 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.69.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.70.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "f0a51870cf837fd689094ce73a420efa0b9b470facda551090f9a93d1e16510c"
+SRC_URI[sha256sum] = "725b94121856a3b76d2345e8596954b82ed1eda78513e55ac55fbe4a4823e66e"
 
 inherit pypi setuptools3 python3native
 
-- 
2.47.3


