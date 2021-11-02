Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4505C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 14:09:21 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.186.1635862161026665376
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HntqQ/RI;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id h74so5662573pfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Nov 2021 07:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pS/rKB3qQNU016HbqutJinftMizPc1pF9KbIpYi7f5w=;
        b=HntqQ/RIaOMCy2jh2xO12ovlCuHfqsr/z71belC6qFRoJv8zqiVonQ3UsZMXU9HWvG
         zhMIDKcROmpWdibm3E+obrVnrDv26sgewLmLWNnFWRL9WiOHq6g4IoHuUGiNaz3GbkxY
         LSZrum6Z1hLdgFy0HA/zo+/mj5bSL983HCNIrZ1pJfde1LgE1yjSsJStNUgAmQJ4Ez7I
         udrWyPENAnrhQ8W9WlMDQsQoS7A3Dy7rXiKfNPrJuA/lyWw70djQSw2A1l8U6leTtHly
         JkbSfDr900OX7CHfz7VYezVCyPZNZCekuy1UkplTvxeSjEYgYdchA+hdOcPQkKugT8V3
         uNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pS/rKB3qQNU016HbqutJinftMizPc1pF9KbIpYi7f5w=;
        b=0pSh+iDLEajjTqWaWekr6QrMZOwcLmQUSQkpwTCZWAKqpd+XtbNPhIZbA6UhQxTX4x
         YASOIVksna7f8dUZZyQc6i613pl4IGuC89T7TBG0cRzKodMrjrSiI6iWU2VdCttNDraB
         rHry3wQwXblKj3v5uv9zydIuiB+D1kVbYcylsNUH78bLLD8nrb8A+kR9ekDpAwg35l2Z
         CWFRJZjp4VsO6jkvbKAYLU3dSmo6QEgOU3cv1e0g/+l/oj2ZWL53qvzp2SudTczX2nWk
         nEKFbVoZ+p5/4bPFnhbhoxpXOD9+Eis4Hc24VIYpgWb6s1lsBH9/KOi4jPhEKp3MMuBd
         WhZQ==
X-Gm-Message-State: AOAM533wi6Fn0nEZ3jkfGdHWxB2UsfHj/jvj327BYUQZ4nFiYU1jcl1q
	GgmcJrWcnZa3LzqbPGFRLfrpCS7iac8=
X-Google-Smtp-Source: 
 ABdhPJxvGeIsLLK2o2mLlXNixXgQI0Y3PJMUp3ucwBC9qu6dr5clwfkO9fwymgxaVen0lb+aMNwMDQ==
X-Received: by 2002:a63:8849:: with SMTP id
 l70mr16487689pgd.308.1635862160117;
        Tue, 02 Nov 2021 07:09:20 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:e13:25b1:763b:6129])
        by smtp.gmail.com with ESMTPSA id
 g37sm16340029pgg.89.2021.11.02.07.09.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:09:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [harknott 0/6] Patch review Nov 2nd
Date: Tue,  2 Nov 2021 07:09:10 -0700
Message-Id: <cover.1635862049.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 14:09:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93771

Please have provie feedback by Thursday

The following changes since commit d378e4293d18e374f5d1494a88bfc3caee4d02df:

  postgresql: upgrade 13.3 -> 13.4 (2021-10-23 07:39:43 -0700)

are available in the Git repository at:

  git://git.openembedded.org/meta-openembedded-contrib stable/hardknott-nut
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=stable/hardknott-nut

Armin Kuster (1):
  Apache: Several CVE fixes

Changqing Li (2):
  redis: fix sereval CVEs
  redis: upgrade 6.2.2 -> 6.2.6

Khem Raj (2):
  gst-shark: Define SRCREV_FORMAT
  android-tools: Define SRCREV_FORMAT

Richard Purdie (1):
  gattlib: Place pkgconfig file in correct package

 .../gstreamer-1.0/gst-shark_git.bb            |   2 +-
 .../gattlib/gattlib_git.bb                    |   2 +-
 .../android-tools/android-tools_5.1.1.r37.bb  |   1 +
 .../0001-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
 .../redis/redis/CVE-2021-32761.patch          | 257 ------------------
 .../redis/redis/fix-CVE-2021-29477.patch      |  35 ---
 .../redis/redis/fix-CVE-2021-29478.patch      |  42 ---
 .../redis/redis/fix-CVE-2021-32625.patch      |  61 -----
 .../redis/{redis_6.2.2.bb => redis_6.2.6.bb}  |   9 +-
 .../{apache2_2.4.49.bb => apache2_2.4.51.bb}  |   2 +-
 10 files changed, 10 insertions(+), 411 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
 rename meta-oe/recipes-extended/redis/{redis_6.2.2.bb => redis_6.2.6.bb} (83%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.49.bb => apache2_2.4.51.bb} (99%)

-- 
2.25.1


