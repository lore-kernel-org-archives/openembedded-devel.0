Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D50C4345F
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 11:09:47 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.17975.1714388981311923417
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 04:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=RmXtw5Rn;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.128.52, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so37961275e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 04:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1714388980; x=1714993780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dk1mar3iz5kcrjrt+aO8F9oLIESy5Lq8WuSG+ZQs2E=;
        b=RmXtw5RnYbj6AmBZhFvWwv2LwC5s+amOPSysLvrW+TYN2UIAiPAqu1b57sWA61vy/m
         40yBljdcFglkG4x/udwfYABVbLC0rQfcU/ZEJiy9yKSPXPiqw5GtnqmjoZNzCzITX7Ro
         aomd7DPoGOx8TYDhhK0Xn63XGHoB2S6Bn4xQod65798xT7sqESzNNj25HpW5CufkI56d
         gK+E0Xn96IGnwj6S+zwl+mrhYXi4Hf21k8SDX8wo+m6HSs1RRW9jilc/6I1ezA8nZSqd
         q8PQsgm/6aGtKbRaJ/Q7F+ivCgJ277lDBggjhNvW/c4Xp5RgEEnmt1KSdKEqJKsG291S
         pIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714388980; x=1714993780;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7dk1mar3iz5kcrjrt+aO8F9oLIESy5Lq8WuSG+ZQs2E=;
        b=ZaEbdemSsEgnsWWvOqihswlGZJZA9pztid2LY3shf7uyWEqWtYFmGKNgEPbjeazHSi
         crmS/sPsO7dChfVqMst0U5w+VP+FmYk8rldDOZqXeHUQa+9mxaMNYIKwpbkE7pUOr9SO
         SudtyPTKmAlWNUT0TeVn9G1NtXX7pHAolRXvVyuuNnJgvxMicOk5OOMjMd0WCYNuothm
         bFz+i28V7sWdenKyi/rNWTFsDl0GPQtJy9e35F5CSmU9/peFGxvNU5sGuIL5/cLCpRN/
         CUAVCNp5uBxY4GxotZtrQ1mVZwcLgLtfqbtwOHhnCl28/ElaoxkTvSjxMf71wLwDIJNq
         EgHA==
X-Gm-Message-State: AOJu0YwGBF1+ihskKw1gMmliKpVQYL5Vysp5jVWjeWneoPwMfQOPMTcm
	OpbMvxFvdbkYRGFq9FqxqdatvmGj5HbG7AX94PXIzUSJl/GbexEa+ZEvQ4cYQYIhsWURjjB5QYZ
	yU4Y=
X-Google-Smtp-Source: AGHT+IHCrrIDs1GdJuZMGncuMj8RpyW36FFoCs6SjZ2vdxIHPHVm1bGSKLRgdDplt2CJPowKMTAf8g==
X-Received: by 2002:a05:600c:45c9:b0:416:4641:5947 with SMTP id s9-20020a05600c45c900b0041646415947mr9439090wmo.34.1714388979827;
        Mon, 29 Apr 2024 04:09:39 -0700 (PDT)
Received: from Ninettes-MBP.fritz.box (pd9ebc533.dip0.t-ipconnect.de. [217.235.197.51])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b0041b43d2d745sm16210084wmq.7.2024.04.29.04.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:09:39 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] open-vm-tools: Update status for CVE-2014-4199 and CVE-2014-4200
Date: Mon, 29 Apr 2024 13:09:36 +0200
Message-ID: <20240429110937.55865-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 11:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110176

Current version 12.3.5 is not affected by the issue.
Affected versions: Up to (incl) 10.0.3

Ninette Adhikari (1):
  m2: update cve status

 .../recipes-support/open-vm-tools/open-vm-tools_12.3.5.bb       | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.44.0


