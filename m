Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB6CC4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 14:30:27 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.18934.1707402621144106214
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Feb 2024 06:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kxxy3V1W;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40fd2f7ef55so5785825e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 06:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707402619; x=1708007419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dkVcbkoPFlJi5ZLMxeLmFLCwS4hMPd0R9U8r/5L+TGw=;
        b=kxxy3V1WSmqa1qr1vQwsHGn1ISvv+wg7hi8yJmLOD9CK7x+X4lPUQ31SQMBXcxrsKB
         CVFXbNe0Xc2ewEEwmvb0yHxIQjYzsTxP0MfeaZb9VsVixzKS/lezzDoIPx3v9QXDrogp
         GJv21RH0Ss6HvkM66Oc7s+LSyoKpZ5n6gKZ+0J5/SiiwX3o2sUWl3WzumCIPeW8yaZNE
         2XLQ911phcOqD4d/uFrQGrjmjl5LF/WOEYoqyMORCIBvKwr7hYTe/hlc3XKW/UG0gSv2
         0LEp0I7hOzVLyDM9BsGQMEz0t6laRnHVx8AQunV19Lm7FeFgFBmuhTA086uAWwObfPdg
         dsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707402619; x=1708007419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkVcbkoPFlJi5ZLMxeLmFLCwS4hMPd0R9U8r/5L+TGw=;
        b=jmHj4NeTeL6A8YqaWGjbZ7OIKZswUD2XP1sHniBLIyvjofnjVosmLWbpSmOzlsUg2D
         fw/s5f2NrVt43vTfnwqgAlJMoNVzWT05DQ+ocDfw4cPAHg43gsFGf1wPlOR6Kt6BfuCT
         0peR12ZpWz8zu37eogPBDUMcsAI6cV8kq6UmaAeZckMtP9QYHf/rAiBYX6kVmG2PeSqa
         sy+w4P6aHSTeiqeQI+/jynr0giYHsUol04zUX6ifQ0e91nXPTo1iSuivK91674FHq8KM
         NoDPamUA9qC92jV8OMv1sMgjxsardWmxtAmRcZ22WZZKrAlWVrWUdZhCXRy0Xsyi0nvg
         uzMQ==
X-Gm-Message-State: AOJu0YwLmaLJATwpyMsS7L9kYrz41rNMa/g28+vmUcJu59UmcvOvlHBY
	bFT9N3i3+aPYbOagJOXPcmjleWmCYIsv8ZPHR6qXMpP6xtLwP5W5WjGjh7ZG
X-Google-Smtp-Source: AGHT+IHMk2MV7q8NZkCHwDnWKsW4tzWEGFdifz1r5hccsF3d0+gWnlugdh0d7xwdnPNkKZsgSPD8Dg==
X-Received: by 2002:a05:600c:4f85:b0:40f:cb0d:4de6 with SMTP id n5-20020a05600c4f8500b0040fcb0d4de6mr2331042wmq.5.1707402619234;
        Thu, 08 Feb 2024 06:30:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUVbpWjqLF3G2bWt+VX40unocUC6+7NzSWyDG9LxOUXIpvlv2xKdoX9+U7MncpBfmN4H7QhV3dwzYsWie0cfczsv4sSO2U0uSGI2Z1/FElEl1BjcZGwFpGaqJVHcAZPcRRl1DAdrXn4P6Qdm6ZrXXRH/fAJi357IFA=
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id fa8-20020a05600c518800b00410000a1a29sm1803990wmb.8.2024.02.08.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 06:30:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: uvv.mail@gmail.com,
	wangmy@fujitsu.com,
	Vyacheslav.Yurkov@bruker.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-filesystems][PATCH] xfstests: add gawk to RDEPENDS
Date: Thu,  8 Feb 2024 15:30:13 +0100
Message-ID: <20240208143013.1381456-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 14:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108670

* QA Issue: /usr/xfstests/src/soak_duration.awk contained in package xfstests requires /usr/bin/awk, but no providers found in RDEPENDS:xfstests? [file-rdeps]
  this script which was added with upgrade to 2024.01.14
  causes the file-rdeps QA, but awk is used in various
  tests files even in older version:

  grep -R awk xfstests/2023.10.29/image/usr/xfstests/tests/xfs/ | wc -l
  77
  e.g.:
  xfstests/2023.10.29/image/usr/xfstests/tests/xfs/716:  awk '{print $3}')

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
index e644272a51..d0237649e9 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2024.01.14.bb
@@ -34,6 +34,7 @@ RDEPENDS:${PN} += "\
     python3-core \
     xfsprogs \
     acl \
+    gawk \
 "
 
 USERADD_PACKAGES = "${PN}"
-- 
2.43.0


