Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A63C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:45 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.43621.1700452243250321857
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/PGpZaT;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6bee11456baso3264899b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452242; x=1701057042; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzY/kyJrqsBYdvSp4sQPCt9dcNx2cxxk6yFjgskU4wA=;
        b=L/PGpZaTRNhxumB2v8lcfFNhuLpvJQ0Gkyljzgg+iceGe/ZQRGgOGON8V6pvqbyBzM
         VRdw9tBD8hoW4lRomIN7g8jg8WmEriZOfu8YGwMqZaL3trqukvpEG9DLmEMKkakdImTA
         h3S9/Nbnd5hJEutVtWqMBJkqoJJL0bp/ghA9fnYHu8htY/hZ9jDF/iZ8cJXjKi3dupV5
         RxmJD1v8Imvl1yUqHJfhPvkkVT3H1P4zMHLH/NtZ+bAFE1npzBHb9LJtUAPeBr5tf8nl
         EjkrG4bOumfadVhI764ATM4SN0krGY+iWGtY3qHtYDRZxdlK8ETJ+962KOgoeg+xL2np
         Ky0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452242; x=1701057042;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzY/kyJrqsBYdvSp4sQPCt9dcNx2cxxk6yFjgskU4wA=;
        b=mOab/q/ZH2T6Cc9mWwDaj+wyR+0g+XOjT5I7OccJV3cbqfnocBezjjAgRsbixjU4nc
         4A+G7Sneh+d6fLAVOtwyYjXQE5wru52/Ik6gME6j3WxvU7oaFEHPcvp8vnNWFWfhlVvP
         0RIWhEEMqEZ0mP03LA9RRGFY9jBgayJS3xH/ipLj4LlFu6sEhS8xHJXXmavc19+BWXmn
         t9I3f8gw15td1lz4AlHN7sx4ln5dmlwU+/2t8zrwwCvJVNuWkuXInXVnFSBDckTZp/x3
         aycsunPmUq3287EyYlo5Zi8mVLRidh2Coo0HxaVGsdB1Llphu3hBQvjY4795dZT0BLRH
         CvaQ==
X-Gm-Message-State: AOJu0YxfzaJHOJBXbVKqP+5v68TKf29Xjtp5y8PbpIPX9ibC+gwt/6W7
	gz5zk0gcnD6rfVp01bH5lT1d5ntkQdFUww==
X-Google-Smtp-Source: AGHT+IGJZ7nrqyF8DT0o7CR3czv/tgt8FoA0PvDQyqaPmiHDzGB/mFS++9E4AwIfhyRkBXuNfQO3QQ==
X-Received: by 2002:aa7:9814:0:b0:6c6:7405:1dfc with SMTP id e20-20020aa79814000000b006c674051dfcmr4203234pfl.31.1700452242357;
        Sun, 19 Nov 2023 19:50:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700120848-21465-1-git-send-email-wangmy@fujitsu.com>
References: <1700120848-21465-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20231105.0 ->
 6.0.20231112.0
Message-Id: <170045224155.1416826.1128484246572184500.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106900


On Thu, 16 Nov 2023 15:47:28 +0800, wangmy@fujitsu.com wrote:
> 


Applied, thanks!

[1/1] ctags: upgrade 6.0.20231105.0 -> 6.0.20231112.0
      commit: e7e72d7c814d81e7786b3ffbc99f6626d655ee7e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


