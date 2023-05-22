Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA56C7EE2A
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:23:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.7012.1684797775834270977
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 16:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=g/QpnmBn;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d3fdcadb8so2484549b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684797775; x=1687389775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1WJqDKIcaqiBFUtKiMJFm758phaLn/5k7TexTK5h4A=;
        b=g/QpnmBnIpcX4itPLEhngKEuzb/S61KGAQKHHqhY3lHii5lHCp5oN8Cd/G62FdGCSn
         S99lJgiUEejElTe8L8hc9rOl21Tx75YVucyGmRxcG6RCiKtBkFmlWYcgmF6Fsfdd8qOz
         RSkA9D7NZ6dHIW7VWShx4BoVQbqv9gbFnP9XeSONVU9DXZDmLLjfKl6Yl907JoC9jP96
         hHx1kZLGAqsaGU9vS6h2YiadskgazNERJH+kfdiO1jcKwHR6OMDTnuZPGzXQRAlosE62
         yfj6pSw98qKE5qP4D/HtH8gcu7OUmg9c/iYRzzy3TrGHhUtlY9IWuSfQgvrhyHSIFkbi
         FyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684797775; x=1687389775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1WJqDKIcaqiBFUtKiMJFm758phaLn/5k7TexTK5h4A=;
        b=eXYuVfbwxUpW27mZzk5HiaKGgD9cjYnf5i9CEvfiQqcmn3osLeHE89Qan+SKJe7zXC
         365klLCdIwqQ7u6MM0wzbrtDtLjCFVGcuvCjrc8DMXtd7wK/dvNxrj5kOMbH5fYKRoBR
         sDRrgMs+fLrmbtSYe62FYa11ibVSKkcbNWAnJba9+I/HEYo9s+g/AwIDaHowzG8FcMtM
         qP/gJm5jO9t1UjDM4A2Qq3JfhycWcMJfoO0ygsOEGb0EgQIA2qQCKwPtaKRXpw0azNsv
         Op/lN0agZ0U9yzpyUpDpUa1S+nIC+eO3JdDlbIbPq6R0EphYxPNDaFtBfXu3qR0jVJBi
         sX1A==
X-Gm-Message-State: AC+VfDyn7sabX37Jyc7POcUGsBafybLClypBNfEe+SwJN5B9ViShRVqo
	yUUMRYXuV7Aa7DZylxJhTwWTbgkq8wE=
X-Google-Smtp-Source: ACHHUZ4zCn8zOkFZs7ppdwMTrmNYGI26Y5l3O2c0m63jV53fIeElzwYigaXFz+Hph/dy7UTMr74PqA==
X-Received: by 2002:a05:6a20:a5a8:b0:104:b7b4:e03b with SMTP id bc40-20020a056a20a5a800b00104b7b4e03bmr13420642pzb.48.1684797774959;
        Mon, 22 May 2023 16:22:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id x22-20020aa793b6000000b006439df7ed5fsm4621267pff.6.2023.05.22.16.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 16:22:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/5] ptest-packagelists-meta-python: Add python3-pylint to PTESTS_FAST_META_PYTHON
Date: Mon, 22 May 2023 16:22:49 -0700
Message-Id: <20230522232252.3475281-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522232252.3475281-1-raj.khem@gmail.com>
References: <20230522232252.3475281-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 23:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102712

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index acb853cf7e..9dc592720e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -27,6 +27,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-polyline \
     python3-precise-runner \
     python3-prettytable \
+    python3-pylint \
     python3-ptyprocess \
     python3-pyasn1-modules \
     python3-pyroute2 \
-- 
2.40.1


