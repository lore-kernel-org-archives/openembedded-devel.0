Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32579.1793879736419884411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uP0ocdAv;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so15098505e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879735; x=1794484535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4GGpEXANq40WNuAIbXp3h0XAZDpIADf0+j7qi5jFOM=;
        b=uP0ocdAvaRO03VEcLLXb++mSAQRkOYNEXy+nwU8l9A6thMrxMm0wSgcknFSHfH7x1B
         rkGdEPhFZpxTAX+72VtqAiJZWXOJg2tff+iR2cVYLHveYQwu0lMXWNq83CTiq4e74JP3
         vBnrgmAXjuHnLMwlqoApecLGhLGFplxe/W1/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879735; x=1794484535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4GGpEXANq40WNuAIbXp3h0XAZDpIADf0+j7qi5jFOM=;
        b=AUl/Qt2focQwc6HHwYUzlArGVSBMAQaiZJxOjLC+tqQpjG3OaLRQe7XkqqQlPeMNlM
         cX7Z563Zu6AvNWuJkuvW/TxTK39nsV5G9aBFmhbRyn5E9Y5g9YN23Nn3OhExqRLqDXkY
         mPCQwoCced1BZzMnDUKwLVHoHFHzbvUjuXtg+o5dkYJ1yK9fffwBacdRPy8u53aqSI8V
         teoiU4DX8DsOu5NWSXJ8UicD3xJoNHVg4zV7xvsMcroz7DkhtZine5nkP7IY4+JL5Vaf
         I8kytlZr7S8MY07m3457IOA4fYit7Qgdd2JwQ47opbqEtYSQ5PVFX1lFYAicJx3cY69e
         0LWA==
X-Gm-Message-State: APuU4Z83EM4DYONdb2FGXmt8lcNxYkJRf5SgmqrroeALdSZE7H8VwNVl
	mNebpZ16O+TBJRHhxOnD3JUuzywp2mAZef2VNSG0wZgJXIEvnxzxvXCZQIMrFlVWNo6r+EsYWOP
	wvXyG
X-Gm-Gg: AYBFou0SVlEXAlroBK3UH3MsTTGqeH83d4csckOtLITfBqJbTAWgbX9W3IC1fJFWcNQ
	pqCnnakHqgwMvu7cmqsiatj2phTL0GoNDnVzeqQlCePr6y/qZ2q1NrvpmCoYo1cQ2K7DOaFNxaU
	Ldo+bFoIkQiGDV2tgmhb1IIEP9KXKRmWKY9eCD/7BVmEA/nu60cw1VGXMs5pRnZgvYe2yQ+fPzr
	Tda8Xce3QmceKG7ZDU5ASuvR7H6XsXUcvQcJUqvioi0cwzUOQ9FAlF2Jno/PRvqETJXtRRDleLG
	BmuHsuMnHa8tAOFK+trXtYqbieqVToNl+vvsl5jxLshQrnhJ8vLApAvMQGUXGl+OCg3upgG9c91
	FDvJCek8ZW4M6xRiHC0E226nT7EUg8RJhRBjr26/5/IO+WA9lbUBshit3nv3abMwSZbX7w3U7yB
	mcThYJzT6jmp4wY4Solpv7symgKZ+1Xa3yno4ALHD2VTr6SCTgxGZepbRg5rSXTibZH6uOLWj49
	ZJHb+al3nN5acDsnjF+chK54JyWE96E+NI5tl5Mtk6qn4d/iOfoAcXvt6Du8tQ3D0wUzVDwuPJT
	IzNbzODXvPcVbKknG+ZjE+lAVRLplPATT3luUvWVzlti284mfuMM8EIdHnD4Jl1M/vuW5TgTxyd
	INzZrCGdX4Le5IBoThKOKTu3ZUjTmCql7b+yCBjwskQFxXU1Y+gyaOVQ=
X-Received: by 2002:a05:600c:34d1:b0:4a2:526b:d3fd with SMTP id 5b1f17b1804b1-4ac1793fb5emr429497955e9.15.1793879734772;
        Thu, 05 Nov 2026 03:55:34 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/19] python3-jsonpatch: Upgrade 1.39 -> 1.41
Date: Thu,  5 Nov 2026 13:55:14 +0200
Message-ID: <20261105115526.634289-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105115526.634289-1-leon.anavi@konsulko.com>
References: <20261105115526.634289-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131907
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.41:

- Ship type stubs as a jsonpatch-stubs package

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.39.bb => python3-jsonpatch_1.41.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.39.bb => python3-jsonpatch_1.41.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.39.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.41.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.39.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.41.bb
index 0748642130..42fb13fc94 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.39.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.41.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "d0a314128ec7fc7dba7155b0b19f94913198f54acbbef9c7817d5063d998bc27"
+SRC_URI[sha256sum] = "1aca06402f94e5cd7bc133af0cb4f7b2c2f9c0bc172f9de52c9aa4c6104b0d1c"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

