Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31FFC47258
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 02:47:16 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.31451.1704682028619621939
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Jan 2024 18:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKFpEKGc;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3606e2120bdso16062355ab.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Jan 2024 18:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704682028; x=1705286828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ravNBnEaOkL8Odp+atGW6xNjfrEV0QgLP39GfHEKkA=;
        b=nKFpEKGcYcC/Ae/HvQePRH7TQlnxgAbeZWZg/zjtIykv2TJ+xbLAWsgrh3GKNvmcy7
         2d1oF/DCOQdKqWXDXrhHL+o80TbWWRhAmRaCgoPyDQgNdb49Ao3kN5L3krGC8oF4y1EA
         4GpztAuUCug2oA8pWDEXL1gZiAGPYjXZ7cvoEQa2SYs5k8Jc6WTqZjoRZDsqod3JVCpf
         7UQXeilehHKW0NjFF2NwB7/Zluime4+ZsIb766/B8K8JVZO2XOVac7lDNkXv2d/4GNZc
         EsIaF0JdlPN7/BqnDsxhDkFke6R7O6TBCPVwLnhNfDX9dpinigtgiAvm/EqobnCxPqPW
         vjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704682028; x=1705286828;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ravNBnEaOkL8Odp+atGW6xNjfrEV0QgLP39GfHEKkA=;
        b=DR3aDVuVz/I8JdVfPzfjnmo7BkCrKEJR4wwORpHyCpl2wiYFzjnwbthzbZHDdwrxqy
         VWPpn0Dk9s6Mi9EdDFWYqxedLigSl6q/qh8oi4ayv0UACtfI3EbTDPtYWNaPXeww9c+W
         jJCXNw9p2PI3W3WsBUrMHr+XExHWCVSfCPdO48FaNvOkgtTpokNhURA/XtYEbYGIy2Eb
         Bv/ZWT/nqYSDSlrZ9rwrfo82xt7ZdoQI4UOTvjr+cSBLEMexxh75RCgZdw4eSBO1DKj8
         trh90O+h1DA+5OgYzfXSGX83WpjConFsWQSDtuPKcTwj28sjm9xcoqp0dqtoFRr4K/2R
         /oMg==
X-Gm-Message-State: AOJu0Yyk+pBihUBaZgDffd8OFxwsCL3ZaAnqcVsSMEF4TGFve2NeshPo
	5DMYp5wETVIrd0zhozXSeg1+1kJtnnI=
X-Google-Smtp-Source: AGHT+IE7MXW3pKKBzRktPMS73Xr7hto6/132rHvFTmXijkH0VD59q+QZTfBzPS05ZXlSuLu/4I8KxQ==
X-Received: by 2002:a05:6e02:1c48:b0:35f:f3af:3634 with SMTP id d8-20020a056e021c4800b0035ff3af3634mr6374852ilg.125.1704682027871;
        Sun, 07 Jan 2024 18:47:07 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id az2-20020a170902a58200b001d08e080042sm5019868plb.43.2024.01.07.18.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 18:47:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
In-Reply-To: <1704271107-17682-2-git-send-email-wangmy@fujitsu.com>
References: <1704271107-17682-1-git-send-email-wangmy@fujitsu.com>
 <1704271107-17682-2-git-send-email-wangmy@fujitsu.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-pydantic-core: upgrade
 2.14.5 -> 2.14.6
Message-Id: <170468202666.912276.2040772266631904581.b4-ty@gmail.com>
Date: Sun, 07 Jan 2024 18:47:06 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 02:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108113


On Wed, 03 Jan 2024 16:38:27 +0800, wangmy@fujitsu.com wrote:
> Changelog:
>  fix memory leak with recursive definitions creating reference cycles
> 
> 

Applied, thanks!

[1/1] python3-pydantic-core: upgrade 2.14.5 -> 2.14.6
      commit: 45672db184f39030417d8412f0aa0c8589be6a74

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


