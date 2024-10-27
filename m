Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334CAD1357E
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 19:08:15 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.30465.1730039166063794743
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Oct 2024 07:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DhUrSm9T;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e0875f1e9edso3503932276.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 07:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730039165; x=1730643965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yopX8sVC7hT6WrVg4tjMCSH7wKj+WPYHmD6Ocup8kpU=;
        b=DhUrSm9TVZ3zxnDsb9sQ/Nd70ei+yZJj/GHX+IYs3J6M6HgTOMAEletwRkZ/OCs31Y
         CmL+1Vp2t+61/CTNZHJLaRt5JmsNcpGmOpDiEmjWl6NIxII/IWyaGt5cgiJky9yby//h
         f158FVsI+L4g4ra5yHzwrbGq4MUq2sDSl06ig6US8RGYWUzlVJHgYp0qRQ3R4P+vRaJE
         50lib50IJMv77bQM9LkZActXHUxwXbGXhZl8gTEUDzr81r1Ch5AemSON++V3n9hCXiR0
         sGrs1MV8wAkujH4MnG/SdTFB7+HF/4ENnyf0Y3pN+qv8gw1s0eQ5F0pHfBusl6434Dlm
         Q5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730039165; x=1730643965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yopX8sVC7hT6WrVg4tjMCSH7wKj+WPYHmD6Ocup8kpU=;
        b=T5C2UR1Bw3ZWfEVTk+qjAP1EQSlt4Wxy3iIMgt4DGHC02fQ1V65QnsRBAU3H7f/4DE
         Rb01Xc/IskY9bP189fxtEf1B/rYVVwi5BLRHG0Vry0PRskZZYIU4ZHUWzzNLdOYl9Dj5
         a+taRIYypJbg4VJpECqFdrsip3WtfAAxs1xM57wYkqcWvEGshvi6EusYBKvyPqi7m233
         cePW4IXs52buhS1sARCg9e5ApWlL5yfBoHUzZ6VuBX995o7yrKvfsqGWNumJZI7whDS/
         aUdo/PS4boNd9fgIMkqE+jCZaK3uMSGT5lDzKQzDv4nLUq6I9C7Pg+NIc9Sjdd60OTev
         QxIw==
X-Gm-Message-State: AOJu0YxNw0gODtaLo27GoadZBX47pXqIMRVh7hBYC98KYFrGLDgimvfW
	jX3HTg4kRB/iWjehMSv6csdzLY7OpsHnCudCGRyeQedyY3q62ALhgC7TnQ==
X-Google-Smtp-Source: AGHT+IFBDZBXziiDnuKuhEViMSlRmadntkWAyB0LRWe33jo27XgUAL4fG91pxX2VGsKIFZkxhrG79w==
X-Received: by 2002:a05:690c:9690:b0:6b1:8834:1588 with SMTP id 00721157ae682-6e9d8b00311mr52835037b3.35.1730039164548;
        Sun, 27 Oct 2024 07:26:04 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9e2953ecdsm5593087b3.1.2024.10.27.07.26.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:26:04 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][PATCH 0/6] www.cpan.org
Date: Sun, 27 Oct 2024 10:20:51 -0400
Message-ID: <20241027142547.261248-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Oct 2024 19:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113245

In this patch set, I have updated recipes that included reference to www.cpan.org to point to locations at cpan.metcpan.org

Added homepages where missing.  Updated homepages where appropriate.

Cheers,
Jason Schonberg

