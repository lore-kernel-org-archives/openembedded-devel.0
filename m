Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6623CC46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:36 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.6763.1702967249904820751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W8w1wkeE;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6ce6b62746dso2022979b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967249; x=1703572049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jgg+yRNxx5FwmRZo8Dp9CvLOdYDe9wZ4tbtDYmFZRvc=;
        b=W8w1wkeEtXgqdlF8UPmmYxV5Cw/zZbrtfC+KU/2QBXeJsMemqBePnxY+PytlDbRLdQ
         e42xQOApv+Vzo3WBb1N4OGXEmAx7ncDreuOT+slD6IiYXeKcbrllVUigmtEOXeU0CEWs
         RXnUd6Gvo0k5U0Avjbhp+hm0YYmr/gT0GaEK3uTJC5r4B2JlJyUEsyi/oAdKsBSN2cKk
         A+Kc7dvHhtqeDePuTVTvoS91tzYE/4tIAFYxwpqLIXnExJwKAggnkJnNJYECed4VP1ky
         axFDgh0ST7XJxpemtIjpsk9+UeCjYdMY8G951+HcVpDfXMrTS1nQFfpwFBKSl7VqGhUe
         Zqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967249; x=1703572049;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jgg+yRNxx5FwmRZo8Dp9CvLOdYDe9wZ4tbtDYmFZRvc=;
        b=K3pb9iN5UkXxy2gmaxHIT/YQ94zs4JvrNd+4Aoo6Uk7kfq2vDvDNoI8CtoKyCVGTKs
         cpPs17Q+GbG5I/mjqNl8zKN+7JvAoGr+UsedMWJ4uwTUenaMtFud0XiSErZfdrZY4Hov
         jmV2GpnISD2fL7qaL1fiiX7elr9jvDJjZ+quHYDSZtuaDujbSXKZIkrQ9iEbCMl/5JxL
         4TSXkwea5oes+vTWcabet8sm2/MaYXli20YQl64UudOiuw9IBMbEfl5WharhMopb8yEC
         pvD4SBmiQvhpzt4kRA1f0lFwMknxH73FrEQwD2Gt3QfxgqzFD8Y/5c2PC5fnuloaFUBy
         IEUA==
X-Gm-Message-State: AOJu0Yz+ZzUy7jMjeZyaA+32HwJNEvWQFiZUBYdk29x4oflLduX5RlMp
	M9P74ZIKqU6zlXn0noOXAwpqU47KByk=
X-Google-Smtp-Source: AGHT+IEy9mNoby0+Fv0tdAC0IKXsjnU9cEayUuAbbeOiO1aVJY0AXgwOHXyVBfruMF/SzyB6Nzj7/g==
X-Received: by 2002:a05:6a20:158b:b0:187:9f15:bfc7 with SMTP id h11-20020a056a20158b00b001879f15bfc7mr9956571pzj.27.1702967249356;
        Mon, 18 Dec 2023 22:27:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702544342-28156-1-git-send-email-wangmy@fujitsu.com>
References: <1702544342-28156-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-path: upgrade 16.7.1 ->
 16.9.0
Message-Id: <170296724852.1627685.801412127611857404.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107588


On Thu, 14 Dec 2023 16:59:02 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Added .iterdir() and deprecated .listdir().
> -Use '.' as the default path.
> 
> 

Applied, thanks!

[1/1] python3-path: upgrade 16.7.1 -> 16.9.0
      commit: 5958fdd6f51905c8d6431e1994215033ca56ee16

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


