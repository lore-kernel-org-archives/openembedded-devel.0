Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B6FC6FA82
	for <webhook@archiver.kernel.org>; Mon, 26 Sep 2022 08:08:35 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.25842.1664179706801506692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kWYLgqPA;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: debrabander@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id y3so12372740ejc.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Sep 2022 01:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=qPSWjkEuFau5NbERq3bquf10GL1dDPoB60HXt7xP/0k=;
        b=kWYLgqPALtV1b7ZYP3lXp1nO11Ze3D5gREvxMe6InJ7LgkeP7MgNLpmmZTyfz0VR/V
         fgZV4x+6l/L2tg7xuNq6IzC1s0c8ayatRi6uq2EYC4CV32owHDNEw23YjhgT5RYXY4KH
         Pkjwwiw4t5SU0DMtg3i+29ZlRtDc1cE5EypIjvUQVtvsS7e/G/WSXWOuLuIPeMgy6Uxu
         LkyfFC8h3p19EGLaP3kfv5u5wTw7uErDhoDWJFwOJnHCfjc+6V8bhdiliBC7ynjrlZyw
         S45MVcbKlpKC+WkN4Ko4jgTiaV/Gg2MVknGcS7NVsfyay9egnA6CQwJxX2lFVMmG+6Zw
         tfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=qPSWjkEuFau5NbERq3bquf10GL1dDPoB60HXt7xP/0k=;
        b=YryoWP8IDSr6H5or18fEieBOHRlT9MpcVBnx/d9OPhBlx8QpW1M6WL7S9TohF684Mc
         XXLCB0ZuUKjNUvuqjgDEglKjBueLZVwFHYEFcDRm3P6A9tHBet4/gngRAgE0EV3oykO3
         y1Pjlh7qszR/7W0os/gqj7HfV4Dm/IaMn4pPvCbOHvoqGZQpW9gKDUWBrN6C5MOybv6v
         RT2RsehSf7mk9sHEeAbCdk2FPHci+FydsWSGo2r/7ubpK/ogtD+ugY+GwfG7sibpOUsj
         04md9abanCNTrAIgCwfWNm75X5DloF3XM5R4ZrR4qcJcazAdic46pwXbpojVL/uTXzEd
         pn0w==
X-Gm-Message-State: ACrzQf2xcYfGAbyByklzKNLUrHf/9tyJqf8HWGOLbbFLDbXpjDgVNd+5
	mm6dEMsmHfgnJ2KOAE/52e2vJ94ED/4G2KMj
X-Google-Smtp-Source: 
 AMsMyM43Dv9yfTvs+uC2Dt67XIV4XixVkfT8dAJtRM+Kz7P4K6EU6pzgkJjkuQel524NTUus9oXJ2A==
X-Received: by 2002:a17:907:3f8b:b0:783:2008:e562 with SMTP id
 hr11-20020a1709073f8b00b007832008e562mr6771720ejc.261.1664179705090;
        Mon, 26 Sep 2022 01:08:25 -0700 (PDT)
Received: from buster.foobar.local (186-153-172-081.dynamic.caiway.nl.
 [81.172.153.186])
        by smtp.gmail.com with ESMTPSA id
 gs13-20020a170906f18d00b007724b8e6576sm8015572ejb.32.2022.09.26.01.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 01:08:24 -0700 (PDT)
From: Frank de Brabander <debrabander@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frank de Brabander <debrabander@gmail.com>
Subject: [meta-networking][PATCH] ntp: add missing runtime dependency on
 libgcc for sntp
Date: Mon, 26 Sep 2022 10:08:26 +0200
Message-Id: <20220926080826.2200-1-debrabander@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Sep 2022 08:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98951

This runtime dependency was already added for ntpd but not yet for the
sntp binary. This will result in an error when pthread_exit() is called:

"libgcc_s.so.1 must be installed for pthread_cancel to work"

Signed-off-by: Frank de Brabander <debrabander@gmail.com>
---
 meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
index 50f5477f27..2ae53dc640 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p15.bb
@@ -139,8 +139,9 @@ PACKAGES += "ntpdate sntp ntpdc ntpq ${PN}-tickadj ${PN}-utils"
 # ntp originally includes tickadj. It's split off for inclusion in small firmware images on platforms
 # with wonky clocks (e.g. OpenSlug)
 RDEPENDS:${PN} = "${PN}-tickadj"
-# ntpd require libgcc for execution
+# ntpd & sntp require libgcc for execution due to phtread_cancel/pthread_exit calls
 RDEPENDS:${PN} += "libgcc"
+RDEPENDS:sntp += "libgcc"
 # Handle move from bin to utils package
 RPROVIDES:${PN}-utils = "${PN}-bin"
 RREPLACES:${PN}-utils = "${PN}-bin"
-- 
2.30.2


