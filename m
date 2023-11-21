Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC3CC61D85
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 20:46:08 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.4439.1700599563208636748
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 12:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OFYo4IBb;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7a683bd610dso207619939f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 12:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700599562; x=1701204362; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSKJS181vf4H5GIhZ9EWGs6mfz+pgkGzbVC6zxLnsnM=;
        b=OFYo4IBblbhW9MLWfy1qdO9aG3Nx5sRF+ooWE6NfqqA8wbwtqX4FG6uSBqlXHhziSB
         xgFmIHhYoYk+9J5nhOqD1zwKwITn3MtmtG7JTlHUF+HBFk9bUyGSKCaLbD8+qKSdKruc
         EWE/B5XvgmYygWcpLjjLAjPpYamLGYi9qsyptM6W2MoogpU6LS1NmvwymtQ66hI8u5Kj
         ZIuW1IUsLa7N3qL54W4Fy7Oyy4BKk7FKxJ7HNUP6vQ6Vz5qVIlD0lSSboQ81shoLe+QW
         a1sBiVLQlRE+DtzYnP5zLsF95V26My46zs+KMqDx2QWzADUVaWYeprDqyzU7u/400gt9
         rqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700599562; x=1701204362;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fSKJS181vf4H5GIhZ9EWGs6mfz+pgkGzbVC6zxLnsnM=;
        b=TwMPQO2HGoN6GEkvcfe445aOjw9dN8Lm2roY2nJ09Dw11l4wowgGTWDF/TyaPvJmh4
         dOBthq9UsdqOTC6evghzquZWA/mNr42PUMLXUkXZ7GiG74zlkXx+b0wcIAi+6xHcLj3v
         GZ2vFXSH/QZXGqHBf0H3J4L9tx58o6QsAAzvs5+vDRxcjsCln5imChAzYnd9CcYVZSuy
         Y8Xg3zFZmcoTCiklOlljs4o0hwkygkd55FV6eTz2OtD4YaxoQtzyfsFXb8Pgd/CKHL1g
         4jVnKetYEHot1ZNRgnX7poJEmD4k/cKEAMICpDSWLhsyK3JAknlb91k1PCB1dBVcVyid
         rb/A==
X-Gm-Message-State: AOJu0YxSueaA1NQI/+uSgzwBJDrycsTM52bWRApfaqDXvkNCASj6EvVS
	wS9LOBqQWvgXRA5JKV9+9cYLvxVGVhmzqg==
X-Google-Smtp-Source: AGHT+IHY8V0jwWIYWlEs3fvLmpJzWkHeA22VKuqF4Db2X8pdkwDFVZh1DWez11NN1Df9ldRjJPuOLA==
X-Received: by 2002:a5d:87d1:0:b0:7ac:4124:cb5a with SMTP id q17-20020a5d87d1000000b007ac4124cb5amr48489ios.16.1700599562060;
        Tue, 21 Nov 2023 12:46:02 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id cl19-20020a056a02099300b005c1ce3c960bsm7142465pgb.50.2023.11.21.12.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 12:46:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, poonam.jadhav@kpit.com, 
 Poonam Jadhav <ppjadhav456@gmail.com>
Cc: ranjitsinh.rathod@kpit.com
In-Reply-To: <20231121132937.933820-1-ppjadhav456@gmail.com>
References: <20231121132937.933820-1-ppjadhav456@gmail.com>
Subject: Re: [meta-oe][master][PATCH] sdbus-c++: Update ptest path
Message-Id: <170059956136.4811.397623151036596746.b4-ty@gmail.com>
Date: Tue, 21 Nov 2023 12:46:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 20:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106985


On Tue, 21 Nov 2023 18:59:37 +0530, Poonam Jadhav wrote:
> Update ptest path to run sdbus-c++ ptest
> 
> 

Applied, thanks!

[1/1] sdbus-c++: Update ptest path
      commit: ba89a9058acbc1d20987373e60e528cc2518aff1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


