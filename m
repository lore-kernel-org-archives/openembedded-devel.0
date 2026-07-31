Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 944BCC55167
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 07:17:14 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1430.1785482231180828814
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 00:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UFpUJB/i;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6689402c7bfso705949d50.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785482230; x=1786087030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKDmXPfhkm8QrLUvi79H+dE4jRGCVxm9uzr7OxOmfLA=;
        b=UFpUJB/iMscR+QLBxVf7kOnw4OnH5N4Cq5vJCIRGf82TVjhHmehtIph3uf5X7eWY3K
         +qRoSam1HWJ5qHTsudDHtgqrrkAFqbLH2f+SZEPSHLzvJ0C46LBhFx1eMzRWJ+FczvQZ
         ipJGyPIkRfPjS4fP9bky4LW+1aEyNd8v+4YB0hITSAC/DP7wBY4/2aJ14Rrn4aVmMbbs
         RfG2CdLOKj/t2v0tGYRqfhKvIFLIzsSSszRrpu6mDJzug7Mj+rTJixKVv4hOed11tr18
         6EniYapN0UeGGzxDt9t+7vKtKlB1QkYKisg7JBNStq8dKVaoZJOKj6ZvZB53fL3c5Hiu
         saeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785482230; x=1786087030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKDmXPfhkm8QrLUvi79H+dE4jRGCVxm9uzr7OxOmfLA=;
        b=FJ75D/w4Q0jl++9urHk20DCBXWAKK2KjAarpKqqaobZL9lHAlDRSAm/F3f2bH/QaZQ
         IXrlQOfN9P/tTZfG2JjTj5MB2d+cJwW/lmkQ9yjD4I2+N7b7NHPrL0s9ohE/wj7J3UMr
         qHZQqA/xqo/Jxn7eEFrA4QFxqAb7JnqIOA1xxmlwofBCSrsAfXlO2bdrvAjgCEu5sthd
         aesd21SWu77DzSq2MyBN/i0SWYyruUoOwvzvUfQqMx2+ERNAroihV05cSltf4qjdLVTw
         G1xFmLo/+atuJmFoBmXLilZMxjIfUlrJyilGxTOaP6MrpgfEmm6N0avxb1vDo633DKJ4
         illw==
X-Gm-Message-State: AOJu0Yyz8IGA61ZA47i5IaQRDgb+t3Ovab5H9z/iIiXKK7O1nMac4UY1
	3PsHcpGIJNtN4YQRdzqovNe9BE1XqD2XOrLRYihYYHfMCxyWDdkUSKKqPipq/I5W
X-Gm-Gg: AR+sD11fj5Ftr87erMEtdDnMkMfI5lSbrmZSup9jSn67UU/5OzZZqidcJxckVoQsdiO
	8bVM+ZlamF84ERDv9OT4miLwMwdMWK8odRRi0UktiFkWjROW4i4iENz+lFTcDSkumqbLe7gXS5g
	dlWj/5mrw8EJc4bK1+6a8r85DCjf8wK1TknJfC2RXJkUeDcdwMy2F7xUGEddWnmfgK2ByLZArwv
	e6L70FqcarbMojDZ5egWD1e79b/C1d/cYh+w03Lk+Sn3ispUXophu2GH72rI9LfmOXQGco38JLh
	V+yATXmdy13xbjHg+elrGMOgbm11B3lnI5TLdp/9Y0pwvsWwLNtp8UnI8VWp/mIQ0G+O4AMidTP
	gvgvNHE5POy1Z9dR5d8qHYSX5GUNOMoIPFEJM8lnvsNB3Bsizgu/jQZOipxiSeKwZcis0001gYO
	inh5jRPfVYapdCExC1CPcpIvgIhRc8491rymDuW7hJwdGd9cqJWQ0V7thmlbGKeZD9rwyF6pFDd
	63TbEbbHPRSJ9Ub7zjCTnMSQNS3vBsKEx9R2+vAsl8jmW8yoxFufWu7aS4O94Yh7J0l89n5TkMs
	/VHrJAiAkuCo
X-Received: by 2002:a05:690e:4888:20b0:668:1414:e9b9 with SMTP id 956f58d0204a3-669453cc64dmr401815d50.3.1785482229934;
        Fri, 31 Jul 2026 00:17:09 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948d01591sm137112d50.1.2026.07.31.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:17:09 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.32 -> 8.2.33
Date: Fri, 31 Jul 2026 03:17:02 -0400
Message-ID: <20260731071703.1067967-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 07:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128580

This is a security release.

Changelog: https://www.php.net/ChangeLog-8.php#8.2.33

Signed-off-by: Jason Schonberg <schonm@gmail.com>
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
-- 
2.43.0


