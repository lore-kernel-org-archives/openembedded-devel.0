Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3088CC6B03
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:25 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3509.1791885561293233331
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S8DhFkzv;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so989074a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885560; x=1792490360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEDQS+kx9VMgq5JbOjminOwY+7UtO3rsA4XnZSG/ZsI=;
        b=S8DhFkzvCcnfa3EOAkTOTpNamzJA2GvP2A0a/qf4U9+Dub4hqihv50RoCdl8r05X6T
         4wQcSCp0i295TOR35FbXeMA+XCsDghUzwK+ckXqvYoaBH2NF2cgO5i/LJZH20J6Tn/KC
         9eDKsyHnkR6k1BNFHUyYaOZN2QcO22Pjhp/ehmSk8i+0Vs7vTyzswfI86CSCDcKi7LxI
         EurNifZDklBB6q7qVockpQbUmVsowZknKId9L9dugeqz7NC/zH38UopXSk1mGxkn1v4v
         M1vyfsqebeuO/AK5dae+rAg4uFo8qsqhktS6sJGMMvdsM2Q8tZJCYwaRae5hCo0bmKBW
         rTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885560; x=1792490360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEDQS+kx9VMgq5JbOjminOwY+7UtO3rsA4XnZSG/ZsI=;
        b=ZyXEnUjuas61bdJtPxUbPN0qdo3FLLRmYMLQUoczw7zp/y+81CU3u9RIDQ/aEbUSBo
         XFhQjal9/jBbhWbwY/LZDS8H98a2zgjmrMphx/vXl9FbLkkYz8JofftGfXWeW8gzkNUH
         R5c296t31SHQA4CNVBjAxPnQJJ4pY2iBzWLkgtIAysMjPHJyEjhaJq5QtVJqj2+3jwgq
         X+xOYmhpoqXhvLUm0B0x9sI838BgexjbnrHjGsOKYydJO0WpOZggNjysCNSrhlTee5Hm
         3LYa29x7Ldn83Ng+jSLGT174Ml9LjUihj/AVTRQo254y9jOdhlk/lsAKw0vblQHaTq10
         +9LA==
X-Gm-Message-State: AFq9FYLebqyaVMuW3owl3/TLs7tNUhsDiqbs7D0xk9EJHILIoBKN5zIt
	5t69xGon5bkAfNiNqHdstionNpJEjlDskQJgLIcg6YrSLXW63TKi37heZNibvQ==
X-Gm-Gg: AYBFou32bGGkPEs7Xf4Sd+sF+pnAp9DyVLEZ9P8FhCf21ztmM8pv7vDw1w27DLG3bGH
	oZmL0i2GTRLPMS6Y90HqjpnMkYVMvpklj1YPK5ZIw3MjUm9UD28lTM0myc3QVIvpwYB71lFj0dh
	nhC8fnDSx2XLt6nQzoSrv+tflFfYVEjG92D2rfZkQEt1wX+vNDdcM93x4hzk0wqOZiyOlCIWuxp
	YgeyngrCq9i46cEmoXY13Vlj/VN4K9u0Zqc0slpMlYwFBbxkW7n0PNz3qb1DgumHpAK2MXbMtU3
	PrKepbdkyF4uuQWT8QzV5GEd5M5691HQu/JybyOB0mlQRLp2svC8eC6MRsHEE1YPd5Te9zk9+mz
	S7V3hqXyhBiAYZ5Gpt0pqIWllP2cA9QKdLEu7RMVXX2p99IrN/Dyy+1mFXEC3quC7A2UMUoB9Ci
	56IhvPsaHyrGrwJms/0Q/9Z1wjEhrMxTLDuzTNrMouuulUpd617eRk2n5Yhl6HlCnviJhOIBLxN
	iJScCDvc3Ln+0xjWuDhP+4+WeWpxL1ifdRoaWk=
X-Received: by 2002:a17:90a:d44d:b0:3ab:1b19:78ed with SMTP id 98e67ed59e1d1-3ab3a60d92emr9861246a91.21.1791885560316;
        Tue, 13 Oct 2026 02:59:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-python][blacksail][PATCH 4/28] python3-eventlet: mark CVE-2023-29483 fixed
Date: Tue, 13 Oct 2026 22:58:39 +1300
Message-ID: <20261013095903.3544906-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130837

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fix[1] for the CVE is part of the upstream version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-29483

[1]https://github.com/eventlet/eventlet/commit/51e3c4928d4938beb576eff34f3bf97e6e64e6b4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 47b2ce9cc77297c740ecf50d00d6956f5a867144)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
index 3292950e2c..67a69b1478 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.41.2.bb
@@ -17,3 +17,5 @@ RDEPENDS:${PN} += " \
 	python3-dnspython \
 	python3-greenlet \
 "
+
+CVE_STATUS[CVE-2023-29483] = "fixed-version: fixed since v0.35.2"

