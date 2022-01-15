Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5892DC4332F
	for <webhook@archiver.kernel.org>; Sat, 15 Jan 2022 14:28:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.7644.1642256881776979030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mygMrCP0;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 w12-20020a17090a528c00b001b276aa3aabso1421152pjh.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=swt6BIlhVvwxQXVFjAyJ/uMDfKT+V97GHJO6EgUyMQM=;
        b=mygMrCP0HFyn9gYXn/dEXQAnFn5+xvtv5l7YrZOCGPOLl9RCrhaTRiMlwwuAZgc+y4
         Oftb8bAKhFVvUMTU35ecJ2sig4AY0zRW8MNfoMcb20yMayzPo245OgHIuRSkP2g7w9Jn
         U+VX3YErJrQuQ+/oeRfvJiNR/JKm5jkb5OriRNMjI68C0MQzxlvQtA+zbtxRDnz2jAk+
         BQ6EcsnA2pdeph4gOrgrNLMleNaM7giVSmcD6BzqRzaDBUNUzW3CQKiShoncX/NUSPpK
         213lXbLTUZcAUDFJQcgki1zOdDowwtxoeYFrDJytgpXksvwtrPdZ8CoVrEOWCuCTnc2B
         xvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swt6BIlhVvwxQXVFjAyJ/uMDfKT+V97GHJO6EgUyMQM=;
        b=NX2Bye1Bcu84RsGJHxPfoyCqXzpVuqvAOVuzm8pQQytm4cVFA0CTQklZty9cQF1AfQ
         HNpdtNTT2l+mQ8mdwPmrGdFVCf/YyUQ57pTgxOlkqaFlxlP/iHJ5EnyP7JXKdXzOfABB
         AlRhrDzao7jcQYiRQWYAnYYrTMvSkyPOMZsodh7nMpwnvh9+H87Y8dL2mo3FKpixZ7ih
         a5lUmM9rKzfEsoOCmDJv9KeiAVn0iU42Tbtc2AwpuHBdWx6TUpDLzEEky+9tzeXIob5I
         LJCzNSuD1CV5/+TzRM8NNj0Skm5nQJsuerkZEoQPOx7DnwpyYc4oJRTXw0dGGs7jku64
         8MtA==
X-Gm-Message-State: AOAM5304Ut5cE+JbwBI+oqlcQWtw9VtPMsQ2U+2YjPzz/oehqyAsfzeK
	3n9mZWk7nJZlL6BLdsQ9rtkBqtGmbOtkfQ==
X-Google-Smtp-Source: 
 ABdhPJyI9gUN45CsWGnH1zl4KN4Ks7DmWXuoXQsfTNRDmVCTVPTrs4il8yKqkCMwljyRkOgUiVvudA==
X-Received: by 2002:a17:902:cec5:b0:14a:5aa5:6a76 with SMTP id
 d5-20020a170902cec500b0014a5aa56a76mr13908824plg.51.1642256881161;
        Sat, 15 Jan 2022 06:28:01 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:7ab9:6507:6566:58c8])
        by smtp.gmail.com with ESMTPSA id
 k20sm8606779pfk.111.2022.01.15.06.28.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 06:28:00 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/11] googletest: Switch branch from master to main
Date: Sat, 15 Jan 2022 06:27:47 -0800
Message-Id: 
 <91ef937c49de1c39ba815ff65c58f2240faf3013.1642256649.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642256648.git.akuster808@gmail.com>
References: <cover.1642256648.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Jan 2022 14:28:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94863

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The master branch has been renamed to main in the github repo.

Change-Id: I19e9ea3998cf22508425d87fceb64ae68fbff166
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-test/googletest/googletest_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_git.bb
index 898f23fafb..35fe1bed00 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_git.bb
@@ -11,7 +11,7 @@ PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
 SRCREV = "703bd9caab50b139428cea1aaff9974ebee5742e"
-SRC_URI = "git://github.com/google/googletest.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
 
-- 
2.25.1


