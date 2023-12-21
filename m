Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424A5C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 00:23:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.38640.1703118210531028751
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 16:23:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M8nAKOUk;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ca5b61f101so146480a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 16:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703118210; x=1703723010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY9KermgDULoiSUvCcZQ0zom89A/9KHkVlPkvcsBXEs=;
        b=M8nAKOUkHPLigqCP7jJCBf1d0tVQCfQ1QIksKNoLN7cvh/aDvkVVU109bV8ZP+syvu
         APeAJ2moGKE1/9QXztVwYSqJyTIJP+utLFkwm6vEy/CRUGgEPIihiFA7kxinHeinYT7I
         8jGNwfmfJjCW+ertrZEXWg0/DkcK+b17W/D+6kGMWNehXAO+4i6wO4lxBMTkObDSxEkg
         oXOwWMtlCo0MJ9hIMYVtETMGN0A+bDwxw7rc27CAVtpoOXh2pC6iFU7RIsRfAnFFXulv
         gFBdfdyuXd79PPBhHvCw+EHeLGE9Avhaf0+vSkWL/RDVEEpWojOcP9IIhR3eseao2OpM
         yAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703118210; x=1703723010;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY9KermgDULoiSUvCcZQ0zom89A/9KHkVlPkvcsBXEs=;
        b=jYusq6W2ri8oY1pZJSG1n7xpazkRyzjWUrudKbLKxxZs4MAvAp4RmtrY1UQuoo2ygj
         6YX1rghe1aSspIjubRq2RS+NHBn5yQAcrohCagIPQfoWQfxT1qLiYDuxDrKxbRYH2UV+
         6nkV6yIexEg79XKtzYrXVkxXE+Eyu1lSoM9yiih3Q9yjaNbU3+i8qSGPHrZNBdbPZtLJ
         Pp6h9vufsMBvol2/7gbdYG3JuScWXX7IQnOPKMz7IsMGsmEY+0tQgh4elwWnV8BAKYsm
         ZWKZOZXqUyJvb/6CE4ynoZFbTtvlM6R/OnQOQ1YUKwuWqnnCDFl5Wyxa70ptDmdk9Pus
         HMQQ==
X-Gm-Message-State: AOJu0YwGZWXbjN9+K7Vu/B24T508x+RXj9lB0cdiwxCcOa+Mqn5hOCXU
	2TolO+hMHb2Zz/TJILKbeaaE3bk4Xno=
X-Google-Smtp-Source: AGHT+IHnuRY3p+baxpWqYMARllduHmW74xYLGxiNHKfJjdb+hpJ+EwiX1tWry6E/hZcN0iDOddh7jA==
X-Received: by 2002:a17:902:b195:b0:1d0:75d8:6ce2 with SMTP id s21-20020a170902b19500b001d075d86ce2mr9367777plr.82.1703118209829;
        Wed, 20 Dec 2023 16:23:29 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id z13-20020a170902ee0d00b001d3e51eabb3sm302948plb.225.2023.12.20.16.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 16:23:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Xiangyu Chen <xiangyu.chen@eng.windriver.com>
In-Reply-To: <20231219033611.697251-1-xiangyu.chen@eng.windriver.com>
References: <20231219033611.697251-1-xiangyu.chen@eng.windriver.com>
Subject: Re: [meta-oe][PATCH] layer.conf: add libbpf to
 NON_MULTILIB_RECIPES
Message-Id: <170311820890.3718266.11417647364544944276.b4-ty@gmail.com>
Date: Wed, 20 Dec 2023 16:23:28 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 00:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107694


On Tue, 19 Dec 2023 11:36:11 +0800, Xiangyu Chen wrote:
> libbpf need line up with kernel architecture type,
> so add it to NON_MULTILIB_RECIPES.
> 
> 

Applied, thanks!

[1/1] layer.conf: add libbpf to NON_MULTILIB_RECIPES
      commit: 14c07e1b45290e68fe72516feb94d307a50d89e7

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


