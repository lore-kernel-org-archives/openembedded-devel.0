Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A241C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 06:13:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4404.1634105588998253971
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 23:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R81ZgKJ/;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so3602192pjc.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 23:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xQlQUQL3w7boR5CbCQ3pCF9qfNzW0fUeUN7flHfLsMY=;
        b=R81ZgKJ/FMfS2Q06r43y21+y/FTj+2Dfcnv7dYwm3WRsDcgGImKuyQ0KoX4sUlr3RC
         yA1ZDEGvId9W1EWXmEB/VnJTsMlFTCIVoazG6RP5WCqELcpg/wsxvKCwTB0TdI9IWrCE
         pksGJe87YvkG0D+iDKwXMjCKa4sPHRBTnFeQBa39Fd6SYi6QcyWly7wuo8Ibdsz/mifS
         U63D+8kXbX3Xjd70UippaWhsfjgNfBiBKx4A1RrdRkh+Yt3EkCHzqUcdtPDwf0vJm8Q9
         cHPDtw9G28fhNnyJFAgwFv2Krk0AngjQN46zoMDACYH565sQ12jsOsHYbKTY6p5Q1xXD
         SuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xQlQUQL3w7boR5CbCQ3pCF9qfNzW0fUeUN7flHfLsMY=;
        b=r4CGBediDLMbpIItFWU4qpbEZvt60yHqozNHCHyX3pYZucFSiePtRBdW1f0p2OXpKt
         JLDFd1FiyNwCSu+ga80oQ1JLsw3aRLZ+0+8CNWBBxWySaKnV/bDyZPTSdw3+6yIMUMiI
         YhrUOUvp9H2DPeKRt+sawxGm0KHjcRokcNE9CMvd9fJ0QRrxA0v5nEP+PHwUAjCk0V8L
         tPD4qC3ziAN3mYCzBObelO3o171Qs8KFU8talc9z7nBmp/+rFhFTEeCa4uya+vFMHHAo
         FSpoJX5dYpaBfmQPSNArH0R+Z1UfdgHC+6aTM9Q2hlB3rVwljN6Qu036qyypKwGOFLKf
         S5yw==
X-Gm-Message-State: AOAM5338EwgSUcV2PYT/Qju1zf/Erog68nbj3zyvnMIc/qoeNHoaz9p6
	RBMLf20xemAq9HPRjiKHk5OXRNOPeCrXZA==
X-Google-Smtp-Source: 
 ABdhPJwfw7cKG8DjTVPFpEy9wxe23GHG0F2OHKmU9pjYaGR1tmi4uzh5fCCbE5wcrxWuugvuapUErQ==
X-Received: by 2002:a17:902:ea05:b0:13f:4b5:cda2 with SMTP id
 s5-20020a170902ea0500b0013f04b5cda2mr34089817plg.86.1634105587953;
        Tue, 12 Oct 2021 23:13:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ba74])
        by smtp.gmail.com with ESMTPSA id
 t3sm13391367pgo.51.2021.10.12.23.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 23:13:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-simpleeval: Remove use_2to3
Date: Tue, 12 Oct 2021 23:13:04 -0700
Message-Id: <20211013061304.431809-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 06:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93274

package works with py2 and py3, there is no need to use 2to3
See
https://github.com/jobsta/simpleeval/commit/4ea1a5d15d449ab805bae042a698b381ddefd5b1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-simpleeval_0.9.10.bb      | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
index 9708fc6262..36512cba9a 100644
--- a/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
+++ b/meta-python/recipes-devtools/python/python3-simpleeval_0.9.10.bb
@@ -17,7 +17,9 @@ SRC_URI += " \
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-
+do_configure:prepend() {
+	sed -i -e "/use_2to3=True,/d" ${S}/setup.py
+}
 do_install_ptest() {
 	cp -f ${S}/test_simpleeval.py ${D}${PTEST_PATH}/
 }
-- 
2.33.0


