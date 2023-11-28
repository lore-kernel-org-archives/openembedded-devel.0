Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792EDC46CA3
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.14513.1701215718939406499
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IPCLKD1H;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf8e569c35so40742265ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215718; x=1701820518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVBELQQbqDmd95ErgEiohPEAxFXTlcX+4Ocn/l8zgkI=;
        b=IPCLKD1HTRUy3W9vYTfIqUW1tq0fAIVgAlZJOIWp3VM4dUyQEFCLwZ8tru82CTyANv
         apdida2nahcdqATFP+JhHTJnHIQqZMhH3oT8+yjYgFRUTtz5N7QkZFSE/UvXdAGl7DL4
         kkh7F1kb3G5yob5yCfVSFXX5kX89C77EhWm/qxle8hkicu+Dsje893mspW1pVwIQ9iHz
         L9mOmyQx4wcBAisWPDFiX2eT843p3EW4jtmBdaglXqC6MgJAAdWWndMOJHylXVajX+xl
         PPeOfPyGHaH1vy2GrIe+dMo2NOgGZ6uMiwjnuzmzbYNhDcX4cfonfx/PZkEjt35EnC1d
         udtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215718; x=1701820518;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVBELQQbqDmd95ErgEiohPEAxFXTlcX+4Ocn/l8zgkI=;
        b=DthFYWKlj2Yjv2/Mr3qz4RAJsuNal7yvFg3xHPCO0bXNTiUlsFP97lPU6MYpDuDjEq
         Xen38jZ2kThkKmG6QVVqXMqtYaALyc+gTU6+q7c2SzzX+a5keu77n8CQFBuWuiHy8JMl
         6ucTX1cgszep/uKgnmT6BmwNY9fl8KmDuLuNIc8d7AZwx5MDegb8mfNwDLDYPq31d4zw
         dj81MMw1U/Ywh4JK0ehrdmRJ+Z4HD6VlNQUSnDUJsExuxOHoAbXkInm+rJb9IW2aXaGN
         YUmH9T+fWYT8l3Oi0h7aab+6fAG1t1DKCntcr/KwyTUy5BWnkgBWtobktMXxfnkuZCVw
         YlxA==
X-Gm-Message-State: AOJu0Yyi46s56v3OoRd0SUoSyANbWpavNMKRJ3JdSZzf6DR0BwBD+G8q
	w6QzQvE3YV0J7qwnRrZ+3VCObk2shIvr6Q==
X-Google-Smtp-Source: AGHT+IGhsY4gpUPS+H7NKRmewuX4845jZHxp7VODYsrgFK1UbM3K3xET68/VxoWNnobs7U+qzBCpnA==
X-Received: by 2002:a17:903:1103:b0:1ce:6312:537c with SMTP id n3-20020a170903110300b001ce6312537cmr17680710plh.10.1701215718061;
        Tue, 28 Nov 2023 15:55:18 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1701159692-27917-1-git-send-email-wangmy@fujitsu.com>
References: <1701159692-27917-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-oe] [PATCH] paho-mqtt-cpp: upgrade 1.2.0 -> 1.3.1
Message-Id: <170121571675.1187527.13745672104756019653.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107107


On Tue, 28 Nov 2023 16:21:32 +0800, wangmy@fujitsu.com wrote:
> 0001-cmake-Use-CMAKE_INSTALL_LIBDIR-and-CMAKE_INSTALL_BIN.patch
> refreshed for 1.3.1
> 
> License-Update: Updated license to EPL-v2.0
> 
> Changelog:
> ============
> -#462 Fix version string for version v1.3.x
> -Fixed building and using library as DLL on Windows with MSVC
> -Updated License to Eclipse Public License v2.0
> -Updated create and connect options to better deal with MQTT protocol version
> -Defaulting connect version to v5 if specified in create options.
> -Added a topic_filter class to match a single filter to specific topics.
> -Added a topic_matcher class to create a collection of items in a trie structure
>  that can contain items tied to topic filters. (Useful for queues or callbacks
>  per-subscription topic).
> -Minor tweaks to prepare for C++20
> -Support for Catch2 v3.x for unit tests (v2.x also still supported).
> -Changed the sample apps to use the newer "mqtt://" schemas.
> -Connect option initializers for v5 and WebSockets.
> 
> [...]

Applied, thanks!

[1/1] paho-mqtt-cpp: upgrade 1.2.0 -> 1.3.1
      commit: e4fa64c59618711dbf6621a66e0db5c840e7536c

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


