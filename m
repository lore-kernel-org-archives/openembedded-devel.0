Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D0AC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:10:16 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37556.1786086611753014601
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=c7LuL7lO;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e507b079dso2002869b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086611; x=1786691411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SyL4luDAqj3Evg9mSpIEkVzipNq5sUtROfY4Trol9Sk=;
        b=c7LuL7lO0NpXNchSGqNalJCATwTUvcKmks4NlzlkKDOgMqT4yY1OAMVo/HcfE1jh6z
         iTrIr7+qZukl2B+KnorByzAeQ9KQvexV81upPL9Jdeuvb12nt+M4BSAb2FMZhAIGgX9Z
         6qvcBmHezRZHevi1TmtfSrKLIalpJe/lyaVgV3bUd3WcoJ2QGcncbKDIoq7b6UgNAik5
         34ZQIZv/16j7l0uESxCm736J5m80ZhRpf5tKNMs0FSK3/Z8ine2xzn/uqrCgFpgbs7th
         WtCh0J9nkxV0rETkHcDWSO5axYz3KXbocLuJviYANwcMO7N78BpVUOJoliEkr3gGoUf/
         qeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086611; x=1786691411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SyL4luDAqj3Evg9mSpIEkVzipNq5sUtROfY4Trol9Sk=;
        b=MFDasirbiMtrbY7s5rt4DjAXib6g/oSxu7I4fw5bNtMW0a3eUVGDtfxUozLH164WOz
         dVqFEmyoQgJW49vVwKFWGHOsYnNIViLBBcHOnjmfpl6O2patPsFEOhLMCv3xByEuR+/d
         J+gX7QqCfGD7ly+Oe0W2ymnH0PM5z2Wrjmo7Cj4Ll6Wsl8X9w/PQgJilpHrP5ScFHYue
         /g+cx1a0fg+2l+v3BBo0DcfIGNSL0B1DOF1mmqtetBCB8rVUBEo9JRufj5zowOUpD8RR
         vuHnbVd2T+Nx6iLrbG93fIKxOmBTuokl1ea+GdfeS+H8ADpePCOO8b1jJ0jTVBeOm7V6
         8nDg==
X-Gm-Message-State: AOJu0YzPCUBlfmkWL8lWnbOTTd0eDHcsuHcgvXVTCv2cKHsPRrqOB7gv
	I/PQgE3Bs+MubCxYPtvO02xBQIaR8R7RjBBUt0dyiVq67HiKkC3SgF7cDozk+A==
X-Gm-Gg: AR+sD12DZxda/zk7mVTT0CC1ZWlQEKDACrosZbq5WoTkeRhp0IQGISOQMHsjd/3Va2I
	8Q9K+Es67/WfE8s+OcUK7GBkDCnoNdiQDglafqG/TtkYYHO+BGDgXPTEZrcK2KCl946x9351FUu
	qXhvzl1r/3Ozj/e/+D4W4yJreO9GgRUtQ70mrPiCvpl3RCYJyyDB7Ypacw4Ror0iNVu3fhY4tL3
	F2bCnSLf7gEo9KDpIG+udKisMXyvGNnpSY2JWOEJyMTFXanTbmAm5CrXBmRXgINNRZPIRiS0LGa
	1RUq5YzCtg1DlYrhGeqQRHIzLFGIqqZgOpSLBBzHx/UaaUgyTTC94AiBk+aGScM0WfZxnOzcSvw
	MoUdrW8ZRiV07BKskYmRzsVcbsp5kjtXt8SrReE+Q2oQPRtBmBtW0OjkAPldk+yCcaMBT0t6SSf
	kUGShlIvAeiu+/aqSySBNntoEl+ILwLUA99dFb64E2xRKpTrl2mlmdvPPFAFSAb8JjW9KEj91lP
	A==
X-Received: by 2002:a05:6a00:4603:b0:84e:24f:2667 with SMTP id d2e1a72fcca58-84f2e031726mr22593878b3a.8.1786086611062;
        Fri, 07 Aug 2026 00:10:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e99asm520440b3a.33.2026.08.07.00.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:10:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/6] php: upgrade 8.2.32 -> 8.2.33
Date: Fri,  7 Aug 2026 19:09:48 +1200
Message-ID: <20260807070953.2275518-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128860

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://www.php.net/ChangeLog-8.php#8.2.33

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.32.bb => php_8.2.33.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.32.bb => php_8.2.33.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.32.bb b/meta-oe/recipes-devtools/php/php_8.2.33.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.32.bb
rename to meta-oe/recipes-devtools/php/php_8.2.33.bb
index 1eb89a408f..29a2d5b6ee 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.32.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.33.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "8f21e988ca4dd5e14dd9fb889884487843566e487280027c4efab6c93188a2d1"
+SRC_URI[sha256sum] = "5362f2a7a0e7168ce722fea0048b1a1d28e0f7cc265c417df670c65670695018"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

