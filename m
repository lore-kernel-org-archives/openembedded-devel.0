Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C76C46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:46 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.6829.1702967260840717373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PIOH6Wta;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6d3165ac96bso1265006b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967260; x=1703572060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etKAOVqbgngbcyVpg+ZtTDU3lw9LT/8O/BKMicoAIZQ=;
        b=PIOH6WtaRmd1HlCHq9i6tvRZd8Ev1VsSqTtb2RH23IyH2pxas19aaeaq1C0Snj26y5
         MkCrGcpyryXL2U6mOrOEfkEWZ6YCerSXd0gqJ4CMeNAYJfXxwvFLTd+U1VWBIUn3jVP7
         64thZ8UQvW++xagkaK7WgVr0Nu/eC+FCSW3lbnxxXwQVOAcAEsM1SjnpDAAmfE6dfpUB
         3CvvWEXlFe446eTf7TlU5Vz+aqYLwk9t6ljC6/qquMP6YkK3g7ldHgWyW0ytJjCCCsSM
         TxX9ac+qo2UNUXoUm67makIYHuQwu6UnqTP666iG3U4OhRe+bVjRmYimSSIU/VG3hHnq
         3AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967260; x=1703572060;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etKAOVqbgngbcyVpg+ZtTDU3lw9LT/8O/BKMicoAIZQ=;
        b=TJXmUmeyscxb1bbI0b1XzCDp8/IpNMjZ6x48a4tI6B7CK7g8wtYvZjyu2oOFW2Kw6C
         IBglb3cAtBDW7qn3GFYy76DILQ6ByZjLHY7utWXuoiBx6ZRzjfdkuHFRz/OlcaIEkbUe
         A1aUQ6EO+nFB61s/zj1jY4UXTe8bbWFPGmJpCofyflxi3N4ecdaEqFRyjnZSVulxtvx/
         txCN2MUaoihLys91vInQ1WWH4JUn+fVaDu6IresUrxFllo38iV59GLmrmaSTqvDhp6iV
         ++0QYdJCkUQXZl1qGoPCc8KQ3flSpVMm2On87E3poUviWbchHbUQpFOguVmQ0jsdLeiz
         T80w==
X-Gm-Message-State: AOJu0YwZgdw68zf4xAuxRbXWLCS2tDGBvdH9+I4TrMP6cChlA3P8VwXb
	OghegyYsB56gAnTJVsH1Xqm+N4RmC1Q=
X-Google-Smtp-Source: AGHT+IE+sfmTQxcDopScoi1cUaX1JMzTUyYtJVMTZ1g6rq77DbcQqJhyMuJlhSJXWoPuJEQW/y7aWQ==
X-Received: by 2002:a05:6a21:1f03:b0:190:36c3:afd4 with SMTP id ry3-20020a056a211f0300b0019036c3afd4mr8280960pzb.112.1702967260289;
        Mon, 18 Dec 2023 22:27:40 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1702599458-1577-1-git-send-email-wangmy@fujitsu.com>
References: <1702599458-1577-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-fastnumbers: upgrade 5.0.1
 -> 5.1.0
Message-Id: <170296725912.1627685.10084585026898895744.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:39 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107599


On Fri, 15 Dec 2023 08:17:38 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ==========
> -Added the denoise option to convert floats to int without numerical noise
> -Support for Python 3.12
> -The changelog now only explictly exists in the repository
> 
> License-Update: Copyright year updated to 2023
> 
> [...]

Applied, thanks!

[1/1] python3-fastnumbers: upgrade 5.0.1 -> 5.1.0
      commit: 236bf067d420b1a7747697989a06735f34924fe6

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


