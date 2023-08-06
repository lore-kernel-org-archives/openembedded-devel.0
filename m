Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2411C001B0
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 17:31:47 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.15471.1691343098592237221
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Aug 2023 10:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bb1BF1V7;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bbbbb77b38so23035745ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Aug 2023 10:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691343098; x=1691947898;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2b6dm8Bb+5XAwUbQ6aeuw+fVu+3rHtCTk1zwVEbFlI=;
        b=bb1BF1V78hJCpS+RxeqptJcbl6bOZzcPAOy2QAQmH4V30rfBb09bsGz8ysX3WElYf+
         s02w8TKPfSX9qSemghDIA2zxMFhFFp9cOpiD+BENVBeHjjWnw7RZ9I6ggr30evquj1UU
         NPbXc2TcUbQD3qhEnUoVyfjl0iwWYtF+ffakkCadNrHK+AixvM12oKYsV8Yt6xP+mcfe
         JLF/dn5cPYqbjyOb0ZAUqCm2IddBo1K+X31nYXRgH+RfbeyE66wc8OMV0wJjQ9V9Svsg
         Nokpn2KkQR98Io3I8xj0bRgrQtQtRJ7TXfVJE3Fadfewfkq9lw1MiqJqhZzEsRVkKf7w
         2JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691343098; x=1691947898;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B2b6dm8Bb+5XAwUbQ6aeuw+fVu+3rHtCTk1zwVEbFlI=;
        b=a37qzmrsXSl7zws53Nut7UN1KUtoVK+1yITF2xCFefAcVUWZju88R3A56pSBxAcGgH
         WoeD1t3m8SghDJjsvRxrGDT0a8AxM4KpAGJmuuxk1XEt8r0OZRDTfehW9AEjOvTATgA4
         1AJMH77xpPFafjzDZnyeznKRidOYA/vJptdLNlP+fqq/takp2N6nF+QyWedLlTULYQWR
         JIesodWaz8w23FeiFa9VVqyWcLYAbh3SMTo9IBxBQaRRnaIjm1ShkIPAnmT7Lp4dgDGA
         tIVAxoEEkKX7TRiNUSrSDAnfBa9Bgbn+S9ICAntRo+fk4ZM1wHbH3Zdg79FwtgPNV3G8
         +wmA==
X-Gm-Message-State: AOJu0YxU5pSOq2tBFujEw7PcBYPPbqkFR59dVLvRjVrKiMh7FdRtSXTi
	b6+xXSIHcRtb+o3uXBAeuFg=
X-Google-Smtp-Source: AGHT+IGC6va49lYyISRiCU4TFOXD62bmuiKqNjqOPGuiCFZTYPJdQYu9Ri2kb2iDmrl6z8i0W/H6Ig==
X-Received: by 2002:a17:903:22c6:b0:1bc:6707:f451 with SMTP id y6-20020a17090322c600b001bc6707f451mr2273368plg.42.1691343097933;
        Sun, 06 Aug 2023 10:31:37 -0700 (PDT)
Received: from [192.168.19.117] (c-73-90-186-127.hsd1.ca.comcast.net. [73.90.186.127])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902d31500b001bbd8cf6b57sm5119419plc.230.2023.08.06.10.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Aug 2023 10:31:36 -0700 (PDT)
Message-ID: <bda36b56-b77b-d348-8b1b-22a7015aa48a@gmail.com>
Date: Sun, 6 Aug 2023 13:31:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Subject: mickledore merge request: Aug 6th
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Aug 2023 17:31:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104296

The following changes since commit 03fd1d368ac19793b3e4c35159ba2ce802247e4d:

   yasm: fix CVE-2023-31975 (2023-07-25 07:15:34 -0400)

are available in the Git repository at:

   https://git.openembedded.org/meta-openembedded mickledore-next

for you to fetch changes up to 75cf318cef3b4ee81fad2782cf063ecd69ba8842:

   lmsensors: do not pull in unneeded perl modules for run-time 
dependencies (2023-08-03 16:46:11 -0400)

----------------------------------------------------------------
Beniamin Sandu (1):
       lmsensors: do not pull in unneeded perl modules for run-time 
dependencies

  meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)


