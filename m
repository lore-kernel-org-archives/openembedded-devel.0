Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EB9F53D8B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 20:18:53 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60739.1773692326650066993
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 13:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H9Tlzfqm;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b04b4974abso17321815ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692326; x=1774297126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftbLEB0PEx+4rbPRqAgtUefk20v78gWh+tNlYsUjvZA=;
        b=H9TlzfqmcRLEFnNj/nMS1fHouyykyrgP4B+MOUFORPMMPB+SzWLx4fwGnfnZqbXDz3
         8c6btWhuNdLDy9a4lOvWR7KslTsiln9keO6gMae1qTrH20oUSe6Iv9giHTw6e9O6UUaW
         wSSwRzgakLKpV8Cvi+RAJkWk+Xvyyq/EEoiGWV0AW0kV27xt3CtzRoVb0H1uH4jOz+Kq
         gVs7f3x1KQHruZGsDxwY3U5EzTJc5qNgq8LNx299F5yuSJlOTeqvCa0/iQji+wAerlN5
         d60HXUkhpoj0lDQC8f8jEvTy28UVGDo3yloj0+Snb0JLc8fPZDr6KtAyfLiFO2S+hcO/
         2AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692326; x=1774297126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ftbLEB0PEx+4rbPRqAgtUefk20v78gWh+tNlYsUjvZA=;
        b=hvYjy7eB8DeCz9SNSqltCoaEaMFVpL9SIsTk1f57LyBGSiY8Ix+w16aCKtygKQR/Gx
         XfdJJFL+uhH+ai6Aml5BZwmuIieWR9zTaRDmIT+BsVvigETMkGvseKVOIMDBfzCHt0Tj
         IoteVQUv69JIOQY9qO24lDA0VYXjEGLbgaJIvUjMxWClm0aFj+5aiJU04gvdLn6QJLwO
         v5gCod6i93LlJrKmKnWiHqVvViAVjeN46z9k3+CtuV2++B1sQ/PmaLWKz9ioODVaRJrR
         kgfJiZYwo4I3js4fden/I7wC+GmFVqT4MKZNZLdFNAKhDg4hZLqo7x60V3UDnpUi9KWr
         86tw==
X-Gm-Message-State: AOJu0Yy1R3kMOf/tLjZdCKhGX2NUGiNyked+1sKdu+Rdm/bokOnXhecP
	aSVq8gf9dkGQFpBXuuPLehekgW18wQV78JqnjNYiDv2vUw7i+b5CapkK6QY8nByG
X-Gm-Gg: ATEYQzxYep/aPIjsSeWI9I8fNK6zBll/TmchLNqCn1RFzI2EC/5ZJrrGkw3qFhtBuw3
	J7e0SAMs6gq1lNlWO2YGYUP1JAknYSlluOIZLs0sR+49wUInDToP5urWOgHyJJwzYdLNiG2k4Ym
	HHsRRc9c46pdxyzm2e9AmmnD/beKM5nO0pmLGK8pBf7/73tXT3qscd5dKhRmkeSaGSrwKzJ5AgK
	02SBp06TX7nU/xl5pmVQRreo9JqfZ+beQzLMaGAeE0vI25qofH0IvguMPhZgR2Irl467bqTdNeo
	qsH5UL8Pa8t1EL83XGs8zFIIJINfqmavFDafAm0igm2XAT5r6rShOMr8LodnRWUB7kXIVtvB9vO
	Xfn0aOJz4YTpVYOsXT+dJnhaI/gR2jMKBcWKw0B4exy/KavPx9X476yV7riAVI3hI7Ur8no9EAw
	KkAAbgnOuI91+hWqDV/D+zzc2y1jbdA4HUl9Y=
X-Received: by 2002:a17:903:17c3:b0:2ad:d5d7:bad2 with SMTP id d9443c01a7336-2aecac36dfdmr137950885ad.48.1773692325789;
        Mon, 16 Mar 2026 13:18:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece56cde9sm137792105ad.15.2026.03.16.13.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 13:18:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 2/2] python3-tornado: upgrade 6.5.4 -> 6.5.5
Date: Tue, 17 Mar 2026 09:18:27 +1300
Message-ID: <20260316201828.638877-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316201828.638877-1-ankur.tyagi85@gmail.com>
References: <20260316201828.638877-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 20:18:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125288

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Security fixes including CVE-2026-31958

https://www.tornadoweb.org/en/stable/releases/v6.5.5.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tornado_6.5.4.bb => python3-tornado_6.5.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.4.bb => python3-tornado_6.5.5.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
index 9b43d98e1c..8e433fde2f 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7"
+SRC_URI[sha256sum] = "192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9"
 
 inherit pypi python_setuptools_build_meta
 

