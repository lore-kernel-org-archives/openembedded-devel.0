Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B9FC5AE5C
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:25 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.43616.1700452281671310108
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QkRds9OR;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3b6a837a2e1so2351661b6e.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452281; x=1701057081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RncE6mUGRNWYxp2PXB/5jVS6nVJ96/gMvTLWP3mLoa8=;
        b=QkRds9ORG4VNMv7UenTrtZryO0TSfYNBtwWy1sLRM/dcJOZTVAcGvj8XiQIKL4peF3
         6YKv7Hlaqo3ot+E7TnoyaTRSR/nlTqJGvyAy1Ft+nlM2QKhr68oZe5yXDcXDuSCAZY32
         sK0zLZ43BXR4UwCMl10MsgohuL2bJ3K/3TN9YYUMpJVhfLfGyuvinWcrf4Jbz2F95jOw
         k3Yp/ojynrKKtR8JcaSzNFhTiSxQghc8DkNLmSoefjj8DIkksnLQOUfkERLWSVEB4nUn
         8b/kP5oejpWzkm10fCQWpunu2CNXWFz81E2NVO4HfbyRX00uF+S4wrzmEsocWN2ZDdLG
         oGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452281; x=1701057081;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RncE6mUGRNWYxp2PXB/5jVS6nVJ96/gMvTLWP3mLoa8=;
        b=hZ3xKQAb+M2oqPyva3wJ3XR+q7J4yTiSBhGJViSPpXRvSMsjHqpi3je3ncQi7/WdQU
         k3iykh4NAXmw8WHdyV5NaaO9FJ4Xx+MdFyWRmM21nRoJsiD7/z9gC3EHFmVWAIjnIKC7
         1I3dwrLbAwNrLrBdBgndXV4JgMfm18bM2hKbBuWRH7jBt2O+gQz3WgDHmh7480EULASs
         3FPkIJn2+syw8reDXO/d1g/T+ZWmskxgYl7CRiE34/fbeBcaRIvL+kUq/n4pZb5WOAga
         MgIB1Nc6g19Jtvw0tZuG1Qi/I0Nm8NBhSmbJ+SOY0DVicifyQB25/+1YyNVPIdxOwCrl
         0Llg==
X-Gm-Message-State: AOJu0Yw2CAluNSPf55Of49QhchlKD4R8uEga1AFtQaU2THq/Br/Vydby
	VV1MQDn1wm6IhYFqE/OG17M=
X-Google-Smtp-Source: AGHT+IG4pGTqAnHTqEIHW2n34aMJbMvOVGN29QrhX+aGkDmO7OE5BgZL6ZwOpX1L4oJvMNToVK5KRw==
X-Received: by 2002:a05:6808:2e96:b0:3ab:83fe:e18f with SMTP id gt22-20020a0568082e9600b003ab83fee18fmr8946522oib.35.1700452280998;
        Sun, 19 Nov 2023 19:51:20 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116134545.1047335-1-alperyasinak1@gmail.com>
References: <20231116134545.1047335-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] uutils-coreutils: upgrade 0.0.22 -> 0.0.23
Message-Id: <170045227989.1416826.4690454541732220761.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106936


On Thu, 16 Nov 2023 16:45:45 +0300, alperak wrote:
> Changelog:
> 
> https://github.com/uutils/coreutils/releases/tag/0.0.23
> 
> 

Applied, thanks!

[1/1] uutils-coreutils: upgrade 0.0.22 -> 0.0.23
      commit: 3282b78470df619330a8d197e78189579cf66a13

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


