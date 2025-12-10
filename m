Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FA7D3C54B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:25:43 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15607.1765373140858896002
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iIiasSwF;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29853ec5b8cso87703515ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373140; x=1765977940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xit7xh9idnz0mZF0ipKuIVdnq5lDVyAMN0d+/9Ye0+I=;
        b=iIiasSwFPjb0El/5Ib0cBbrP8lanq2ejrRCsozUtVw9thaaM7rHcCI/q2dbFjzQJJr
         /VHYzjmxaMTNDiEo1NKJU/Yf7b4V3vFD4+l3MRA5kS1MBrrvJHJyIwlkEA9RZT1KxR7m
         g6f/kN/UReVcs/HeqLVtBFAjHGOkgXx9YkgFppMAn7FobqAm9mJXVFRy1yDCo8mJ/44q
         SdbVbMsjA8bRP4dnRzlMN3RUK4dlpijKTzq/iKjIwpod6MpbBm0OrHWfSwJOuAz42wI4
         mD4rjIyE0jK0YfxvW6ENmn4/EWZO1fmKKj2bGKJ5eUwvy33HibzQP/xIR83DoQ7IE0qm
         hjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373140; x=1765977940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xit7xh9idnz0mZF0ipKuIVdnq5lDVyAMN0d+/9Ye0+I=;
        b=IAkU+wc1LAyM36uo0VzRg3d6qNUJX99L45WdfG0Jii1d1t2XwbKxkEgHKoWDBEgy+2
         QN3velfDlJdWvDIFDQSFgv5k1/iP6cNHPGlJJ1nOjI/Fi9X0H0UeLJn8T+K/qqDenWAj
         yRmZYY4G983xjFSXHAUri0edj73lL3kpvRXR7PDkqh3pJYU+iLpE0dLDKEo9XNlMjILg
         qxZYGmn4bWP7U7eHREuJrkrrug31HIpHRe2SdAonOA2dM3uXcEWQGANUrzZdJ5GLf+jp
         zcaGXmuUyzWihlrh2oOTI72sQZXzWGMnLZVKrk225y6lnR5mQFl27f7Ux5ev5NLjtc7Q
         tGgA==
X-Gm-Message-State: AOJu0Yx5S6Fq0YNDKHbRdpUI7uTDZ575stqcqiNYgHAuE7IgTThtK0Kr
	WkK4HbKwPx2VHpWNhT5DteNLv4TzJRUQo/YiYYMMJDuYHrXEmBFjZdsmfIdNFg==
X-Gm-Gg: AY/fxX6g+4oup43PIqDJTN0B3TNIWBtad0DgOGtWtHEq5gnLoZI9N67WYqXmBl1gfrC
	qZrrAGButSPnxj2tUtwU84bDP4bQQPlFohMjm0LCwvUcDHIUupZUy4RGTAJKJJ6DAHAmuoKYWrr
	kNfDC536L5RSj7y24GKB35ifSy1B+5gt5JmzqZ7C4f0ySNgQfWboRVx4+bsD6sKiC9BjlJIEmXM
	nxtIBkPU+Knjo7godeh3FhC66RzUdilvW5Ub+JkPVQ7SM4F+oLpFfzd1GCPXIXXf9a72TCJecx5
	yXVgiNQzrYWNx1eiX5Og8Nw8uayZPQejHKVREyq47K5wlVEO0QI4+7c12DQKFYODEvUAYQpFse7
	N3Gi2+ReZuBHTYCn+yZ7wAQeDhrJbIi2aHIxPQHx3j9JLMwbg5uz8aqMGAU4ejk4QqsaSj5zjCQ
	+uEQwukHPM99dQVP42WyIjq20=
X-Google-Smtp-Source: AGHT+IEfBlQi2vJ4NKwdVeZaFONqqJm3cq8KTvj/ZZsOLvN0utBI3N1JlzFaBOTC4mQV1r6jyOKpfw==
X-Received: by 2002:a17:903:1904:b0:262:9c4:5470 with SMTP id d9443c01a7336-29ec26be96amr22717835ad.28.1765373139886;
        Wed, 10 Dec 2025 05:25:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm184283485ad.79.2025.12.10.05.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:25:39 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 17/43] fuse3: Add missing rdep on file for ptests
Date: Wed, 10 Dec 2025 18:55:27 +0530
Message-ID: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122521

From: Khem Raj <raj.khem@gmail.com>

Fixes

E  FileNotFoundError: [Errno 2] No such file or directory: 'file'

../../python3.13/subprocess.py:1972: FileNotFoundError

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 32a029dae19d2a21af94ee7ad2793ce907178686)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
index 1c91a1aa17..2747e6c8be 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -35,6 +35,7 @@ RDEPENDS:${PN}-ptest += " \
     python3-pytest \
     python3-looseversion \
     bash \
+    file \
 "
 RRECOMMENDS:${PN}-ptest += " kernel-module-cuse"
 

