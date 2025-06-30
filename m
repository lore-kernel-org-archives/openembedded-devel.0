Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D87C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:53:09 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.35660.1751277182140184604
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S2YTyFh5;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6facba680a1so23351086d6.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751277181; x=1751881981; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1sLa0m2mpsgZkiGMeY2N2pOecbnVvj6/GgCBlT4ZpQ=;
        b=S2YTyFh5Die+Fv93Q/Z67DWX0BaEppblqW/0mtdkMAhQVLeugS9L3CAdCsVkv0UaE8
         XSLwpMzGJpEbFiUwVf58xqOxX9jvCPuEWUSKIxQc7+/0VoyrgIBBmZXxgGc/EJYhkuWV
         rTQ2XSz/fMISvLNFGAq/xEm1lO0XoE1nUnALdciC8E5FEdISnbci+2Hv1o5n80jvlHxk
         WFHL9FHBmZwj/jOHRNGqLLNvPVHJkhWeZ5FzkY1ussyf7n6a1p6Axqi/gERPjA9mRgXe
         nae3QSebEMofuKAaHfFllTCENQ/SxsoDEr3mkf8v47cZIE2U+jformXqyK+ul+MOKO1k
         orZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277181; x=1751881981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1sLa0m2mpsgZkiGMeY2N2pOecbnVvj6/GgCBlT4ZpQ=;
        b=h9aMSJmSBImyYq/ClZRDedTmffzWzmUHW/mV0rnzWzdr0cjS/Swp//7rUOrQ2dnpJs
         oEQDszS1S9kWKkyGW2X9uimX6T0pI473vywgPCNehzxIKa8qFLPEFgFvwg62u31+I/gW
         tCDMvGYpLm9WQFFcj1YFENGt6D47h+85dAFZN47l6k9pKmchXs0zeoiNhQvJmddVntoy
         pU8N0SbVsjPuLN29ed+72Ege8RAXwd3vdt3jFAq2jJciALt3eukTc7Bgn5FUffasQwxa
         KWW2UpV40b1D847buDuoPpKIhGnyu7VrOo/VOSHhH/zzve+2SCnHjvtBNh2P6C6r4QMf
         D10A==
X-Gm-Message-State: AOJu0YxpmqfjsCWWkwLACQ/IxZjj5OQw8RYZSs/oJrxQsmfzWHnxyk5P
	A0QXNgP6Y9BJ1g9q2UNp4Q7yxpv7kZxRC0fQ9kjdjyAcpPf3+ZG7aGXbEDNFuKcxuNY0bDbi8q0
	/Z39uSDFA8/yPnMGmNK0+GJeOvWEuFyo=
X-Gm-Gg: ASbGncvRxyuN21hJ22EtB+XNm2MkyOH8BNtF8HsaxSo6EzCBYkFWDZBdlWsieI4/mtD
	d3PcE8B565oXV8UY6PocifiN0+ahQMGpoCphI3qeiJhyoaP4FSAkK+VaejBCKhwat8z35byj1NN
	yD1qBO1Hy6AseJYN0erP/Oogdc2mOr/vFSXQlfPRS7C/SwPhSgCMBnOu67T2C2OFZV+TS96Aoft
	rTt8UZJYxbEkp5l
X-Google-Smtp-Source: AGHT+IGWTfhJBSRPMbnOcli4yUJEifiv6MjdQkndeXWqf79kTnNn9c8Rz4HcozS6+cbt6sdqgK4l8e64krK1RihaULQ=
X-Received: by 2002:ad4:5606:0:b0:700:be2f:7f19 with SMTP id
 6a1803df08f44-700be2f83e4mr150025766d6.18.1751277181104; Mon, 30 Jun 2025
 02:53:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250627140633.354460-1-skandigraun@gmail.com>
 <CANNYZj_K1AT8nov3Wz30bUVdReE=c=DNvgKEQ5tKAygVb1MshQ@mail.gmail.com>
 <bd09d601-b551-4621-aa6d-ca9d05473280@gmail.com> <184DC9265B92F2B0.11405@lists.openembedded.org>
In-Reply-To: <184DC9265B92F2B0.11405@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Jun 2025 11:52:49 +0200
X-Gm-Features: Ac12FXyGN1sGlGm51RjGT5lfqERdq88jkXKa3i2cDW7ROQ2vIMHrZTZBYVUeGFk
Message-ID: <CANNYZj_=QnNqgsqLw8bPQ6iyaSSUmofvU=d3gC6+3SGotLQ1aA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nodejs: inherit qemu class conditionally
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118174

On Mon, 30 Jun 2025 at 11:49, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> If you're unable to reproduce on demand, you can't confirm that this
> patch is indeed fixing the issue either :-/
>
> I can try to help you, but only if the starting point is specific
> instructions on how to see the problem, otherwise I'd only get
> frustrated at wasting time trying to get there first.

I see that Khem has merged it. I still do not think it's correct, and
I believe we need to revert and look at this properly.

Alex

