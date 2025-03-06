Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A92CC282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 20:08:13 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.4283.1741291689159016383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 12:08:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aKX+PVrV;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e609cff9927so734419276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 12:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741291688; x=1741896488; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K5hzzQbCdSD7dfZTGMv8hG83UQ/jNE+kEfgmC7Mk2NI=;
        b=aKX+PVrVMlvII1DLwixdx2XrmzsGKQIGQHW1rRuMae5H4b7IE7dhsZQxXswyLQfpPh
         Nl21trjsY+bL3fj9sJQtbh/Lkk19dL0UZFFD5Bq9ppLFwbujkJ/oZi+Oapj/4JX51RpE
         EWnYUZIgjRNUM3175aQ3hK7Q16JpVsEnRKs+GhWsgpevjUkWcmEeO6zV0tGz2/0RoXop
         Rz+mdpPcxhYBgT03EG8qYHhmpGt0VejWl8RRpzUvjtgeou7oDgvGxrCQC5u0sj0D9E8W
         tOqCqKrmAKGZTBJL8F3BBV31lklLH/0htykR+vmMBRWQ4iDIavcb/9aCzIlTJ0uJBDAh
         I3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741291688; x=1741896488;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K5hzzQbCdSD7dfZTGMv8hG83UQ/jNE+kEfgmC7Mk2NI=;
        b=Ss9J+YIzAn4XxEO7OkuDb9T4/968wGI4SamU7Vex7JdBZy8AGPcp6CfKUDb2dtj3m/
         53px1DYC/Wp0FmjgMS/sWpacBr4Motq3rF4pmqTRvRMc40D4t413djwpDAtmkyuwGKBG
         VWTFbRorHU7hC6yf3bFxktOeZex7DTHy4xkS2PDlyv7mrPoMh3vu7F1opJ+Cg23dQ6cu
         nOmSB2x/TJ5wPJd8hGfw7jaoXdmTknRP2HSRzzpe5TzfD4ULNrnEQlyZaUVDnjRNbITn
         cSArl0O6qjQ77YAVwD9HUNp89PUgyy2PUWXe9iFSSQU/2WtuuD12fmX3TaGV4qj8nodn
         N5iQ==
X-Gm-Message-State: AOJu0YzDHXuO49a9GmKw1AunWYo2AxFQwmvABB9gs+/i7rdBotf21bY4
	FBdCwhvAcUUvfYtJ5G+gLOqJPtqNMWakoaij6ehpSLum0vSt2P5mSxKApltuGTwAk5Oi2Da5llX
	w3/8sBvsPKtFcPIN66WrvQfE8QPYUQfTP
X-Gm-Gg: ASbGncuy9H10xhiUAS3cpVqHBj525yezQSmbUvmTFMAkTa47k9GAEtbxbE1bWiXzK+d
	emzBmUuTm0j8INraX8sAvvesol+02Y6IDGfOlV8rkhd8YumqRiUSPWOXIMqaIZx4jJC+Xv80M/H
	AiDEMrt+sXzR5h8o/+r7NPfJ1iSJ8=
X-Google-Smtp-Source: AGHT+IGbZ+LRe8erDyBhklYXWqoaK+JfvVagI6c7yJ8tZbHPipDr5QeufmFUVXbh0HwbkX0fPAuj2y4rSBWYvYHqLM4=
X-Received: by 2002:a05:6902:727:b0:e60:9b80:1f86 with SMTP id
 3f1490d57ef6-e635c162d39mr1137047276.20.1741291688075; Thu, 06 Mar 2025
 12:08:08 -0800 (PST)
MIME-Version: 1.0
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Thu, 6 Mar 2025 15:07:56 -0500
X-Gm-Features: AQ5f1JpQ26rWtD3I-yrwJVcqu10FHBLGXwcGUxCgTMDdouTkOg9ThOeIORy_Hr8
Message-ID: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
Subject: [meta-python] python3-scipy
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000084aed1062fb2101e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Mar 2025 20:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115775

--00000000000084aed1062fb2101e
Content-Type: text/plain; charset="UTF-8"

The meta-scipy layer was archived on Nov 30, 2023 (
https://github.com/tuxable-ltd/meta-scipy)

I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so I
patched it up and got it building again:
https://github.com/robwoolley/meta-scipy

I don't know the history behind why it was in a separate layer.  Would it
be worth submitting to meta-python instead of resurrecting the meta-scipy
layer?

Regards,
Rob

--00000000000084aed1062fb2101e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The meta-scipy layer was archived on Nov 30, 2023 (<a=
 href=3D"https://github.com/tuxable-ltd/meta-scipy">https://github.com/tuxa=
ble-ltd/meta-scipy</a>)<br><br>I need python3-scipy for some recipes in ROS=
 2 (notably pinocchio), so I patched it up and got it building again:=C2=A0=
<a href=3D"https://github.com/robwoolley/meta-scipy">https://github.com/rob=
woolley/meta-scipy</a><br><br>I don&#39;t know the=C2=A0history behind why =
it was in a separate layer.=C2=A0 Would it be worth submitting to meta-pyth=
on instead of resurrecting the meta-scipy layer?</div><div><br>Regards,<br>=
Rob</div></div>

--00000000000084aed1062fb2101e--

