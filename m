Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70508C46CD7
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 06:27:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.6743.1702967234235069681
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Dec 2023 22:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcM3okh8;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d04c097e34so28676915ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Dec 2023 22:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702967234; x=1703572034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoGr87TP/uprF8hFPlG/PIu37nzgQbgsDniO9OCSaTA=;
        b=gcM3okh8gf4SLBS+qT9tAepQokNYP/gzjZwVdt/kIuNo6/3DdFGFM1aY+9y0SQzIZl
         Ol1GZWQ8VM3WpVNh28VIVlB8RHQr8JW7AqlMn2HOGFBzAFMKGwxxCUkqhnri7oDnala5
         CMupVcBcHPjebRg0GsDSmUgoCqg17pOHagITJ2eTuBusAaw88sePUSZFKSR28GiPDpzo
         QvbcssoaeOVXPtKzKPxYUc/nt/om5g+GY9cRFUNQfE8ID8TB3qQQGlXv+bS9lho2EmiL
         C8vwWc+59u8xsCEsQBRE6I3cLEbCFYtIn+9clCCSPC8zl7C3OFASsQP0nhZ9v+er+Xe5
         q+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702967234; x=1703572034;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoGr87TP/uprF8hFPlG/PIu37nzgQbgsDniO9OCSaTA=;
        b=IEU7SoEMa9malV72cdJl88seix67h+kHZyP7zutbs8H/suN+/t40WBQ4WprtmzCkw0
         7LtHZibOcFp1b5VhvictW57I+ljqKtErY2mO+KGA6U9RJ22sZD06y8M+2Cu/9kSDdlT5
         oaZP++uKn4RZoOc9q/JliUYtGwIprt+eaWCmfxhFS8LuM+2OHiEDp4a44XVzrb/0f4kp
         z5o+WeI/Rc8UQRs97nqPtebHhanqz3kWS9XD7qf6EKd6UO7GL1mUuqqS7ZLAKwJ5zbej
         0pPd96vYEZPyJ0FAhYXBrQjzoLXJMbuqp9EYWCn5gbmmZmI7CBUfhywSzwRatl2G1g50
         65vw==
X-Gm-Message-State: AOJu0YzgO4D1nkj9z6GhzKQQ/LDqiuqm89AnvlwPD+s7cBIlo5cjlmhW
	MAnjY6mUvIJY3EqqQK5Cm4nRXbhQMzU=
X-Google-Smtp-Source: AGHT+IG+zXz5VbJ96qMv93AZTP6NADWIqckp70c2JlxqeUr4IUDG60gxEXMeyphqRAOBOus5qCjnYA==
X-Received: by 2002:a17:902:930b:b0:1d3:d2c7:6797 with SMTP id bc11-20020a170902930b00b001d3d2c76797mr637373plb.65.1702967233620;
        Mon, 18 Dec 2023 22:27:13 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001cca8a01e68sm20040524plt.278.2023.12.18.22.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 22:27:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231214051656.1206600-1-derek@asterius.io>
References: <20231214051656.1206600-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-bandit: update to version 1.7.6
Message-Id: <170296723279.1627685.14977772449942774240.b4-ty@gmail.com>
Date: Mon, 18 Dec 2023 22:27:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 06:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107569


On Thu, 14 Dec 2023 05:16:56 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-bandit: update to version 1.7.6
      commit: e028b409ea999b4bf5e6c015d57d604e997c7345

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


