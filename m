Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39909.1793009963515161521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T7iizrIP;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1918165a91.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009963; x=1793614763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BRrJmT57+W6tD4KjOXFDKVPQwPydRPm1M1QGOHUlGI=;
        b=T7iizrIPgLg1Cs/HBzHIST16OB8xc6i/sN2fIOvVIGyYhW0X6P5u+dNF7lBMRXQRMU
         ukaRxTQkk304hjUGBalLwfKZrDect3J5OWPhanO5tsT/6kxQbhS4Le4g9oQkUXs/QLz+
         C5CfNNHcszqGRSLsLND+BE4X56R0atinHyhgLXdA5Vx4RUaVZ7QmMgfmoBTezyFN84Iu
         vz1mUfvctbpXqIjRJf9ZfEpLdSgQroJWmhcCBpeSDuJ2yHlJWmYI223hWPPpl0LOJHPQ
         LfhKXuB6hioH7REOKN4nFO03PqYWIjasQFy7guaig3lSuUj7W5khudnnlmz28URzmgQl
         RK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009963; x=1793614763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4BRrJmT57+W6tD4KjOXFDKVPQwPydRPm1M1QGOHUlGI=;
        b=ImM3mJkiYaA76BEz+qylLzHSSiFznzp+BUE7MjTfsOqzAisH4shqiAWgL3O8UMD4Tf
         OU2ttxhfzjR3If+2KOwCKDHnUMnJgUBmwx74AtoBQ1JrdhRMHeHYVPYvC/RQlHamr6j3
         DHLvhBC0+fiBL42bD5nwqQBhzNgQk9LNQtBAkLFqU3tr9gM7C6BINE0b/n5M/vbyzhaz
         h+oAYutgiBy6/+QnQFlSXl3ga+i2HlMEW278JXnTaSIdjRx+84EoK8maClvTaON7N359
         +h+4jZwXXV7CanVi9c3K+kapR0fvkJAn5FKBnIMZWcc2PqK80/2UN5pXVAeqL9P/Mnl/
         gh3Q==
X-Gm-Message-State: AFq9FYLlcKKoaitsYbpO1vsAtPsDSVMMFqBUOOfgzm6BqM4O79KnT5Bo
	Q/quUUnOaiXAvFvXfT/kfesECiSqNhivPxyQuZ7tVSpjlrv7TJ9krwZwrebkJA==
X-Gm-Gg: AYBFou2NTREnNe6qaPlIA2Rh8ATDEdpq2MTS6JwRcaCNF2k4p4FnXSB4z1ynTefWWD5
	4lnMKlie1p9mfbP2TSHi15BCjEAortSti7fCijJt1vRFEwE8von0SW0P9sb7W/Vf3TeA3wLcz9f
	YX+9pvcE7UtFL9vCxRX9GK+IOZyqKXOl8UsfGkA7L3wzDQx0CLnCYsVKSz8dj7/6NAPW5OPRAFo
	M7whBDQmw+7w8+RbwPmkmvQSPDvaA1iDGbYbJlwRCUbhVIQSwZrWxWU5jFVNJZUcRIqz0OoJpHa
	Pt9VmiQsjOBgwRov/LzT+jv8vf3zwE48HapWxge+n4f5xD1bOJ5FV5/x/pvgEU2RioC87FQJC9W
	Ux+v1r2b/RFB4mpeRRtypCbe7afqmTi6qUOPfjueNF9bTnzdGFLWDsqM73jr5T8tOOQnKmkin+o
	3+pf+xJm3Zk1VVcWPS0qvwN90knVSDNkdCPUVeQlqUOv4DL9bs5oZfbetyHYUZV/UM2oyuZwaXE
	cgpHTCmC+zk7x+Wet1lnyNWb40AQYU1ON5gGpbXm3YoxlJWR+oVnRJfJt0BhmYGUYSx64OxDn+T
	aRX+6EqVcOungYEksZxsq/CyRvzM1/s=
X-Received: by 2002:a17:90b:5286:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3adead5c836mr5412076a91.30.1793009962787;
        Mon, 26 Oct 2026 03:19:22 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][blacksail][PATCH 8/10] 7zip: upgrade 26.04 -> 26.05
Date: Mon, 26 Oct 2026 23:18:48 +1300
Message-ID: <20261026101850.1470035-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131430
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ip7z/7zip/releases/tag/26.05

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 533d0a63ac2a38e77746e32458e09461f12737b6)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/7zip/{7zip_26.04.bb => 7zip_26.05.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/7zip/{7zip_26.04.bb => 7zip_26.05.bb} (98%)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.04.bb b/meta-oe/recipes-extended/7zip/7zip_26.05.bb
similarity index 98%
rename from meta-oe/recipes-extended/7zip/7zip_26.04.bb
rename to meta-oe/recipes-extended/7zip/7zip_26.05.bb
index 49437b807d..050673f678 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.04.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.05.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/ip7z/7zip.git;protocol=https;branch=main;tag=${PV} \
            file://0001-Remove-treating-warning-as-errors.patch \
            file://7z_wrapper.sh \
            "
-SRCREV = "9128b80e3a471108678e2b3ec3c985861c8d7b0f"
+SRCREV = "b88c6bc09339de32f7d18bbab900686b244f42ba"
 
 UPSTREAM_CHECK_URI = "https://github.com/ip7z/7zip/releases/latest"
 
