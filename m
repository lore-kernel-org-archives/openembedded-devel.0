Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21EEC433FE
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 06:34:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.7733.1664865287052625433
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=pTG2Mn4g;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.49,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f49.google.com with SMTP id c11so19760468wrp.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 23:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=8ym85k1xMLiF8ct0Gv+n7mqB6tzgJ3TsyuOoMDfMf8g=;
        b=pTG2Mn4gM3pVe0zCl2rH8BX/k+FstIvhtKkB0Dlgo9O4OHzw7QOLnRxKSY1NGaM3Cc
         5vnvByt5Xqogk3jH85mFLzi+0jGqfaaQyVdb2Wj81gYlB67d8SF40susmnAFgSyocjfl
         GuBon3X34h1gKj2qsLlVM0tFWtEkbb4UDoDe0iShtwtQzYUIfqmE5XNLtzeYFSzWmanx
         ziszZFhEeXx4jVLhxbmXVidXWgJs9KK3oMDZNUx9BWyxHzD+KdK65uwQvF8eJJ+cGPfP
         Fa5NdjeEOwHQZTv7FXNAwKX4PeHJW2Uk7/vGliQF88g0kPr6Q8xfl5HLPaYUSDI2UqNl
         wfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=8ym85k1xMLiF8ct0Gv+n7mqB6tzgJ3TsyuOoMDfMf8g=;
        b=VuRMCgmOt8LqAAayMYR4U85vrrF276J3LYZl38yP1o0dK3HtTXQsDI4SGybZqQmhco
         YSzlTnm+341b/ZSqzwGecGqsnzm4ES2xOme7ax8uzgM1dZHvZXIwUJ/6yyW/hqYaDA1p
         Y9ELH+vdusmHahIfQhfbYBOa4qqpwwJDR6PAlWIyLx94lAsmjdQByrlJVv7ezyt5u5+w
         jz9dKmUXLOsPXcbUPSPXWGqI2Ek3zusF8SrJHz1hzQJB/UHBj+SuuX2MTW0S5Z4IvDIQ
         YI76hzP2p7WfSyhdjY0LGtTMhA4dIGLaDWJzDSUylba0LaXD5iRKdjUtftc7hNFFzgIt
         F9Zw==
X-Gm-Message-State: ACrzQf3TpR3oAT8r9xZdon3YAF5ci/0bXQzkj0yRQsUCOTDQWLkeldt1
	o7phfdaSeEo4gHchi7ThZok4YaBHrW/RSQwojQY=
X-Google-Smtp-Source: 
 AMsMyM6cwGoOtZEBNIaXFiJRjYySFtdLKuMFLpjiR2lzCIs9ueFFx9nLKQVH/qT/EJ6GYKwtJL5TzA==
X-Received: by 2002:a5d:6c6e:0:b0:22e:355e:4bc8 with SMTP id
 r14-20020a5d6c6e000000b0022e355e4bc8mr6576039wrz.24.1664865285057;
        Mon, 03 Oct 2022 23:34:45 -0700 (PDT)
Received: from WIPC21110265 ([2a01:e0a:9a8:8b40:238e:3570:9587:5b36])
        by smtp.gmail.com with ESMTPSA id
 a14-20020adfed0e000000b0022ae4f8395dsm11373103wro.96.2022.10.03.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:34:44 -0700 (PDT)
Date: Tue, 4 Oct 2022 08:34:43 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com, Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: Re: [meta-networking][dunfell][PATCH 1/4] mbedtls: Fix CVE product
 name
Message-ID: <YzvUA8zS7tmm+81H@WIPC21110265>
References: <20221004062843.2541778-1-mbriand@witekio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004062843.2541778-1-mbriand@witekio.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 06:34:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99054

Hi,

Fixing the CVE product name from mbedtls uncover a lot of CVEs. Some of these
are fixed in the last 2.16 version, but some remain. Here is what I found:

- CVE-2020-36477 and CVE-2022-35409: I added patches in this PR, but they did
  NOT apply cleanly when cherry-picking them. Original commits:
  https://github.com/Mbed-TLS/mbedtls/commit/f3e4bd8632b71dc491e52e6df87dc3e409d2b869
  https://github.com/Mbed-TLS/mbedtls/commit/e5af9fabf7d68e3807b6ea78792794b8352dbba2

- CVE-2021-43666: Patch is merged in 2.16.12 but CPE do not exclude 2.16.12, so
  I added it to whitelist.

- CVE-2021-45450 and CVE-2021-45451: I believed the CPE are completely wrong
  here, as PSA was introduced in mbedtls-2.22.0. I may add it to the whitelist,
  but I believe the CPE has to be modified.

- CVE-2021-24119: Fixed in master and has to be backported, but it's not clear
  which commits exactly fixed the issue. Seems to be be165bd32b87 and some
  parents (from https://github.com/Mbed-TLS/mbedtls/pull/4305).

Best regards,
Mathieu

