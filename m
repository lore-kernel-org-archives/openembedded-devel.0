Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC616C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:56 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9351.1788343554846433010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S1sR0lAW;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so1066824a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343554; x=1788948354; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqoH0/2TaW1YwdZpgN6NdPvXVjJ+RZb1i4kv1nCuQHQ=;
        b=S1sR0lAWyhshyJsXNm/GoZXTXTHSvP6jE1P/OiR8Fl9zWBTxjLk4i1Y3+3/vkKSL7/
         nQoI7GwIm3OLm5v74u1ATRPoo2OUK93EOdLiuMfSeghwwFAAubf9ysT/wqcSnD8rHjfY
         bU1se7TsZtkD+1cnNbg3u7TVMs+NiYANJIDDzMnVN72Ms7bPtfhhFHQ44HxMCs5rEYtQ
         L1/JYIjV7gu36n8cR2m6KXc6E/k1R3rUIhiIkW60P/y4ftFwSWGUSNSd+TQvpouQicfn
         npIMsaM0M2pdJZLwUYjWNreYRRNIUKu2n1tQp9OGtG5KKE/uxo88ZiFiiDhVTJa2hsmE
         bNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343554; x=1788948354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqoH0/2TaW1YwdZpgN6NdPvXVjJ+RZb1i4kv1nCuQHQ=;
        b=gQcz/WR35WBO2mzRyObCovwdpcCKwUlQkw2ru/iWH0MKkC89xGX5NXO2MDKSKoHOyd
         4q/4lEZ3/Y+/x3NuAG53n+9f0zrGVpwHO7/IYV1hLOZ+jXrI5tkZghP8Bg5yeKslIvt2
         dhX5RG18mf82VtdJs1UQirIoukGe238Tu3aD76JJSTayUXV733EzvNmYgnLD10xW2Q0s
         rj7hk1dvk8KsOtMGLoZuZICAbqYD3Q2oY8LGTxP4+/pke7ck+q1ppk+AjowmOGI88mIe
         1ScVRun1gpDb12AMjMov+KNstXKd/NwHAjn6+VKIG0mKJeywklcOp9l2kFmu4+6gms/n
         yb/w==
X-Gm-Message-State: AFuF++ngyQFN24XKKysXl+AeQJLrFL80qBuz/1tYMoDi0/wdwPPa/a/F
	tMatItyr++mMekdll6pJ0lL958vKo2DfgiOdEq+QO4EelP+TLJvfSGmLDzPXO4Yn
X-Gm-Gg: AYBFou2qL3VS8OYo8v5nDD5t+SlWjO3OGRe1/LgNEb9iMxEH2/GwyYaxkiYlHso8ww4
	brc/mVrz80DTOf9lEStmu+/sd0jG5jUPxW2ugirP8CAYtS/BU/T0pZp58CsuSOXbvsMPJfPA8WJ
	ed9kDhJGu1UMUOZPf5+e6bdqU5VVGA5tH21wHpykEJB6woNgbsVQxn+lRjbLyAtMEhH3Tz7LiZZ
	kxEJGfOM6BSYL+T//A0l/ClEDjmNAPflC0ObWkCupudyCgMDWP4FUx4Yb8T3OvThckfxctvrlDC
	x7nO7VdnVaYnpVtbNx8Js66EUsuY7Qte0bUP+S+lFlr9AVgjlVxJP+EXldzEHRC8tu67ZzZ69WV
	KoAwEVMSy6Ikll1IGxOhrqLr9656o9aNklQ9UqxbozKr7rs8+BXKgLidJuGfD/LZxKqjiWEaF50
	DVZlMGusOghQiKsWvWr+9Wecin2Y2gwQukxH4I/r7JKOA6+tQJioGsVuw3t84CQ5I4bYkuDxxn
X-Received: by 2002:a17:90b:4a8e:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-39aedcfc81bmr5385851a91.0.1788343554199;
        Wed, 02 Sep 2026 03:05:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 14/28] civetweb: ignore CVE-2026-5789
Date: Wed,  2 Sep 2026 22:04:56 +1200
Message-ID: <20260902100511.2105916-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129645

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-5789

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 0e13bc6deb..a22d08f05e 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/civetweb/civetweb.git;branch=master;protocol=https \
 
 CVE_STATUS[CVE-2025-55763] = "fixed-version: The vulnerability is fixed in the used revision"
 CVE_STATUS[CVE-2025-9648] = "fixed-version: The vulnerability is fixed in the used revision"
+CVE_STATUS[CVE-2026-5789] = "not-applicable-platform: Issue only applies on Windows"
 
 # civetweb supports building with make or cmake (although cmake lacks few features)
 inherit cmake

