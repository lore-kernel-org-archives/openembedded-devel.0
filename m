Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092CFC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 20:02:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.24547.1679428923378662751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 13:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JAtJyeIU;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id cy23so64227183edb.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679428921;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cr2FO5kLIszztjhAyjstrtNpPfarSxq8Ah3s0UfW6UA=;
        b=JAtJyeIUGY++MS1niuWtoIbMvdamKgGYfPRuh7BvHL/PaZd+bpRa8qNBgMvOTn4x+M
         stjTumGSXyjZQtEJdSzhhAEC+XzX7ZkGSirRQsEsRg/SApzo9nb4r8nUMbo/8eOmPvz0
         ley1t1VINBEMTwNBw8qoIrfPpcb2sMbbJ39yWadUW0ufrTELSrxs28PLTb+Fmds8u1Dj
         i3XlccLBP/sYJKVg94V3orZaJaPVSj7tzymuYogpUOzs6G2rXZ+OXlcPvsuSe5+l7e8X
         ko6o0fEm6Py54bHYHCyAv7gd7qMaVhAaADFuUqS2yZn34tVFKE8jLhD+ZNZleRPcJqAd
         nZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679428921;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cr2FO5kLIszztjhAyjstrtNpPfarSxq8Ah3s0UfW6UA=;
        b=kUYT5OPnTIsec7/CH3wbnPnQLX3Eb0Gs6Yc7uWuj3OUBzhIlIsqFG5HYSNrd3mAN1n
         1iXdCn2t53KEjG/FhnxhM5xtjbakc8xCg9KuJC2RgJNaLyI360JKukH8So2vDm9D5BqZ
         sZ0fe2AFHCV62hWhyaaoTRoOuysCR5lXY3dEZ5bKVHBXKeN+9VbcOR8T2SBPseLdVU7p
         baUxMsnxtAaJ8O2xyJMlQhobwvRtKBgrHy8OW5UDsQmFDemwav3iASyxpNjNVII7IhsF
         2408MmJCCChKBkJQO3rnCE+FOn252MDSAYjdpc8k7WwbRGGh55SDU2wr1U9pRvD1eZY2
         AjHg==
X-Gm-Message-State: AO0yUKWbc1wR/Lwpbcc4RJKdNSXHuMvpegtYBjN+OwcO6OSbaQ04mN64
	vjDzhgA9vQi9EZ/c19/JAygAIfamf9N/nLbnGcOSzHnyw4g=
X-Google-Smtp-Source: AK7set9rzisirnp5wV5faKgeISI9qgqKNHyIOkT3i+OUIQ/H+iYRmRsMq/QP12y4CHoZfDYa4hyGHpBtgNSmwX3JmQI=
X-Received: by 2002:a17:906:185b:b0:8e6:266c:c75e with SMTP id
 w27-20020a170906185b00b008e6266cc75emr2092907eje.14.1679428920961; Tue, 21
 Mar 2023 13:02:00 -0700 (PDT)
MIME-Version: 1.0
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 21 Mar 2023 15:01:49 -0500
Message-ID: <CAJdd5GbZa4CK+tSeyVdgshefo4aqR5dnVmJcsPv16k1VJe-h=Q@mail.gmail.com>
Subject: SPDX Support in Dunfell
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Paul Eggleton <bluelightning@bluelightning.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 20:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101625

There has been a strong desire to have our SPDX support in the Dunfell
LTS release. As such, I've put together a patch series in poky-contrib
to try this out, which can be found here:
https://git.yoctoproject.org/poky-contrib/log/?h=jpew/dunfell-spdx

If you have already gone through the exercise of backporting this on
your own (currently, I only know of Paul doing this), it would be
really helpful if you could give this a try quickly and making sure it
will work for you. I'm going to clean up the commit messages on these
patches and hopefully submit them to the mailing list to be merged
soon.

It is mostly identical to the version that currently exists on the
master branch with the major exception that is uses gzip instead of
zstd for compression. This change was made to prevent the need to
install zstd on some of the older host distros that dunfell supports.

Thanks,
Joshua Watt

