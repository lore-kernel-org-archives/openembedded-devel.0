Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06493C5B562
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:51:26 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.43614.1700452278353920963
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KkOd/9r0;
 spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b3f6dd612cso2550902b6e.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452277; x=1701057077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZIYC0h4ud4uK+ZbOA5SZLtX4WOYRWJDkxApyrE6+/A=;
        b=KkOd/9r0GYBIOZxrCVPgbHZSwuFlkXBkxRjlUfFEtdQfnZTrh18mDzzDx9TMRT1zbr
         Ema6i9pRLpuHyzy0NiHGXhPIeKHjnBbrl79W7N4EjSIarCOA8Pa9oLAswC/7KFUqACLt
         emESQmdw6zjg5YAsqI+e8/dNauRwarUHinA6AHeV8XVjAnJmBOvsE0is+H4cJ7Ajsty0
         p3/F4BBi5aXjmhNxwn/78pKtATsFHkUpUoG8oCQJTN0sEH+VrKav0yst4ZyyWX+o2c8Z
         7ssGISuBILWDwBkBqiDKPBIWgVdA5CQAydSIn3IreXKm70egY2fhNuznPwJv5DsPpCby
         YW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452277; x=1701057077;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZIYC0h4ud4uK+ZbOA5SZLtX4WOYRWJDkxApyrE6+/A=;
        b=jSYdz2r/KPI/i5laUAYTmUZ2cZZ/q8W+G+dRX8DUUUTimyLD5Ju0LDQkqP0Npg7L0L
         sO3fIxST/Lo8SW1tmHy9RFCoChTEFvLw7feV9yCz4ufh5jROXn3KBmnnkezM1mvU7Ll9
         Iq2LMEK6iuYlHVWLMpbLO3LOoSHszpW2O3NIA8hyaBKefodJ7NQVa8jPz1ahFs4cRdxB
         43GuIQVxcgPVfgs+PQOrNeB93CWCu1Vb1BfPHLfF/WmJ4Ew6llNGuiTZ8fPU6ICdC9xG
         Ji4Q5C+ukyqF/q6mqcHDk644oR4y3f/RCwzoGt9Zcj4xfeg0Cqp7Frw4oFx6QpMhVqYa
         GmOg==
X-Gm-Message-State: AOJu0YwGdFh+hQdQUNrjOU4dFW7R79J2Ic/5VAHFqY6/BDLv/Bjpsm7w
	2uO824dwkUkmDiVc1lUW3N04nr6jwBVDow==
X-Google-Smtp-Source: AGHT+IF6iN80rfyOAlZKSI+7hjiPGIKBXCfA8cHuH1iA9pDxKe6yqzeS5NWWWbQDZN1NOL3U9PL7OA==
X-Received: by 2002:aca:1315:0:b0:3b2:e0f0:e53d with SMTP id e21-20020aca1315000000b003b2e0f0e53dmr8120392oii.37.1700452277632;
        Sun, 19 Nov 2023 19:51:17 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:51:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231116111540.919671-1-alperyasinak1@gmail.com>
References: <20231116111540.919671-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libsigc++-3: upgrade 3.2.0 -> 3.6.0
Message-Id: <170045227692.1416826.11925688071891122618.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:51:16 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106933


On Thu, 16 Nov 2023 14:15:40 +0300, alperak wrote:
> Changelog:
> 
> https://ftp.fau.de/gnome/sources/libsigc++/3.4/libsigc++-3.4.0.changes
> https://ftp.icm.edu.pl/pub/Linux/GNOME/sources/libsigc++/3.6/libsigc++-3.6.0.changes
> 
> 

Applied, thanks!

[1/1] libsigc++-3: upgrade 3.2.0 -> 3.6.0
      commit: 2b14e7e5455f8e21922490e5fefc7e35cdaed555

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


