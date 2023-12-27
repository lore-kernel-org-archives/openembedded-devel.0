Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C5BC47255
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.97667.1703665311471780246
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EoAq0w+R;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-28be52a85b9so2418267a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665311; x=1704270111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gdBwcMkylAn74b9YFcK290XuykkzTRPUTtMYpku+Xc4=;
        b=EoAq0w+RcebMtK+r3DS9IfyzgqW4pv/fi4xfCH/rIDljgdNmhedjVJWX04l5O8ujVi
         kl3N+pTErdD+3M7vFWtYGniHOjpqxy+6rRfx+stzeUfkAkSZrh8sBTvwvYQSi4srmSEm
         mingPBqC9ybslAB/hjs+mpSqBKoZxZZta36Uq6EDZrQ5NCxzx6G8mOu8qn50ZmR9cdV6
         0ms7RBxpOMXYVAKmjgWmTsvH2KlnhL+R1u9I500dHubWrLULxYuC0nG0biZmbzIGPnKF
         alp3YQhapqB+4RnrC6IT6PqWuhlLJxE6TEsK+GgOEyU33b7lVYkO/6qS7PdyrNdagcia
         qFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665311; x=1704270111;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdBwcMkylAn74b9YFcK290XuykkzTRPUTtMYpku+Xc4=;
        b=wC2mDBONfB0RN38Wbp8tBSWkXQzzdLNCTQfzB4xzCX3oiQ4vKBgPiu8aGFydF7RCBF
         mtO32WBLHFCUUDnry97RVI0bhL4bfG611HZHShIdXGpgLjhRl9pKacdN+MNTKDtCwRta
         cjYXli8gevEf20uKXGaPXyi2kmExue5+q04spSRN8Hj50i86oE7wvSIScbK/lgLuW3XD
         CsFbLyRj80XnfiyVJ+65sMDatb1HMoGGz5PSEgfMjFZOMCnwIowOwq0btd6HeOayc79l
         KZ1KjL/a9bvfycNEKulGGhYVGNmtS7FyuZPw2pjYAwPJtLud84lUANE2oTimcJPbXyBS
         qJoA==
X-Gm-Message-State: AOJu0Yw4D9DE0uGgrAMrpijKOPmHtUTfG/NPtNSavfl/8c4ZQn7sxczz
	u8QO8ED+Ins1ZEuag1Qvqcs=
X-Google-Smtp-Source: AGHT+IHcoVnqsfVeSOqEYv+K3q4A/YqMEtQ6rrvfFcFHqe65dJRA9yFNwmVoiOmjmJpMbjDNZkQRJw==
X-Received: by 2002:a17:90b:4f89:b0:28b:f368:9a85 with SMTP id qe9-20020a17090b4f8900b0028bf3689a85mr2435187pjb.92.1703665310857;
        Wed, 27 Dec 2023 00:21:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221224158.3936559-1-derek@asterius.io>
References: <20231221224158.3936559-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-constantly: update to version
 23.10.4
Message-Id: <170366530996.1947762.16925042727387223302.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107858


On Thu, 21 Dec 2023 22:41:58 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-constantly: update to version 23.10.4
      commit: 82153598816fd56e9a2040ec027ba3ab5bb54d32

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


