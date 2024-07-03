Return-Path: <ninette@thehoodiefirm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490CCC30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 16:30:17 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.54926.1720024210512343525
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 09:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thehoodiefirm-com.20230601.gappssmtp.com header.s=20230601 header.b=yHVOLbxz;
 spf=neutral (domain: thehoodiefirm.com, ip: 209.85.215.182, mailfrom: ninette@thehoodiefirm.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-74840cb804dso2545404a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thehoodiefirm-com.20230601.gappssmtp.com; s=20230601; t=1720024210; x=1720629010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7EqbnC30SZW6/AwDDaihpruJ6fscYo0zTSBh1mn0Vs=;
        b=yHVOLbxzFY36AQoHLjST4DD1NsqUaLMXCoX/nBGZjO955w4qARsXG/0I+S2BfNE97O
         lqUk+zYhH2HSgb/5wcnaRNpkq+hlZaRnlLDYugUQNsQRdIxnzk7LvA2+ypoz2ainS6OW
         YuOR0/YjKie6CUpGalMD9LVHxHZ04v4O5QnRS9hbIFNy8SKG0fyfwkQNKKSReXKrU5IL
         qS0AgmelWrumoMtj6bfFdvJtY/SZYcwoUB7SUy5kLjSQ82z7ze6+SvA97DbxsUPnp9WZ
         SxXtHt82MwtKD+/rzEW7ths8y+tM0Jf+nANYUAVduTWKMFP1ipNXRkHXgFlS1bIdMDdM
         g3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720024210; x=1720629010;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7EqbnC30SZW6/AwDDaihpruJ6fscYo0zTSBh1mn0Vs=;
        b=RRAJ8nfRZH7KUqCaavAARehxjCMEO4ejVybge8Oa5vksvJPX4kytpVllLMoLtZujqt
         sDOQsV8seQfKAbiWvktC74HpBXRLYmQKIPSI4KaVjnU6AmzYC6Vhy6Nr7IUewe1q8kUK
         Xpa+QDYSFlV7ms/5C9hVAtKxnYUmjhcFm8PLH8hgpSYrS7fJjqoScmsakCUQIBhQiNSB
         xBwA0odlsqBt3UaJfMho7LSRPWz2ae0VD9RGDzuddx3946jlFnhTvPSwRKhV7415V1Kt
         6gUbU31QBhfKtS+gDCittqrghIWH9GiVNCn1L3MIkpuAex07kb4BwO3x1M8nn/V+CPy/
         UPyw==
X-Gm-Message-State: AOJu0Yzxpi2aQdjQ4tBihZnEDxb9itu2c4xFMqy2UTAD9vecRQ1YoV/H
	wWY6duC469djEiK0W6oBejvVK2cCvFtdIhJFcnPpIgEFQB0Zs3+U5Vff9fDWtZVZ/xcWAN1bqPq
	f
X-Google-Smtp-Source: AGHT+IG+S3Xi0CgAs4MpfxvMuzy2RJT9kTnT7m3Xt82wCsFzlXGeDDLjiOaBIsFrb9q2Hofhzkrogw==
X-Received: by 2002:a05:6a20:9145:b0:1bd:27d4:afd1 with SMTP id adf61e73a8af0-1bef60ee5camr16534465637.10.1720024209628;
        Wed, 03 Jul 2024 09:30:09 -0700 (PDT)
Received: from localhost.localdomain ([50.54.151.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70801e63ab1sm10599643b3a.36.2024.07.03.09.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:30:09 -0700 (PDT)
From: Ninette Adhikari <ninette@thehoodiefirm.com>
To: openembedded-devel@lists.openembedded.org
Cc: engineering@neighbourhood.ie,
	Ninette Adhikari <ninette@thehoodiefirm.com>
Subject: [PATCH 0/1] apache2:apache2-native: CVE status update for CVE-1999-0289
Date: Wed,  3 Jul 2024 09:30:04 -0700
Message-ID: <20240703163005.12293-1-ninette@thehoodiefirm.com>
X-Mailer: git-send-email 2.44.0
Reply-To: engineering@neighbourhood.ie
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 16:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111227

CVE only applies for Windows

Ninette Adhikari (1):
  apache2:apache2-native: CVE status update for CVE-1999-0289

 meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb | 1 +
 1 file changed, 1 insertion(+)

--
2.44.0


