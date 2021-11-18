Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A31C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 08:16:10 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.2905.1637223370115335401
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 00:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gGdbace3;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id t26so21923706lfk.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 00:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/faSMAJxxNmhFzxXLei01owD0cahgtI2s7EzYzwJNhQ=;
        b=gGdbace33Z9WhUsfNF8TkrDr698WIA63E1Y1pFU/GQu1W40Lgl7eSsqXJZjcL1jQwf
         6B/yiqLsTzFD3QdQUcC7Zu5tHu/WZCjK/oEGLZF3ZyvUL7jIoZUAlOZgU/A0NRxVEh3H
         ts/LsKCmufuzX15yD4KLcQTb4e6Ayae5+sai5B9d/rRRWch9BteGD8ufKYFZiw0qyxJf
         u+HjMwJ+c9pnxTPq2BGr0ZWBAEMnb0ppkIkTNtRpYJA+WSDhjgvgy7rg2YzVa3mxqkAE
         4JpxlTey/fd0MPBSXFIsNdouG4QDlQxrK+u1IBKElkJo6lrtlN0sy0nzFOmWWyU2D/nu
         DUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/faSMAJxxNmhFzxXLei01owD0cahgtI2s7EzYzwJNhQ=;
        b=zPEtgkw5WfbQSg89rqmhjVXVqPGfhszUyWYzBwDcEX9bPDBvI0jKiE2xEwNpaNiYys
         2meGc1JvsK9LQVR7pcQ7Oe+7jJwQEQlDAsAAZYO7X0Yf6rn7p2yYdDIsxqpBpoGOS04U
         HQ/i8mkuJiixc7/sPTbkwfZdMdpKJUstXzPYNkKZif1eWsE+NZ1qLnIVMDpSb7GzxpCM
         0NjFSG0+IR37s8Vxpw3u3Ov2RUAy+ia0EO+2GmeR4VA3TLGv1LfKEyGpPgV72O15LrZV
         kfwRU58x3h3PSkG6DnT6Rcdn7yXkl0pm0HyVQg0aTc9eJ5UCe1gxS9uivvXsHXCBSfsl
         MJ0g==
X-Gm-Message-State: AOAM533HUShm1VQmpM34Jdt6O+7BKBT+x7vY5BDunLd3cjhjTHzRqiDM
	iH6RZFv5MnkcpFfphWt/aO3VoX+p+3uX9g==
X-Google-Smtp-Source: 
 ABdhPJzqifLiDkoOJe/0N+llwykIwuC0ZJnuAj7r38c7nH2eggQWghnOokXPB+304OXPrgK9Nnea+g==
X-Received: by 2002:a05:6512:32c6:: with SMTP id
 f6mr22194111lfg.675.1637223367809;
        Thu, 18 Nov 2021 00:16:07 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 be30sm226835lfb.3.2021.11.18.00.16.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 00:16:06 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-java][PATCH] cacao: Set git branch
Date: Thu, 18 Nov 2021 09:15:52 +0100
Message-Id: <20211118081552.628047-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 08:16:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94017

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 recipes-core/cacao/cacao_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/cacao/cacao_git.bb b/recipes-core/cacao/cacao_git.bb
index 29aa24f..fef7f34 100644
--- a/recipes-core/cacao/cacao_git.bb
+++ b/recipes-core/cacao/cacao_git.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib libtool classpath virtual/javac-native bdwgc"
 RPROVIDES:${PN} = "java2-runtime"
 
 SRCREV = "6c4694f9bd175386a8c451531e9a5ad97aa23b6f"
-SRC_URI = "git://bitbucket.org/cacaovm/cacao.git;protocol=https \
+SRC_URI = "git://bitbucket.org/cacaovm/cacao.git;protocol=https;branch=master \
            file://0001-java.in-Do-not-use-hardcode-paths.patch \
            file://0002-cacao-use-system-s-boehm-garbage-collector.patch \
 "

