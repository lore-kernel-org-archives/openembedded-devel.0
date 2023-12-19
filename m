Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD02C4706D
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.6833.1702967262842891145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EO9+mqVh;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6d267461249so2248421b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967262; x=1703572062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4732EPGqeY2HQlpATBi9uJoulPxMur18ezzAfmdbrpo=;
        b=EO9+mqVhciVbTg+spjvUfHXosc22hJhDQxcHWGnvymj1glBc2foTT3qnGfKMZf4j+4
         Z97zeSEKYM4zMEi9pa+U2aTqseVak17sBlFxYDEK/0hFPwMHjaLc3s8y4X+iU2y57WTD
         CzjzGyXXTRf//3RtU+QaPxU+hDF6HXMzBqvernyzKPI/rvNwok8al4eHgXx4cMTPORgd
         mAMkbv44VYwAl6DYJyyqPjrETFJn7bTAtl6kR/Eix/PpN2gQX2AFMXCU8w4crVXfs/TW
         UGuZqP/frxaVqmV3oD04UEGx//lEYXndz1lKflkZqlGm5GEOK+H9aalZ7rwspJWK2jcC
         4+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967262; x=1703572062;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4732EPGqeY2HQlpATBi9uJoulPxMur18ezzAfmdbrpo=;
        b=G3/sCbze84OYA+LKhnj31RKcpwl4b7/KSXgbkoJlcjamdgzkHHZtufSQpDQxWHChi6
         rr8iMwKjFyV1T4NH63obSoqTmhPYXLq2OYG6KF6PulXwNv1y8isO86Wrx6jZQISmw/26
         2JUr7qmVmDf2rnJDjsDMhS87PyOG1LUNWjiZxNK1lad3qGYUmku1kzXQM3WHhFQnNXOu
         jFVo9hm8XEPWzHIcL5aytMOnOgiPT46uZV24LLFxSEihy3VihzXABzHUV/ERR1GgBjMP
         8P4tu7imK/R2Tm47Z5+5HrVJTRpPbvsyDH0g5KQmehIhx7yGQXFkF2B8jW26dZ6wp6+P
         pcFw==
X-Gm-Message-State: AOJu0Ywndu6iRxz01KXsZmXjHqoAUQgLqXe9j2wCXpNfkf+fezEKlUma
	CCDFbo57/LyAuPCzaT561LnlnklZGlQ=
X-Google-Smtp-Source: AGHT+IHO6xzOWYxcEyr837Iu1WvvyiUN2+ZYi5J1SE4JFXFSgdbvz518Ozmr00eexQ5VtYg1WuSTPg==
X-Received: by 2002:a05:6a20:8f09:b0:18c:8d0f:a7b7 with SMTP id b9-20020a056a208f0900b0018c8d0fa7b7mr9997853pzk.22.1702967262222;
        Mon, 18 Dec 2023 22:27:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599562-1669-1-git-send-email-wangmy@fujitsu.com>
References: <1702599562-1669-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-tornado: upgrade 6.3.3 ->
 6.4
Message-Id: <170296726107.1627685.12767064718394053063.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107601


On Fri, 15 Dec 2023 08:19:22 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>   https://github.com/tornadoweb/tornado/releases/tag/v6.4.0
> 
> 

Applied, thanks!

[1/1] python3-tornado: upgrade 6.3.3 -> 6.4
      commit: e47aa62228fd60fed05c9c79bc7d44fb44b86606

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


