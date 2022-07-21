Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F63C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 14:47:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.7327.1658414848968720880
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 07:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=keTL/uMW;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id v21so2070121plo.0
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCxIinvndwBgd9A5t7TjUcw7Omg8j3MvzAVDM5lFTbI=;
        b=keTL/uMWamRMzqHj0RzcFD/FmTt4VZ5mySA15v9BR+gWfGPTmcv0taamqnUqezyXjB
         B9VkxPbWOq0S4cnOwJ1Zof5j8h2UPGjd5WR2Qx1l0j/9Q549IGgfQIUo9Ju2qVHURn+X
         4LXjgr4qiTApRuG3QZM35P1br7TdRswBKkAQdn+rFO1JZv+XkkBLso1mus1JLL2FBwi6
         aJJkiziJc/BF1KgsdHgYEU3wLy1dGtYnojDLWzE8dOTJhZ1vJIkuEawEIYZEfqu11kVb
         nDVyzulkorgPRF33lCQifTkCBlXDy2SyoLVq0+LL0QjnlXdJVhv6cKBuskwMK8SvfYGs
         D9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCxIinvndwBgd9A5t7TjUcw7Omg8j3MvzAVDM5lFTbI=;
        b=ZKKZccvVM1SU/Pc7j3teeM/H38jxeRQeFRN9v06wbL47uq1mCBBqJOh66/RnzziQHK
         /m3oqPHpmU0F7oLk7+SFOEq2GwkKDGWHWQFGr3EZs65GKziad59ijaXQrYNQ/54bawpn
         AMdfeeZX4AdRoVgaq71G2Ca40znxE6ZRy4o8cST2iDXE6vM7TFiIlYQk0xoptTkecKs8
         r39QcCXjTWb/yjdo89pvZjpcDxbu27yYh5WHCASyJ9AKaIavbDLdEO5pPIrWysQGesa7
         Gq982GbLf7QulxlgGxuck6qYzMij5DbYnKmLd02jq694AHWA8NoapMTJb+HXgmcSSgGi
         8tOQ==
X-Gm-Message-State: AJIora8VLzLVTuQL8DsKmswQBuNtlxnSZ/Iyvnia8BFsU6S08xhHQNER
	eyAe27sbbufSQkLKi6i6xm3xn3y/Dmo=
X-Google-Smtp-Source: 
 AGRyM1vCqk08S/fnRCH+6sRg6IY7B1gs+9Pb6hVpoRN8grc3cODXbkvYudDiYykFbwm9TQVjn4FNJg==
X-Received: by 2002:a17:90b:4c87:b0:1f0:30fa:12bc with SMTP id
 my7-20020a17090b4c8700b001f030fa12bcmr11806926pjb.66.1658414847814;
        Thu, 21 Jul 2022 07:47:27 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 r9-20020aa79889000000b005284d10d8f6sm1867969pfl.215.2022.07.21.07.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 07:47:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] php: upgrade 8.1.7 -> 8.1.8
Date: Thu, 21 Jul 2022 07:45:21 -0700
Message-Id: <20220721144521.3730832-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721144521.3730832-1-akuster808@gmail.com>
References: <20220721144521.3730832-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 14:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97916

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8d7b56ff235ea3b6da8e2b8a391176a99ca07327)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.7.bb => php_8.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.7.bb => php_8.1.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.7.bb b/meta-oe/recipes-devtools/php/php_8.1.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.7.bb
rename to meta-oe/recipes-devtools/php/php_8.1.8.bb
index cf4f6be3fa..d5cf7d8b21 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.7.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.8.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "b816753eb005511e695d90945c27093c3236cc73db1262656d9fadd73ead7e9d"
+SRC_URI[sha256sum] = "b8815a5a02431453d4261e3598bd1f28516e4c0354f328c12890f257870e4c01"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


