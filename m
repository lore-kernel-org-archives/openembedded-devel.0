Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA0A9C46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.6834.1702967264568213705
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHZ2FaZT;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d39afa1eecso24233735ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967264; x=1703572064; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/k2X4y+5ifVRvAAu5YZrSjATAZuUFta/XqFST8X98Vs=;
        b=eHZ2FaZT6vwcqtABNL2hTt/ROmL+YZl/gFO60LM5oQQqRYMH/zBp6ll9Y3mvliWAfO
         c4V5PQa7EIrQe2zbzaBCrImwcefGeN4as31FTwmEr7L3dROXXizRzARRwAuPqf+H2QYX
         Z/5AfJ7/VXn5yEJ/awJqBdvi7hCz/L3lheXs3fjfw4IqXNjcnOIaqSCSlV3Gk5vtwntO
         9QtHnTYH9nHJBuuwIMLsDvGMkOfdJo2BUhDQOIkG+6eezvf5Uco7gGW2cSP4y6qW5XYm
         vsa02MXRQ6LZhgQ+3FCFNGqCHdhJQ2mBA4mR+UOGX6oFqswlkYHVnaKRkQQKw2Zebm9D
         xLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967264; x=1703572064;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k2X4y+5ifVRvAAu5YZrSjATAZuUFta/XqFST8X98Vs=;
        b=wSESIF1rHP0UlbP0NeERhoYKVhKI8JPnymSpBa5St6sDKhhcKrQXEJaReKmWWisFg6
         0XELUBznrID9XDPFqVYTw5YBqhISk8GbJPSvGOBF90TzzjD6xr7B99oIdlgx6rVwYEu6
         XKn/bqDagSgslXZgddeXKUaU+2hS4CZJZ5f3dsWO7grWeqKWF9Qh7P5+c4fQ5dMQsc1M
         nk/tYMRpfdAJcYmEm1PxxUdgFkxigPQ869gz8IBfKep/QRgQwk+zFeq602HPgpqoTou6
         J//lNAIZxjbzkjS+vPDfjZQ7r6RVpjmQpxrA5ydljBO+X3gQv0CgRsm9lc4YPTNqG9TD
         hReA==
X-Gm-Message-State: AOJu0YyrQTFv2mSAoQnMrTJ4hHfhn+mAGU+CJWT7YTnJMwy0wlQWHaaE
	WmuWzH0cdDDVww2KJi/OWqD9zWfU+TY=
X-Google-Smtp-Source: AGHT+IFb0YJSSLVw9/xFk8UhZ5q2DVmOP8+5DTC8Jsto4GuC17+rTFe/nqTu36vLJ6fp9Cr6bmkzqg==
X-Received: by 2002:a17:903:2806:b0:1d3:9f4b:fdb5 with SMTP id kp6-20020a170903280600b001d39f4bfdb5mr4692776plb.58.1702967264052;
        Mon, 18 Dec 2023 22:27:44 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599690-1744-1-git-send-email-wangmy@fujitsu.com>
References: <1702599690-1744-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade
 68.2.0.2 -> 69.0.0.0
Message-Id: <170296726305.1627685.17408001412017954488.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:43 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107603


On Fri, 15 Dec 2023 08:21:30 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>   Bump setuptools to 69.0.*
> 
> 

Applied, thanks!

[1/1] python3-types-setuptools: upgrade 68.2.0.2 -> 69.0.0.0
      commit: e5852cf3a535e31959acadc067b9cd418fd89059

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


