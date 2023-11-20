Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3192BC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:05 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.43636.1700452264242319762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ArhWwnTg;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bd33a450fdso3162310a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452263; x=1701057063; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HTrkLLMXwWZP+KUZt4dWxflOhxU5FBRCsb4QjmvDKmo=;
        b=ArhWwnTgCYJhYsP8UBoiM3gweNdjwGvzLZ5Nk8RBhpJcJN/LCAvKglc6ZF867CR4SN
         5Yjs/RzMTYE/ScPyFgSe7+vLx15JvlOjYPVMaWn92lWivs4txgFw6rtMfHZvZywPqR3e
         0WWBq2UO8HsMtpEyAWc8OsozJO/TTkKN5Pf3TW9T3Op10pR0znmZN4GjkNUSiixcK6EB
         PWh+hE++AHB5mq+D2S6z3YspqTiZVvwk4VbiaPgyFLQgvub++UxhhZLLs2s16WPfkATR
         a6sfVkziWRruSiyTxtJJS3GGXYWvQ4xHdrttdXLuhnoDfG2IE/vuAKp8/ArMSk3G9Gd1
         95pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452263; x=1701057063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTrkLLMXwWZP+KUZt4dWxflOhxU5FBRCsb4QjmvDKmo=;
        b=gSBbcp/nxvKEWHTfB3EsfcGh7WKyn52nb8zlc/Sf16uxq204MJJJ25tv8IB/uQJMDH
         8dFsIpjvdvtgzpTBQPh2pTmTzjYYuIHth5vVF4OM2DCQHakKUW8C9FYRG309a4xeUT7/
         /kVVEtdmQIGx6s9MboAOsO3ixv3XTJ5hm9JlBEWPPdAdeKsvAANepZNVt66saoJuMdAR
         lO4qCWpAZosff5UkfMPiVYhf4h5uIUz+KqB7piYm50V0siWzIw1tyUaARCtyZFaqezOV
         F6NzINgalv1OgACxO/4lCU1zMLzyU3Z5iYYYAdgxoSrWoG2M+6SjKpF4n+dHmA/9fSAc
         eZJA==
X-Gm-Message-State: AOJu0Yw872cygiTC2d3X/62Y7Mc7lFxJG9ahhd1FKq/G5ho9oeS58DI2
	f7Dbkw/YGpqPsMCcCPhtgto=
X-Google-Smtp-Source: AGHT+IEjTLr64klSGLdq4x4XECkLv4fSq3UIYIm6dTI38r+rNFOYM4B2sgtRg67a5wEZGIaSaCqxcA==
X-Received: by 2002:a05:6a20:7351:b0:185:a762:9179 with SMTP id v17-20020a056a20735100b00185a7629179mr8256031pzc.1.1700452263527;
        Sun, 19 Nov 2023 19:51:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700123403-22422-1-git-send-email-wangmy@fujitsu.com>
References: <1700123403-22422-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pymetno: upgrade 0.11.0 ->
 0.12.0
Message-Id: <170045226258.1416826.12943156942503751847.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:02 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106920


On Thu, 16 Nov 2023 16:30:03 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> =============
> -don't overwrite day/night specific conditions
> -Remove dependency on pytz
> -Use ciso8601 for parsing time when already installed
> 
> 
> [...]

Applied, thanks!

[1/1] python3-pymetno: upgrade 0.11.0 -> 0.12.0
      commit: 7c8de8cbacc7137488bd6d207d411b1cdf5defc6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


