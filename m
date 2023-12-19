Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683C7C4706D
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:28:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.6848.1702967280275951126
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SoNJY7yf;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d32c5ce32eso35863755ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967280; x=1703572080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S+YUlligPDNQyY3NzyaO25lUhW2/HY6Wt4ZYL8P7VkY=;
        b=SoNJY7yfr7HTwHczXVxf2egiViZOMLVMV9iANX0RjwGznZW8n1thtTYqDx18QlJ5kW
         Q+DFpa85xs1uLdGAvFx5qzXopT4OgptoRNlwHaDtue6epbW9omYNCnv7vOzljBVvtAaK
         rUfGIw6nykG3YRzrgi9ed0q1WtacyBet7vtv9FDa1GeQv5TPLN2XCRbryMnieJyedhXv
         diqlEf7n0c+2kNdx2Dsnbm+xvoDJYjN9rm/Or6EXidy0x/f/qA94zyYyMW8eq3hQKTy5
         QPg+q3UdRXZ6RhBcQCz1IRJZ/xNyz2Fn7AWFFYWMUck0xIYEE4gBkTzZyPbGCEdPz4Pi
         Nvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967280; x=1703572080;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+YUlligPDNQyY3NzyaO25lUhW2/HY6Wt4ZYL8P7VkY=;
        b=npEUXuTlDIRPQIM86+UXMeHKh9Vdy5AijQFQ7XftlvGlBvNx4abyeZycTBQnZeZz97
         SZ+yBgSVEaefSqWVQs1FmfjMuKBuGQ+R8OrBQagmB6M8dqGr8ScyLxgDmf1DG1rKXbVS
         lF8LulM5Frpoosh0WFNZlIDhzJe0ZBEZY2mR116HUM+agoRNGA+UYeSR4OYRI9WWJVp7
         0zuohZNxXo1c802kfCx/9nLCDq5DiS0C46+Pep0SUDRB+QGn0SQXcVhEzfUYoFMcjpxi
         JFUfvERMYJ4duaZjobI7paEY1CUjBOJDBLEorbk6ybDI6nM08TRFnD8Za0MxWdcP6SLr
         sTbQ==
X-Gm-Message-State: AOJu0YxsR02Fa9+x9a+mS9lTg8ePG005+sxhudmxkQ6L+l19eYdS1Rvu
	T54XynbiQF9HDswgk5Uc1i/mHkSXU9k=
X-Google-Smtp-Source: AGHT+IHFXPJJDxeft/ML6rhI4EwQsb0ST66SaJFhIh6apN+6MM6WT1TLW/U8Ege/fNhe05occD7xJg==
X-Received: by 2002:a17:902:c2c4:b0:1d3:8e5d:ecf4 with SMTP id c4-20020a170902c2c400b001d38e5decf4mr818898pla.56.1702967279674;
        Mon, 18 Dec 2023 22:27:59 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 frederic.martinsons@gmail.com
In-Reply-To: <cover.1702798681.git.frederic.martinsons@gmail.com>
References: <cover.1702798681.git.frederic.martinsons@gmail.com>
Subject: Re: [meta-oe][PATCH 0/3] Introduce crash-cross-canadian and update
 crash version
Message-Id: <170296727910.1627685.11513171617533843195.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:59 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107623


On Sun, 17 Dec 2023 08:39:27 +0100, frederic.martinsons@gmail.com wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
> 
> This series brings a cross canadian recipe for crash utility.
> This is particularly usefull for using crash in an sdk to analyze
> a vmcore file generated on target.
> 
> The following changes since commit 0a0ea87b8dda01a2887a525cef78eb6c3f4c2c32:
> 
> [...]

Applied, thanks!

[1/3] crash: factorize recipe with inc file to prepare cross-canadian version
      commit: 058f22ac2747693a32ea2a14edaa11471d67fd0a
[2/3] crash: add cross canadian version
      commit: 1f9ad22b28c24a289636b1eb049c491e4529337d
[3/3] crash: update to 8.0.4
      commit: a4031df72d4b2dfc87d270221c339a50c7fc0d6e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


