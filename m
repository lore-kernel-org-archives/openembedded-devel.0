Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869DAC54EAA
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 07:29:41 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.14413.1674372575900773040
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 23:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJ6PAfFL;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id y3-20020a17090a390300b00229add7bb36so8569364pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 23:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhp3P25j7m9MeBFxGBKOPUkkXQyUjDD6pl2XAbMt/c4=;
        b=ZJ6PAfFL2KmcZ8lHhZ6M1NDc7tO/I6JiXbmYt5LHvGkf4Ro601AqpSO9Q4+WwXwqnp
         RUOW7mMIruJ2Hm8pF3xXMzmqpnv4Tuf97K2lSH0lZh4CpGu7EXnnGRKhoae0R8iFHq3U
         H9rBdOpP6C9oJSnHuBOok5NQtnF0MlFRs8dVHlrv0LB/diaaBcaMAeRHmQZ6zAxHujKp
         vrCvUWdpKzzMvyD2O9w+RXoEqCsY3YY6iF5Z/5UfMCEfTsa0eXRP6AODYotkwU6ZNPjo
         dHdyEeODMYMoZvKwI7qnHA7KgJC0N/6TjpWTRKHq1PyeyWmgYchYnlS512hvTnIxj6US
         67Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhp3P25j7m9MeBFxGBKOPUkkXQyUjDD6pl2XAbMt/c4=;
        b=pUzT4ktd/hsjhEejTRvaS6lsHLomBGaNdQu4r3ulameMWEzpHgqymFQxCvUrkGTfLf
         OxX9lXzt09YAljsX4jjoIRg4ezeO1Xn73ON2bTjIrtITImXBsENHiKRYnJWTlNgg1fd/
         cWTNAXCFIbQUCM9IRr29SuF9xGfVZJ0vFuXGSD2GjapAcM0iKId/Dun+ejZEfCKlKEfY
         o2+lEUaFqJOhqAhCAMspG9xV+N0ozN/5VjOCXUdLFsa2mDrAYH20mT1llnAbytjsG1JL
         JKjZf+i9kaUAFAL5aLQ1FaHa9cjl6+ea0qKPUFCSvoqfX0fDbIJZHinlf3r68zTAF/2M
         alDA==
X-Gm-Message-State: AFqh2krqt0PZF2hHwnHBW0tL8iaTDQ1GlpmY0lhP3jSPUPkfuISzCpis
	3P5LPD7taMyHtULo2m0lc4s6GKwHtacVOQ==
X-Google-Smtp-Source: AMrXdXuYy4HdCkcDVTe56FuekWfHT+gB1Hxx4iHH/0qg42gB1vku0rBf1L5nNVFFKWr80F8iHOQmxw==
X-Received: by 2002:a17:902:cec7:b0:191:3993:801e with SMTP id d7-20020a170902cec700b001913993801emr27061871plg.56.1674372575164;
        Sat, 21 Jan 2023 23:29:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090341cc00b001888cadf8f6sm11084998ple.49.2023.01.21.23.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 23:29:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] sdbus-c++: Disable ccache
Date: Sat, 21 Jan 2023 23:29:32 -0800
Message-Id: <20230122072932.1721979-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230122072932.1721979-1-raj.khem@gmail.com>
References: <20230122072932.1721979-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 07:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100701

It adds spurious -isystem from somewhere else

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb
index 75cd815535..2fb975ced6 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.2.0.bb
@@ -42,3 +42,6 @@ do_install:append() {
 PTEST_PATH = "${libdir}/${BPN}/tests"
 FILES:${PN}-ptest =+ "${sysconfdir}/dbus-1/system.d/"
 FILES:${PN}-dev += "${bindir}/sdbus-c++-xml2cpp"
+
+# It adds -isystem which is spurious, no idea where it gets it from
+CCACHE_DISABLE = "1"
-- 
2.39.1


