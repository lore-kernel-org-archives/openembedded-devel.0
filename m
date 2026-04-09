Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09257EA3C54
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.129547.1775733746134323902
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E+SPl5p9;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82a655cfab5so802259b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733745; x=1776338545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJLxd5Yw7ky7PfUu/npff9FZXXRiKlVh9H3xFWyw04o=;
        b=E+SPl5p9CZkyzFlAZ+oLB2dBSladxmFkfUMRgw5NiyClhj4IclzBD6fTlborR/rDFl
         ktOXdmuWM1ZssuA8kRdDsWup8sMtsjGI/wtCiP3wZwIF1Rwy3K+pCd3mhLp96mIAMiZc
         DntqRcMDiLlp8HtjkxStDKaTX5vZ91KRphERLDjkDkfTLhVd0sE4OaLRG882ycc2s0+V
         75ax0m2F4zyotcKOloCBjW/xqkQDMZQQlW2cF9/4SyQUXKbXldFmlQqau3EpbNWOyQNo
         6HKTX3D2e1cfXpC3qwny6z1vkN8XsjklhDmsOcWb/Wh8JYM13j1cfYrwQ2cRlQDYeH3e
         5MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733745; x=1776338545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AJLxd5Yw7ky7PfUu/npff9FZXXRiKlVh9H3xFWyw04o=;
        b=hZonp1pOqAZCy+hvtu1HtSj4hWK/RZlp6yH/huVTGQuiDxgYUEziZtJV/sIZeqttwX
         IZBnGzvs/Chj/nDFWHosmqvpOozJ4w9me0R8LC3aV2yTwHprpzE5RgEroBAlMF3USsoC
         zOc5JyZu0i9aeOMwxChnr5Hl548jik8yLXpvkbg07ypCgup/0Kpxy0tIkiB1WMgKBCo2
         TRdw9jrN1dmWSe5cBLRckBd14sseSx4mS64GR7I3mg5HYUQqolc4JinCcad8ef+UKxC9
         uau8Q788Mz6kBB1HpaWfNDfIBnFft4hjP7fsxk8CtIHJBMQW6fwCT7hwefbKt3fqA+sm
         AtsA==
X-Gm-Message-State: AOJu0YxOUAxpWg64xuBS4uDiQOMvPepc1vbDokuimIDwwMWgp2PIzCy2
	mrdAh2kdiI3tf8JtnyFHSN1tv5NXw7lb1BMQLuJakW+RFYwo1Q8gjcsEe1TLVBb1
X-Gm-Gg: AeBDievIHGE/h4OigU5YXitbE/v7mB14JNYj8K7SjHZqzEktVI59XDrhXn2/Wti/sYW
	NikDCQvkQ0mSpEm/PNA8oVIMKP2R8up9dNvhWj4wLxlacZCXutyEQ+i2SbIcRlyGRYszwNTbn16
	4miyCM0YxihKh60TZ+CDCdhIZCsi97e1kjKhGi4fgHi1HdJZXxSXtf+2EhAnq7ZmLd42VK1k9Zo
	i0eOnsrHM4HKizPvGyxZSoT7b2vK6l8Zb9gwrMHJwl9BP2oVGu42KRtKjo83vvqAwqzWdtf3+Su
	JoN9D0lXUYosQu2DxqooixlgALcNjUj7ysBpQOhG3ih+my8uvCxSe7pmq4Sxs1oxqk3oc1y0/TD
	ecI8neE6zmFb83flz5i5qSCMH2NC48p0YqmFOyg7VJwXrywdcsR+NFyZ+19wDvyjNEnQYwgpeMi
	dkntNXAbrDI7YytvE6HkKJpB/ul7a6qmQEGYk=
X-Received: by 2002:a05:6a00:aa09:b0:82c:b808:4c59 with SMTP id d2e1a72fcca58-82dd8b0e0e3mr3321547b3a.46.1775733745326;
        Thu, 09 Apr 2026 04:22:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 3/8] mbedtls: upgrade 3.6.5 -> 3.6.6
Date: Thu,  9 Apr 2026 23:22:03 +1200
Message-ID: <20260409112208.1119823-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126190

From: Gyorgy Sarvari <skandigraun@gmail.com>

Contains fixes for CVE-2026-25833, CVE-2026-25834, CVE-2026-25835,
CVE-2026-34872, CVE-2026-34873, CVE-2026-34874 and CVE-2026-34875.

Changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.6

Ptests passed:

root@qemux86:~# ptest-runner mbedtls
START: ptest-runner
2026-04-09T10:41
BEGIN: /usr/lib/mbedtls/ptest
...
...
DURATION: 508
END: /usr/lib/mbedtls/ptest
2026-04-09T10:49
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit fe1b038cd814102b317c6896f265019909a67de8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.5.bb => mbedtls_3.6.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.5.bb => mbedtls_3.6.6.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
index eec39ac85e..cedbc90ccf 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.6.bb
@@ -27,7 +27,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
+SRCREV = "0bebf8b8c7f07abe3571ded48a11aa907a1ffb20"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

