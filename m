Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC7BC41535
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:33:51 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.3145.1699900428852169526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CuuqRQdd;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5bd33a450fdso3796719a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900428; x=1700505228; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCnskTpY4dSPOTj6fk8DbaIuErifNDulYGXz32UzlUs=;
        b=CuuqRQddjFcQTAm3d1KTb+wD/tXH4iSCkW5H2Rw/y6LCGdjvto/vhpf+fJX1KYBgmr
         KdHjiluBio6UFd3LCFz5QhL4xzVIfBTA3Yx8emuSwVPmRWXaIS3zxQ+ona/2w57Wtff2
         e1ZvOecrjhK2DEpI4xggvUQS+nXCdyTOLi4q8MBr22ek0yiDnXUNtK3KNDVo35eADqYt
         +n8PVpvdCcj40caV23FCp81i0ucFv2xKmndkEGhf12bqykJfdfW3ylx91dvZZizt56Ps
         7QW+/V9HcyqLB7J6Y5cix6DpE1CZvzlJQOdTtD4U+QxwbWsrEXftBC9O7YVdk3dyorxc
         QPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900428; x=1700505228;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCnskTpY4dSPOTj6fk8DbaIuErifNDulYGXz32UzlUs=;
        b=GTPLk0zIImlVRT7TqhtyzelEdqxNE+ifspsbKFzluN782FQk3FMhKrI2O+hlFSOFx1
         Ou6MZr93ZYWFU1ZN9yvAoD9GpkSSIzkd2oTSf92NVkBujaTpM+EAU0s0v2nbdP2x1OOA
         Dx89rnFLVWO/gZoa4k1dRUbb7hoYvsC+QvcysztsBvCEus6TsW3660+INpi/xcF3WYZI
         cGOyRjvtD6iZe6T+EPozW/sYzyUJRuzkidadDi/jnyxqUjLDGq+LDhgHFeIJRiAg+L78
         zoiFQEHyi8Esu3a9x/+FP1yj+gngqvFicrqXlRWMU0nTlyYGLEttz8U7QtzicY/L+6dd
         UAmQ==
X-Gm-Message-State: AOJu0YxzSUBMSJX4asF/fviaQvy6P0/tF4Y4zcRashDoOn0li1sUpiSl
	TqSMclXUljS1nuQQLqqFR+LFa7t3YRa11w==
X-Google-Smtp-Source: AGHT+IGlNpenenH6H3Id6/Ut0iocHh6uZmAwMRlGQKEMnHm3tSnZNK4xf/v2g7lc3K3yqrm/TJWN7g==
X-Received: by 2002:a05:6a20:bb24:b0:17b:62af:e63 with SMTP id fc36-20020a056a20bb2400b0017b62af0e63mr7666432pzb.31.1699900427933;
        Mon, 13 Nov 2023 10:33:47 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112070940.15457-1-alperyasinak1@gmail.com>
References: <20231112070940.15457-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCHv2] libsrtp: upgrade 2.4.2 -> 2.5.0
Message-Id: <169990042678.4418.12501695105858614402.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106652


On Sun, 12 Nov 2023 10:09:40 +0300, alperak wrote:
> Changelog
> 
> -Make mbedtls hmac less restrictive in line with RFC and library capabilities
> -Allow overriding stream list implementation
> -update min openssl version to 1.1.0
> -Openssl 3 support for EVP MAC
> -Add android build to CI
> -add CIFuzz Github action to workflows
> -Add policy_set_aes_cm_192_xxx symbols to def file
> -Use current directions in stream update test
> -Call `set_aad` and `get_tag` in AEAD performance tests
> -Create alias for srtp2 as libSRTP::srtp2
> -Remove compatibility code for legacy OpenSSL to fix LibreSSL build
> -Export CMake Targets
> -Avoid initializing local char table when converting nibble to hex
> -EVP_CIPHER_CTX_cleanup() is deprecated in OpenSSL 1.1.0
> -Correct null cipher key sizes and be more defensive
> -Include directory should point to 'include' not to 'include/srtp2'
> -Count blocks instead of bytes in AES-ICM limit computation
> -Rtp decoder support ssrc and roc
> -Use a full-length key even with null ciphers
> -Fix set ROC functionality with gcm
> 
> [...]

Applied, thanks!

[1/1] libsrtp: upgrade 2.4.2 -> 2.5.0
      commit: 930b556ff2e1266786f366fdb58b60d203f5b6a8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


