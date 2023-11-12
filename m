Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883CCC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 15:19:12 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.16761.1699802347634273444
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 07:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ckcyxWB6;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so5536050a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699802345; x=1700407145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYgP8xngvaKW7rzZawsaRgYO6rmE2EpQSQsCJABlsbA=;
        b=ckcyxWB6Go29pfVw+tZ0TGxNxOb8Dp7wXFVWGfliBrfE+lCGaI38WEZAEVLfImlUdn
         fsSIb4uj3Rl3aSXga1BvuOTwzcOOKPryzRx4LTb92YZCEXYjlXbDscXEdp5lCnYMbKJG
         r7xhSkTRmFTI8UeaRA6jjLwhS+zDTOg5dN8K2ZQs/TEChSAIJLvl9EehNPL1rG84HDYD
         URartVqcEj8Yt0hXV4q/Kyn23UCC9FscgTbtZ1Ub/9HA+PaMByd4HshpHfO3JtsRxaZD
         PBDjI9yThSCjLwCr6fL0jtsQWqs3k4oUJdRBI0Xz6lr5x9ogFojXtUkW+SaxncuGU/oj
         meYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699802345; x=1700407145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XYgP8xngvaKW7rzZawsaRgYO6rmE2EpQSQsCJABlsbA=;
        b=O/0P3ADEZ5m2mdffpih5pG0fR7hZZ2oVmpHbm6lYfunvOR304veuuuJa++EkHjdFWQ
         pnTnlZMRBw6Y5C9Z4sXR7hK6XcfPgBBHbW9Kc5dJ4D3GIcmWn5zzw0wBoHKzaTs4HSzD
         db4FZXL96RlnX+Glo9QFV2vOy/B/558TBBzeBtFefhMrsBXZe7G88ZxyXZzHG1dyNNxN
         zSyyQ6pErH6W7qR9dLteBNoXFua2XcBpVI/TXU/3FGcxF8yw1WJJd78teE3OyGuRH/JN
         ydNNm/x4joOg73ebt/MVI8U3jMX2ZgIfJPpZ6ZMn4rcUD1MUUSQc0KcZDZkLDNwbdTPv
         ibzQ==
X-Gm-Message-State: AOJu0YyjMbsRZTv8OxrJyHzKfMjWe21aEdPfgtPahZtqcuR6rR8TbJ25
	nF8+dsqswPzuU9I49YNjIK6J2sN1fb6Umw==
X-Google-Smtp-Source: AGHT+IHH6ADCJynFgh1HHV1k6iF78A90Z53e1m28nKefI/Hzs0mdJb1OWViFB/deJ+LLP6lEjwyS1Q==
X-Received: by 2002:a17:906:770d:b0:9e3:b513:7004 with SMTP id q13-20020a170906770d00b009e3b5137004mr3292864ejm.47.1699802345418;
        Sun, 12 Nov 2023 07:19:05 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id j14-20020a170906278e00b009b9977867fbsm2688089ejc.109.2023.11.12.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 07:19:04 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] libopenmpt: upgrade 0.6.2 -> 0.7.3
Date: Sun, 12 Nov 2023 18:18:49 +0300
Message-Id: <20231112151849.414772-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106590

Changelog:

https://github.com/OpenMPT/openmpt/blob/de9e591419eb5f5534f06da2876515fe7af18039/doc/libopenmpt/changelog.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../libopenmpt/{libopenmpt_0.6.2.bb => libopenmpt_0.7.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.6.2.bb => libopenmpt_0.7.3.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
rename to meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
index 47173d71d..58fc8278e 100644
--- a/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.6.2.bb
+++ b/meta-multimedia/recipes-multimedia/libopenmpt/libopenmpt_0.7.3.bb
@@ -7,15 +7,15 @@ HOMEPAGE = "https://lib.openmpt.org/libopenmpt/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ae09d6164bdecb499183479fd32b66fb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=59f6e21f42e49919617267ff13a0b232"
 
 DEPENDS = "virtual/libiconv"
 
 SRC_URI = "https://lib.openmpt.org/files/libopenmpt/src/libopenmpt-${PV}+release.autotools.tar.gz \
            file://run-ptest \
           "
-SRC_URI[md5sum] = "d21fb799695cbe10a1e9aeaea23ed708"
-SRC_URI[sha256sum] = "50c0d62ff2d9afefa36cce9f29042cb1fb8d4f0b386b81a0fc7734f35e21e6b6"
+SRC_URI[md5sum] = "ffd572d817a090554f55adf97c1997c2"
+SRC_URI[sha256sum] = "2cf8369b7916b09264f3f14b9fb6cef35a6e9bee0328dec4f49d98211ccfd722"
 
 S = "${WORKDIR}/libopenmpt-${PV}+release.autotools"
 
-- 
2.25.1


