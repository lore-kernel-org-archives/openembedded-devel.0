Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC2BC47258
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:49 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.98066.1703665308909665779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X2JOpkYw;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28c2b8d6f2aso963516a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665308; x=1704270108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOw5blkhOt1C+mHIYJAlEWg8b9swQvimKz5sN+t6GAc=;
        b=X2JOpkYw5ucPBujAdWp9ABn+4XcPmuuyswFG2jfPgtIMexRf86t+nn1SIqmCfS3B4R
         ucj5y8r9ql3h7v2q5xmd6DSfSIxMlcbeetZE58T2H118E+eiMzMkKiVMDJ89kT6A13Q+
         JEMil/2MGyePJxY39cJs7KSvPw8Syqu1Yi4pZIZpFssO0OIut4bz+4WPF5jJo9M7G3gu
         1uijULF7jTXgImSxaT0INCgTm9Kj6O7gSwcRy9J+lGcL4cPK+2IRMLFBCO/AgZblQCOE
         3MLdH3rzuB2laemlLfKxjAffOSjW8WNmJFqpjK7Ylcnh1+Rt9KC2Q6CFC/9aWZqIopU4
         vl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665308; x=1704270108;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOw5blkhOt1C+mHIYJAlEWg8b9swQvimKz5sN+t6GAc=;
        b=NP+8iyFTeCP24BTJ4SWkNjmLIFsbmzp5nmp2UJJ9lhZVbTsd7bgZibTvr5QocNBnso
         FI7ZmZr1Dh9I/YCgFjAAuxn3dAXK3y7FyVQ1yuknotKMISbRFB58+27OmcOuUEQARkm5
         N2J9yXUzfxf3rnGZ4pcBxLvvwIjvAb8bGKLodL+BLzue09dkHjsvu1MOUo1hytVeDL6z
         NMqvkAtIVRUp3RhgZ2LNJ9imDdtt+g0uT0OlVkFV1wKyW4m49poRC9PORXGinHomrdQ/
         FYKgkHUcqv5tc3ApeSIN7H76CS+U44a81mClYGxVCsZ/jQTUJqantvm8cWkckDU4IR6h
         2Lew==
X-Gm-Message-State: AOJu0YxyWQalRXLE8seN8wzCpWJjiyTaTSNlvto72WJc1jr4+Nh3FsC9
	D4WUXDj4NxNgR9v7qqUkyKI=
X-Google-Smtp-Source: AGHT+IFtJILFYzf48zvCjRy+TEKO+YXZBS6f1CUvXQK2+8R4rFNROG/noArbrfuD4Xjz08gLpiq+fg==
X-Received: by 2002:a17:90b:8c5:b0:28c:9093:b0c4 with SMTP id ds5-20020a17090b08c500b0028c9093b0c4mr147027pjb.43.1703665308242;
        Wed, 27 Dec 2023 00:21:48 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221183408.3923439-1-derek@asterius.io>
References: <20231221183408.3923439-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-gspread: update to version 5.12.3
Message-Id: <170366530746.1947762.12641531452211446001.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:47 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107855


On Thu, 21 Dec 2023 18:34:08 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-gspread: update to version 5.12.3
      commit: c89f9d0a833ab3a4e0c7c0fdae987572cdabaca5

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


