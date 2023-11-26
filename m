Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAF0C46CA3
	for <webhook@archiver.kernel.org>; Sun, 26 Nov 2023 18:39:42 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.61712.1701023979226339107
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Nov 2023 10:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqOY9fiT;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6b20577ef7bso2866950b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 10:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701023979; x=1701628779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqrP3MYFNtx0e8VoDxq3jKZfFMUNBU3L5etZn1YIhUE=;
        b=LqOY9fiT+T3KaUWLcLKWLixGEgRU4NDZpAYsGiYiKZyTdprZ0eCk/bYLTQefzhXavX
         GUetE+rrFCF0RH1kevpsWyredFaqPCMHH6U0lCkqfIwYU937U5b0XZXQrNt6e0s1Lot2
         QOzYQxnN+h/zfimpnykc13t8RiksxsmsOAJABuy0STUyyRInzy9AQZf9uZX8YgxO3Jg3
         7rWqGLJ6ARONMUyPUA4Mdh3R6yjw+UTOMBiZjH/VmP8udF7pJRdZc8fhrzzQdoM0F/6D
         quj4nHTV1TrHZL85wWPLCBhKKlrA6Nc3h7SEb4ob0wu0TZGucL6Rg2C0oZqwLiIkCFLq
         hbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701023979; x=1701628779;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqrP3MYFNtx0e8VoDxq3jKZfFMUNBU3L5etZn1YIhUE=;
        b=D1/Ne8DJLzIybCs3fFuJ9VTxKV4MRmBQLV4czJoNZqemsi/BU41KMFFiGgS0gopUys
         sPblc5AOIXTT9MArA1WTeYlAAwRxNnIY7awjU/GHW8Fq+zeFnkxjQYLyDQ/zffhOCKF9
         mB2oINpdLmYy5E0693pItRD+OBLVudvjZYLyc/fKiLcROHHO86xXk6dN/w8xq4SakxgL
         H+EgL3E55mJZiOkOE4TQN/yjaof6irqYmBZPBxIx7G26sRsGvGslalKDHbaXSYRG1njc
         61chQ7nuHptlSFCvAI+CPAxxXPwUo7noEgU+zPwU3veDMWmgLlVgRIBbfvGX3FUU7mcD
         7viQ==
X-Gm-Message-State: AOJu0YymB99zZo+9jdWfI3iNVfeuiDkEuOZ7hWTkt/4U2DtZKunWvX3K
	5hCAUcsg/1UiFLHzerLVtFI=
X-Google-Smtp-Source: AGHT+IFP0nKhLsa0rbqAQtrFlxvXk5xIba9mRivCVUcioxeNuRiDGIeX6RPcD5G/G1NiG167GLbzxA==
X-Received: by 2002:a05:6a00:3988:b0:68e:2f6e:b4c0 with SMTP id fi8-20020a056a00398800b0068e2f6eb4c0mr9574909pfb.28.1701023978504;
        Sun, 26 Nov 2023 10:39:38 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id ei44-20020a056a0080ec00b006c988fda657sm6157448pfb.177.2023.11.26.10.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 10:39:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Markus Volk <f_l_k@t-online.de>
In-Reply-To: <20231123123302.1989816-1-f_l_k@t-online.de>
References: <20231123123302.1989816-1-f_l_k@t-online.de>
Subject: Re: [meta-networking][PATCH] libcacard: fix version string in
 libcacard.pc
Message-Id: <170102397766.3308314.5567529514376480230.b4-ty@gmail.com>
Date: Sun, 26 Nov 2023 10:39:37 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Nov 2023 18:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107051


On Thu, 23 Nov 2023 13:33:02 +0100, Markus Volk wrote:
> 


Applied, thanks!

[1/1] libcacard: fix version string in libcacard.pc
      commit: 45ce72729513da4aaa0033ad767c25ff5840f751

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


