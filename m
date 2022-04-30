Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A710C4332F
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:11 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.25688.1651346341034160438
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PMFI/rBs;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so10090694pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=657ymL4g033JX3EiGpJzsrYdpbiwXfNFhBYvSvDD3Kg=;
        b=PMFI/rBsMTMv0i6gadG4OPEkSe4al+iJw9shQz39tqbuxKcHbg6oeQ1ZrGb5TYwyMd
         DcMb4EiqmTW0ApHZS7hhrubftfTzpy3pfSzpOr/lLI2fq0sS92JkBltuGgdA2Wm9WNEY
         2XHHuBQLYQ5780C1UHhBJ095Es87oKor4zc40zXQjPHLd0kRb495jS6P0h4Eql3rEGHS
         FjsrGb4W0TvR0RXlak+evb4jqGDpIcXbEvQmpCQJ/eQFILdUjnHG3z2bx5BjWo3gRcQk
         DC4puY133l5NunWfHE5ji+TVcLNOhr0a9x0FfzD18YbY/+vSzxC6qP5f6O3V2fOV4qq4
         iYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=657ymL4g033JX3EiGpJzsrYdpbiwXfNFhBYvSvDD3Kg=;
        b=HuvRN1a03jQPhvEfqdC5niImbU9CvppiJ3UVvpyGbvLur1iSi4bCSCBx1muVP+HoCG
         0gSXoGHPSd3ZlZdzuDLXj+GEVp77GqbVT4VJx5N/Jb1lL9SqCWdtay9ofIrUBxg9EnDP
         zIcGz1+Bvbk7mgcGHQlLsW8/q3v1E8+1k8w/gSb7BppskKHZdrmu30JLrCjtHJjy9XUV
         NdjucQeyjuZPrKYQnGZg+hCpnun4qNY8/Z8ZUtO7dohp9blvXL2NgrKH0LPdH3QmvqVs
         0yQ9BvEm1u2BSU07AB1+bhXow6CYiI0R6H7rYWT4KdPFlNWCShQ6wYkyU37IskdSDzO5
         m+Iw==
X-Gm-Message-State: AOAM5304SpUxrBkNl7iIUM7rRR3wx0AGjXX5ccWudqYxH4NwxG52HAdZ
	fhyA6GnHTmkxTGXVFhn5hSavFW+Ncg2ZUg==
X-Google-Smtp-Source: 
 ABdhPJyh7mMVvotCPsUDkQxMdVzGYTkyXCamQsrvURW6IUyxskdnBXATv8Y+q/8uLHdyYxEX388cqA==
X-Received: by 2002:a17:902:aa85:b0:155:ceb9:3710 with SMTP id
 d5-20020a170902aa8500b00155ceb93710mr4825016plr.59.1651346340261;
        Sat, 30 Apr 2022 12:19:00 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 22/39] htpdate: upgrade 1.3.3 -> 1.3.4
Date: Sat, 30 Apr 2022 12:18:02 -0700
Message-Id: 
 <fc0538ea400f1a4a0e24a8479daa804c8b753a1d.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96889

From: wangmy <wangmy@fujitsu.com>

Changes in 1.3.4
----------------

- fix small memory leak in strdup
- fix free in case of DNS lookup failure
- other minor updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b82354a2acce0370564426f7f824e628a27df2f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.3.bb => htpdate_1.3.4.bb} (92%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb b/meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
similarity index 92%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
index d0cc414a64..d25600645e 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.3.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.3.4.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7"
+SRC_URI[sha256sum] = "744f9200cfd3b008a5516c5eb6da727af532255a329126a7b8f49a5623985642"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1


