Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1581CC46CD2
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.97653.1703665287448233292
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MstfBzK6;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6da67ca9969so3949332a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665286; x=1704270086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yfW/j2QqHY9+OqxLyiza5KeWmIzcALQ7kAdb2rieYRI=;
        b=MstfBzK6MIrK+6R13VaGPpRdr0a+BmdmyXTWyAaERE12hfpeGJRRdy647GkjtifByl
         IWT8ApZwTRt1SlhY5Qt+5BbHzR1ejw81KVkpzp22IP2ZMP8awiAJ6Zhb82ENYtQuI1Zk
         5oyGwWqRTNni3a7q/u8Mb1MWKv2usTE8mMciHi5dF5zu5ZPkzHZjAyUAX0Ggr125PaXL
         zX7mIOca1hxc+OcSrz6Y+46A3Ack8B8OTyn4ASqWC1IpNCjq6ADJlOGqXfyyWt7DTXCe
         txcbaycSmPq1E/fCM09SQT01oPZqitrJouvsNXXB3OD0QKoMjNYV+ogXA3SXDFsmgX6o
         gllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665286; x=1704270086;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfW/j2QqHY9+OqxLyiza5KeWmIzcALQ7kAdb2rieYRI=;
        b=ityNT/R+NHDNZTgN7RIuxKWsokAjPgk6yrIUZPEIqCdlUsIqluuj/9yFHnLsX1jyYC
         vK8N1rOxp/JkHs7gWryIg0a/PkKC9ctLVkfxRXSwDJhrLalVMkFqh6kjS/abCApMtZdO
         sc0+tpdoZ5WCkgV8SvOGlTNF2a2rQ6ZQuPCE2bWRF1D/u/2Px0JUagwl4rF9K8bMDbYX
         UIQA2ZyKzq+zAIs7LzE/gq5J6O1ucQCSJFOVmdsiJ2igffdf5TH5+Ml45x6N2cd2g+Ae
         01vXm0vM7JVjlgit2BFZHV8QYNx3QksSBcteYzl005cgespUrzKhIlwdKrHccWWtjB5m
         1SjQ==
X-Gm-Message-State: AOJu0YwbTAvtWrjOMSiMdPXePAPqAzT2v2vUKqiIAOEmQL0CLTPL8Ows
	rDR+XB9Xo1XEuegSYFah5Po=
X-Google-Smtp-Source: AGHT+IEkUj9rmnScE9zYD7WauCztO3rtDIOp8enhBDJRLQ7PiNILDJwvXaEUhJgnBTSmqlCQlN3vDQ==
X-Received: by 2002:a05:6358:4291:b0:174:d923:32d7 with SMTP id s17-20020a056358429100b00174d92332d7mr8695994rwc.45.1703665286449;
        Wed, 27 Dec 2023 00:21:26 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220230328.3828487-1-derek@asterius.io>
References: <20231220230328.3828487-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-lazy-object-proxy: update to
 version 1.10.0
Message-Id: <170366528573.1947762.11186649310692477302.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107831


On Wed, 20 Dec 2023 23:03:28 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-lazy-object-proxy: update to version 1.10.0
      commit: edf5344106ca8fc625bff3fc8d836b019af9cbff

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


