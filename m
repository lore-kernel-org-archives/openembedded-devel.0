Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8319AC3DA79
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.31072.1702451254993720619
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LYt80BPr;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6ce72faf1e8so4109573b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451254; x=1703056054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIOl6LUR3wC8ZEMCz7sGwavIGKk/49r9Lv/ZU+KU46M=;
        b=LYt80BPr0wm8xcwLLkLlngbIwbr1A6mmvdV9qi7MuyYa7sXTCCWjSz+MR4UfRFQK+z
         gMfM4mgQxglP+RvAVOvlDdBGtoX6LrFJkvfyx3Z+CcLcBDIT61VcgyugDASp7kt1Hp3+
         QJP76Bs4tYwx7V90aTYcjpWt1On8p/tE0KSKB2DN27jCvSd44QmkotNFM1PI+otygI6f
         JNitns9GHDzSw9mjdV1+TYmIoZ3MaeXQrvrlffGFLAxIQHJzmb4+S74Oakcn5p1yXQ2h
         l0okdf+wgFPMLxTOw4e/j9JqJOmRK6ej+Mo+fmP3LUwIZCbMTWAjGigGwiOSgtNTculb
         3eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451254; x=1703056054;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lIOl6LUR3wC8ZEMCz7sGwavIGKk/49r9Lv/ZU+KU46M=;
        b=GLbW12st6cbLt74nPgS4qzV052oXvX2IcOJgAGT9lVBvAdeCyeoX3L9v3Cgm4xXkWL
         eg5wjGdemDLkL2j31VnYdj60cNb7R/AZnYZ3/hWC0aZPVVqXG9EvszNFnzLvVZGednoM
         p8Qm0lyEQBQLWtKjryXaPcniZ063feQQ6GA5FOMax5M/S0aa7iDW6GX4QUtRfYKRRjsz
         AGTilNOfzCNhiY8+DVMERsf+FNaaOwDWCQHjg7jrba1a0D3uOOKOWQivipgN0rfLgyWZ
         k7noT4LgzXPmW/RYvF135Zzf9TWQ1AhL/ILdYAYVCNY1yXEImCw0KnqXcELAsyRIS/T1
         QVIg==
X-Gm-Message-State: AOJu0YwobmxVNqyIAh5EOP7CAAJHKbVBf3POF5FIWEnbK+z9QDIIjgPj
	oz41WDyANpqAIF1q9J6CI49LG7BfIBY=
X-Google-Smtp-Source: AGHT+IG9m2DHwPWncp1IER6kB8z5jTbVNqT/uaOSqrHBTmXW45lCxmlmfdRxP5Gapy2bhvinvQ9E+A==
X-Received: by 2002:a05:6a00:2286:b0:6cb:b7fb:931f with SMTP id f6-20020a056a00228600b006cbb7fb931fmr5145397pfe.33.1702451254146;
        Tue, 12 Dec 2023 23:07:34 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 "Theodore A. Roth" <troth@openavr.org>
Cc: "Theodore A . Roth" <theodore_roth@trimble.com>
In-Reply-To: <20231207181128.2870223-1-troth@openavr.org>
References: <20231207181128.2870223-1-troth@openavr.org>
Subject: Re: [meta-python][PATCH] python3-flask-sqlalchemy: upgrade 2.5.1
 -> 3.1.1
Message-Id: <170245125311.133993.8869837498385066395.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:33 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107373


On Thu, 07 Dec 2023 11:11:28 -0700, Theodore A. Roth wrote:
> The 2.5.1 release is not comptabile with python3-sqlalchemy 2.0.23 which
> is currently provided by meta-openembedded. This results in the
> following error:
> 
>   root@host:~# python3
>   Python 3.11.5 (main, Aug 24 2023, 12:23:19) [GCC 13.2.0] on linux
>   Type "help", "copyright", "credits" or "license" for more information.
>   >>> from flask_sqlalchemy import SQLAlchemy
>   >>> from flask import Flask
>   >>> app = Flask('foobar')
>   >>> app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:////tmp/test.db'
>   >>> db = SQLAlchemy(app)
>   Traceback (most recent call last):
>     File "<stdin>", line 1, in <module>
>     File "/usr/lib/python3.11/site-packages/flask_sqlalchemy/__init__.py", line 758, in __init__
>       _include_sqlalchemy(self, query_class)
>     File "/usr/lib/python3.11/site-packages/flask_sqlalchemy/__init__.py", line 112, in _include_sqlalchemy
>       for key in module.__all__:
>                  ^^^^^^^^^^^^^^
>   AttributeError: module 'sqlalchemy' has no attribute '__all__'. Did you mean: '__file__'?
> 
> [...]

Applied, thanks!

[1/1] python3-flask-sqlalchemy: upgrade 2.5.1 -> 3.1.1
      commit: e351a50f8b001abe5ee3d92de5d8f173b74f758a

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


