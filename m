Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675F6C46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.6850.1702967281717997513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IaUl8sWC;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d045097b4cso15987505ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967281; x=1703572081; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzc7xOlY3+xCWTmzXHYDXVX3/yjUhUnxsaNsKwdBoE8=;
        b=IaUl8sWCYrK24W3avxDiGbrhZ1Dr7tFXt8umHdSDlzNrUvsP3LhHqyVO1JeH43Mz7T
         KqV9pDwU4jGqb+HXFVvjMNNUjbz4pqMDSO4tHjLbQnLZelLQp2axQmvk6d9mhmJ6qlGi
         A48q2QqnVD++mPV0XdJ89EV1MB/BR8mXo0j/KBQdbId2A93mIcusOr2UZ1gBSOC5FnUn
         RY2VobgvnbT0+wR9rOlWHjG3ZYnJJ1C8mHK+7v0c7MosGL0dMgTejQgkUm7PPzsVQrbB
         odjzrCIAlYDRKBwY/iCSBnmHB0a7UTV+Wn1jLOugYkEyT0iPrYuxhX4uebR5Sh+uR7/i
         7zbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967281; x=1703572081;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzc7xOlY3+xCWTmzXHYDXVX3/yjUhUnxsaNsKwdBoE8=;
        b=Bjnkj/SJYb7AcpLHcKryD4ZtThk+c9SDCnY3JxxD5uWWeEJsLEVsmumXZWv3KLosnn
         /4UizrR0J+hkoVQnh9QLsGs4DGodhjONUsyI3hze9JfB03Zqs+aVWIkm8OmxxPD3cLPh
         WTZQ77mRCZ0Pc2UvSbjRt+B7Pi8iORTIZwit/YwIKKt1ofJP2KHOkQjTnd1JThwR4UkU
         QjicFCSKQTCa9IaHIayzGx2+KIBkokxOGidkfwg2zbDwdHMvdQtTefioOD/2xrcBCmuv
         EHgs60yRB27ie4Qba7ndv4K/jEeVCH0PWRUvT7ofEXSZbFtUZmCy6jCamMJT+cy0MauV
         wlnA==
X-Gm-Message-State: AOJu0YydLvN1rQcDjfEjzw8YJj1XeAKCqy7wHMWaN1zBmYfzozsuzIvG
	mjT5pF5hFb0DscZIbkTJGg+67p/z/Ng=
X-Google-Smtp-Source: AGHT+IF60Bpwaz1YhXVmkze/owBC1hIv+hnU9DVhDujxdi1YjEFvxx9aQME6OMcGpCoW3kFnbc8L8g==
X-Received: by 2002:a17:903:1104:b0:1d3:33b1:f57c with SMTP id n4-20020a170903110400b001d333b1f57cmr6977677plh.28.1702967281133;
        Mon, 18 Dec 2023 22:28:01 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:28:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alex Kiernan <alex.kiernan@gmail.com>
In-Reply-To: <20231218095137.8814-1-alex.kiernan@gmail.com>
References: <20231218095137.8814-1-alex.kiernan@gmail.com>
Subject: Re: [meta-oe][PATCH] mdns: Fix HOMEPAGE URL
Message-Id: <170296728060.1627685.13709010592277592319.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:28:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107625


On Mon, 18 Dec 2023 09:51:35 +0000, Alex Kiernan wrote:
> The Apple Bonjour homepage has moved.
> 
> 

Applied, thanks!

[1/1] mdns: Fix HOMEPAGE URL
      commit: 7a7f975f6bf0d03c06b8876f3ba6367c034a88ed

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


