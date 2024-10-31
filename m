Return-Path: <andrea.ricchi@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1893CE68962
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 09:20:36 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.8385.1730366433967297632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 02:20:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=al7acobF;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.54, mailfrom: andrea.ricchi@amarulasolutions.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso86466766b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 02:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1730366432; x=1730971232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UdVzuyc7h6ljQYFp8JYIENkWpczkr0q6Dx7+3YPFJD4=;
        b=al7acobF8b2a6dAnWRdjV3zjfBh8kc9aVvg/D/0LUoMyKuJ0DkNBx+dNw2axvsV5Rb
         20rBjCWkKY8n0oyZVfhba8mjYk/LMl/j2mw218PumWWBF1RT973Yhk8uV9yeUBrj1Rua
         oiUa+k2yDdrDM1kEQ0pRs+L3RVKYiH70rtD9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366432; x=1730971232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdVzuyc7h6ljQYFp8JYIENkWpczkr0q6Dx7+3YPFJD4=;
        b=nc2Jfor0zJnOGGHtqXab0dWjWdIi3p6m9gNeSJ/G77DBoVrq4ICdnDRbQ2Gha6YiDi
         /Dv0a0zO/UIUWHs27HuF10NnvHeMovifm3vmR3DP9unBGiQ+2ZdGcqOOHLMxIa8b+8eY
         bKePW7RwWsiGc1BKU80sCf+BTrGfbIc2XNEtmzpjKgm5WtfciEf0NN+FiHtzoMpvekX3
         g3gyxcsgeXeFtZ+RSKj3SjN5XgjT/7HslH6HXzaNhBvRBrYL+ByHq05jiZlyv+oECL5w
         VuAHKRN6Qi9Ko4nV0YLQdzJR4Z53fS+tr/CNx4GHG1ILDe8TewBTdz+j6gA4zuxOd3wJ
         ePCg==
X-Gm-Message-State: AOJu0Yzd35N3o2fgijQZy+0ELxrueHHS1VdKJIPY96ud8FlZ7sQQSgmr
	RVasPgTEXo/T1P57eD2asxgorz61sXbpZ3aX56fEpnyNy0wzOiIqx829KbDAlUMA2vUmiK8aN4k
	p
X-Google-Smtp-Source: AGHT+IEDsAsuNDO6Sc8CaBE0EyAb+vex8OQr4lcLXWo5Zs4mKZpUZWM1cvzvG3sj9dQZ+JSR8ra6TA==
X-Received: by 2002:a17:906:4788:b0:a99:5ad9:b672 with SMTP id a640c23a62f3a-a9de5ca5eb1mr1786026466b.10.1730366432086;
        Thu, 31 Oct 2024 02:20:32 -0700 (PDT)
Received: from RccLenovo-T14S.homenet.telecomitalia.it (host-79-17-249-140.retail.telecomitalia.it. [79.17.249.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56649337sm44362166b.183.2024.10.31.02.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 02:20:31 -0700 (PDT)
From: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Subject: [meta-oe][scarthgap][PATCH] asyncmqtt: add recipe
Date: Thu, 31 Oct 2024 10:20:11 +0100
Message-Id: <20241031092011.16158-1-andrea.ricchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 09:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113356

async_mqtt is an C++ library for asynchronous MQTT communication.
The library is header-only using C++17 and Boost libraries; the main
features are client and server support, MQTT v3.1.1 and v5.0 support,
continuous packet sending and auto acquiring/mapping topic alias is
supported.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
---
 .../asyncmqtt/asyncmqtt_9.0.2.bb                   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb
new file mode 100644
index 000000000..dac83065c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_9.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "MQTT communication C++ library using Boost.Asio"
+HOMEPAGE = "https://github.com/redboltz/async_mqtt"
+LICENSE = "BSL-1.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
+
+SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https"
+SRCREV = "51a97adfd022cf5205c3bb31f38ace1f7fbd21a1"
+
+DEPENDS = "openssl boost"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.34.1


