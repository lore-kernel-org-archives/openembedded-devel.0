Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6663C98309
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:56 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4291.1790160108530871346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rD5sEpW9;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so371527b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160108; x=1790764908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlbAlYpjSI7sRfD6Xmw1JfSXiKSeISL5eTJpnfovEsY=;
        b=rD5sEpW9vHm7z3kE4+8THBed1/dn4QV0lIZc1Rvq9/vQhVJ4tfai11VDq8f47rlUq7
         aDU25HXCtxk++4v7W6rHE9OiNLUOuIrsyEFveq8aUvAh8lbOz7A5+HXdX4Sk3odIYiCk
         qFcl+x/8eVVg/0G2ISAwzzeH2eAJQHUhov5S2bwpB/m9+Gk91tckIAcZ1ojwzguUY3Hz
         z82z/YyWJzx5GjjO04MpQU76Cqjxtisu+/uNRCGt6ai6jzs4pT0n4zL4pLGWVmc5QSvL
         bUpLPjw70Z/F6E+7IfYNZjS5ZL9Cjw4iel1nG7/M9CZWrF058yidzbH0ZifPoj8LQBdp
         Xhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160108; x=1790764908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlbAlYpjSI7sRfD6Xmw1JfSXiKSeISL5eTJpnfovEsY=;
        b=ObhgSVpShTHNqLRfPANGbXOKAKDFrxtqR0vjEFMNO9ytIdqeuh1h5R7bP/pH3sz9Gl
         GhFgIRZLT8zYDR6Y2EbUCr74MfniaO90c8RdCEu5anQmKiykyPvLajUyyzOXxHqZjksX
         g0WKtsZR7YvOSF08TZTZB8pPNgLDH8cqO+HTseUzFzkzloArOqX92B73z5d7H/KqZFXT
         CQsiec/RkQazyuJvT9W515+Hvvfl5OC/oz3eX+S6/5R2M5T0u6dWVk1QFHsj7x0Ru8Ep
         7NLkyC9CxOw/FZB5QkUIJI6sPwLZWlC0nH25ac9qmwUNZFqSf/tsYMHk9vHLpdMKjgW6
         2A5A==
X-Gm-Message-State: AFuF++laa0v+xEnkfzvlpjuCgsNPTzlNsz4nzEqYyJl2lGVc5mNmZF+2
	12j8PixN4x7X0hf/L+j6GF2ZiH096cC6ODgn9MdcIOzvaRfyTpp1mXfNyAlXqQ==
X-Gm-Gg: AYBFou2e5/h23W06BKgFDIEmzqblYJ26ZqbHj05majegA0Z7H1klvkxZvzCLiGXn36a
	0TQkfC+N/nCmtfw2rzlYd2Tghe18kkD0DJi317j9WDaPolzRT+TJymI+sJJebFhcXizwb+P157Y
	4BUNtQGnHPYJ16iYYNrwS+yV4DshTI+TWO4c6mgZyQqNhDSNCFjo0JlH1NXwQR1wwoX/0pI9shI
	v5qUdDy02IF34rvZawJhw3fV5fHlUSvT5+4XSYDSPIvRz0tH/fXbNsfiIzAw9IDPd+w/KUU300S
	QbwLNInfNwvI6PJIcgywPwL5RtoJbM3ZxvAOf/tI7AVwMqS3X0vgw89zmZKjtiqMclxuUOzOzGi
	68ZwkAHyDN0cqyVHcWMh2e0W7wMzrQjODL4v8ahQhNuP+UY/uEOVq26OI2sIMtVoJx90KUVyht2
	IXeK3pP/qw6Ex2riSG5SMEqdNq88D0vqZG2paMsYithOsQzwr2XoSzle4x6PUPoeGOCV9eEF+C1
	fL2YlvMn0d26c/CTHQmON1z3LoF8hhDNw==
X-Received: by 2002:a05:6a00:3494:b0:871:85a7:7af6 with SMTP id d2e1a72fcca58-87d1b6a0a17mr2007777b3a.23.1790160107888;
        Wed, 23 Sep 2026 03:41:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 23/42] smarty: mark CVEs patched
Date: Wed, 23 Sep 2026 22:40:37 +1200
Message-ID: <20260923104056.457360-23-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130210

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2024-35226[1], CVE-2026-62992[2], CVE-2026-62996[3] are patched in
current version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-35226
https://nvd.nist.gov/vuln/detail/cve-2026-62992
https://nvd.nist.gov/vuln/detail/cve-2026-62996

[1]https://github.com/smarty-php/smarty/commit/0be92bc8a6fb83e6e0d883946f7e7c09ba4e857a
[2]https://github.com/smarty-php/smarty/commit/99c048ce7a590c519b79fbd38ad0143a08183a1f
[3]https://github.com/smarty-php/smarty/commit/3c9f77a2e06ce319ae0092496af32cc8f3adc52e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.8.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
index dcb7c85a80..0c1487f1df 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.4.bb
@@ -35,3 +35,7 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 RDEPENDS:${PN} = "php"
 
 CVE_PRODUCT = "smarty:smarty smarty-php:smarty"
+
+CVE_STATUS[CVE-2024-35226] = "fixed-version: fixed since v5.2.0"
+CVE_STATUS[CVE-2026-62992] = "fixed-version: fixed since v5.8.2"
+CVE_STATUS[CVE-2026-62996] = "fixed-version: fixed in v5.8.4"

