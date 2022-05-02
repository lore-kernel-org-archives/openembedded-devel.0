Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B7EC433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:33:59 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.11430.1651502034232049159
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pte+LLw2;
 spf=pass (domain: gmail.com, ip: 209.85.216.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id r9so12821939pjo.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 07:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=29406Y8WJDmGuEvi8+1BSGmH/6/7iThuyN7k41MG5kU=;
        b=pte+LLw2cHBcXDtxcrfiR5Nu13CZnm0nEOasxry4DsiUV79Ka6qpIvjXcooSs6ixnv
         liYrz0/Xi6tckGE3haowusRUsG5WMOg2nujTRvTtUJgjn87v1rwwzoopKmDAFK7i+lCT
         /v/46wLih3na/bQatp/e/jvM+G+Tac+2BgWynHlw8/dXsq1+2AyMOvGIrn+TVR0WuMz7
         88JUUDDsBfKl37Px4LCznQPYUDlMHezvjtcR3EZkOVwmhCpV/s0PHrIELqUA6ju9h3J7
         sAXWIe+/Lx+8/VN4WML+ExuQGttRhO1ybLCKuAvXFpsJ7yJuMLygpjloBWRHZk+MVDzG
         0q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29406Y8WJDmGuEvi8+1BSGmH/6/7iThuyN7k41MG5kU=;
        b=fi3Hc7RDFdXpck7MWb3KwBVqlsV86sXI/F3ygjxaN6h7e/n2ZmXG3MVT3HrkGv45VH
         wIoZQa3eajI1V0wFLWnmjLN3HVb535W/OtFjEF93CjqAhAZoq8v8kslS63KmOW3bxBOY
         Sz2rfBYFoeuxDLngwKgjK++b60LvWRcK0GEmRnAuhWpd98ZK+MpEvOOsIb2dwxPY1T+6
         6TSrnKjE/RIbsUBcqwhdx32k+eLOmNCQ0gGAtp2fBQU1QqwCF88mvGZL3BaCQakYLt1l
         cD/+llGndLW1+I4rXwEQbeEG4f2UfLR2YjKbpPxzSQj/ENrlvDYz58eKQE/o8ZWa17gb
         GbIg==
X-Gm-Message-State: AOAM532NyV98YL57A3P6obIgpazL78tr4NNQZushZZPG4nagdzVI5yfZ
	FXmmc+Y8dARElGPx+jbuOpA2jLSifPmz7w==
X-Google-Smtp-Source: 
 ABdhPJxjDVn9C2tx+WMhwNHmx5jrCT3IV907di//17VdFRmP098sYZu3niZ/jLQtXqUCD/LQbO86Fw==
X-Received: by 2002:a17:902:d044:b0:15c:eec0:2bc with SMTP id
 l4-20020a170902d04400b0015ceec002bcmr12017573pll.28.1651502032657;
        Mon, 02 May 2022 07:33:52 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:33c6:b9d3:2a7b:1418])
        by smtp.gmail.com with ESMTPSA id
 i14-20020a17090332ce00b0015e8d4eb1f0sm4785518plr.58.2022.05.02.07.33.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 07:33:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][v2][PATCH 04/10] nvmetcli: move recipe to meta-oe
Date: Mon,  2 May 2022 07:33:39 -0700
Message-Id: <20220502143345.1500852-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143345.1500852-1-akuster808@gmail.com>
References: <20220502143345.1500852-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 14:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96933

Signed-off-by: Armin Kuster <akuster808@gmail.com>

--
V2]
Move to dynamic meta-python
---
 .../meta-python}/recipes-support/nvmetcli/nvmetcli_0.7.bb         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-networking => meta-oe/dynamic-layers/meta-python}/recipes-support/nvmetcli/nvmetcli_0.7.bb (100%)

diff --git a/meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb b/meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.7.bb
similarity index 100%
rename from meta-networking/recipes-support/nvmetcli/nvmetcli_0.7.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-support/nvmetcli/nvmetcli_0.7.bb
-- 
2.25.1


