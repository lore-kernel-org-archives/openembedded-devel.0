Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B8BC47074
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:16 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.31459.1704682034593470598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gy5I4ttB;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-595b208a050so1082349eaf.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682034; x=1705286834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wPXcqgR8Jatj+IFs+laqArCNtgIWyvONvfaU6mBBRDI=;
        b=gy5I4ttBcdAWHIF4mdekloymji5FVCjCgqZ1waEWKbtfrm+N8YVRsWmM5ZG3meip62
         cLfRF7wiOONRS/LAB3UdRcdppLsFx5hzIexqPmP5m2+sKB3y57FeRJzXrHxKjjg0H3DQ
         Kao6ZXX5HxBnseDXzP+KJqOqVcFsaZut/nAzLySvS5VFhFbgQTo3jQP1Twwt/7SEfbmY
         cI7MSQsPlWYB4NehOYyd9YeXEkNk+0bX6QfYaskrwMMM7h2aPOnNFLKuX92wU0SdShAL
         5dnP/WMQZ0uCNUHeefgMLblEZ2kDGeCK/McB29AE9irJ5av/TTtU5vFxOhmfhBBUxnsZ
         BGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682034; x=1705286834;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wPXcqgR8Jatj+IFs+laqArCNtgIWyvONvfaU6mBBRDI=;
        b=jSy/2gdGQlbnGHkx2ux3AX2wlcYzTYk2QXW2vljEffaMBAV7VdArXb67lpTK4s/vpZ
         xYPxFgqO3L43s2g9nrV1VZWGRf3QQB+Ha9RWrfud4s1y0qLjJaLsOl0onv8GupX3i1LG
         Oi8cN7DlZjgbyieIOo/kby3mt/lG7rRjXv/V5u7mQtttEGZ0EOZfBwQWF3Fbs5l+17T2
         RgR7JiQv7Mj/sH7gnAmTK9z2ixu0bfUACN27wwRiuefgRP+zPSmtYlxgmdFFq3G1EGaR
         f8yJLknFHDCLd75KYX0yesH/W3yN9AkACTp5VndltJ5XRwlu8mjua3X+55zT3oNcoiXj
         AKpQ==
X-Gm-Message-State: AOJu0Yxqz9omblN1yS4b0QBi/SF+uibpqiWUdt6di5L1OIRBMKlzSXyR
	srQgDZT62qYr/eD2Af8CMGU=
X-Google-Smtp-Source: AGHT+IEQbaknFxL+m/2UdSX/1dU/Mr6xO7HXx/nMuEeN5omaw0Fx8Oa7a/9RGYpLeO9Q+hfrjpyFSA==
X-Received: by 2002:a05:6358:418b:b0:173:c5cc:5027 with SMTP id w11-20020a056358418b00b00173c5cc5027mr2453218rwc.56.1704682033776;
        Sun, 07 Jan 2024 18:47:13 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>
In-Reply-To: <20240103173742.1834490-1-festevam@gmail.com>
References: <20240103173742.1834490-1-festevam@gmail.com>
Subject: Re: [PATCH v2] picocom: Update to 2023-04
Message-Id: <170468203304.912276.7239517683798264290.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:13 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108118


On Wed, 03 Jan 2024 14:37:42 -0300, Fabio Estevam wrote:
> Update to the 2023-04 version.
> 
> Use the the new upstream repository and drop the fix that
> has been upstreamed.
> 
> 

Applied, thanks!

[1/1] picocom: Update to 2023-04
      commit: 8838fb392808881366d4bcdccc3296c7413413f9

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


