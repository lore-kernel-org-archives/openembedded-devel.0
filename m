Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.640.1795195667289750266
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2026 09:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=KfFFlYXp;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso553714f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795195665; x=1795800465; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJy00z0shoP7kD0bDbTLByntJmhZkBxQxjNYBdaziJU=;
        b=KfFFlYXpUWfyu8zBdzELDej9wiadQOkcQP/B57+yeXn3CY3iMnnA+FKscUs4xcDBjh
         RDdgTlIaVKcHGvCTp5dQySdSoL3V8V5hZPe0ndqr7fL2H4YpY7m/kGw/2NGDquuj9lkT
         x/48oVUWW3d666QJfNQw9JOothi7vO3y0/28M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795195665; x=1795800465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJy00z0shoP7kD0bDbTLByntJmhZkBxQxjNYBdaziJU=;
        b=B1/Hun1wOjfXMJtKqA/PF9SEEqboZ+rBUk/6/LuyUC5XnYux2BB5Tw/Djp8hHIqeVC
         I0+3MpvpR8C7DZI6ziH8mYs84hgQVH0L6xF8gvVJVPkQ4axN641N3I/8xZjPs1UZWLtd
         x/6JZix+hlxqkxvMbjkc2VbrnD3a66vQi6NVcwnceOz97SiCji0IYPMMkFXyoewDdYpJ
         qj1MeMD9m1XQUc8/ZF/2YBZQusu0PSzX1ZWRPEA86X8zYHuvu2sScsR+ErPWJnKe6MTO
         LDeTsZ7yDmy4W/kbu9Hui7V35I25SRJPToG0DJIREJ60I4KGes50QY92k+PxwNBgtBsH
         ZSrQ==
X-Gm-Message-State: APuU4Z+2empxFTGzRjT/wV4mijApzZhd2aWa48gOUWrig8KLr0RgkK7Y
	LuaRdbXSYm3rlA3getOBdBlLp65wQYTsnCnMmOm9XOazetzYans7rSuSknWAFtR0evuyW1iSyzp
	Bd3uP
X-Gm-Gg: AYBFou0Ug+V01swoCKERuwKitjs/7hsOGKp1VFL/Nf9AlQ1LCjv5oHfZeGp8G2t6l5L
	Wv7ozRmHlRYrhJ079JQ3Nj9MaKlMvDVxIlwTKBsmV1iJZ6Wb5h9t/P3cxoP+7whRxMhPBtRUZRf
	ew8RxRMS+tdw1TQNP0S/YT4i3YYoja3ORi3+pSa/+168MTsSg7IyECz5nFzqdSIv/Cek0fqenZR
	VM//LNbOZvPsqu6zaXJ/VE7hgv3tO8qaKcCeHLV85oYfzjFP2rUz7J2nUwSHcYj+uoRZySpNDau
	VhfOqx6Miyiigq1QszSkpQDA9hqrpX41UhITwZCmOqdhRlrLSnawytcSlzj4frcQmOwo3guKKDt
	vFvTydG1b7/E56DPLTw7jkSOonqbKVzYwzwZjWZGThR8HJHeAuXg/pc2qa5aQQc1Vhu186ebu+Z
	4DHCzjulO6wPC0pnVBIBHOcjH+fwRBvPtT9cD1llkR3yaWo+3NvJXAOhN3mxbzw7puYI4edaToo
	CLk229JUC+cJBC+xrNrYR33a2QuCHshjpn5mtlTyVctbSMZsq5UP259tJo+dR/pl0iLo7jhDNSs
	WbSLi1PwMJymxFjEUht3YdmrFW0hHp3C41SPAud3nQlCd95V7JvRgy90EW1Z7BHkEonj2b3Xg86
	xogSaLaDCVdTcolhZikhhL1LdSICCwN38sVFMrvIlip6rRI7WYsdQBw==
X-Received: by 2002:a05:600c:820d:b0:4bb:5de1:e923 with SMTP id 5b1f17b1804b1-4bb887c33f7mr88025365e9.4.1795195665677;
        Fri, 20 Nov 2026 09:27:45 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm1946485e9.1.2026.11.20.09.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 09:27:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-jsonpatch: Upgrade 1.47 -> 1.48
Date: Fri, 20 Nov 2026 19:27:40 +0200
Message-ID: <20261120172740.3283871-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120172740.3283871-1-leon.anavi@konsulko.com>
References: <20261120172740.3283871-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 20 Nov 2026 17:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132780
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.48:

- test: compare Unicode string values exactly
- Serialize and compare patches whose paths are pointer objects
- Report errors of jsondiff and jsonpatch in one line
- Let jsonpatch --backup replace an existing backup
- Reject diffs that change a member whose name is not a string
- from_diff: avoid the generic deepcopy and the sorted copy for
  move keys

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpatch_1.47.bb => python3-jsonpatch_1.48.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.47.bb => python3-jsonpatch_1.48.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.47.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.48.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.47.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.48.bb
index 6cf5f0cb67..4a43d3ccfd 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.47.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.48.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4f81c84f9a053e31fe9402a2a4e78864"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "5ed650b7517789e0f43428aa7b09442c0b90de0a0fd17a53fd0ebf55205c601e"
+SRC_URI[sha256sum] = "81e9a03754137a1201d9b534ddd599cc0eb5983fe941bce238dc8a76e442bb94"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.47.3

