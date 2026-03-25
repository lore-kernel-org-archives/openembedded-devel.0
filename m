Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0853D1093176
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 01:55:17 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13330.1774403712921174862
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 18:55:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OwP7TZgp;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso1091424eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 18:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774403712; x=1775008512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWCHe6wIwr5Gc3NzQW7cJzpbizlmKjU9iMoVm+/TrKA=;
        b=OwP7TZgpXe02AY4nbItklaHgHjhp75mKawpbEBCSWjawCvke+prfM6l8im6P/uwsxf
         R+c9hsB2FsP9QG5eYfeodN3Q6+PtxB8tE3y+7wknU+92q+fCJr36IxR/PFPiLT1fG+nx
         LE7H4Gzu9IQuUS9dNU/Pq8fyrMTe44gwueNG869014Rx5b+SJYLRHCgFIxpga4otBbXe
         HFHA3xNgZCAyq1v28HhHK1LHuF43WMDIYy/44LcopYXeSOsNHUxN1h+zpX8rNHbGF40g
         KaHYwEPSHQXie+suNqaiL1aTXp4R4GSWWQN+XfIToRDQI8DRAaNIim3v4DCsPFObun7F
         9T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774403712; x=1775008512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWCHe6wIwr5Gc3NzQW7cJzpbizlmKjU9iMoVm+/TrKA=;
        b=h8Fxmgx46YGafNfyKxsr1MMuXyDs9VFNPYrCIwqf50WXMe0cfzPUhnYUvo23Nnmot7
         bPvwdRwXPeFCo8l9iS0d53R+VlQKtHZHX7p+E/d7SGXsPoTvYaEWZByMEOk2nX8dZC5r
         x5qvrWN8/3PIXzSaAKgkuQT6O84hJwJTOo9Px4MTIdMwi/NVxxcvFzH0VFgcsqfWBAhw
         gvZ7yNqHzwdLT7wBYMN8Pdq/ynQm5BmxOB6hUFckXdFmrOqdGkrCNIy1luVVPqoEL0q+
         GxDpf53yPDoadZ0VtNt9mdEpHtejFYc38YKUgpC/gUgGeLKDC3BZPml+O7POpPw9j2NX
         /pmA==
X-Gm-Message-State: AOJu0YwMfYarpXFpQu7slHxxHA6mUXAEI6PJ8j8vnFVUGijOEH9/JCTb
	NR+C4RWuLJwBhnUj415Hk68SS4JBuxOzp/OyTzl6grJz5RwG84gitJGHrgZ6wA==
X-Gm-Gg: ATEYQzyilgUwnybHWGZV396FdunZek90cFZ4c07nxCl8+aHdyUUHRL+AfowVbFjONuG
	lRsMN1TCVut2t18daCMpDPd/QNapaPhFEzEjTUi6+u9SFxywbGTdsM1kNdVbq6LSRiU91jNm5+S
	h5zZ8rrt0e9/OCLtjvemYuUHP8DjvcVrpopMomodnDEeihSSnhjN0R3+msKJzh9e6ViJ8bsoLWI
	FOugoQtstpToE7SBca5Y6Q3s1iMSmBLIx7Ke41vorBHzSMS6+Bph7AiJqu0xkfI7KUuESui6LLM
	4XWDpPhKbt4c3pV2hTkSj53NW5Qr5bkKCn3W9HYrYuf4pq32emjgQeDFVF+lbI5dUo7HT3jNMtw
	IkTP3EUk/PCn00FIXNNZ+lOwlpel69YsoHvPg97+5p3QGbrm/D6YY4AiNreI5GH3DNFagMc+c0f
	b0jnglr512ivpGb/zo8m/cGm9ASvD9GoLegY9pq912T8P8gVUIeedolf2kteR5675P6i+XZUI8L
	rJme67UV/ZEXXZeLSwZk+CjYYXdipIcVCmjLJz8Rjsbb5Si+csX2/p1f93O
X-Received: by 2002:a05:7300:7254:b0:2c0:c55c:1574 with SMTP id 5a478bee46e88-2c15d443c3fmr929946eec.21.1774403712003;
        Tue, 24 Mar 2026 18:55:12 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14bac4sm22502069eec.4.2026.03.24.18.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 18:55:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH] hiawatha: Fix checksum mismatch again
Date: Tue, 24 Mar 2026 18:55:09 -0700
Message-ID: <20260325015509.3973929-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 01:55:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125596

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
index 09f6184a66..d6fa250cb9 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha.service \
           "

-SRC_URI[sha256sum] = "f895a35234a3efdda78187acd7ec6da9cc6cb69b3dd186d1c3f474989c418dec"
+SRC_URI[sha256sum] = "57b61a6d2640e72601d5ba0a063d6f1639613b910287871216f7ea06c75bfb96"

 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"

