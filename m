Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1485EC47079
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:46 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.31419.1704682003834759127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CJ3R04dp;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-36066190a99so11116905ab.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682003; x=1705286803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4P2vkYg7oKQysmAOB8Q4ohBmg35K2Qub2VOLXMiq6AQ=;
        b=CJ3R04dpAjTyQAmagCKifqVrDxG0Lhg0HYdVstNkI0pL1P52S0u2mZ6lb7i+77UdWy
         3HxyZ6mDaEVXo48qsr8c6vepQVRTrxJ7OhKq/pfHy8w0TpM3tS4iv94NqxYkr8FqCKZH
         9xtA9d/9sD5goL6d4tqq4TAgX2hWmBI9WLEgSKRHCxOfhQOFh4+n0Uo3POpNmLJ5QV2y
         9xwzeEYzHJMa8vTMRwRsR/BknHNK7Rh9JHehpSmJ/oX/ZMqsuLhjKZTxlG8z9OmNG5hQ
         RIRW0fx0M0gpss/SsvIKfH7JIh1wVb2cW4N2hGbU4EhJ97x6a5RvI3tWnO3p0VQc+Fc5
         cLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682003; x=1705286803;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4P2vkYg7oKQysmAOB8Q4ohBmg35K2Qub2VOLXMiq6AQ=;
        b=Z52urVFd8YUYsIGcRKkwTElIxvOrIS3S6xj5tVc6oupGGWosijkgbfVtgF+52hldRX
         qATlj10u8MQs+DZ7hczrVhEv3ZGn87qnsTAYCiyE3Y++vIcNVGz4kp/7fDVQs8tkeARI
         Eg/Befd3BD5wbFABpK73Cv48FRuOniRwGXYQqtztjIl1DO0Tn+u03vqiG0AMudE/ME+F
         7G8ZPIwkoB4O2s9tE0u77I9i+hTw+6G+qGP9sS+WBwci1uG0x2jVNbEQAxzRj3c6FJHV
         C5TubXeR6zp3fi2R7UFyLVaQPikTNDOu8Gejm/+PkVlezsqk+V9QdevPjJUjowyqy8B3
         x1Ow==
X-Gm-Message-State: AOJu0YxoBiJuAGSwtQsSMzkd3VEyVQj8U6PtAZLMtbKe8FoiDZo2n8zZ
	kvaRBi25L4G0HLKCrCDrweg=
X-Google-Smtp-Source: AGHT+IFc02LsK24RTlg4n3L+YBXItQIDGVbeLoi1dmXIbciogU4W+iPTkWOWu50sKZI9LBGnkkrh1w==
X-Received: by 2002:a05:6e02:349a:b0:360:17a8:5c7d with SMTP id bp26-20020a056e02349a00b0036017a85c7dmr7490708ilb.6.1704682002954;
        Sun, 07 Jan 2024 18:46:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20231224135056.3617584-1-yi.zhao@windriver.com>
References: <20231224135056.3617584-1-yi.zhao@windriver.com>
Subject: Re: [meta-networking][PATCH] vsomeip: upgrade 3.3.8 -> 3.4.10
Message-Id: <170468200226.912276.4942518183359317089.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:42 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108084


On Sun, 24 Dec 2023 21:50:56 +0800, Yi Zhao wrote:
> ChangeLog:
> https://github.com/COVESA/vsomeip/releases/tag/3.4.10
> 
> * Refresh patches
> 
> 

Applied, thanks!

[1/1] vsomeip: upgrade 3.3.8 -> 3.4.10
      commit: e1c4be9bd47cb77c70b8ffe8f3b2abdb1e911318

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


