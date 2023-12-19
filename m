Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCAFC4706C
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.6748.1702967238809167445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bmRox4hd;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d04c097e34so28677215ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967238; x=1703572038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJZi4anudXbse682ZzdUXp0xnsVhkrLyfzd/Ar5sMlA=;
        b=bmRox4hdxaoJSbbeJGvmfAXeNAugXOpdKcvnPEdwNT/TCGH0TpK3QSDB3hqscSvaPe
         uB2ZKCWmAZaRcmOqD1dOxa0WPKRL+8/wdHp9WObXfPDXXjcePoqeW0SO2j+27bbDm+fu
         Italerr9I/L1+RXCaIME3sNE0PnkjEIdEHxeRxWqjTKfwNnm4tS8rffz8TApZbfzwF6W
         JXcXmt0pks52tlsKFkF6eW+88bYwQDLE9lp3zMaeEF7pvGedCuIY6rBrawEcQrL+QfIb
         +M0TOkB6RPycz5tzW+iFr0DNPCurNMySVKF6rKYc7OxLisAoNKiqzGsIZYUYp3XK4jsO
         lEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967238; x=1703572038;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJZi4anudXbse682ZzdUXp0xnsVhkrLyfzd/Ar5sMlA=;
        b=oxiO1uhXCzHmA/1UjnLLf3H1383Fd/f5zBa5b2VLKQNhmHYaNS7lNdcNdbloU2q7bC
         4rGwzFDOBgQ8b8jCDGobcbYm+gOTJ7ZZ3MtyOcV9lJ+P4GGhVRpHOhkj418A4AGAj0+M
         ZBtWFkOXiMrW+CJH/EE/rIxs44u6FX5hlzD7yeovc/r+MlZmOVzr6zuUJJnahw64z9ia
         qnEwIGX92l5kDhfC8JUrrSJ1iS6MTdEZCy985Cj8x/zlyW/e5A62RtrCrCP5BdXwXwXK
         RZzB/jIfxIzsQ0QWVhQAHqaJb+zw55ZLWZo04+XFJUzhzxNe58GJ45QJivHYv09dG5lb
         DdKg==
X-Gm-Message-State: AOJu0Yzpphx3dNJidLwjb+SsdTxIpLSb1ncpV1bUs8ZB55T4QGBC4J9U
	fTlNjF1jLsGBkm4ohZDKMqo=
X-Google-Smtp-Source: AGHT+IGQEmjzNdGBN8wAI/VmVlAqHrNugksmD7f7hrdk+FPYYxs9D5XP1+K1gPo3PMm1whSQ90Tqyg==
X-Received: by 2002:a17:903:2011:b0:1d3:e39b:2c36 with SMTP id s17-20020a170903201100b001d3e39b2c36mr63221pla.58.1702967238240;
        Mon, 18 Dec 2023 22:27:18 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214054139.1220161-1-derek@asterius.io>
References: <20231214054139.1220161-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-ipython: update to version 8.18.1
Message-Id: <170296723749.1627685.17757161390050961230.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:17 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107575


On Thu, 14 Dec 2023 05:41:39 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-ipython: update to version 8.18.1
      commit: 660144e48c82cc787927b59e9a7826595d9c967b

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


