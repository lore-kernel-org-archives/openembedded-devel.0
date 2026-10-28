Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36041.1793161461952775222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jBJWwukb;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso241630a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161461; x=1793766261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLI0VP/Jt3BBslil/tHzmXSVaQanww03QlU4UwGU1P8=;
        b=jBJWwukby7n2Bq15k9MrK/UaI2eQCvjg0X1faGKKtLiFeybUFJcpWwtPmIkyQlrguw
         Qc9RggQQtgHFp0i4rkCRyRv2CrrOcEGJenzNW35yijeSOcICDXXhaDqflyCkuFBPqcyT
         I3Y8t7Ia+z/YvJY/MblWow0i+AhlmFParQ8F4tydKcLO/sSYwfVe7nhfWM3g+dToUO+1
         iPQcakg7BHh7Zk+3dJBw6lCgsUTn6PIJTm0Tp5hyUWEDHzT1WM4aVv4NCkve8vuIQfpN
         lz353J2GW5m7IaXaSV3/q8yvEWjiFwEDDKzFx3ANzACiOoHWGF+mh0X+9jCNmBEZTDEt
         KkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161461; x=1793766261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLI0VP/Jt3BBslil/tHzmXSVaQanww03QlU4UwGU1P8=;
        b=Sy5NSAepN6y1qZhE1K+hjFLdoDcV3vh5i/0C4aCOPC6RqIsFFyXqirZmUu+DklujGZ
         ZT+qwE7m9dW8O4HXnzZB+DaeQunYH6z+w2dT68BHXS9249iFO3899KvNFfnN4W+Kwrmb
         HjbzsOQj+5WeR6SxBL2cVlDddF5QfW/6stFvZ7BP3Bl7kH4bSbrlXdtiMCjoRDwKMq+K
         qe6EBV+LbM5pgs+0HM0k6gaePGrhSpofcaWzd3TctahY5Dt4PWs+98SKH/D7KjF17Klj
         OBkCk8rzcB5Me45uGT0mDR9XcNiOfMuz+fbAywRzblnzMgCZg0JxLIjgT49fSlv4QabY
         tElQ==
X-Gm-Message-State: AFq9FYJVOzaKPHr/6ryaADZL06vQgzC4zudFYnS0mA1UhyCgmdHX6jA3
	2o0/dKhCVAWdZ0XQqY4Iai+jX0mUtknrpNu+6yoHBoIAT/qYjqjEFNIYhgTWPQ==
X-Gm-Gg: AYBFou3Ifm97xAVEz2Fx0+mlNOdwBlJy4+hVKLHYV+hnrAYFtgakmYpK8DU+iDPQuof
	ERjaqx0utGNbar+f/g2hQtDAohpmu0HfxHHwNbRJOy9eD7yFO9zlZeqyEmkGp4DVcxXGxNefnIT
	S+MPtEOUxMK+OFFC2/7n3winJlggSVjvxuZ2oILzJWuP6Yen7fKnEuzCW0dRcVBxgnaoTN6aoru
	+yfWiUZbMYzfTMwS3D2mGfrBok7BqQRRQBFAwtkxyQ4h+9cp345JYhX+Ut8sEeAO45KEGk5hiQZ
	kvYzRkBozSY5XXKRhVsOJOKYyw/feHw/W1h3ChHB5vpzlKIoeULtUlECFFUKfd8Zx5p2HPi3yFu
	fYcpwB87wC5cw3tNSxOc4CGHxvEDhXwImPoOPYn1SuziPaR4ZMOKku0D+a07/i5BvcQ+fobX/SM
	HQhkM9B9zRbxkiv4OKuwyhSUAZegGcehNWhWIRzluX/jrgTIPMAjvMCy1zHWCtH8OlAlagW4zz9
	3BWplDUbPRG48fWbTSyN0FfQFGgE0shpyoQy54Yt1Osn0wkhedhpgdoiKHETB5rj8kyoVQ9CMc7
	LYVHa92NNvRKW2SmQndmsvi+GLI+J3S4gbMNDhoqaggArTWV2qxbU5KQoXqHpA==
X-Received: by 2002:a17:90b:224f:b0:3ac:a7ee:6760 with SMTP id 98e67ed59e1d1-3ae57f637d9mr795339a91.23.1793161461274;
        Tue, 27 Oct 2026 21:24:21 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:24:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 06/60] xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
Date: Wed, 28 Oct 2026 17:23:04 +1300
Message-ID: <991d0967810dc1dc6bb903f875264a3b744f69ba.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131558
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/flatpak/xdg-dbus-proxy/blob/0.1.9/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} (93%)

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
similarity index 93%
rename from meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
rename to meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
index eb21f701d6..1a65874155 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.7.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.9.bb
@@ -16,7 +16,7 @@ SRC_URI = " \
     file://run-ptest \
     "
 
-SRCREV = "6a170fa77e3cbecb48f9dd2478fe5c0a119eb467"
+SRCREV = "72b40c8f6d9d585cfbdb249690724f740d207087"
 
 CVE_STATUS[CVE-2026-34080] = "fixed-version: fixed in 0.1.7"
 
