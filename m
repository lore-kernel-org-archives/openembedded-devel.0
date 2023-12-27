Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C853AC4725D
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:59 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.98068.1703665312287704600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b+siS4pl;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-28c7e30c83fso500607a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665312; x=1704270112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjbLIe9gx4n1EeyMKfMue2AmIBRZv/PY/5348icHBa8=;
        b=b+siS4pl6pNipeRWaUyQCPXq31BtrgE9tBPEoUGt5lYtKgsKa3Qi5Pse+DImSflZDQ
         dVFL9iXmdk94gs5Jbu72NuTEt32uawT4nrHNzqWoZxNOIjVtri+ywkM4oLUTluUIJobf
         7vIIGZpoMGs94niz80Hh5fGLGuB66ELydO2RUyjX6cbt8rIX2eZbA1lVfJmPwWf6Em1O
         ufKqL4BnkddriRgVmThleNL1gc5YCIMSTv4d8IqZG63RpnqxTFYO/nwx5p8AnZ+ZYWpv
         2TNOKikSdxxJPN0iAf84dBVlUTTu3Vm9o+NF1CbNtwyWp+tOpNV89E3LTYb6gDkHcA1L
         oYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665312; x=1704270112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjbLIe9gx4n1EeyMKfMue2AmIBRZv/PY/5348icHBa8=;
        b=SDevcVfbFuC2CZ5g4czbHlnJPl6Iv2kM55eL18H+FR2hyh4CQC8GxOsa15HAjfFfsl
         DjkDcNkxhYPO920s3b7K+mNGg+4+ib7TeRxru+XofqOwNHTPOMGd+i506efoqlzEIkHf
         hUUuKrz7+hN2ggtnjR/vja3YMpLj06A7r8hDXjpe6Z7kGLbp/9MIV87wG+8+qstrKmVe
         pY+IYbBfJkPpk4T5rJVclZm+X5iu09H2VskEB2IIDveEI6nTgMpkWpUW/5HC6E/QtMTE
         e6lDWvWzXZZHhD4v5nDDhw8jC3raQh9yvgrzP2v6ZHJeRKM3WhizcRFY7IoYM3rh3nZe
         FDog==
X-Gm-Message-State: AOJu0YyLJog7oCscDXVDH2otv8sl136bsQniji7RLAfqYHvJO9Qb4WoX
	40PyQQMq06X9zYgBMwmd4j4=
X-Google-Smtp-Source: AGHT+IHT985XGHOEwhDuImMoUl2siK/9ZyyOzp76yIcB9zfuzT0lbNARhvSsicuYJoyctKTZugJWLw==
X-Received: by 2002:a17:90b:30c6:b0:28c:7fe8:927d with SMTP id hi6-20020a17090b30c600b0028c7fe8927dmr516724pjb.23.1703665311733;
        Wed, 27 Dec 2023 00:21:51 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231221224359.3939073-1-derek@asterius.io>
References: <20231221224359.3939073-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-mypy: update to version 1.8.0
Message-Id: <170366531099.1947762.8807222516298738019.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107859


On Thu, 21 Dec 2023 22:43:59 +0000, Derek Straka wrote:
> 


Applied, thanks!

[1/1] python3-mypy: update to version 1.8.0
      commit: fbf6d4ee53212a36d832fa2361ea1d4e58d0be6e

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


