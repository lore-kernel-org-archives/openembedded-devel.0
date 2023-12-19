Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C15F3C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:25 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.6746.1702967235833293109
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jZLEVOvz;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d045097b4cso15985195ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967235; x=1703572035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sMv0sPGGY8su3P5totJ16A3ckBjQ8fM/2ek2jRBoDzs=;
        b=jZLEVOvzRgnNQAnQ6JzthnAt/6JQZoTNywfYV6QJMeqXCaV5d98TbeSFrWowudJOcc
         Q4IHkJ7LmVDQKu2XrG+/okWhpxPL8oUM9i6zsuWyGQZcTKPfPX9fYNTxYzH+1URPRWrF
         JIu87uAHEpFGWXA7icXy/S1BWgdKEGM73kUZdf/aCXU1Y7bWwG66LVJG4BMd/mzvhbsq
         O9b7J7ZkPth5Gb2Zts8Yi3RDlDwIjYmDLuxYbEWslIzsG9MQ8Jq57pEst4hWb8Uu4kFe
         YxOTBrhwaVpIIPffsYe6K9Citu1EQ2Ge8tQZXVDwWBALsmWr/TB/Ka4PIRI3nZauA/3z
         6Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967235; x=1703572035;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMv0sPGGY8su3P5totJ16A3ckBjQ8fM/2ek2jRBoDzs=;
        b=wsabowJmnIKurNhjy/ZuJjek4nBNX/Sdn2uHxUQCfGaTy/+YpX7YOPWwUkYhXeivb6
         QPkiMDv3tzidvU2jp1yRCbnetU4d5cndYbm6OSHxsuQ/FB7W04K7byodXypGQnVgpBSR
         iNMJJj3zKQ9FbKkZ0gqj8MJWVi7gbyeX5gKC+sDxMPnbo8DSog8usOCW5SryTWunrzkm
         D5FalzsvsTy7YWt3VTz3mdriN+04O+o87w6wlJJhcpIXOFzxNV3XvSSQf14DEIb3F0bS
         y6x7m8SIUdsO+nmCNhvlAYxO92U3Vo/l+5XCklNYiC7sX8HplIHgC+CRZiJRzhCaxacI
         T/Gw==
X-Gm-Message-State: AOJu0YwAs2Gk/B9CXpIofXy+h/3VoSZb6AGazshLfVH8qhw7zmXYOrBP
	9Sum7gQZdQ1RDp0zBci46AI=
X-Google-Smtp-Source: AGHT+IFyLUUKfg5K6YaTCfV/LAsQB4/9q4J3L+8ijskqbL4mRarwP7R/GkLNimsorQyrbQoWFJYHCw==
X-Received: by 2002:a17:902:c408:b0:1d1:c96a:c72 with SMTP id k8-20020a170902c40800b001d1c96a0c72mr12484530plk.49.1702967235205;
        Mon, 18 Dec 2023 22:27:15 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214052330.1209724-1-derek@asterius.io>
References: <20231214052330.1209724-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-portion: update to version 2.4.2
Message-Id: <170296723457.1627685.13504119830153682497.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107571


On Thu, 14 Dec 2023 05:23:30 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-portion: update to version 2.4.2
      commit: 1b849b6ded20bac71f253a0deffc69f1c6347fc1

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


