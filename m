Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62145C46CA2
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.30703.1702451253135646300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LdwFYSk5;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5906988ab8dso2779953eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451252; x=1703056052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nEU7puFR2czlm5twSaycV2KqdEcWO9/s8FRUYdcjtPM=;
        b=LdwFYSk5Jg5VXC47tMgh4YYNUpc58zJH45ViM7EI2pS4uxD3nm09EOK0JuExCP9kvq
         fKnT8jniLhBaozE+pDrM2/juvEnKDDCl783gvkKpcMEeeke02Q3TUrWx/oAAJBa0V1YE
         ZdRlYAMRw7DWZC2J8qIoWvN3pq2hXQBvCri7juPOktraoxCHswZVWCkUX4HbbdhPFzfd
         XU9qucUYDN4wBeTx7Ec4a3bH2kI/Q8KLqcAXgCtIPsAuLUxdG0SPpvj1GhEgZ64zQtb0
         x449UlNSUla+NJFIDg+9eaIB68CRmcy98GClyef0hzfBTKrf0E91Fff+LFQLfnDtxywh
         C3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451252; x=1703056052;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nEU7puFR2czlm5twSaycV2KqdEcWO9/s8FRUYdcjtPM=;
        b=mVUtkRdhP81SgBntAI20kk/10g8VDhs6Ey7X6ZWmf7xEmupUad0tQ77Gje66i75VIs
         0uJdUq7x3/nxZ9aeBDdxc3GpB7KMVL7Zr+rvV98vPoWLcgITnMeFHXhisX8WDW2mN/CY
         BJh83YMvdFeebWHwgZIAo1O1ExZeKgrm9QZfWfM/KBgcu2uq7fXh7EVNkJVkAjevv6Ra
         uSn0m5RL9EHFUs2C7IfBDOZbC9Ha+iq7XyF+xbtdMFFKqMqC0z+BaaDuUWrUqiPWJoO/
         sePPwCdaVz0yO0tLd9tW2UX5dPTW3O5/2q2AIEstkaEX3mqjm7pAP+GkdDjOrbthT1tx
         N+/w==
X-Gm-Message-State: AOJu0YwAo1GNmgW9zBQlS9jn37Rn/BW5sAt0cdsyCM3dsH40crJ79etS
	0Hqkfia6x3P2nmd3WljOWtVMOFht1Q0=
X-Google-Smtp-Source: AGHT+IFC4fx75OoM57itUDNKCNzysDMNDHfPnlDIpK6c50As+EPupfE0k6gGVAX33GOGbPYUohMn9A==
X-Received: by 2002:a05:6871:60f:b0:1fa:fcb4:2771 with SMTP id w15-20020a056871060f00b001fafcb42771mr4642858oan.32.1702451252153;
        Tue, 12 Dec 2023 23:07:32 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231207125614.1390970-1-alperyasinak1@gmail.com>
References: <20231207125614.1390970-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libxaw: upgrade 1.0.14 -> 1.0.15
Message-Id: <170245125147.133993.1190559839983954399.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:31 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107371


On Thu, 07 Dec 2023 15:56:14 +0300, alperak wrote:
> XORG_EXT tar.bz2 removed because not supported in the new version. The default value defined in xorg-lib-common.inc will be used, i.e. tar.xz
> 
> Changelog:
> 
> * configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
> * Replace calls to index() with strchr()
> * Add .git-blame-ignore-revs to hide whitespace commits from git blame
> * Remove "All rights reserved" from Oracle copyright notices
> * fix typo in XawMax parameter in GetBlockBoundaries
> * Stop memory leak in error paths in XawTextSinkConvertPropertyList()
> * Stop memory leak in GetResourcePixmapPath()
> * Fix ctype(3) users.
> * Fix spelling/wording issues
> * gitlab CI: add a basic build test
> * Build xz tarballs instead of bzip2
> 
> [...]

Applied, thanks!

[1/1] libxaw: upgrade 1.0.14 -> 1.0.15
      commit: 97f91bdbb0cd1a52f56ad9d3a6ada15e6f47a213

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


