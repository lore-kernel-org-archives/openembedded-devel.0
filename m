Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7738.1793266027595395324
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 02:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=K+oFOQMj;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e940d5d2beso7114015ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 02:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793266027; x=1793870827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5It6bycBh4mjuGXDtGMlGOZNNn6BehQhh7B/ixxoKSY=;
        b=K+oFOQMjAv5nZRlua0wGF5ATvaHMqdvyB8CGauItFV0ORD/9wmRJXYGwhz3kOGUiv/
         2iCT1Z5etBvSp0nS1mVhZLNDXW1lvFSyr7eYJjdOpwLdQYNDjoJ0ve9xGyIux+iq3umR
         q8sqOHBKjOKE7sqJo1UlT7T3S84mtZFo4bdSXvS9Uxuc6FYwhr4bWIeiuKPN+nIJkXLG
         s7re/m+cJPx5klhQEoackbzGu9emGGvCp8aRor5uaYNxkhxG32+S3hy2maKuQazfKyt2
         eHUUOjeOjJvn55XwUJItvOBH8AmvhjQsw22SgZfrg/xsHsZGK4H5qP7TiLO/nyiZWglW
         2fzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266027; x=1793870827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5It6bycBh4mjuGXDtGMlGOZNNn6BehQhh7B/ixxoKSY=;
        b=QfjOh8cS/zWyHJJNfiA9SkwXCUtHf4w1z5fGqa466PxPo19YhRXecZpI6L8oj55GYy
         v1Vy7wyipTw7IE6AUYub0LsCs21VchwBPbQSpu08nK4A9Fkh2aUpMQ2qA55eByxmn4H9
         DX7Puvf31pAPjlz4Ik9elvVnBBAmjpnGliUP3N6XoZfSlyzRPdi+IL0OmuYu1WMuLNk2
         AT9m6X2GQIIv11DcCFi/rX9xcRgj58nidCxDuYhRbcGzwiuj7hv2mcsxlIYxQn31QttA
         tlEKardtEVRSThetVsqLWE88X8pyCImTI573t/LOr+pxzwj4opux7k+iXYh2n4yhA93s
         7Ijg==
X-Gm-Message-State: AFq9FYLyMr13YJc1N09pvyzN1Zh7eMJkt9TfRZaK8FSBppajtHEHFKwz
	XPPuKcCP3URbQSnNDhCdzviaZo7nUIWWViBx7QSjjyIAA51X8/zaKSAZEjPBvg==
X-Gm-Gg: AYBFou0260RV41ZFM03ENCix5CkdtV5tgam2gk55IEXqC6BSNWsjaco4sJ346e2Tw7f
	BxTpwLKwlg1+WMHr0EChD015OwtSiP9gAzmn9qcgvSn3n23AcBWuSjOKoTLF7nRkAjUHPjPLW2w
	eGZLhgHEiTj5UlkGeOyYSatVzqhnzyCrO+6KMiEe/xRFHuD+JhqdsSCOiyooNqVg4wxDXGOcl8U
	+S+QhqEWM/7ACuGbuf8xO2ZxzJ33dIlM+PZL+FpEPvMCEqonNcznUIAT28RuoyhBBVT5aW8ApDn
	XAdaeD7znrtKBH/DVB0PJJZVmFAoIrlpI4AUn0dA6rfBiJ6sZZdV/tNYYJf7Wk9U8apWK5aYY3B
	I7qN4ucOzXR1ME+c688cG7a6hEXYSK/rMGXbHRuNh2JFfgbRMPhKm1sSYyblpKnzrgaJClShOt3
	MYJcJ92whk2QurYeiW3ZM3E+hpBdvCsXteN01ZbDI0hAVRubIaXbZJLfHYvNp96XGyqfPZ+kf95
	20Aef2RryDJRxVxGw9IJgFMjNj21ytiXZxKB0fYjGb7xBu+hU77zx7uI3NqjpFa23Z07jBmlvuX
	9tc/Z8MddjHXtJRqm1YiRN0lIyc4787ysCDUwJUWuhHyQtY0W05wkXzLLDhLuQ==
X-Received: by 2002:a17:90b:4b89:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3ae580ae58cmr3462392a91.19.1793266026952;
        Thu, 29 Oct 2026 02:27:06 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e874bebsm3513079a91.14.2026.10.29.02.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:27:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 6/7] parallel: upgrade 20260922 -> 20261022
Date: Thu, 29 Oct 2026 22:26:45 +1300
Message-ID: <20261029092646.3634215-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
References: <20261029092646.3634215-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 09:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131654
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../parallel/{parallel_20260922.bb => parallel_20261022.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20260922.bb => parallel_20261022.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20260922.bb b/meta-oe/recipes-extended/parallel/parallel_20261022.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20260922.bb
rename to meta-oe/recipes-extended/parallel/parallel_20261022.bb
index c536df7ac2..cc49bfdf5f 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20260922.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20261022.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "54837e9e8c16134a3c2e95f91c5fe2f7893d4cc89f252b26735713ceca866387"
+SRC_URI[sha256sum] = "4fb0d2d4d14a4ef6448c788cb2bcfde9fbe00b8d4bdc637a7e4c08f8c5453a55"
 
 inherit autotools bash-completion
 
