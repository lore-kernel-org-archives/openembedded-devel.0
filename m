Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4942FCCD1A7
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:01:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.18267.1761066059043911469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OPXzXcuQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33bbc4e81dfso5948896a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 10:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761066058; x=1761670858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Zb2trI2De7xseeA4GWBbIiGCaAB8cdWykn+JRKL9vg=;
        b=OPXzXcuQp+2Xb9k4tsVix2uyQEH6WzhL6RqLRS1p2l1Zwe92OHJGbiqyMvbvH5GgHU
         8c4BX6QDZBowwOg9OblrtKWqyqKLku6g6SnwjNbnhkxHlwiAPIogvYQKSEFgv4sNQVIw
         zWr2HHqFRNt4GGRDGt3gFbq/Y6g+oQuOKEa8so2ucADc3HWsl+A581fiB/dlmbP8q4On
         QPKoj7lUICgCqZM7eWfF1Z9i3qS7gvlRuTX1cvMIN2aMwmoPE22RTs6YTpWK4nSSHVCs
         lLVTIlWt47gmioMJufXeHJOKxWYlz05uruxdRY0RDgEvE5xBlFSQuvI6KZtqY4zbT8wa
         7Y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761066058; x=1761670858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Zb2trI2De7xseeA4GWBbIiGCaAB8cdWykn+JRKL9vg=;
        b=Jc+P+mHZePbzjpNLtBLQgCZUJ9ejjym0FZLHzOYAJqMqxwg0SDgj3tGxAwGl5UoKVd
         i4FjRYSB7EKkWzw3kmaEbNtOB20TirbfZ2u8S0+vd2h8gYHzh1fZ47FC+OVxv7jc1Lqu
         CTejmY/Ag81WALwjoUKIxZLZD6RBy/VUOrbnREHbwjMq7hmzjJ4pP+MQaxbmZeQHAo2D
         53XIkaTgHYNcMoD+sIq0lghEol8F6Z0CVXXJN7T5zykxY+o58z2wt7funjSBfaoaT4R0
         51jnB8tpLDJYdytLjY4foAcTIkc81Rmxi2qBTxumdgomwIeY6F9Mii2LQXhJIrnFTz+a
         oKrw==
X-Gm-Message-State: AOJu0YxkbnGqjc7th+YSHgW3e+VfwZM3QAybvEokrljhYOBqru6ZEHqc
	bqG+CTTcP+ENG/jUSE2q2ci1gNv+nLGPSQKtU8UF+17zeoNfHDGVhCmY3eLbC+uM
X-Gm-Gg: ASbGncvxOtdcTHhcqjnMv9AzN+PqPqv5obwTz3CJI19kID941h6wiMs+iV2iZmtvV9C
	Vrx6+/KpS3qjYf/7pL5kxKMetAUaIVZwjOtQcbvAibffMKGJo1ZFy0QLzKdjU71DBrr+t5Fq4PC
	TkWdUpItb556SDTrKEcx5HO5o19u1NT/9QuTD6BD14D4TPgqyGWd4hX5BXR1TJXGPJR8yRY9ZDu
	6GxGZgjkEfKp5itmc+Xd3BlOpHbKWadMALTKJeDm+lW9elJKWfioNWbf/K3P/FnXUN97FZ+rMAf
	I8iHhjwFT9LUhjapSntzMUV8/S8Iq6R4ENR7dLRr1iJZBklS5h9zYUufFGH5fUIzNZ1XamB7O+J
	6oRoxrEusxzUpwhz1GvrcsptikHeqCUlAnB0VbPU+phqbqPgubDZpzEXxWQLcrOIMv6DcGbXdoK
	jFcsQAZaVj1XwipF5VAa2isKrlgpyCt6hxCvVe9eFyuIOmSAMGRaD2nLHd7C1wJeyz0P/7V157
X-Google-Smtp-Source: AGHT+IFGJhMAvE7hpwJgo3t6qoRGjLe2j2t/hmPkgEmeyHq/nzr4/dEvNQPKkAdeHfRZNg5n6aDfog==
X-Received: by 2002:a17:90b:51c4:b0:339:dcc3:82ca with SMTP id 98e67ed59e1d1-33bcf86beb9mr24685245a91.6.1761066058079;
        Tue, 21 Oct 2025 10:00:58 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e2a48sm87261a91.6.2025.10.21.10.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 10:00:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Subject: Re: [oe] [meta-oe][PATCH] vulkan-cts: upgrade 1.4.3.3 -> 1.4.4.0
Date: Tue, 21 Oct 2025 10:00:56 -0700
Message-ID: <20251021170056.2738168-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <vds6ywkuqqaka3n7ka47u6drjcsexpdr7amsiqmvpjhxewytzw@omx5ziryifwn>
References: <vds6ywkuqqaka3n7ka47u6drjcsexpdr7amsiqmvpjhxewytzw@omx5ziryifwn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Oct 2025 17:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120840

here is next failure seen with clang on qemuarm

| /mnt/stash/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp: In member function 'size_t VulkanVideoDecoder::next_start_code(const uint8_t*, size_t, bool&) [with SIMD_ISA T = NEON; size_t = unsigned int; uint8_t = unsigned char]':
| /mnt/stash/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/vulkan-cts/1.4.4.0/sources/vulkan-cts-1.4.4.0/external/vulkan-video-samples/src/vk_video_decoder/libs/NvVideoParser/src/NextStartCodeNEON.cpp:39:57: error: cannot convert 'uint8x8_t' to 'uint64x1_t' {aka 'long long unsigned int'}
|    39 |                 uint64_t resmask = vget_lane_u64(vmax_u8(vget_low_u8(vmask), vget_high_u8(vmask)), 0);
|       |                                                  ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                                         |
|       |                                                         uint8x8_t

