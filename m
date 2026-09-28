Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FAFC9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:17 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46640.1790553850144456383
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GnVnhzAZ;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f9bso11021545ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553849; x=1791158649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1NF73ZExU7Li1xuZS2r4VBALf8v3N+rVr/HSre0hQY=;
        b=GnVnhzAZwQRarLPKftaGw7Cshfo9FHj+XguUPsw/of8JtEcqKFyvc3R1Q7HhsAWnmY
         VRq08F1D15lunwH4zbFO33Qb6dTpEVzTUKscNA2d7p++5kRJED9RS186YmvnGGnzO7qk
         L5fU8P0fc4i2/OReqqbNSVs0nNe/6oSkJYHaX6l562hi2E9vDWwhpqKpqawncdwEYAxY
         DXf5Uz465bbSiz8ctEfWHCI6vAOhFzIqnymFuvOSj56fGCBa/ipOxYTGEsDS59QVHWH0
         B7NOGn5lIawulxCiASGkvZw3BN/Pvmk4gclJ79PDOntQ+6yKOJ4k0Jv74J1yYihJvxs+
         gAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553849; x=1791158649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1NF73ZExU7Li1xuZS2r4VBALf8v3N+rVr/HSre0hQY=;
        b=gY4UgLH6eZabk9t9UCssRXScs/F97srKC2Q3jJuPHuwy3Eyg5B6mXgoH08h3xWVNEh
         I5saYG3j088tXv13fqhZKDsHGytQHfcwpSRZuAuIssiCqte0KZ1WP7gFKmMFDWJnJKNB
         Bm1igPns9jrTwQlnC2Sw0JiVnh1Dh1Uk6Gv6tKy39YpC5YQR4fCNRfU3+1FTN5lNiKFw
         wO9+beqKjwIIU8TILfK3mCJFozYMhxlkJtq06yUZIs+OisWhpuIzds9FHcL2pMH9HEOh
         g1iizFnPrI9cbfTXr+sU3j0Ph1kZPr9hnzbTj5OP5fuXY6/IVBJBkI4/K6G/O7VpG7J/
         X3rg==
X-Gm-Message-State: AFq9FYLuK4DNSC4FaSHSDQt/Kl0+pGA0yb/AkrNG28KUh0QjZSf8qnTc
	vARLE6ko05fDOJeAh5yFuGqTWGemeWS9mXVdB3ILbrg3Zvv/ZOcZ+tOla2IOOg==
X-Gm-Gg: AYBFou0aCsE+oM+9Qt545H4t1HERURrCHFMcrZuRTwsurDje5uyhivOWZMZHSyaGykk
	/3UbDAjFAwDVExNGpBY8/iyhShy9MKsrVb5SGBy3BGIglRWn/zLbOcDV2NXGqER7IEVC4jn1yAh
	5cbcueIFSYHwwfBAm+3U919BOG2BY87znBhJtoeX66Y/pUdAIFSp4+MkyR14jNeUpHCVZIMU3IX
	QOKPFcX/RmRUjHU3r28HOtzrA4AYH1JjbaveOjpMvY1i1u9O2w2PmKITQBACqhGkRVklhNiTRhG
	vd5QBMuF9YfPeFcY+2NmnpeuArcSa9wbgdbNNvS7sB7VFBHYPPObV8pj9Ty442LENjN+GaVCt5J
	w+2NPD1yqScZfUeFLdfDR8VnKHzMfychwqKu0l+ZRESyiSKWdJhHYnSMVhWCQKRwdUA2UqX3oEn
	Oo7juIVgjVozCIPPyMIRvQtNRqv2J82oeB2+EAnoA9iyVUuykK3gjaQGJZwvjmyJ3vy6OkcvHbO
	J+HdLT3cndtuVZytRNBz5Q=
X-Received: by 2002:a17:903:19c8:b0:2db:539c:b7c7 with SMTP id d9443c01a7336-2df7da7efd5mr91413725ad.20.1790553849488;
        Sun, 27 Sep 2026 17:04:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:04:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 28/30] python3-tornado: upgrade 6.5.8 -> 6.5.10
Date: Mon, 28 Sep 2026 13:03:00 +1300
Message-ID: <20260928000302.2528437-28-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130415

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/tornadoweb/tornado/blob/v6.5.10/docs/releases/v6.5.9.rst
https://github.com/tornadoweb/tornado/blob/v6.5.10/docs/releases/v6.5.10.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-tornado_6.5.8.bb => python3-tornado_6.5.10.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.8.bb => python3-tornado_6.5.10.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-tornado_6.5.8.bb b/meta-python/recipes-devtools/python/python3-tornado_6.5.10.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-tornado_6.5.8.bb
rename to meta-python/recipes-devtools/python/python3-tornado_6.5.10.bb
index 0f5509536d..9536008c84 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_6.5.8.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_6.5.10.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://www.tornadoweb.org/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9452e1b208a8bd771e2cb1f2ff564985b9b214bdebbe622793e1799e0a6bd23f"
+SRC_URI[sha256sum] = "a6b1ccd08c04b4a06fb5aeb381be99de5ad1e5375c1785e31d78c880feb57687"
 
 inherit pypi python_setuptools_build_meta
 

