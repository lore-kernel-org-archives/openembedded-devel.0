Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD1CEC47072
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.6738.1702967227193688369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=inK4tvcv;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6d8923fe26bso901447b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967226; x=1703572026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzO09ObtuMsXMFznmcLN8AVjDUuWdiOnB5cV74vCIKc=;
        b=inK4tvcvS33wd9CIJ4oeDrah5fmk+xKA8H+uW1SZ3VgxhvdiV8GJsf0Is45uEC4RNk
         BP+jLpi2FPP/K6nTYMW5xa9dK3H6mupGirNDL2/iyAGMAGgviyNSwa6fVfM0JotiOKaq
         hng0ISXHPk756jb3TCeeptevtgQNjQxtsrpCcJo5e8pdKwSa3ZXLSgDAnR/EVgAG96wW
         YbU3jgp+zvwiOedZSKSzJmOR1g8MFFl9LbSViwAxZAI42k52CLRdVL5sP7cTeNhxcS/x
         u42xQmf5ZysPB8bOvci7JwxOhzZSJm93R8H3YbAgqypw5SCkkSdzaNaGniPSM072PZS6
         iu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967226; x=1703572026;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzO09ObtuMsXMFznmcLN8AVjDUuWdiOnB5cV74vCIKc=;
        b=aXKWyaczAoIXQStIAXr3awSXsnTpqWkPCf3jSoUgZ3xsHpOk0mRYbGAKDgUNyTeojS
         v+yhHYj2MIIas77lNebOy1Tp7L2DKX2yVAh3FAwm9/MR2GMOofblg3x03OsWZBsKdG8w
         a/22SRbx93BwjBkVG4i34ao8VYUesqFCynQ6XrM2f6vNnDYsqV0vTVzi9FZAbDwU6gj/
         T0c5bR0Vft08YsPQbUxyspHchLJ10kq44Qw3qOSKUIeNuTtuIZTTXxbzSCZRQpXnfL7+
         2J6De9PPEQa/7SN7bS4j3H3qtuYyO8AUQW3oX9jKvAV9gfNuVoZMVCYCPygQyS2zxKIi
         AyTA==
X-Gm-Message-State: AOJu0YwhTn3lV2LA9bBvWy2WmT4mlS2iwUMsgUxrYkazcJukgJpOmPYg
	mysTCbRme4IMPz8PIfvpHCY=
X-Google-Smtp-Source: AGHT+IEpMXT6vTe0umTknhNQh7QXNldJKVJ3JlfWS5BoxSMq3KT5lJnInDducpck4btjkeJJ1DJh+w==
X-Received: by 2002:a05:6a20:7490:b0:18b:8bf4:6b4a with SMTP id p16-20020a056a20749000b0018b8bf46b4amr10112150pzd.0.1702967226449;
        Mon, 18 Dec 2023 22:27:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214003056.1163424-1-derek@asterius.io>
References: <20231214003056.1163424-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-gnupg: update to 0.5.2
Message-Id: <170296722564.1627685.4078128724031066425.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:05 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107561


On Thu, 14 Dec 2023 00:30:56 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-gnupg: update to 0.5.2
      commit: 101bb00d877c6e71c9095c4e199137062b154d28

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


