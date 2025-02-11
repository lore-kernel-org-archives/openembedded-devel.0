Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC48C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 11:29:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.10044.1739273372330684798
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 03:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BN8xNWrr;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso3084050f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 03:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739273370; x=1739878170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/Smbcm4ko5fhW3XgYIQDNIDJHuJHL7Ae7pYxWXkMyY=;
        b=BN8xNWrrfHJg3+maJ2LgrCSCoCfRvpvdGJDlmfFPqcS/hlWxPq6aqUHds52BVpysxh
         EWZdRlDbjkbUa7s/ia95lgk+IJQp78R1MXN8lpS0q/9u/0dEhOztuI1CXwJ0wpxLJx/8
         yb9VOZmVSZJYT+NA4ZtzvlNlx4Vjm47VVtul0COz237cXdTKCC1fxSJ59sfMbF/yMuvO
         DhoZidgQR8YS/J4Nt6Y2oj/g36sINxlny8pIW/JU9t44LjqCE637PaZa++rYsxbRHczP
         HyR5X0EuceSWckl4vpVE/DdgxgEaFO1C7ScSgLwJ/A68FN2zNDIEioaC/C6BC3/jA8tv
         2qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739273370; x=1739878170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p/Smbcm4ko5fhW3XgYIQDNIDJHuJHL7Ae7pYxWXkMyY=;
        b=GJ/FoNUuWC3dfN6rtWL+8WLMZiRaGUf8paXfq4sZOH/JPFfPzzLqxTr1IGP/xf9Hvk
         tRUVzFQzij4h54O8kJX/n3bQGSOxj0WvU9nMr77TpZKLqU6c6x2/+SpYbVsO5ffpRrHs
         aFZmo54kVVo7WVP4GwfTLjvr7aAhxikmMvQ+hlawAHDXkSX0kHi/XdcMaLRH/zLd5TJv
         uYGX/zcxYdb6c8nibLjoPKcLlhlOcEROvQdexXoV+mQw3G6tpaZgDklykoDqFe5Lge2r
         Ef9YIKiMnNo49H5lzlmoLgoILpwqb/Y3Dey8tShngxUqN4Z0JPHBuXH/x8DDItp28tbd
         7vnQ==
X-Gm-Message-State: AOJu0YzOgdE0bun8g8TIF8cUFS4u9+UPMfDk2a5V0QG5sPah1D5R/CZ0
	1hkiOLqaYsBiU9daR72tFtcCWNc4X8DhJIcQ28gCRKFmnqd8/172QO0kGA==
X-Gm-Gg: ASbGnctjjRANmA3AyixWB3rAHD1a2/bTO3JZbv5ziPBb56UdjGyHZ7RvmThoU+8PsMK
	aNz6ZtOwFoiB/KqZ/DbnOPnKYWEc6CmN6zZHQX3PQWz1xCNklA4rvDtrmrOBWqGbtQXmiurFBA6
	8em8RcOoBVqMyj5DMySNtXqlc+5uq9ZERVNuHztUg8MBCt/Bmgc96EMXggOg2y9qmhgN0I7MXMg
	451kEKGAPwnQsNSXMdRKg8s3/A1Nb0kfr5EU/uB70AOLcrybCgYYSPww0HkwWW7cdkg/7ISYlhi
	gDy4krcmsxeAY5/cmx2DVODt
X-Google-Smtp-Source: AGHT+IHk/ijhsWWFkHyIXA0kre9B/ao/lFg5JZbcP0GFUx8Iv09faTXz8wLYF8pkRcHx4iuouTpkgw==
X-Received: by 2002:a05:6000:1ac7:b0:38d:d92e:5f79 with SMTP id ffacd0b85a97d-38dd92e6266mr9661711f8f.33.1739273370131;
        Tue, 11 Feb 2025 03:29:30 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm12912362f8f.18.2025.02.11.03.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 03:29:29 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][master][scarthgap][meta-networking][PATCH] networkmanager: remove nmtui from EXTRA_OEMESON
Date: Tue, 11 Feb 2025 11:28:16 +0000
Message-ID: <20250211112815.18422-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 11:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115423

In [1] nmtui PACKAGECONFIG was introduced but they are still be
explicit in EXTRA_OEMESON and so remove the last.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=c331f59e42e9c0bda9d47d0365e6c276746fc81d

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.50.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb
index 9d2b1f2670..cefafbad72 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.50.0.bb
@@ -60,7 +60,6 @@ NETWORKMANAGER_FIREWALL_DEFAULT ??= "nftables"
 EXTRA_OEMESON = "\
     -Difcfg_rh=false \
     -Dtests=yes \
-    -Dnmtui=true \
     -Dudev_dir=${nonarch_base_libdir}/udev \
     -Dlibpsl=false \
     -Dqt=false \
-- 
2.48.1


