Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D39C25B76
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 05:50:04 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3039.1718084995744816123
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 22:49:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rv0Eu8fh;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52961b77655so5736537e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718084994; x=1718689794; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKOLNCcBnuq7cPOCJ5LmKTbMto6Uk8OvsCiWSjzD33M=;
        b=Rv0Eu8fhg35rw3hgMiSGSe+jDlx3Q9nXT3OPdj83Lodn/8u4l/MtqTVmZZJCy37ZUp
         pgIhcAp3SlSRXitCD26dfy9+JZO4u0CRkOiBlBWyDC6ucI7kOMrGXovwXnaZiTZlVa6H
         JO3Mip40trjvjAqvXTbb7g2y74SZ8fRo+8Yfh9Agggs/uiB7L4ipoDgLcnrvXbryS0+0
         T3Wft+xo6T/6C3g7xZIlRgRNDSGp7Ity0QkhACz7st+6F456siFUefKGPwfqBhtBPOhN
         zM45q+wJ8ZfXYEK5//iicbgQ8Lf+dPngoskjUDW5X4XPHnFbR0stLEKcld03m2oRppfQ
         3g9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718084994; x=1718689794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKOLNCcBnuq7cPOCJ5LmKTbMto6Uk8OvsCiWSjzD33M=;
        b=iu7ZND0O6+2wFm/kLy5aXG+BVAvDC+UjzgFh3rzt7SFAh9sbi7tNeBhjlnflZOT2WS
         3keoCRMMpTezFmJYg3C5589+brBTXnCbsBiInJjs/f99XqACOhxtIXtX7EQddZb+TTd1
         KZZgRwoEbzjFI6PHAvE2kxyJrBCGGrxwxo7QETY4E0vnvzICujjYIrCH6+kvO7uEVhZw
         B2CxpOXP+F2GE7e6N0hvM7mSyZK9EPXcBG0BB5iK0TIkNaG1/W0KYut+KB1RRgZTcRuF
         SrWwC0Ees2R6c9dXDs3H8DabzIj3rFoVMzyMeSdP/6PqL4/epLdRqKJjE54DGrs1VbGn
         kerw==
X-Gm-Message-State: AOJu0YxM5J4b1Ng/Oz0J+cC9cvnLfRSdV6JRtKnsHYKW7OQ5Sq+h7p6d
	WvL785pm9eVq4e5zJbvXDCMalC4Bt/fhA/HG0WV1ZerOZgvaA0rYPLUaSt4Cfd+1uRewrD+HzQD
	8te76Cq6NlKE9o77NHd2rO3BGW0o=
X-Google-Smtp-Source: AGHT+IGWRbLJxOha41y0BMWtAI9tbOB+xpwZhBygTxlIjXa5taWGL+NW1uWvLtZf1o8ZqnO5dqq7d4jOmC5ezPFQ4l8=
X-Received: by 2002:a05:6512:1151:b0:52c:8d26:d0e7 with SMTP id
 2adb3069b0e04-52c8d26d341mr2308699e87.35.1718084993558; Mon, 10 Jun 2024
 22:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <GgZd.1718060263870944239.ZhvI@lists.openembedded.org>
In-Reply-To: <GgZd.1718060263870944239.ZhvI@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Jun 2024 07:49:53 +0200
Message-ID: <CANNYZj9cu_TU0ZaNrcFYn0SkNaBU1_BaojyM0nBCeJzLJGXbvg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] tree broken source link
To: egyszeregy@freemail.hu
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 05:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110815

On Tue, 11 Jun 2024 at 00:57, Livius via lists.openembedded.org
<egyszeregy=freemail.hu@lists.openembedded.org> wrote:
> Source link of tree SW is no longer available, it seems http://mama.indstate.edu website is down, tree is not downloadable anymore, please fix it.
>
> https://layers.openembedded.org/layerindex/recipe/37212/
> SRC: http://mama.indstate.edu/users/ice/tree/src/tree-2.1.1.tgz

Per https://salsa.debian.org/debian/tree-packaging/-/blob/master/README?ref_type=heads
the new tarball location is
http://oldmanprogrammer.net/tar/tree/
homepage is
http://oldmanprogrammer.net/source.php?dir=projects/tree

A patch would be most welcome.

Alex

