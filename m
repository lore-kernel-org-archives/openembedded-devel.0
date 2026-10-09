Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5653ACA601C
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4395.1791540374272493899
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FPLxBJRl;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so6219634a91.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540374; x=1792145174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1And9Ul61Fsqfd8n9DC4tbJ0PqiRePdRd8bE4BL2vmk=;
        b=FPLxBJRla4dCrGz/4DkUaF/v7CGADpfFE3NOz50Ic3dNCA3wNTJK/rh/yR/B0Km4yI
         i9nbBsabHD7vt0ZB5ZoYbqi0tkM1UEz3tBRklc6/m/t6DU3JHXVNyq9kmCEUnlpfdS08
         M03OFo4PqmoIttADVaTnVBr/e7pMYIPfwv6HngDJli8gXV3yA37nQjTDz1DL+J8jYKQg
         7eOG2pFPoeJsexYQCsPAqapSQ/fTE5jqf4A0aDJVNec6biYB1Dk45W8pcVLj8EGHXg/Z
         1qeMHV9bBCgVLExM4qmUnCfBI8D88M4NSg7T/8RwQeUUNs+FuvdQhOYD9/KOW1S16R20
         51WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540374; x=1792145174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1And9Ul61Fsqfd8n9DC4tbJ0PqiRePdRd8bE4BL2vmk=;
        b=1cbH53gOS5oi9NvXbEYEEz5hkYOYBZMkZ2XNZfyhDZijQF7a8eA6xtqjLTxclQSsp1
         s6Kc5aOi4QkEqUw8gJ3HGjWZneURy6htAAzS5+21KhMaQlyc0locs+kSPQlH7hLK52K3
         qw7w4lbUOAgfw+3uKSTsZ5GGVs4iufGsU7H7x2O7Of+QSuCw+H81K0j3fmlrk04o/CBA
         5jFAdJWKhnHUaCV92m7pOAbg9Aa9L/MHQKm3KreFpnEjk0UARU3VVletDQQjbzeRNV6y
         w6mXWtBsEPR9zgqAoV9dpgN26+eQzZLi/an75pFMJdYVaGYiJhd03WTI+PkyehKAHcZh
         adJQ==
X-Gm-Message-State: AFq9FYKO8ORfVEX60Th/jxLdC9X4SO4vb2MzbzCjc/9TYTm895hcipgW
	2VD+DK902VCFOuaz6bHt0SENdWjofO1tb+yftjBWpYmqkOVqVI8+rMQv/qIb5qzv
X-Gm-Gg: AYBFou3M2hTIMYxCTUsT9nkX3/sGZKUe6LXlVB6wYS5zgSKhcQHquf2hI1TnAkA3onm
	W2Ujg6nk10b4c7OkJAC3T/Z4SE+Rl4qJaAavGFPrekdeqnzQxBthxOJOTY5pALjcLR2ET+Zome9
	7/KHiqoL2svoHBCfeQfkUKXr/3B05sQL/rLp9Ne6svY21kDdzwJxRwLYv/b7QzmOWmbY8bumimt
	4Dw/SvZg5l2h0Fglc3aVFLyD3BUHMSuixIhUj5WYBxT/zXerypCyIe+BL3XTNkqSnvPTxgI1cts
	64l9whsuSfdD8v4Tf8b3IVaUXhrvp9V2+1ZGZHc3TciIr7SX5e9yuAgzqfBgaVXFDKxT8jOa0eF
	JZwElYBEK6kWMVwuOg6fJed0Dvsc+Df6+BjR9fcD/W0NIqXIuCbIkA9Yqgau0LareyTMBi78Qsu
	qPa6d9H9Z3OSlpSzqTUAOuGI3QJnRPJCoR3QmH+oy5AuQ3hsILmKSjtTmpe8siJr5DN9zPc1eFD
	6IFmeckTlM2VbPPa+riY2fdrC1AKOimYF/C1UI=
X-Received: by 2002:a17:90b:3b52:b0:3ab:1481:2fbb with SMTP id 98e67ed59e1d1-3ab3ae439dfmr1226079a91.59.1791540373570;
        Fri, 09 Oct 2026 03:06:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 4/8] srt: Match SRCREV to tag
Date: Fri,  9 Oct 2026 23:05:39 +1300
Message-ID: <20261009100544.1428938-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130688

From: Khem Raj <khem.raj@oss.qualcomm.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit c024e4975685fafc85123c7fb350968f741ecc8a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-support/srt/srt_1.5.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-support/srt/srt_1.5.7.bb b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
index 2796ee443e..7d992a1245 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "d99d2e1a3b1a213b03c7dfbea5133898935fdeea"
+SRCREV = "899348d8318eb9a3c5a5b6ec43c4a1114288773a"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
            "

