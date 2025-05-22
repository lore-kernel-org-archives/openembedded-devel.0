Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B786C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 09:56:18 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.15340.1747883247919205896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 20:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RlgZ9tMG;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-231f325366eso55741825ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 20:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747883247; x=1748488047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=++xBpr/kY/BdxILn5DY8A0ubjZUaTTCL31P7AL7Ua7Q=;
        b=RlgZ9tMGUTlBPBV7PHp5SppVr+UXnu6Igk3Kq3tnzsuCqi9GnKXLYwCvGwK8NraGEY
         QfgXKN9X+/KQ5RNgjMEKK9ZwVl/l4HWKZJX4ZpHa4s8yvvI5Goq29HfQRefb9Bk/NTMe
         3yams3KSllaiGoJnzgHJiL8QMhKsqTt6STAkpL2df7UNXHDWWjVdvgH3Tp3aNHiCMQOn
         WqNmzeyUTgcsAYvBtpluw55X/uCfhPs/a8rNA+eghyrpZxSll0tY+4h3AumLZrD7QSqT
         upfjX0tg6kImzanP1aV+2iRAasnvgUI3OEO1v+uj+nLLkgfsiqBHPbFxA5J9vMdJV+ww
         /oig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747883247; x=1748488047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++xBpr/kY/BdxILn5DY8A0ubjZUaTTCL31P7AL7Ua7Q=;
        b=Rvw23wNr1ssglFJenRgby1Z5qPio21Uvyq/XHXrIy7dbKdFGJY+sQLVPxBkQW75HMu
         ef1JtqWOdmx4GYbNkJqje8bdv9uUWIPAN6u5Bg/NJJmZ0V7cLS88Bnq6ZY6wYvcM1pfN
         zl4W6ZkS2C11KkqlbyVNJxCDszxucvGWCxxX4VycOPjEbw9V6EaBJeFl3JU5HM0KDUQc
         Sd3jhiaKShIJxF1jUqpkwaBDVyUnb0yZ0sv7Rm4Ngam5Ujk/2oRTpbSK5f39lKbtYzcx
         xfU08EhHSfWir0k+/5Cfqj1htdVnBb1BlYp34L43evO5SjEeX1F+plQW46cse2LPGHOO
         +tzQ==
X-Gm-Message-State: AOJu0Yzo02/8dCwL4133EYMxO/kBlbT9DEHqdaf64v5XCG6/1ZQ/I8wX
	3ZWJS9ZWcrn8wgWcl97yMRRMku1eFlxuQX8tVC56UqIS44LBG+UVjPPILDSloQ==
X-Gm-Gg: ASbGncuZZUywIrmo5WemLHT7vKnde3vJjP963HcA2kqI+8Nf9Pc8aodi8HL7iJ/H7I7
	J+nxOywmyYt6FuXUykPjV1y50MQ4hnj+mglynnb9FVC4Imi9NZIU6A32ohzdW6iQQiVojQgDMY8
	SNlq8UkpgONH7/tkI2dVacIyHJMSjvRMxL92MFWORhhNY3RNj7307QpsBDkHiXl9mOZiUdxWSlJ
	DnqXmRNtEwwpKxUt9LiVxJSUDaMRrL0/pDyKGK/xPZsIuo7I+3e8IFnrgPACvA5jmzifng3cXE5
	x/TGnDdZ0UN3JMSEm6z3/dDPwXOl9KlpEH93xE8Tai5/tacOwwrln4nxKvCi/rrNLnxI/jLnKvr
	ZAu5K
X-Google-Smtp-Source: AGHT+IHUZmEi2T7mTTw+f5dhH+bV7oebt3ZEfc1WSOKoRkPOECPAjCfOK6HN0iXV98JvhOzK/v6rwQ==
X-Received: by 2002:a17:903:b4e:b0:22f:9f6a:7cf with SMTP id d9443c01a7336-231d45cc01fmr335605595ad.52.1747883246233;
        Wed, 21 May 2025 20:07:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:4802:9111:1040:76d4:35ff:fe85:dd7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac95f4sm99923675ad.32.2025.05.21.20.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:07:25 -0700 (PDT)
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
Subject: [meta-oe][PATCH] Add spsr_err_txt, to get text of error code.
Date: Thu, 22 May 2025 10:07:04 +0700
Message-ID: <20250522030704.11700-1-nguyenthaithuanalg@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 09:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117579

---
 .../{libsimplelog_1.0.6.bb => libsimplelog_1.0.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libsimplelog/{libsimplelog_1.0.6.bb => libsimplelog_1.0.7.bb} (92%)

diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
similarity index 92%
rename from meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
rename to meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
index 0aacbcd2cc..0302f7c89f 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.6.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.0.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22cdd382a6275cb4c2e75c517952ac7c"
 
 SRC_URI = "git://github.com/thuanalg/simplelog-topic.git;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
+SRCREV = "edbe423bdd1b36faf30d2eeeb869e4c1755864de"
 
 S = "${WORKDIR}/git"
 
-- 
2.47.1


