Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B14C54E6A
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 20:18:28 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.27239.1710706701367826226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Mar 2024 13:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hv3Yd/sA;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2732102a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 13:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710706700; x=1711311500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iilabT3ALdQ9b3UzVIYm1ijLzgNSU12pYzjpTL33SQ=;
        b=Hv3Yd/sAoqRxEXugyagIbeDa8MGOsAp1sPVc5U9cNch70J+Lr198TduDpDibN3c0PR
         jSzbdRjrk5dzgbFjH5KnJfkFJT5MZmYEwUO+Tcpxe0321EdbDD88N1V8xBzBxGDNf8NX
         iYmLNcHCjeUZGUMFkoBK5Xcv9eqr691UEP62FSpYnyL4i4XDyTgJBlktGnaCM+evndAi
         mnVexVhN1v4CTtY35ufdwcGvWIIn9K1vz5AUeO27nNhAahTPouwMU7GL0IwriYEukKGV
         4JZUciZnZbYV9/P4lJQL46MufUdAcZDzU2am6egrBlvlOG3eGgOYxJiauHCArZYaczLf
         8AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710706700; x=1711311500;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iilabT3ALdQ9b3UzVIYm1ijLzgNSU12pYzjpTL33SQ=;
        b=X+3lqYjySTsuIw+7cnbqcjo2rOw054I2+FGNzNvFHZtLcxceOPnJbTO9mM7erDNClZ
         JTraokGBPdJedeVPBrLrIrtf4yzo9JWR0KvJpP8E9cvGVVc2PDvMimm2rMbPZl6Ihirk
         D4cnkR2WX9lsFAptXSbanywox2SZyiPmZTr4Mhoc01LlA0TY4WCHiTYmeC9GUDHaHcC0
         Cl4vv8ZI+YoPa9+Nylq7WrDqbnzI6tKPaFyMKExHQwEaP+DKCrSDZeXZr85AiBNokrJv
         ttCnlF/Asb1pzldHzHJK4ngsRzvCSlrIAxg3La1S9tOmoTwWe/SATo1HRmHMtxmTR7QF
         Ymsw==
X-Gm-Message-State: AOJu0Yyt5LEUwmI0AtRl6j2POR4B1L69WaX+gQp6Hfm4qpBhpJu5RCAJ
	bRd1TuuKhbNywmnmUXsCCEgoUkSktinca6pbCkmVI343RTGiTuhe
X-Google-Smtp-Source: AGHT+IHHmRIV4UWPbPFR7mBLGjivm+HaI+Kw0I791V6TMVWC4utu8GF+KEP6xPNotZZieGfV3j1qPA==
X-Received: by 2002:a17:902:f7c7:b0:1dd:a285:b428 with SMTP id h7-20020a170902f7c700b001dda285b428mr9415139plw.42.1710706700488;
        Sun, 17 Mar 2024 13:18:20 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::68dc])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001db717d2dbbsm1465604pla.210.2024.03.17.13.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 13:18:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Dan McGregor <danismostlikely@gmail.com>
Cc: Dan McGregor <dan.mcgregor@vecima.com>
In-Reply-To: <20240313211652.1799855-1-danismostlikely@gmail.com>
References: <20240313211652.1799855-1-danismostlikely@gmail.com>
Subject: Re: [meta-python][PATCH] python3-pylint: Fix ptest failures
Message-Id: <171070669980.939783.5240084576084182767.b4-ty@gmail.com>
Date: Sun, 17 Mar 2024 13:18:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Mar 2024 20:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109379


On Wed, 13 Mar 2024 15:16:52 -0600, Dan McGregor wrote:
> Due to the way we install ptests, some imports switch from
> first party to third party. Update test expectations
> 
> 

Applied, thanks!

[1/1] python3-pylint: Fix ptest failures
      commit: 0c428fac857d5cdb90862431c34bec1b76bb7cba

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


