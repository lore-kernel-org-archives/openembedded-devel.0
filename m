Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D4EEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 17:51:52 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.961.1691085104753717143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 10:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZMEo7MO2;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: sweng5080@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a751d2e6ecso965129b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691085104; x=1691689904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zDcXX//la0BDcjke3FAbDPc5u03fnFdk7id+I2yziyg=;
        b=ZMEo7MO2gywtQaCauCfi7XIGlqqaj8m9huGk05Hw0n+4hBSet7/lo9GgbuAEL0c0K0
         8G1pAlzSx3IHYUOwMwO9WwuYev5ElbbZUacbWZpEKkQ5SZbWn8pknxxwwBm5PsPPEABe
         OBIGjHRmOjjjBA9Xnhf1L954SyR52FE9XF40gLl7e4JfpZDFGMxPyqedhCyC1sV/OFlU
         EL3lWnF871DR0LqTqackgET+tFIXlvh35M2zv3R0CAv/oiVvptbPBB98jMDBEvjil7/M
         e4Intcyr5UEKuXdERyWGNJg03Qw5qKi9dxYSEkGgcZAv+nZpUDa0+BPN7PNqT0+bB6Xd
         gf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085104; x=1691689904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zDcXX//la0BDcjke3FAbDPc5u03fnFdk7id+I2yziyg=;
        b=V8o3gMAzXbBzAm78M/aR7uHga9hjc/sZG0V8TWrynEocWv/c8j77GI5F6KglJ3Qjrz
         NpjEoNmr5Rqy15LGTdebpowr7pQO2RVa6MzjKA8ZqU1AjxHnsnyPLl+VvszxBvTAfqlu
         bbHuR/Sla0tlb+/L7i8bSDHKaljjNvCtPy5AS0fSof3tzN5P7lPBPcq3kc6SYpc2ObJu
         QvDyKzfcgk68uauDfq/oEzlemJs6fH26ZATUvOo+m0BX6esAbCrAK9DRXyZNx4F5kTtc
         rwCrXJ5iQ+PdOagCUC/cfwFCN/Obi4Ye1bc1px479//ueL2e70IL7fiGYYKxDCKciQ+N
         uiAw==
X-Gm-Message-State: ABy/qLYQC/cZHisGxL22t3SQ0vqYHufScz9HAdUDzqQoVD14wVZoAHhv
	pE1g6Ejj0Yyx4nVef3wVRjcvgzV3V8Y=
X-Google-Smtp-Source: APBJJlHqjS/fnklkR7lTQkHGIEAf/8Fx5VXChbo+eYq2bp+JX4CJpDoyx7aTvXGANxODb13RU2unLg==
X-Received: by 2002:a05:6808:1183:b0:3a4:8ac7:3407 with SMTP id j3-20020a056808118300b003a48ac73407mr25288729oil.42.1691085103740;
        Thu, 03 Aug 2023 10:51:43 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id r23-20020a0568080ab700b003a7408343bcsm106254oij.47.2023.08.03.10.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 10:51:43 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [meta-oe][PATCH] Fix groupname gid change warning
Date: Thu,  3 Aug 2023 12:51:27 -0500
Message-Id: <20230803175127.23188-1-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 17:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104223

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warning fixed:
cyrus-sasl: Changing groupname mail's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
index 11b53e7b6..d85ef2057 100644
--- a/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
+++ b/meta-oe/recipes-networking/cyrus-sasl/cyrus-sasl_2.1.28.bb
@@ -74,6 +74,7 @@ do_install:append() {
 }
 
 USERADD_PACKAGES = "${PN}-bin"
+GROUPADD_PARAM:${PN}-bin = "--system mail"
 USERADD_PARAM:${PN}-bin = "--system --home=/var/spool/mail -g mail cyrus"
 
 SYSTEMD_PACKAGES = "${PN}-bin"
-- 
2.37.0


