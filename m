Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35019C47079
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 08:21:28 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.97652.1703665286172101781
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Dec 2023 00:21:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GDZHEMpJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-28c934be96fso108091a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 00:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703665285; x=1704270085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v17z7ptV7mikOD8o5CJ5HVLx6sGaouisEgzCBC8N0Ww=;
        b=GDZHEMpJBcD+iqDcCowBtl81hceHI1xzDt2ttorLad5fp5Ap92pljpQqalMVPNHRzY
         lcDArV9OltWB9F+RvX+R8NPxyri1gW/caqJtBZDlSTL4VNDFSei7lhbJOfNmQ2ZbRbmB
         ZlPP4qTWTZPtx/H/cCHazLuUxOIAKjHr3kz5BKhdKrFAcV05jZ0ICBYpraR9E2iyR5J2
         /cdgaC3XTCfR2NJ/zYKDoroDAIsCe6SEofXgBZKcLj97Y3z/Y88iykSH2IP5PVoiI+2u
         3msWFjsr5qV2zbKPkmA63wcVFdbaOH74XFI/KjWNQ7ckFDEvy5PaP3yVmSMHtk0HCKRX
         Vwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703665285; x=1704270085;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v17z7ptV7mikOD8o5CJ5HVLx6sGaouisEgzCBC8N0Ww=;
        b=Bv2XMElMyg+NSxfus+5grV/izb6xWScJ0Mrjyanh0Ev1Q8larkg8WaHxW5r7LFXjTz
         iM/YbCY1oPT1vr8MH619km3WCPJw1Mc+tG5EkapxsMnrAP74ekE0YPhbJoyMJ325P2Tc
         p/NRiZ909GW7Wr21vKHHoUU7EC5+azh1DjzNWF/Uw5tFmwhwPrQDGRyTXX3TppVvUylS
         j1kORI1+z4qT8LknN4mte02xJZQLgnw2AvSPpEur2hvPU1EmR11VT86W7umIGSiiUytk
         6qxqxhVLCIHH4oBhT99ipc7a1xx6y7irNmqpjxnB669MYDs2KJAfP6eNVY7ZkmxWQKd/
         vNhA==
X-Gm-Message-State: AOJu0Yw87nLEwl+i2qaBV5tY8B+Vf1ajTX1Ce5wue7UN/ZoQiJZi+of3
	4blI3Tkhmut/JSXYTo5ULng=
X-Google-Smtp-Source: AGHT+IGBzJ+AitxZULypLum7rmoMb2kyWwuJem/VhCJoS6alXxf091izsrkSIdiQFFubDJxO3NeIjQ==
X-Received: by 2002:a17:90a:43e3:b0:28b:99d5:ce67 with SMTP id r90-20020a17090a43e300b0028b99d5ce67mr2072198pjg.11.1703665285582;
        Wed, 27 Dec 2023 00:21:25 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id gk8-20020a17090b118800b0028bc2035c09sm11780177pjb.34.2023.12.27.00.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 00:21:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Derek Straka <derek@asterius.io>
In-Reply-To: <20231220230109.3827292-1-derek@asterius.io>
References: <20231220230109.3827292-1-derek@asterius.io>
Subject: Re: [meta-python][PATCH] python3-protobuf: update to version
 4.25.1
Message-Id: <170366528493.1947762.14733035666606553346.b4-ty@gmail.com>
Date: Wed, 27 Dec 2023 00:21:24 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Dec 2023 08:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107830


On Wed, 20 Dec 2023 23:01:09 +0000, Derek Straka wrote:
> Remove patch 0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
> that was incorporated upstream and released in 4.25.1
> 
> 

Applied, thanks!

[1/1] python3-protobuf: update to version 4.25.1
      commit: cf59d70d6ae237a46ef73e67d1e8b2d9292360a8

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


