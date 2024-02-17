Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE69C48BC4
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 16:34:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.494.1708187658723237100
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Feb 2024 08:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RMnwTC2x;
 spf=pass (domain: linaro.org, ip: 209.85.221.44, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33d36736d4eso213364f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 08:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708187656; x=1708792456; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpsh99k2UOaJhGvkvzUo2q3+Jn48Nn4M5Ct3R9hsHCc=;
        b=RMnwTC2xY3lvcPssc37Emy6zexC35qKwerK2m7ZuLXwJ9MOpS4xb/BqpXWy8Evq+5U
         rp8crZeqHAJwsqQ0EfLWhjKiZZGYsfG/2dP0vQOG9op6hR7v9T+oETOpONHgNCqE7GOs
         yLjCKzvLOBCvHObB81c3vX0U8EFpcPOVaLxy6wcAR/ahX9uQTUdbOTSn6G3L/D/7Yzer
         qpEYLcfFqYx8Atyce0XtYMtxNYT8K+7Bsc1tTmWCSJJSrnSShDhpgOQPxA++Rh0BN0L8
         fzLeI1wNBcbzhh4qI60KwQvv9QZfD1OkkGsrdB+yvA/VGjoTzdm72TT5iVhTxp/7+rIO
         MnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708187656; x=1708792456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpsh99k2UOaJhGvkvzUo2q3+Jn48Nn4M5Ct3R9hsHCc=;
        b=O7q0KIkXQ0Jypi7ZxYmMXwMSuvkSiVrPCxkhfecb777FlWE3GdphjQnhYQi7e4w1kH
         uQl+DSSdyxwF0TTJvOBgdbiHSl/WWeCnYZeQsqnQlSiu3jaYDZy3jXAd3hV8+EDdOQ5g
         0Dp7qTZUxSH/fvW6WfHPyvj+sDNNqKNcLP7rvhsJ3dsbbq2d3a/xZFXpszvbJ8GTpc2q
         p4MUUHVfwgtFAj3SRY0DsgXGuMXAxeODUApAV5Adr1ypXoVUgmGtQnvQnNmF59oNneqe
         jKTX9zq7lZZ0sazF9qnpN32kb+2PKioeBhzm3O7NcAT+oNmFKVP1FJY77c7m46nWEBE2
         Us+g==
X-Gm-Message-State: AOJu0YzDBflHuiJUaTYhG5kploUOVLau4gvclI2eJFGxOBRFo4Wu104R
	6uWooMS8a50DpvlTJGI2Ki3BkmZxN9VV18q5w5I1lu+vqEJJoiZswbWv4v2CijfYmhz1U2SP9BE
	exnk=
X-Google-Smtp-Source: AGHT+IFdFssDqsvVMI0TDgNb2k2HwEeyZyy8vgbJJ1B8WPUYm05j7jLmjCSQJveZCcF1oPJc4zio1A==
X-Received: by 2002:a5d:44cd:0:b0:33d:3893:838a with SMTP id z13-20020a5d44cd000000b0033d3893838amr658616wrr.56.1708187656235;
        Sat, 17 Feb 2024 08:34:16 -0800 (PST)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0033d07edbaa6sm5277639wrs.110.2024.02.17.08.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 08:34:15 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-oe][PATCH 1/2] libtinyxml2: fix the homepage URL
Date: Sat, 17 Feb 2024 17:34:07 +0100
Message-ID: <20240217163408.213929-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 16:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108833

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
index cece68c632..5039e9ff77 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_10.0.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "TinyXML-2 is a simple, small, efficient, C++ XML parser that can be easily integrating into other programs"
-HOMEPAGE = "http://www.grinninglizard.com/tinyxml2/"
+HOMEPAGE = "https://leethomason.github.io/tinyxml2"
 SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
-- 
2.43.0


