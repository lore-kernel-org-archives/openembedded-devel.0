Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFB7C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:34:22 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.2142.1652348055156337017
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MB+gxHwE;
 spf=pass (domain: gmail.com, ip: 209.85.167.178,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id v66so5748310oib.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=5H5MeCLez0TuvonYwAR8+W2d9dTfnkMEMxASTpkMbDs=;
        b=MB+gxHwEno918w9OXYG4vPaqoUEtxdnjjccntFPbvZy+sgcw04jo86rnDtapmDc5kT
         RZrQQrrwZasbjAD8YKOrTUsAG5/ui6SKZELJ3WbmikBp8OIK8IhxITsmno+SsDk/1E9F
         5OXtVnwZHawPgJAc0be7xfQf2G90uWeEhQQeI9QZ0Bu/nJAEYvz18gUWKy1lkVxzflV4
         FOWN7csRw+asiVeOjexNTpm3O/mmW+ISKuyRYJvYUe3PuZHeF5xyOtN+m1HD0ntghM5r
         bUDRh4vG+gygcrzZQYVf3SbAmEqivz4G/QxO3ScSHvrFidxHKQwslr5MC84vMzFCZyFu
         X0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=5H5MeCLez0TuvonYwAR8+W2d9dTfnkMEMxASTpkMbDs=;
        b=EksZXMBI0N3VK8ASnDscfM3xhZ4MZZP+tGUxpXcBuV1EIumydxNrX5uqydwaPf6HcQ
         e97yQ7JUilkd/RBRBCdJTPE1pCeD7tGq472Gfiq8uoUguSvTIm5OIoYgFiGBlnpBJTH7
         AYynicFm/IiPZ8QS2F705aHdbtf2ePJgo//y4kL2K5AMZDAkRHxjAeMrOp8+etQVu84x
         VvTpLbej4ec06GaByYY9aBUSyY/MSCPgIdK2SgoYn4FJN36AV3GevzuLVukbzJw6/5at
         6uKrd/l0ZN0gj2r6nCDFAGiRCreWzzRNnQBYAzDo4H0UBHu3i2hX9EXlHpiwWMvkRVTo
         0wpw==
X-Gm-Message-State: AOAM533udnhEn8NPSl12+MeEWt29pTiur2E6IM9UJoaGOhSfcHjSOXvn
	mA91XG8bwzfk4htM4s4vpMAXwGaIdAxQnlILt8ho3Cth
X-Google-Smtp-Source: 
 ABdhPJyNoL1O8eSJFzWLwfHZEHcVKdxWBjM1wn2cZ9WrMPpPQHzGMQmPadm6yerwTWDYTfAcFRRyUsGyEvVvfScXP+M=
X-Received: by 2002:a05:6808:124c:b0:2f9:c7cf:146 with SMTP id
 o12-20020a056808124c00b002f9c7cf0146mr4678916oiv.54.1652348054073; Thu, 12
 May 2022 02:34:14 -0700 (PDT)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Thu, 12 May 2022 19:33:37 +1000
Message-ID: 
 <CAA=hcWQ3U2fpcC_H-C=rKwXs_CPW=KAKQ_rQyw5nXdpSCOh13A@mail.gmail.com>
Subject: kernel bbappend files failed to triggler build updated in kirkstone
 branch, could be bugs?
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: yocto <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:34:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97077

Hi,

I have a kernel bbappend file which can update patch files but cannot
not update a defconfig file when the files are changed.

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append = "file://0001_wifi.patch \
                  file://0001-kernel-mtd.patch \
                  file://defconfig \
                  "

All files are in files directory, if I change a patch file, it can
trigger the build, but if I change the defconfig file, it could not
trigger the new build. Is it a bug in the kirkstone branch?

Thank you.

Kind regards,

jupiter

