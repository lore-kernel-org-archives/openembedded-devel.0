Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A4EC46CD2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.6815.1702967231711773485
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5TOIBl4;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so1569073a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967231; x=1703572031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KyhQVa1bEZClTP9YO3BHRPt8VnrmPNsMHXYBF2+jp8=;
        b=S5TOIBl4Qu18ekCgp8wnUW8uQKg3IAvc7wq7L4pIQ7PYRtExreizW0l9IerCnrXCxL
         qPUgPWOpcYpIWFA61Txl+VzMDy2gSStNyb9dkYdgwtbfQznG8Xpj9vfpI/pP413viVZ0
         hwI0a2yEWcPJAdGwmgFGJHPHcS7WDy7V6bsAUDolmVDPYmqzOIa4DKCGOMH+oiTxSQBQ
         nhjMAW9F9KZzq92hmN1dud+i0G6fi/KsYdGSYWgnxwvC914TPK5Tgto46dmNbrUUGl7U
         KbtWzBH3x7en7sFGbiuVDYlmunPfFmGTmvtX1JRey4l42g5qrwI8w2Ua2GjafUp7aqLT
         6zrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967231; x=1703572031;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KyhQVa1bEZClTP9YO3BHRPt8VnrmPNsMHXYBF2+jp8=;
        b=ejTZAFCaAeXe9UIYYcTwa1vX7mYEMMKndqT5o+58dDm81vmJ+PYTdPmTC6CIuGlLzD
         MZKQwGccZEi8hc89lbGeA/nLgLfy0ZcjmaEd3lxytLU2TkkePFnd3NSepshifZaVlkoG
         Op6jrKQMIgmxyRvSIam8RNFs7qW4qhmyYDcJ21W9VTgYfadPOQ8vikiCXNdoOBC/NT4R
         1wO5MR4tJJLZvhFj8Cyck8WH9L85LJ8UxURNsSiRxe5ddxTI2avD1JUntyCVVp5cjOjI
         R9eFQIb/XwxdSZ5uxWjLZHky7RMbRcRz6RVz0JrKejtAJd3mMRP2N/vSN0kwigYCLSnN
         PrPw==
X-Gm-Message-State: AOJu0YzJPnugN+kD9wOEjO2JZaPRdXDqli4YN/gdd+JqQFMVVlOEjJwu
	Kw9m9HfpLR4Rqx7UfCan1qdNvgC+zIE=
X-Google-Smtp-Source: AGHT+IHHZyrDMeW5ZmmK/nwBvoMtus/QdOWvj/wdX2RDgvHO62OVasxjzp2MtoMt9Lf1W6LvBKYJ1w==
X-Received: by 2002:a05:6a21:191:b0:194:6045:43b7 with SMTP id le17-20020a056a21019100b00194604543b7mr1635735pzb.52.1702967230955;
        Mon, 18 Dec 2023 22:27:10 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214050035.1189572-1-derek@asterius.io>
References: <20231214050035.1189572-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-distlib: update to version 0.3.8
Message-Id: <170296723015.1627685.4957561247173510033.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:10 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107566


On Thu, 14 Dec 2023 05:00:35 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-distlib: update to version 0.3.8
      commit: debcb9a7d0dae91ddf6955150addeb9b826cd82f

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


