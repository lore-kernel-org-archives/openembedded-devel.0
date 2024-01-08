Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE7DC47DA2
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:46:56 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.31422.1704682006680694107
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XDE4JR7C;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3606ebda57cso11144445ab.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682006; x=1705286806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfSaUZ2nZQ0GdmKHjMlhoAnkffNOkq20PcgkmB1iH1w=;
        b=XDE4JR7CNWfUubR6KoE+jAS0OxNTInL7n3nSi3JMTVz+tmxJTlZ4pcx/4Nu8EA/CUn
         1pOYkq0Namph3PHj6Sict3rFR8PGeoQ4hvCni13TPE6YFQoBJRwqWvmQqlyrg4DqaM/1
         /3h0s8LHP+FboP1p/K55ylCtSDFmAGbFP4WkhlbZhzos6lC2cBTQyK/lumB7ZtqSJyhg
         +Xf0BHobpLszxXXwNOU5EWzNWytIt1c2Zt4+YWJsSHW4NrglpWfDvqhqJud/jqVg9V3t
         0DDxW0UpXSijbfXeATsRdTF42Ve+xxlg3tjYIdQtLA6p8LJZS10EtZ0H1UtxwkjRhF+1
         +exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682006; x=1705286806;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfSaUZ2nZQ0GdmKHjMlhoAnkffNOkq20PcgkmB1iH1w=;
        b=O+rSpzoUl8ycyd33pWuFPebJLTgwZLmENKI2H0g71fRXWI+L4XZh1k4A1zgfnIjyXZ
         3tSiqG8UTq/cqzzmLXtPP4eO8JS9POjvqeHXhOUoWQOTr/blD4bP+uihigMoG2VCQOTv
         gi3mEkUpWz5XhtFoQ6v9uut+bSEN2d0FxJfo/C5x07+3Ee6Et6xyKS8zPkVAqxrBBtxS
         51Xt7J6nNhdqcbNcj82Ol45iYQ+8BnynxWpK/bBdQiEB4oRiDkO9OTStsllo3keKI2kZ
         74w8Pw+cFCxNNtGIB7xGUz/km70OU/m4ZLidp5Q/Xh48wVYJdmU69lJdRXvVMiBH8E5s
         DYYA==
X-Gm-Message-State: AOJu0Ywjq8vE+rzUS1mM5yL/+C8nhOIGnrz91EVNvtmlnopLqWroINFP
	X3o1sWxJpRR8nZ+QmO8BLs5m7e6rgF0=
X-Google-Smtp-Source: AGHT+IF70pIAHllFl1hHOuy8eGQumTJhUhVdRwmdCsU2AmwmzFphTsNcpWBGfEwYkSs9EF4DQRZonA==
X-Received: by 2002:a05:6e02:1d17:b0:360:655e:df6b with SMTP id i23-20020a056e021d1700b00360655edf6bmr6239891ila.12.1704682005914;
        Sun, 07 Jan 2024 18:46:45 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:46:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>
In-Reply-To: <20240101184957.647473-1-alex@linutronix.de>
References: <20240101184957.647473-1-alex@linutronix.de>
Subject: Re: [PATCH] audit: reenable python bindings and bring in distutils
 via setuptools (needed with python 3.12)
Message-Id: <170468200515.912276.1894833485989071347.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:46:45 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108087


On Mon, 01 Jan 2024 19:49:57 +0100, Alexander Kanavin wrote:
> 


Applied, thanks!

[1/1] audit: reenable python bindings and bring in distutils via setuptools (needed with python 3.12)
      commit: cb6cd5a566d68a726eea34a1981acac0b790ead0

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


