Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBB9C5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 03:50:55 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.43625.1700452250914621553
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 19:50:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FCRyWfsR;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1efabc436e4so2498959fac.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 19:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700452250; x=1701057050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keNDgUh/bf1Y56vnZRMcNvDC+Ej9JGTc1YDZ1Q1hFQI=;
        b=FCRyWfsRI8kM9l27GKrY171yL1ewCvOSFW4RN4MXuEJCq3qCrCyzu2KjPrHGuR3BPU
         nRXUwbh07SejlO6edtIMFPPUr5FErZjK4kSH7KHZCyq75yf9P/acMy4138wX3Kv+BdGg
         Vay2EQxzNexlAoEBDSiDHb2Hg/RixXzAB6PgNMQlkqp1rkLIO3UYBmpaLTe6q4rpiDwU
         NoSW0lXD3WU/LnqiILwU0yX4snNUg7KA/Lf3VKU5CcqdW2EhAHNqKQ8Psw5rN1jsaCIB
         yppwX+h5iOFPrHLoAcrGou8YP+ZZ4OPOMphdPV/BuuhqLduu2w6f+4inf2yz2EhV/Wy/
         bx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700452250; x=1701057050;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keNDgUh/bf1Y56vnZRMcNvDC+Ej9JGTc1YDZ1Q1hFQI=;
        b=d9hKT1yj8rJNZLA/FtovhKq2MM5110jLyQQArXfA81/rsdr9HKJc0khAac/V2YGTX6
         BjvTuNiHxUVCrYgaHr+X5UYOKzMptYQA7iWXHSNld89QVDPYz9Hrp6AeohFo7JG8wO1Y
         vtG2rmv4mz/v4fnT3aTtIsjSvw7bQ2gme5xp/14QHtDsoasOV3tsfgIXjLjVu87445TP
         0oqSlyzxT7jJL/XVqIaIBFR/1QHFv51NHCzCOb77YnRtxu4L6Tgm10fWG9n/tJmLxu6u
         MT9OkUnuoqrZ8Vwn4VGMBdwasFm3SSgRAzcYm15P+G4k4i2LXvekwBwtkTlBkRnjdPhh
         JkgA==
X-Gm-Message-State: AOJu0YzMVd0/qv/l2I2K5y9xTCtySHOFg9od+X3DbRB1uDVJTek3+nul
	b9n+TOZ8ao/lEeuG2nHC78DYFZgOJ5JK0Q==
X-Google-Smtp-Source: AGHT+IFEehr/d7qat+eyIexlg2zC6ypkW+Q009zvhRj7Qb3Ih/HRUebvnZGqxoSHuWTxh3sjk4uqRQ==
X-Received: by 2002:a05:6870:f812:b0:1f0:1c00:d860 with SMTP id fr18-20020a056870f81200b001f01c00d860mr7198683oab.51.1700452250047;
        Sun, 19 Nov 2023 19:50:50 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::b319])
        by smtp.gmail.com with ESMTPSA id a34-20020a056a0011e200b006be0fb89ac2sm4954381pfu.197.2023.11.19.19.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 19:50:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1700122209-21889-1-git-send-email-wangmy@fujitsu.com>
References: <1700122209-21889-1-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-awesomeversion: upgrade
 23.8.0 -> 23.11.0
Message-Id: <170045224895.1416826.16529263832775954334.b4-ty@gmail.com>
Date: Sun, 19 Nov 2023 19:50:48 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 03:50:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106907


On Thu, 16 Nov 2023 16:10:09 +0800, wangmy@fujitsu.com wrote:
> Changelog:
> ===========
> -Update lockfile
> -Set checkout depth to 0 in codecov action
> -Force string when checking diff
> -Add snapshot testing
> -Allow PEP440 to access major/minor/patch properties
> -Remove diff snapshots
> -Fix sections property with blank string
> -Remove base class workaround
> 
> [...]

Applied, thanks!

[1/1] python3-awesomeversion: upgrade 23.8.0 -> 23.11.0
      commit: 609f8d40b4b08ab86245680d9877bde61f2102c8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


