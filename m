Return-Path: <rak3033@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DD8ECAAD5
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 07:40:29 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.2622.1662622828819025485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 00:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f7hPf27d;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: rak3033@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id
 n65-20020a17090a5ac700b001fbb4fad865so1524657pji.1
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=BC0B0W8fq3ieF3o69jUQx/O/48WC2ZrZ+2zskk6qxIA=;
        b=f7hPf27drcO87CEcCWjQwFMy89qpfTUiZ4VKT3nrvbRdKgxbtNMuHBNAvUdFl1UgEf
         DTOk8A0GAPG4tRknRg33xHjN3cxv2JtspK059Hh44h9b8J1AT0kfFhxvLDrEOJeVnWQc
         EeaY/Ksk6VPxH0Q6j73dzaP4l4LR40FoL5w6WUZnddu48NLFS+gzLPN5nkit3MujK4PY
         NEpmYZu0R+wpMxWcz4Jb/VBELi3RustPICorRC+CfGHtOwlN0kN3VAyE198AMfxMAiGS
         Ut6uBweW5x/sB8jhhJOETmxrUqc/IztJBwhlk2buB/LiAoI3oo+xjJ9XAlLgUA0WYWZp
         8NoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=BC0B0W8fq3ieF3o69jUQx/O/48WC2ZrZ+2zskk6qxIA=;
        b=Ksx34mlbscdfBXIkRox4Xd9p6n2myS00s2sdFSSERG979FHv+Xp+zyNPh4W8ZYeQVM
         VxeISAqBEzP1JbVSmErgxvCzRcK6B+wJ9al47ZB5CNEDATtc8Wtw0aOhVOSD9IfLuWHX
         EHo1CRWiTjV+i5xmFYUI6630aeIy75R0T3JCFIspYfzQVwmFAGItBHLArAGGyb7mylv8
         U4pXTS3edkfUfRUntH/XRNkTRsJ1uDyFYpnWdjihJj9EoW6CsO+JftfLDAEIFSfD6gCm
         LcRFo/Mqgml0HKkWKtf/oX6QDaUSGQUADF2TBOcOvA8GF35IB/1N5OIXOQXD3T3XlX6G
         w3eA==
X-Gm-Message-State: ACgBeo3+U8XlhTBsr+TgWiy1jVKku35dhlnMufYRAYzkniDXD8EozvTD
	X+oNhMewGUyRYyaHzoOMW/j2DCSIfKCJQvhi
X-Google-Smtp-Source: 
 AA6agR4SULOv0tCKBnL/e1Rj36YSSJ/cB0mgrZe55yFjqPrCJo96CV7EqC3ycxUiheftLkBeBHcN8g==
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr2839687pjb.164.1662622827971;
        Thu, 08 Sep 2022 00:40:27 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:33c3:2e02:685a:a9a:ac71:934b])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a170902c7c400b00172709064besm9101954pla.46.2022.09.08.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 00:40:27 -0700 (PDT)
From: Riyaz Khan <rak3033@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	rak3033@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	riyaz.khan@kpit.com,
	Riyaz Khan <Riyaz.Khan@kpit.com>
Subject: [meta-oe][master][PATCH v2 2/2] sdbus-c++-tools: Upgrade
 sdbus-c++-tools 1.1.0 to 1.2.0
Date: Thu,  8 Sep 2022 13:10:00 +0530
Message-Id: <20220908074000.32204-2-rak3033@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908074000.32204-1-rak3033@gmail.com>
References: <20220908074000.32204-1-rak3033@gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Sep 2022 07:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98714

From: Riyaz Khan <Riyaz.Khan@kpit.com>

Update SHA value in SRCREV.

Reference link:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v1.2.0

Signed-off-by: Riyaz Khan <rak3033@gmail.com>
---
 .../{sdbus-c++-tools_1.1.0.bb => sdbus-c++-tools_1.2.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_1.1.0.bb => sdbus-c++-tools_1.2.0.bb} (88%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.2.0.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.2.0.bb
index 01f66c3f2..27b965ac1 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_1.2.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "bca8e81037766a0454740c40307eea32831c101f"
+SRCREV = "751c1addc4fd2f949a466f488c1b7de2ca3b76dc"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
 
 S = "${WORKDIR}/tools"
-- 
2.17.1


