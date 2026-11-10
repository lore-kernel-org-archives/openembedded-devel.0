Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15.1794324467197525836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HV9scI5c;
 spf=pass (domain: konsulko.com, ip: 209.85.218.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5060a48ba9so34584766b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 07:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794324465; x=1794929265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UBMXdOjnQuu6s2MWBt8l2PyrhYYhAnfcrG0SWST80g0=;
        b=HV9scI5cgeCXfE5KbRZmEWW4EwyIc8TnzRd60xcZRQprZalJuXjs2pNckxebYlQhXE
         wJu2FVpwfpe3/Jov2OKO5jr062aahfR1b8kgJ6klJfnKBeBr7ywFlEdh4M43g3P7DUz7
         zrBHIuz3Vk2gkWgVe/Erqy4yUs54VTA6hYpjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324465; x=1794929265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UBMXdOjnQuu6s2MWBt8l2PyrhYYhAnfcrG0SWST80g0=;
        b=Jpxp7lfClvryrT9LimiM0g500k05XRvCzs2GFQ642pXgYh06/CJrLFCdVpdZDiMX/k
         ydOdYHpb5fAKlfdu9yqVNnQ7SQz5U8fQJew1Ze/6tLBiF0x4t2vlvKTUM2E+MwMZhLGj
         dnwjtePFJpmgM0+MxotzDbw7bay7NiVZfgo0ORjnBy4OZHLw7CiVe2SvPaVB1QnWvDBD
         jMmcsg4Tfy53cPTuO8jwSlv9NBeYkY2zcfiHdOcOIx4YRgMt8+CtsDZYaiki3zjdSHzg
         phkkBqj7SEWGyIJ6sGjAU58399aRrWNq2ro/CuFEqkF4FieaBipVB3wRIYvLfVNOBrEt
         m+aA==
X-Gm-Message-State: APuU4Z/k+u75i0SbuFP8Qq3eMV/xArNJPp48+rsaNkwfvtg8k5ZZQ0tn
	J8sMleqTO2+SSgsTbUn/1OwNw8ypDvjQIQojGPLdhfjlf9PzfuG5C/uoBE+r3m9OKKvIMb+NPPV
	XnfyA
X-Gm-Gg: AYBFou3G0pkTatGJ7VdpkVHp8d3HwTHzVmNEly5M3qsM1tPHF1wC2gRSnK2NZ6nMf4F
	g0O/NpsKeu9nLbo7xCGgYFB+PP6ub6P/RzAK/0RK21EJJvN/hqE0BnooOn54hyFQQflGz3fa74T
	v8A0PuLehFbAs/z5LR8A6bXM1+C5Y2tVZoBu9f6aHI8GuaZle4esxJrZvTXXAocrOISqNXhZHgZ
	DRT19+0WX1dSfpNhhqHYCCFS2PPsyN1XCdi+JIJJOQipeuzEw2bt20ZJ+UWiS0Z54r4fwmNnjYz
	9XRQGzh598rdS3XwwUWFzYaNas/Lz+r4cS7X1SGHy4CZ+w9ueFUg3wrIM6IN6k11b3iNbweFXkA
	XMzji3wbASVOM1YToFGTh80ELLETbI8ZOXznHjMYJEzpPWoP3dNkRXNovx4A3MraesvtvNwYV9f
	VLItozvIxZozb3/sMmyjgdmZsihaA8I9Bx095Jt0KhUyjQwEYrK3dZiYwp6fxpxrTP3HYQyBYIx
	aVREqWC+naWvaUHVDV0WgmcjpnEdRegfh7jYaUyrsSsO4V3bBrN9Dk9a8SQnl6XmMfhg+CYov4j
	h3+AdmLn0vPpNE3BSR7MeXgJSCBjiY0PAx2YMzE7ilVfSc3vjtumReS2iLxS4Rul12oLuBJaq02
	/rupD7JvJVO1jzL1LXzJ8xRSReb/2lOZWwHVlrFIZ9/bfZeCXis1MDkrbv+lT8RLaj/5gHanCYP
	Y=
X-Received: by 2002:a17:907:a089:b0:c1c:4a80:30c4 with SMTP id a640c23a62f3a-c50494f1bbcmr231829166b.11.1794324465328;
        Tue, 10 Nov 2026 07:27:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm6064071f8f.53.2026.11.10.07.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:27:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/19] python3-soupsieve: Upgrade 4.0 -> 4.0.1
Date: Tue, 10 Nov 2026 17:27:24 +0200
Message-ID: <20261110152729.1065911-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110152729.1065911-1-leon.anavi@konsulko.com>
References: <20261110152729.1065911-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132088
Content-Type: text/plain; charset="utf-8"

Upgrade to release 4.0.1:

- FIX: Cache whether an element is or has a matching descendant
  when matching :has() to avoid quadratic time on deeply nested
  documents.
- FIX: Cache whether the parent matches when matching the child
  combinator (a > b) so it is matched once for all of its children,
  avoiding quadratic time when the parent is expensive, such as
  div:has(> p) > span.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-soupsieve_4.0.bb => python3-soupsieve_4.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-soupsieve_4.0.bb => python3-soupsieve_4.0.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-soupsieve_4.0.bb b/meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-soupsieve_4.0.bb
rename to meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb
index 4ada8e4237..bd7d6abce8 100644
--- a/meta-python/recipes-devtools/python/python3-soupsieve_4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-soupsieve_4.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/facelessuser/soupsieve"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=74851a2f1e5c07496dcb452af6a6bf54"
 
-SRC_URI[sha256sum] = "ccd6470b256394ac44b08b86fd94b30a17d335a5335c8a3d15565f7b03d3c8cf"
+SRC_URI[sha256sum] = "7621e3c5f6b371ed2c5eabaac5de300ac3d66d05e6d7f34783e31b63c4f90c75"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.3

