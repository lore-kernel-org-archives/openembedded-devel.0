Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072B9C07CA9
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:55:49 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.14529.1701215743229434950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyOmE8/7;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-285699ebabcso268353a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 15:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701215742; x=1701820542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNJ8ZcT48ikXiu3aEfv5Bxm10JNZkDqYPbyzcMKvX4w=;
        b=IyOmE8/7AeMWRyXQB1HGgd9xxk8dewoj71NGiekXoRYc3l8XtFMo7GlGbKJjmBuem+
         f2kdkda8yHsAJdD5e63IY6A5XtcXrzysJ0wjVLWc1MkFa2ieMijxjo/OflhrqTvsVRtp
         AwSEqPYX/ptnF4LSVYpBAbSmkn3/abg/nXZtZo+Kp386wOO+WwKxNZccOfjv5tMrV88G
         DHJCeiI5vpWlB+L6Yz0xYBanbgGg8l1C78UDB5TQY1q+CHgum10CUxvdQ/eflK/C34t/
         RzxdvNTl24Csd9CGJPbC27jyE63lZDFaPMgm8cjXnU4X3GpoXmU8CF3Nk7tfbpm9PHxQ
         UNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701215742; x=1701820542;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNJ8ZcT48ikXiu3aEfv5Bxm10JNZkDqYPbyzcMKvX4w=;
        b=X0zkEDUzJA3/aainp6B00Cv9nReKIasXiQhd5xKnX+tBf+Y95gq0P9KmKtPMIB2Dc6
         D5Af90GE4NXdpNXOmSmylemg8AN5GTjR/zl+qPUcM7f6qsx52HORaki5mXrr2uLTUU7G
         /3/nAg+En101Ad986BZleDR/JqSzBqC8V5DJVgDs1zlPMnGEnVHXkwsbNK4KtOkuQEKk
         IeFsHJRiPLSyI6ZA2h18jRsyR9Nww7uzFLV4SdAMZMJMFp3Iir3VJ69QdH/CnJYwyhTn
         t/7nS37gEsB5Eh/xY9UhwCsWR+32jSs6Z8ALQhfay2foYIbibZnAfYQT7F7pP3UY52vq
         3MKA==
X-Gm-Message-State: AOJu0YxILCs4Bvw3Oj+VIO4yX/ksfDeXroeVTU+ID2WIbTiE7uiWi2Zn
	bPnD/9qcBO+8OLf4A0SaZC5BoXlwjRqf4w==
X-Google-Smtp-Source: AGHT+IFPC9oHHlbB236+V2/EumcF7mfNKZMk2pkL7qQ5qdtXgbaPsAYwNfMMX+6dguXXb68DckEXkA==
X-Received: by 2002:a17:90b:310d:b0:286:1809:1517 with SMTP id gc13-20020a17090b310d00b0028618091517mr1575893pjb.7.1701215742315;
        Tue, 28 Nov 2023 15:55:42 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902b94c00b001cfb971edfasm6713103pls.205.2023.11.28.15.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 15:55:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20231128161253.3900351-1-luca.fancellu@arm.com>
References: <20231128161253.3900351-1-luca.fancellu@arm.com>
Subject: Re: [PATCH] linuxptp: Update downstream patches
Message-Id: <170121574119.1187527.6204639099938970150.b4-ty@gmail.com>
Date: Tue, 28 Nov 2023 15:55:41 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107127


On Tue, 28 Nov 2023 16:12:53 +0000, Luca Fancellu wrote:
> Downstream patches for linuxptp are upstreamed on the project
> development branch, update them with their latest status and
> update the Upstream-Status.
> 
> 

Applied, thanks!

[1/1] linuxptp: Update downstream patches
      commit: e12d38e91efff3f9f28fc35f9b9dc16557d5f849

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


