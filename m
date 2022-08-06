Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59194C19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 15:49:55 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.4487.1659800993466779690
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 08:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dDHTflrL;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id m2so5081842pls.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Aug 2022 08:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=K1/OK0We4Fn9GBHVKTG44QWQTFr5Rj7l//7P08nh2ko=;
        b=dDHTflrLx0Fv8ISQCtHo2qEGIOR6GK1SlGz9fMZIC3gSh3E+m9xiggIrDueGQIt1jo
         i6u6GvpDiKpACUZWOrREmzjF4yHgFPNXuE5XMVZUY5oiZwrnU9D5l1it4qQaEzm5l72P
         SP1/xg+V3EfKo48xSNEUWDoDvrgaO7JVPCpLLFBDppL/JLi8K56cne0odThyZCQeTGHq
         TOS2fhQEy/C3otTeEoBgfnY6yfie10pLVTwRWwUcevNdtCx9GSgKCkMJrmiZM+gruCkA
         1BTrV+vTiJB3ebq94NtRNaXA2na/ajSvnvqhA9c7cjV2hCebcDjtzpHXU7qVcRV3zYWR
         1Qxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=K1/OK0We4Fn9GBHVKTG44QWQTFr5Rj7l//7P08nh2ko=;
        b=tFQeskxPJKirRloN1OrtXQST+Plxw22o38jTWmKlY2ZSoecqM9Au8cpZB1y8lQjV5Y
         HTtwQCRETCcZBiCGeSRVqK8Y7p6q5v2YLgfn/bJqJMJqqgr4lq5H+5nFU+SQ3Kha2uhk
         SKdBOezpHR+JrDU9ueDX7iwmEB9rX08+D6BJ7/perYOqgSxihcMZZo6OYA+0kfC0h4Z6
         ijPCDBg4491/mVHLXXnIYn7DwV6B0VApAv7K+LsCvfEqgHqaESCwhzOrGELIlcSnzYBP
         LdHpFT/sJ0fzTI9ALqWenHEYquAL3Wve+ZJmAjwnQpAYrprGPSnAYF9yyJp/UE0Ger8l
         8VUw==
X-Gm-Message-State: ACgBeo34bVheg4X1irAdTKl+aPR1u3aXVmWHD1k53oealBJIk4AfkA5y
	9Wk5++cIhOxWRP2sap0/KjjHvZKwexA=
X-Google-Smtp-Source: 
 AA6agR6+cpdwGvYAZyNQCxZLzOGeJpc/XfsIf8P2RCEaNr3S2D6Vjlf+l5Bc3rEe9bYDWg5wRuT8rA==
X-Received: by 2002:a17:902:c406:b0:16e:df76:5267 with SMTP id
 k6-20020a170902c40600b0016edf765267mr11650007plk.8.1659800992536;
        Sat, 06 Aug 2022 08:49:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 1-20020a17090a0c0100b001efd4dbcf13sm7442597pjs.39.2022.08.06.08.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 08:49:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH V2] ibus: Swith to use main branch instead of
 master
Date: Sat,  6 Aug 2022 08:49:49 -0700
Message-Id: <20220806154949.805798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Aug 2022 15:49:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98140

Upstream has switched to using main for tip of trunk, therefore follow
it here in SRC_URI as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Fabio Estevam <festevam@gmail.com>
Reported-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 37a490abe0..bb662f2ec9 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -10,7 +10,7 @@ PV = "1.5.26"
 DEPENDS = "unicode-ucd"
 
 SRC_URI = " \
-    git://github.com/ibus/ibus.git;branch=master;protocol=https \
+    git://github.com/ibus/ibus.git;branch=main;protocol=https \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
 SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
-- 
2.37.1


