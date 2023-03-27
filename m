Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC47C76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 12:50:09 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.33855.1679921408351330886
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Mar 2023 05:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PxCmJsLf;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id ek18so35704928edb.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P69xbDcroW32KgBKNtehHCJ+T5rkDxnt3EPxtEEVfUQ=;
        b=PxCmJsLfwbFRH+Ta/ZuWshNVJDL6M1LT4SyTH2yPbFcF3cUis85bD8qN4Tc1lhNeDw
         eu67EEuTA96WMCq+ljG5BD4fTcIUtwCSu0KeetTuH8+T80OFrmhs7NLl9789YBkNrXYi
         k0dtnMm1RkqDO8Ds8tnXHDBw2u6iu1johscM1Jp+4TxAXvoCWi3ipPLItxvo+AXZuH9T
         fABy+PqDs7F++S+jqBrK4nL00wKufPReogPzIAb426jdd84kdBFJ4RhDnZcb5uMELW19
         FFid4YokaGT70JwJzLn2MuKir6xpAVe773Fg1rwvE1uA+pKS9fi3ytV2HAZSoNrNEMGe
         hWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P69xbDcroW32KgBKNtehHCJ+T5rkDxnt3EPxtEEVfUQ=;
        b=VJ0/DZN1VpNh9nbxPruIwbe3ERErjUqocHenw2GUk+P3nSdNunIhtlyTtTBCxvFuOB
         4ulXeqvVNDjiJj/KpkYOvfNDRId4GcP5XRlft7gdGRgbbI123w4lbGysgJrsRIc4nvLY
         dk5SxY52gfzxEMW4clY/1+XXK3Ba2BUZ0f9erzA2iuWOH6BVgslVjojLxmmjBgpd4bCl
         zqa/YlIDzQTbAtw8K77VpMBTfwDwYZIpQ09V2qbFu8y4FCKYwCvtUzfUCD1oQRkk68R+
         LjM0uhjiIyrGaEHb9BpCPNhCT6bFwso2TOXZWrXY0TO539dyUrj0VQad+zbqMoG8hlBu
         alDg==
X-Gm-Message-State: AAQBX9dO4hsytnXpwQY5Ybw82lk2q1QgEDhv4vKrUFgxS8xjc8dfiRLK
	iLzy6vggDONchwOGMo+G6e7bF5mP0+c=
X-Google-Smtp-Source: AKy350bkxMwb0er9T4AUo6NnbNAfDbK1PEpbJUPjF7vbWXwuvzGtlauWf27Rc1oBI+W1Y/+zLDLjlA==
X-Received: by 2002:a17:907:2c46:b0:879:ab3:93d1 with SMTP id hf6-20020a1709072c4600b008790ab393d1mr13305515ejc.4.1679921406540;
        Mon, 27 Mar 2023 05:50:06 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z21-20020a50cd15000000b004acbda55f6bsm14657722edi.27.2023.03.27.05.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:50:06 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-pure-eval: New recipe
Date: Mon, 27 Mar 2023 14:50:00 +0200
Message-Id: <20230327125002.90472-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230327125002.90472-1-zboszor@gmail.com>
References: <20230327125002.90472-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 12:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101779

Dependency of python3-stack-data.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-pure-eval_0.2.2.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
new file mode 100644
index 000000000..d2aaa3db4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pure-eval_0.2.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Safely evaluate AST nodes without side effects"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a3d6c15f7859ae235a78f2758e5a48cf"
+
+DEPENDS = "python3-setuptools-scm-native"
+
+PYPI_PACKAGE = "pure_eval"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "2b45320af6dfaa1750f543d714b6d1c520a1688dec6fd24d339063ce0aaa9ac3"
-- 
2.39.2


