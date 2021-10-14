Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F47C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 16:23:29 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.422.1634228609193037130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hnN3sRFd;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id r2so5993481pgl.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvgnNwsir0RrxvFCW7FzwuHnNZhBwmvMsxKj7gfvwCk=;
        b=hnN3sRFdGlp2inZb5/WYG32veT3W3cdUQJPgkuct9lfCykuaynKgc6o0BUmsAfW/1y
         Cl+P1Fre2xwGC1C9QLPIMuhdBkxowrun8vJRTbn4Xpo880EpbPEYtdHPn5LEzvYgebyQ
         N0xKtcVOg/uampcSd5m+N7/Wy+1xGB+ttDHOXg3+VMYYyaF5D52Yrh9f33YhRfLkani/
         2tVdWpaKbc9uCIy20KV1PQWYRbkuGIq8WMDx9bCEDEBOe6kUNhtWfZserDWEfXs8xZ3t
         gxIQEqzkFEzTILyRRwPfY8tmPWHQ2ov82/wWtUHQ1Jmw0Y0h+HNz4L1qWpjg7759QyL8
         CXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MvgnNwsir0RrxvFCW7FzwuHnNZhBwmvMsxKj7gfvwCk=;
        b=uCtfoB1fqgF9+3ggGe9Ly/9JJhiULUOU1fXeLtS1Gyx5exNe2aSXQAOsYipLD10cNY
         SLXb6rm2zmJpiZAX7iM4+jPpTI6TpklYLBpLDmrH5hCtkGJyaO2FEngcRbllPcnJlmGL
         Yri6vO9QaoEQ2GvtFs1tI/5ldSvSlPXQ0xm5UnGV0yigExQ652s0k+vt65ejAAiKhVNR
         tNP3d3fFBLvrDuEQqHdp6+X4KBfxAF9wKtIvWGGw9HtqaeFkuRlaDk8qgaJ13y7iaHlF
         J5TLWLrJGJg1EnzX3ARUaDKUW3BxHpw3HGF8JCnv5PDN3PaiVyhfAS3xJDR854ZjtTj7
         7Fpw==
X-Gm-Message-State: AOAM5333M3Xlvv6fUJcUXSzM2d4AQayuLIj5Noue9zuxRu6e80mGW72A
	dcpyiuDbZsZa7FD9juV3ecVbvzkOb9dxCA==
X-Google-Smtp-Source: 
 ABdhPJxtqhCPplgaXCSPeDgJF43Vcmv6CvG3pEz7ChsVkaQuZsso7YA91D37yeN2CHYMj9Ot+MnnBA==
X-Received: by 2002:a62:7a8b:0:b0:44d:47e2:99bf with SMTP id
 v133-20020a627a8b000000b0044d47e299bfmr5916542pfc.64.1634228608321;
        Thu, 14 Oct 2021 09:23:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 x129sm3014848pfc.140.2021.10.14.09.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 09:23:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce.bbclass: Mark string as raw in a regexp
Date: Thu, 14 Oct 2021 09:23:25 -0700
Message-Id: <20211014162325.463369-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 16:23:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93299

Fixes python Deprecated behavior warning

xfce.bbclass:3: DeprecationWarning: invalid escape sequence \.
  m = re.match("^([0-9]+)\.([0-9]+)", v)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-xfce/classes/xfce.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index 7cd806701c..913202be59 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -1,6 +1,6 @@
 def xfce_verdir(v):
     import re
-    m = re.match("^([0-9]+)\.([0-9]+)", v)
+    m = re.match(r"^([0-9]+)\.([0-9]+)", v)
     return "%s.%s" % (m.group(1), m.group(2))
 
 HOMEPAGE = "http://www.xfce.org"
-- 
2.33.0


