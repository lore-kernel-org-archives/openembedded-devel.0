Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14836.1793092842965349571
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ppIlUJx6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so17971645e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092841; x=1793697641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qxj0BITOOXJJyBkHtQvj4s2RXxJ5uExlbvIzqB5zeeM=;
        b=ppIlUJx6KryHmJN2dqni7gy0HDEBJgTIgIxZixolOER+QdUtGRR0p0yV2YUsAlJhzR
         L8I0YVGRpBa2/m8ZgiUAS/r7kltL1x6P+dGorNefDVbPelbxLD8qAHSDNH9hY/YlFawh
         HxdPnWks46S9fXOZ9Unfme6MXLCqADlyQnlWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092841; x=1793697641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qxj0BITOOXJJyBkHtQvj4s2RXxJ5uExlbvIzqB5zeeM=;
        b=q33bRbp4rZY+9Yk0/jZ2IdWleN+52XNJgSHCXGFij+AAnlrViIi6L+nyESm3h1LoJt
         df8TwTXkYr887OX6RSVjJNjW95bN55SHDwYJ1VF+q6mSip6fua2W4uXmgAKp4hsVPHpD
         yXYL7BLMNtP2eGGmpQ6ns2xFmshorThG06qwQCSVAj/TWVoH+24QkbgKkpWVe3K1nlwy
         xXIu3m1OamM1s1VJ26IfM19yLRoz0MKd7PhEbxCeda8GGoptmVQYM8esCO5GRQRAblZF
         bwjWXTTPNWzEve9yNtzLbbZoxxd6JbRrtFpbqtvDLS6Pe8d1+2KeM0W4ba7TdcG5bMKl
         82Kg==
X-Gm-Message-State: AFq9FYIPgDQBkibCXGClKWwvX9IZ5+GEJ37iJ5b6/PK1Fl8Qn3+HNSUB
	nXH9n9vDNHbXnWVsOd6leTx0/Y56FDI88nGIqiEqVKVPNWX3+Dfnrcny4kbJMR1PoO9c0L0aMbQ
	Iopqn
X-Gm-Gg: AYBFou38nUqk3fLYE0iYQ/wYfeZjTmKnSKsPCj8jf+1HKh1CTixDanCqTEL9eAdTeDu
	qyfzeU/PjiLv0I3qeONjRMDJVyh6t0N6fyhA/O8qBXqn8fk5EcxKSI3lNAvjaRp7aFqiWkQMQtM
	tPiLrqajLaketAPZXX8y+roFD80u7fA0/vXmLN726n7mS5Oh+4n4j3ekd1W9sbROtbvKiWU32Zy
	tl49xg7IQrpJCX9R9W5LoZhRFRat0Hxw9oDovz+Nmn/xfts6HPvXmrEY3+79ahMgxWO9TlvE5+f
	zvmhyISul6OB3a3eUA5dNW5PTrCc/63kHIfuTWJthzRyB6jqR2Q3SDdfrXmOqJaoCEHPch7dSA+
	lwR+51TGv9B4fQ3JckNYkVvOpy9Pe6df4jdc9CjiTvNcO/zizD8HCkotVq/qqK6nbovlxUNhetr
	05WSCvnD/A+t3HUHe1hwswmp6SoSUtC36kROuADifanbskz+hMkQgF1nuvXEy4QzqB39XegBKDh
	KKGVhnZ/8gPT0Z8TxOfmvVaw5G2yWj8UpaQ6ev4s6dsQFFkeJpzg9tBOALzNti+xqt3sHx3aNfi
	pzbLoSWYT1SpeKCuZo1kOR9rAyI8aCGHCUrv8aLKqOELNyJvimcsL1mxJZpLl6S77tBeeMOJaZG
	Z+8mr
X-Received: by 2002:a05:600c:1388:b0:4a7:6425:c274 with SMTP id 5b1f17b1804b1-4a76425c27dmr69185975e9.2.1793092841154;
        Tue, 27 Oct 2026 02:20:41 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:40 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/61] python3-jsonpatch: Upgrade 1.33 -> 1.37
Date: Tue, 27 Oct 2026 11:19:36 +0200
Message-ID: <20261027092028.782979-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131473
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.37:

- Clean up in-place output after write errors
- Reject invalid patch document containers
- Use UTF-8 for JSON command-line file I/O
- Handle source pointer objects in move location helpers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.37.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb => python3-jsonpatch_1.37.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
index 6a1715c6df..62c12327a2 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
+SRC_URI[sha256sum] = "04288ef93e60084bcb118101cd9d53424e627b91bb47ec5a95c02ec3795f6d23"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

