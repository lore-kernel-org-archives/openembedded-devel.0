Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF93C072A2
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 15:59:55 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.14641.1700236790123853417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 07:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lK/bImYH;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7eef0b931so23652717b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 07:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700236789; x=1700841589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MSMYG8paQUEq/afFnF8KGEEXAYF6M5OtdCSpsJ+OdY=;
        b=lK/bImYHkFadqz88SHkL/529uWzfF8c2qSKl5Cc+rzvQo67g8CJAQXetajSwaod0zO
         MKEE6xGKoRbS0hkqTFxrQP6DJc0fwLFNV7Vxe4vxDhiAD0Wi77YJ5weQN93hosA448Na
         trRYuEem/UaFBrDoyE+r23m28wNq+u2YnCmr9tkMrPrRrgjg9MM1yg/YbpMPwG6Q6Jy2
         J1OnL/02tvFT0xhS7MFOXsciIehQ1M0u9NTHQ7Abvnpgyv5C4OOY2BKuGzxZZ04/0sF/
         fGguqZjOaxNEvUKbUy/wwuU+bFKLh3lCBrXTu1Ep6k5GBe9aqqmISQUk9OYdeGoYofvS
         g8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700236789; x=1700841589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MSMYG8paQUEq/afFnF8KGEEXAYF6M5OtdCSpsJ+OdY=;
        b=rVUfaKwTFRTP8dfm1OeANyu1nqVuK9jhMMtdtCLwW+PVeXPp92miYlM+GmOo6SWbWR
         SGgrorIYu+JQcZlu1wg84qKaKa6G4Ti4X/DfNyO1nOqF9l/fqtiac29UnU5Q5eUe4WFb
         wEhLxj3nJgji0shM5Mb23rMbQcY4NIh4nCj5SdzJWJn2SEvQBYOTWA9aUYp10iPZUuBi
         YiVmXzde3kOWwgBA+T4OmGfKLXixLW2mdAODT9p6XQpcUFaKu+iw2AZcEe4QzeNj6fTi
         cVowevBFdEYzbINuhMAzUfq2facAxSDrnq6vaW8vCeoLX71E+mDxgeW30kBjgUO7DYAh
         pvjA==
X-Gm-Message-State: AOJu0YyjYyrEk5k51j55pcquG7L6Pv1QyrVlgAQrvtzO+0cu0liB7VkV
	xXFiGgt2IgWxjj12Sl9TJT15X34ea2E=
X-Google-Smtp-Source: AGHT+IHQsiI1e5//DH3svjPPoDUj29YyGAXeBWNXmJ32hhNsEGdmyQThiF+raNMmluyUewLPp4DAWw==
X-Received: by 2002:a0d:fb82:0:b0:5a7:be29:19ac with SMTP id l124-20020a0dfb82000000b005a7be2919acmr20075764ywf.12.1700236789050;
        Fri, 17 Nov 2023 07:59:49 -0800 (PST)
Received: from keaua.ep.ocean.com ([209.198.250.118])
        by smtp.gmail.com with ESMTPSA id s8-20020a817708000000b0059af121d0b8sm559743ywc.52.2023.11.17.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 07:59:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [meta-networking][kirkstone][PATCH] nginx: upgrade to 1.24.0 release
Date: Fri, 17 Nov 2023 10:59:41 -0500
Message-Id: <20231117155941.6795-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 15:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106871

From: Michael Haener <michael.haener@siemens.com>

According to http://nginx.org/en/CHANGES nginx supports the openssl 3.x
component only from version 1.21.2. In Kirstone openssl 3.x is included but
all provided versions of nginx are older, so there is currently an
incompatibility. With this patch this incompatibility get removed.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
new file mode 100644
index 0000000000..2e865e400e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
+
+SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
+
-- 
2.34.1


