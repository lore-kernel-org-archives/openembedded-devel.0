Return-Path: <debrabander@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FE1C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 04:08:28 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.90340.1723608501649243411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 21:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+rrHPMR;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: debrabander@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ef27bfd15bso68228021fa.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 21:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723608500; x=1724213300; darn=lists.openembedded.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O51FQgeiE1XUtz2xuBPjFuCgWxImGi8FpaVnA0C1WoI=;
        b=X+rrHPMRh8MCNTq9NpoSm/iyUD7+0pKaBhsaWVkCguYkkLw+NiMEWqQRXTWbkuqQ2y
         tlaGOlVMAirgDFn/axIvs6c2MOFDSCmY8+8ioVQ6DAbSlBkRG75Odmbixv8kA8uvJiyV
         80UPvtPEtLoExPsEJWvoJZIQjJPfXaE/tnc0iGK4s+GDyubUIWYEnA5xaS3Y0w8pCUVo
         ZUK61KYNXi8MwHBMdJPninY8m0XdhibXNDDKIrGZzXEr/JzFgIkmqJBpMB1wSYdWQQAu
         XrkNdVucSOFKih7H/SUqzpUJSsdImKpZ+bf7tgMMDFeu2bWRlfsLOu3HHSD4RE7DR225
         oGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723608500; x=1724213300;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O51FQgeiE1XUtz2xuBPjFuCgWxImGi8FpaVnA0C1WoI=;
        b=TPBtPKkbU4KK67YNF1zqMM4CImXhrjMuZGa5oicJSQq68BjO2P0IGVn8ytPQx0AXMv
         0B7364/lXC7RD1LIOUq15cgvThtBfgiDNA0LM+N1Jt7DJKgX+gHHo0c190CFXI8aUTTA
         3PTRaXlyxqI5iLHBtbYP4GPiZJWQp7tacEv3ZW2+zPrTDxdVCoR4vNrJevBvFqVtd4MA
         E+lR3YhvJvhc39JVOoYFpt53QmX/Aq1g0xRKtLywKaJW+ufsY34E7auYlrBrzRgromsP
         VkxG82Z0NAaG0NDTYKzlfeICN5bbUGC95dJ47SDlnXywO8SZMbKMEFtqC2CMtAH8a5kj
         t1ew==
X-Forwarded-Encrypted: i=1; AJvYcCWSG4M9b9GQcu+ihleiTaaZD0UfVZde2C/nl4CZxLAQQC4Ev7pDCoVDsHolV0wZjhVmcVr/uSXFkY0E+nffmLbTgXdZQrsZCoNQ7FJNPN7j5px/zbdSKEmCNQ==
X-Gm-Message-State: AOJu0Yz+OWhSbUv6ZBzmfNMYZ4odWgKMs+Ar9aOnw5a092pKFOx4mShd
	s8lkMTVh7p7RpuENfUXynQjKqDDluaBW9o4dTMB+JAt2v+a2P1yJ
X-Google-Smtp-Source: AGHT+IEADp1CFDZvWHlW1T9a22YA76Wyz8PNRKsvFALg7VAqmnlcjCBy7KdCc3SddLi6SxsuYwJYkw==
X-Received: by 2002:a2e:b890:0:b0:2ef:2bb4:45d with SMTP id 38308e7fff4ca-2f3aa1a3c2amr9224641fa.9.1723608499420;
        Tue, 13 Aug 2024 21:08:19 -0700 (PDT)
Received: from smtpclient.apple (148-156-172-081.dynamic.caiway.nl. [81.172.156.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f414e0fdsm122937166b.161.2024.08.13.21.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 21:08:18 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Frank de Brabander <debrabander@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [oe] [meta-python][scarthgap][PATCH] python3-pydantic-core: upgrade 2.16.3 -> 2.18.1
Date: Wed, 14 Aug 2024 06:08:05 +0200
Message-Id: <C09FA63B-2B46-4B0C-9D72-25AAF014935A@gmail.com>
References: <CANx9H-BtPB4RwF1RZB4mc_oV0wzRnicM3TYCw0cvtCGMBzfY=g@mail.gmail.com>
Cc: akuster808@gmail.com, Khem Raj <raj.khem@gmail.com>, dev@g0hl1n.net,
 openembedded-devel@lists.openembedded.org, tim.orling@konsulko.com
In-Reply-To: <CANx9H-BtPB4RwF1RZB4mc_oV0wzRnicM3TYCw0cvtCGMBzfY=g@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Mailer: iPad Mail (21F90)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 04:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111796

So now that master is updated, what are the ideas for fixing the incompatibi=
lity issues with pydantic amd pydantic-core for the scarthgap branch?

Regards,
Frank=

