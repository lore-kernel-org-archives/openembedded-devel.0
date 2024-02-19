Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7F8C5478A
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 21:48:27 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.1109.1708379300874475925
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 13:48:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3bb9b28acb4so3373361b6e.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 13:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708379299; x=1708984099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7sW/Z3+9tqzusqw/UUnpDHie5nPflzxby1vy0JqVhrE=;
        b=dL8fq3vVyhc7I0YZxsuCdsc3vXUE2bLGMYZJdmTQxul7wQS4s25F52sPoNgpVBd+gC
         ZWC0zH7ejMngBvYg02qLHwVXCUS3mXthDLh3BzGDlvcVqQ8Gn2NcaSOZ3cRH8bOzlsNN
         mfSpn1jm6a857kyFAQV5mdHDhTWv3rFBW8buSC2lXwdHFy5Uhmn7Qg4VDM37WMPnuv03
         A1JqP1xAqtEf91avzA1VXcoGpPjRW+9HlWRgIkqBb7M6qVP9tVZUQWUKDbUwAhfaNcuS
         oGXni3lDU68zeSFTC4nbfCBs6ovnV4j7PISZ2rO67D3PXVuouhWojVhwlFpYta4tqoa1
         ODLg==
X-Gm-Message-State: AOJu0Yxg+wRvwk+Q80M/+AmaqU8raPXns2naiKTpA8vMabTNCkRiaZiN
	mqLR1HM9RIYyhs0C+Wrzw/74tm3eHhEcIykmPcj4j+k4bmHD8nV55jwxXnyuhhE=
X-Google-Smtp-Source: AGHT+IHdsvgJQaaSUuRm+MOqtQq8KuJeRssSMztKcYEqAOpYDi7wESL8xf+nXlYgBYYgvi7ptm/cDA==
X-Received: by 2002:a05:6808:d47:b0:3c1:55ad:2cd9 with SMTP id w7-20020a0568080d4700b003c155ad2cd9mr4887400oik.51.1708379299361;
        Mon, 19 Feb 2024 13:48:19 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id bw10-20020a056808244a00b003c03fde4611sm994747oib.2.2024.02.19.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 13:48:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 6/8] python3-gunicorn: re-enable working ptests for the package
Date: Mon, 19 Feb 2024 21:47:59 +0000
Message-Id: <20240219214801.1514843-6-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219214801.1514843-1-derek@asterius.io>
References: <20240219214801.1514843-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 21:48:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108891

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 7fa96a495..2733280e6 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -18,6 +18,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-dominate \
     python3-execnet \
     python3-geojson \
+    python3-gunicorn \
     python3-html2text \
     python3-inflection \
     python3-intervals \
@@ -74,7 +75,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-dnspython \
     python3-fastjsonschema \
     python3-gpiod \
-    python3-gunicorn \
     python3-inotify \
     python3-license-expression \
     python3-ordered-set \
-- 
2.34.1


