Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB02EC41535
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 18:34:01 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.3227.1699900440509211539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 10:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Boc58GqC;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5bdf5a025c1so3044043a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699900439; x=1700505239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yuRPUm330fVtt2FVRZrIec+a/1d+OJoSymQW02sfSKI=;
        b=Boc58GqCyAZid4vonryavpGI7Q4ceE3ridic13fUfdXxjpLh3JaWcqgTQTOBmUOcjw
         dqe5kkk6MLheOpRaWJz0IRcID5MAMH79MYIu+8aYE2yaXLrP0yeeEcxWZpNmcmp53a7R
         6Ld7SfZ84MWlR/ZmvxhJA7L178eZOWg8Nl22H71kjLRdlblx+hhtq+nxx5drfMNsMFdD
         F8X6AVxx05Vz9pj5J8UGWjNPl2Qk0XTOtjcCoTVPtAiY0g9tyZTA2jPQCbuI9W8RASSL
         UC+nZnf+naxC71RxadFFw387MPakL9ps+SxGYWQBwpFcs3Lu2Zs/+7+ICB/aIr9iYtvy
         +WbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699900439; x=1700505239;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuRPUm330fVtt2FVRZrIec+a/1d+OJoSymQW02sfSKI=;
        b=POrh8LNjSxeZjAuJaoP2c48u0UdB3MeeO9m9/pH5qs192t1yf0cj4QjEiVg6ue9nG2
         K82LVXNt0XOc89kFRloljSBG4Qul0J9Tf+Um/ohfGnSZy+vUKONjwexEvOxqVwGuoQcY
         8hcH3+uXoOC/Oi1jZ/jY4QOlamCEIZX6xfzlJmwAhsWSeTvJZVAHTjZfeOYnAZA5VWRk
         izi4ClNbi/JH9z05mVu/Bj4dbeXO8nD5McJCbXqXzfKR7FgQuHx6oucomfsz9/eSrv7p
         rP7TrkhVPrQcb54ZeW7KXeuYXYWpLXASb/dwZ2pDf/vx6nEkj1lDBifJna4mLmZG4tZH
         uDsA==
X-Gm-Message-State: AOJu0Ywdk7FKEbP1fb1eeCBarSw8IDipFA8irtk1f3LogADukVJkholf
	1g2RIDHcEBhBdcYkHVQJzfXsno9huk7kFA==
X-Google-Smtp-Source: AGHT+IExAfRzqlXqFZkwuJ9ywTLB4Q5xERKiUVPlQKA2OGr88YwByaDGRfpJdUbxNzFqKEReF0Ea9Q==
X-Received: by 2002:a05:6a20:8411:b0:186:45d7:933e with SMTP id c17-20020a056a20841100b0018645d7933emr4893002pzd.58.1699900439563;
        Mon, 13 Nov 2023 10:33:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id m11-20020a62f20b000000b006c1221bc58bsm4063471pfh.115.2023.11.13.10.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 10:33:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231112151849.414772-1-alperyasinak1@gmail.com>
References: <20231112151849.414772-1-alperyasinak1@gmail.com>
Subject: Re: [meta-multimedia][PATCH] libopenmpt: upgrade 0.6.2 -> 0.7.3
Message-Id: <169990043893.4418.12882299907260552235.b4-ty@gmail.com>
Date: Mon, 13 Nov 2023 10:33:58 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 18:34:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106663


On Sun, 12 Nov 2023 18:18:49 +0300, alperak wrote:
> Changelog:
> 
> https://github.com/OpenMPT/openmpt/blob/de9e591419eb5f5534f06da2876515fe7af18039/doc/libopenmpt/changelog.md
> 
> 

Applied, thanks!

[1/1] libopenmpt: upgrade 0.6.2 -> 0.7.3
      commit: 9bf89882907845d555406383b603f08d76a4a8ad

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


