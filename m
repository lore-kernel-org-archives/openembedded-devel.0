Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02253C6FA93
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 23:41:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.2737.1662594066644795825
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NyPD0O0o;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id o126so7157400pfb.6
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Sep 2022 16:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xzTynCNFfsuZ+Axu5aqps+3Pd9jJPkMQe8D+TkZOKzc=;
        b=NyPD0O0oQYwWfr5i+oQZ4hw78StTa9ycqAxye6b5tK9A5KjRSXjFQ2Q1TY2ItsQmC0
         QnIuH13lOsziHvvPGYwlB8VnCUMz+HrqSoDtQqg6+CvDhjWo8HLAFqaAR2frhtvc+7zY
         MfpdOOhf9RiMF25pmrPvLuX6ucQJzTSpItYN6gIJnDoR5mvmKzJwJlSpZzbylcwaCrmP
         IwWn45y4gRYvXCWPO1GgEgJTp9UgND8EUq5UGotq+ckLVoL3V2Avzu4KSjz6yFNcx8Aw
         b/J+qJ95u1T/E6tZ65Hh2x7f+ZmULRwQQI43CF/10C8VUhqAP5lEjt07B5/ZD+MRrDVc
         L6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xzTynCNFfsuZ+Axu5aqps+3Pd9jJPkMQe8D+TkZOKzc=;
        b=m9seY6u+i0m/l/v9RIJu5Mold5P2GFyFJxHPnqy7buHQKIDAh8NiUMBDobcbQgK/7M
         RjH6ffof7CtpRW+9nzqifDee7wyodHNz6+eAtmdTn0wEIME9WnHyujZtLuQU8A08Nehz
         XcCzDar44RnxbTu9Lh4e4H+A30I46fODjUmf9I5AemfAJpZHoWlOkoi3acxEp9LbOdKq
         SdxFuXtgzYa2wdVe7LPKLSgOHRr/d9OZDV89m2XRlMjoWpNPlbimfDQTDexS2GSZY80+
         Whr9OM4tleEjdFH5pRzqZBmGtbxjB8rDh7gpFwYvN2lMQVroE3IxQhFugZ0Tpzc7pNCy
         GfRQ==
X-Gm-Message-State: ACgBeo2gLEpH2skPdeOY72wlMFQ0QQWIaGUbxTk0QtPmIolGdek240p4
	C7gUguREhKZKU/+8Prd+4Tqz3LuUpvw2uw==
X-Google-Smtp-Source: 
 AA6agR7F1suF1+nxpok9IyvSOjVDHhpOyJXefdOsH3AI3CZF+N97AeTFIPmJX0wtmRZprQegNF0TwA==
X-Received: by 2002:a62:18ca:0:b0:53e:2588:9e03 with SMTP id
 193-20020a6218ca000000b0053e25889e03mr6361477pfy.24.1662594065859;
        Wed, 07 Sep 2022 16:41:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 ij5-20020a170902ab4500b0016c5306917fsm10276495plb.53.2022.09.07.16.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:41:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/22] libimobiledevice: Explicitly pass
 -D_GNU_SOURCE via cflags
Date: Wed,  7 Sep 2022 16:40:42 -0700
Message-Id: <20220907234102.3312797-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907234102.3312797-1-raj.khem@gmail.com>
References: <20220907234102.3312797-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Sep 2022 23:41:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98692

musl will need this defines for funcitons like asprintf

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libimobiledevice/libimobiledevice_git.bb                    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
index 3dfd4e90fe..52176872cf 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_git.bb
@@ -17,3 +17,5 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = " --without-cython "
+
+CFLAGS += "-D_GNU_SOURCE"
-- 
2.37.3


