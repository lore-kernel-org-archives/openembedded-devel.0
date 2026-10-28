Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36197.1793161484437934937
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xVAryv3r;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso236128a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161484; x=1793766284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNQsxVmwqPVTKy5cEzPnePID1JoMFJ87q7zrIsa1rvQ=;
        b=xVAryv3rhn++3XssT1G1Mh9TKZ4eK+Oj2AWHUbodeoRkkdQm3F44T3r+BqnKyibS9D
         oryXdG9ViK47EYWHERaVlZGUwSemDUTmF0BpwMRWzO5l36BdpSrKcLf9sIu3f4Wgjd+s
         /kbQ1Gtxz3XG7Gs7Izkv+GFcAkqgwxQ5Yi0/APT5II2BdU6oUn9NKWBGqQ2QXrZG7P3Y
         7TOIJ2Y1MTCP/Utcb7xHxshfhrJi5cdsgaRessQznjzi7khFQCO7ndIDtjOcIFbe9Ow5
         quKpjrRUCbfvB5ZdPoBmLnhj6r4vITE0uGUAVdX0TN93deGa3sNd8EgEwqvrTOl23KHK
         kYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161484; x=1793766284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNQsxVmwqPVTKy5cEzPnePID1JoMFJ87q7zrIsa1rvQ=;
        b=Qsk+05sZfdqYV0JPhZEPL+Jxwj6ebyQUY4HltEwi+1gnmUcRDA5G03HAmGw+0WDtBb
         bNcJdKKdkD1qb0V4a93Djq92Wn6ALg59d0MVunl2gDcwL+47ZG7HubBZ3qkpGbId+ZaR
         SxS/oh4NEZYivlwJk9X+WwmOIsg8VOpOpFiwaYrtXOyHSG5Ztzy8KId9X3W9N6/VN8PZ
         dAMi9qOCVu0u7YunoDLXv0EJwjl5JQTNKkoztlYGmip99oDmH0JqAp4Vs9m+fyIb10+W
         41OwH+3R1CcG0STSWqb0reK/4hplbMLRdkpXNUGAaNP4ajm9Vv7D60egcLT/olmzGHdg
         ChOg==
X-Gm-Message-State: AFq9FYK+hmfAIZg/kCyKEqg633NxwfhQ6ECSkRVxnaoMLzBQl3gvcNOG
	7RxGdw7Ldr9NYEiYjdgu6nI5A9kMBbZqzFhsaJwq8efe8nFuNOxnHP9ZAiGqbQ==
X-Gm-Gg: AYBFou2USt3d4scnfxBjq3fXnXwFtCnFhIBcBTGTAG95+l58XJMtaVi4a3ksTWaIZva
	+vGAX+q1N6PSjnX18PO1KJNcYFgTkj2FsmBXIe+l3mjSb2ADCQB4A9nq/GSUMOnjYl2JmwA+rw+
	DTdFWbZcnV2JuKFaYeOuU5YirjjB41y7nK2HBkh2IFMb9MYgvqZs/KxMl70yExQTOb/J44FrwBt
	d06hX7rua3HW6OCw3OzMW4UctTSprHSysnNTOmh9F2yKKFOHqADsnDmRp31dNiaWk6j9JNbE0Pr
	WlrbO/c3+9KokFiSB3BIhhILjyxttF3aR57bsEZI2rZQqnpwSZvf/hE3B90F50OA3twBk/e0gRo
	kLNvPZlWJukL19P6NnXToJ19TqFVEnqEo6dg2dTRITJLka4Pl0kuWRt9WhuqufpjT/H5kZ0QxD7
	LVX8O2v0ZG6vFfYbN+CZxg5SOjWDkpC8Bs7kFfPHmKa8SQmXSzLMZEXlr1Q+5FXBWvJQRF1eb2f
	29JI1n0xoF/kpXdd+x1WwupQzyPjLZ7S5PQe6wUBwM48O6aa501W3j/s0f1maDwPGTWklEMphkb
	R7qSKOjpmoK/Kmbnd+TzRdFX4y5i7UTYDZ5w8R+TZQk6+lo1tEFBNAN8X/a4eA==
X-Received: by 2002:a17:90b:1647:b0:3a0:ace4:d2b4 with SMTP id 98e67ed59e1d1-3ae580cce76mr757432a91.23.1793161483854;
        Tue, 27 Oct 2026 21:24:43 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 16/60] rapidjson: mark CVE-2024-38517 fixed
Date: Wed, 28 Oct 2026 17:23:14 +1300
Message-ID: <622cd276dd3855d73e24d610f8cda866519b7008.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131568
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Commit mentioned in the NVD is part of the current version:

$ git log HEAD --oneline | grep 8269bc2b
8269bc2b Prevent int underflow when parsing exponents

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-38517

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index fa20b4d448..f565f0a175 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -21,3 +21,5 @@ EXTRA_OECMAKE += "-DLIB_INSTALL_DIR=${libdir}"
 ALLOW_EMPTY:${PN} = "1"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-38517] = "fixed-version: fixed in the current v1.1.0"
