Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043BBCC6B3C
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32816.1792043043152472652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nWBgvLNL;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6e954afbdso8089475ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043042; x=1792647842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ka0tNIP13fA6NTLmMi/qzJoPzc0yrxeGeXH++YZguGs=;
        b=nWBgvLNLr8Zp99mNy4q4P+ErL7u74S8ZQjHONv7hfiTgC1DMTVjX3MKzFWWNohW4VS
         4Nv4AnZfstWti8CtX/lkXB5vuB6ApWqQ27hVa8SZY0WJ/VBjahoLEs+Uo5fX9hlnl5ya
         Qbpj4Ui9XXuVsDVZhDDunGffbwQOSsny3aElOYBrt3MRYjCju/9tFetSB6bbco/1fWi4
         uDJHFTSUey/Dw+lnuT7zTvs5f9wOS0pb2I1VEsdjkfW0t8CFDJSSL8am+gWXApztpc55
         I+39yyv8WYgM0nDzkeWNy4dTPnHusB/Li1RoHseFT5Y+OzcSW/89ribE/03SeGExZDQZ
         WUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043042; x=1792647842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ka0tNIP13fA6NTLmMi/qzJoPzc0yrxeGeXH++YZguGs=;
        b=oGYiQE9vYtzlDyKcwRPj9IYi32yx+X3VnvtAVdZryP64Hu+lnkaJYoCRR7byfbussa
         3TwZ5u1/ekkShJtlbjRlx3eIw3Pe9betGUBedzF8jcvGtGMrMHs/S9RfF1/GIkXxOvxh
         PjHPzQxmq4pVyE4iF4ebt7ICSsjwXIFmM86SiiNqRs1KrwL5LCpWeGawjaIjJLdabAGq
         /LTL3pkwCjMFop5OOTkKPSn2Qv45Tl00zsGG+qj8p3HR8b+unUSeg+Pq9QgKpi4PgoC0
         AR6/rinLa6ggDx+DRV2sv4GRWHT4gfJfWDZWcamfhk4Qt68ANFQMzYyZotP6iyTC1U3q
         EY/Q==
X-Gm-Message-State: AFq9FYKOkjxMx3XWWL+bUn8rntN4D2pnNUgCNwLHfFkE9OuFvlXYhmLt
	enCLlwQ35pqr8hmbmFWboJptRe7pN/ueQZsDLLHjOQ/GcQMwZWRExfD5moLqYg==
X-Gm-Gg: AYBFou3wbDUwvkKGBztDktXK644H6ECdeu0LJJAY6WRrTT6pB+FFyuZ3Ijkwd6NaNhB
	en4KJVNXI1cpvslwQKVvbsD5zhwoYhKK3QfB2nFGcEhPzNdTYShmniB6LKKoigbRquOpEaWfcA3
	EMx3dmuFdCk7CicSOBpwnm8Rm+aCzJht5mRD/vWUeSuAFcVacdPsvcQR9D6CbfCD/78RZ/HcJsB
	LiVmkdlHsQUKxIgV9N4g7xST6TL3Xp4BKhPfl4qzSGFpnGXnfObKJ96fAGAnwgEqgDO3TwcCmt6
	PbNXQIay86z4f4riaHRtr0kohybxq3NwLFElNleXP3VtxKntbNDA98oCcDxDjXWscdGkrjcyKTD
	vdYqVsmVt+Eb+CQXY8Ek8VW4ZqwCPHJmaSRUYvZ+nPb75SaGUc6a8gwPpRhpsRRKbbPbrSrPtpH
	3z0n4NuieTPL7wmfwn7zQVgbQtDFC5PDnv/II60kgC6GiMBRFBAZudV5YwDvCWwLB8DVuDmtin9
	jdn0IOe9+odIQVFkb3359M=
X-Received: by 2002:a17:903:3243:b0:2dd:ad74:ac32 with SMTP id d9443c01a7336-2e842bc61a1mr157348525ad.27.1792043042497;
        Wed, 14 Oct 2026 22:44:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.44.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:44:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 34/82] libssh: ignore CVE-2025-14821
Date: Thu, 15 Oct 2026 18:41:22 +1300
Message-ID: <d1b13ec2ac893cfffb4088291a36011413f49bab.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130954

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14821

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 6541aefe606686445b5f7c7feb7eb4dd78ce5543)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index d2f5072d1e..738f8b1731 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -48,3 +48,5 @@ do_install_ptest () {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: issue only applies on Windows"

