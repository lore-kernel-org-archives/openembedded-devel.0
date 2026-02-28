Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD276FEE4E9
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:31:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.116238.1772271066203344364
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:31:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhBp02uw;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824b32875e7so1475714b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772271065; x=1772875865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4TpGOx0rRssWnPTvn+xlma6eInm1wyy8GHQNCrOREs0=;
        b=fhBp02uw2BRzy2x537anYUT0AEKWK2MHmsefyt7VfZAtaVYBaT7zHjf5xFNONPPFmC
         8KCGtyWW7DFTjVge3jY9H3QgCLPzY0Pg/CjRL+TPYWmR9uKanaizPGTH1db5Ofhk4zpE
         e46Qna6fkxDSMvaHQzy563mm2czvA7u7Ck/9lJ/hMz/3l9ZZEczmQvp1Q50ZWSnPVUHw
         mFLOyO4Q4cV8+IZo9SwEPtBT5t8s6iH1jhYtH+KhwknHJq08A8HOLYLjJrGCzeziJiw6
         oRg3Hs0koceaHKp9zdkKo1Oj1E8/N2Qcklfz2IMjRLjqXgFwExFf+x+Xrft4muLRhyp2
         0KbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772271065; x=1772875865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4TpGOx0rRssWnPTvn+xlma6eInm1wyy8GHQNCrOREs0=;
        b=IHLhbYjfZKi5KWTCM9aoq2Kpt06Lth3zcUjIY9oGWdqeTbLmrFdsAVOvy7D0Q+LlA8
         KIr8f/OZPy077ovQ/kyafaoHdSFAXONxqIb8WdXpW1nMjIFj6ZwvECX8214MOkEUj5tq
         UQq9elImv+7WXJXOfBLGrTnJ4+5NRN2utjX97OaOLkf1jCdXiH+TwsrXtFkGsTGvyAlP
         1AxucBayZjDhkFfEGL3nzoUuDtBSRTjJ1sy+i6d+0pw1vYQ1ERUTlljmNvQ12tPybadq
         V+ccXUcyb7I0zAt5Mj9jOwkr8pydanYKINvshkh6AuMmvHo+WKEU5tBCp0YYigJ/n1+w
         Pfqg==
X-Gm-Message-State: AOJu0Yzsf7PdVIvjVgnqK1BfeA1KrjBQzxvHwIFlIpAjhK7q7n7FIILm
	hrQycDWPJ3olPr9SxJFFtZ/oSsfd5kE26nt/kt464le0LSpUhEqI3GyA4rTx8Q==
X-Gm-Gg: ATEYQzwNUuD16ghuR533y781ZqrD/nB4AIAz9bOvBAI4SX2zlOySgwb0aIoTIJ0Dk4U
	7CKDw1n4qR+2gEc2+7/UcfpWQsB+P5fqJc0K6/7dq9TuwafuiC2PTogGvsiFm5Sk16qEFiqRsvU
	DYYDr3MdDq2VkMJy5uZVfngOXSzn3wRcLeacCcLKRgvX6erkgz69KdTFO47U+TXBRZe+0UCbE87
	DsZ5X/wN0uTSNY6AlCG0YNWTyddzzCWLtIsCH8qFuUQFzXHJT8v3CpGJ/4seBKmwstTt299vYNo
	VXWriBFExHyb8V+wGobsSB8HUDoc+FINbT02qEWlNJ2IXSfDlNp3a3HrFuxOa9b+vlCgES9z2El
	4ZoJSbOrvjBsk+pkCO0Dho6TLwUcK5I5ehd5tOZQwiYkLUiMxiflKI4SglngCLBufZO+mstNEve
	1NlQNlIjo311mVld27VOJ0rP8WE6U7ngKtZA==
X-Received: by 2002:a05:6a00:2e04:b0:824:4a22:ec02 with SMTP id d2e1a72fcca58-8274d9e62d2mr5291206b3a.42.1772271065427;
        Sat, 28 Feb 2026 01:31:05 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8cd91sm6875158b3a.23.2026.02.28.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 01:31:04 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 4/4] python3-greenlet: upgrade 3.2.4 -> 3.2.5
Date: Sat, 28 Feb 2026 22:30:41 +1300
Message-ID: <20260228093041.816960-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
References: <20260228093041.816960-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124781

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix a crash on Python 3.9 if there are active greenlets during interpreter shutdown

https://greenlet.readthedocs.io/en/latest/changes.html#id4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-greenlet_3.2.4.bb => python3-greenlet_3.2.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.4.bb => python3-greenlet_3.2.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.2.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.2.5.bb
index 1657be2b2a..eeca59b883 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.2.5.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "0dca0d95ff849f9a364385f36ab49f50065d76964944638be9691e1832e9f86d"
+SRC_URI[sha256sum] = "c816554eb33e7ecf9ba4defcb1fd8c994e59be6b4110da15480b3e7447ea4286"
 
 inherit pypi python_setuptools_build_meta
 

