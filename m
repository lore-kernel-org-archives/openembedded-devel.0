Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897F5C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 01:40:46 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2834.1783474843484929911
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 18:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=smbuNZG9;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664bb15d05dso134469d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 18:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783474842; x=1784079642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SecE/k6230Qz6JW8L+318gtyIVi8TnCspEG78NK9WEI=;
        b=smbuNZG9e11xXk2HDj/o8cxvvrjix4HGkxGjhxRj9Q/EMqPWHynuswLFzSsv1z8ODK
         o3tnKwvpNVDDoNgOflmerE8Fml5lKUTspfq9oDvVrWMOSVVUqa4kRwqftLqGi9cxOvgc
         p8G49n+STDbJMZ1bqUtSj6Ej66yiUv4neCsGn6SmQzhImlnGTXQJfXXKvRPZ0BvHuIch
         f0vVgeZLQXNDUkYne+0M841Wsr8McIXc7K4QZXvuXb6OPtbYt778vVVITl6qopjKXwO7
         3JmyIcsuYq3hg9pz+tAcj9DEiqU1RoaTyWsBX2YXN7gzi6yBi44zx9riczBdQedLvnUx
         YkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783474842; x=1784079642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SecE/k6230Qz6JW8L+318gtyIVi8TnCspEG78NK9WEI=;
        b=oUwyCDCR0RuR1f0a04bFzGjAdFxxtrFD6pIAdzLfje+fhiyWLWR/uMr0U8lyK1EnTk
         Ab22Yd/uNTSNswMNmljJCXnMDpEuLlGwJWujb2UDIN0kG/KkyiRUcqIcNOgEXMhBHtzb
         60XyvzRntH3pzYcYay22BxtFLwWGPIs4ADEHSE/0mpyJ2P7cAavkUv41Nax+ieC4blTx
         8AVbL/yGnR2EIPpWH4eD8HscYEOF7VVqxb0hEq6kNvdM68sO6z86QDvcsS6B3Xc2KQv8
         tUbsRdo8+urXkCb7t6mJpwPpw1JiF3DOPZzoDnAXk5dVk1qvZjBZ68v9NEh93TmFwJ5T
         2Avw==
X-Gm-Message-State: AOJu0YzQ7szT8HUWYvmfB5eojslmBV5PjX+/ORXj2s1tD3NMIs7HagP+
	ZOFHtmYbMrtNXjB1Y722X4gKrdQYKI5B9ArcxYmNbYdDvoLb3auXJMt/AQURaLKD
X-Gm-Gg: AfdE7cmNS8PeyynA6mx0IvzJUN/Gr/YISllaFg36KIR88XHTDyU2OdzJZFSNKJHc3/J
	l+4bRCpky3DA+VWugAVj7Atf0fzPR5Vn4lVodLtI+ooOXOPullqUUVVqiT1Tp//W1R60MOpwvQL
	KpScB3DkL5oZLGowuTPN/1+4rkMVES9fk3Yn1a1BvILMYa2+5kk37nqu/fDLjec0+2Tqj6o64g8
	KS6x5Q3YbELzdEL6H92i4t7rZeqFCjNOWe+88W/Vw3r4en2F5qjbOxPVLeL8oCBBSIf3MC7/FIv
	cz5+0NNrJdf2P97Oug6HWh+6bhoq/j7jX2JY4z5vTx6VbJlaYBeaqFZufXtfZywgBzbWg3E1pCs
	7fg/Ja0MsnQHf+FQh7CH1jFCED4mOCJmPAqjWVQmwQsgSXTRESfR40DRzndbfnTdkiq7ltCZ34V
	M25/vLL0ri4s50ncyfmMPVUXn7Hcvr0hkFP53/A+wAM47pqLQFXnp/BJq1a3eDfEp8zoVlz5uTh
	ciY91U/tuKvDmyyp1WW8+kttXT9tENdjj51nNr0
X-Received: by 2002:a05:690c:e0b:b0:81c:fc30:5d2a with SMTP id 00721157ae682-81dc15fafafmr4019547b3.48.1783474842082;
        Tue, 07 Jul 2026 18:40:42 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af512e7sm76330377b3.24.2026.07.07.18.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 18:40:41 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] c-ares: upgrade 1.34.6 -> 1.34.8
Date: Tue,  7 Jul 2026 21:40:22 -0400
Message-ID: <20260708014022.14311-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 01:40:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128069

Version 1.34.8 is a bug fix (a regression that shipped with version 1.34.7)

Version  1.34.7 is a security fix addressing memory leaks, null pointer
  dereferences, denial of service, use after free etc.  Fixes CVE-2026-33630

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.8
Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.7

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../c-ares/{c-ares_1.34.6.bb => c-ares_1.34.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.6.bb => c-ares_1.34.8.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
index c9c54a9fa0..df994c83ae 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.6.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5"
+SRC_URI[sha256sum] = "c222b6d681096f9444d2c4863d2c1174019e27cacca0a4a5c114d36dd7d7bf78"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0


