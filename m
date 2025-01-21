Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6077FC02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 23:04:56 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web11.29884.1737500692568468559
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 15:04:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fKl9Opch;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: ticotimo@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30737db1aa9so33217271fa.1
        for <Openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737500690; x=1738105490; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=idp2ccfv6vzfDb52aDcKOyQkMEKA557TdIJWjaVzR94=;
        b=fKl9OpchBhFnGl8MpC8huqi9XdilABZ/QwrfF2UJRxfj0RQte5N8DuoMp51dK5X7Cm
         Fv7452ds6kuqdaB5/MG3aZRgni3qtokIiKmgBzyg/iTTmfIH9b/gWcxP5Eo/iyYx49DI
         FSUYMwvjeKCj2+G7SFTTzjW0jy4LEHaqiONMfs8g9ujJ1kHZBWwWp3CKCvTlPTA6uBws
         NrYBmOE68m1JqKRHTPyJV6bFVzgHwkVpurg6VZrA6Xysu37QUptb5i5VALTO2M+cKYs3
         +JraSsuuM8wrNVnudY7syrhI4lVo3iPvv9fgjicuyt4He8VRsLbExd+0I2KOYkiM9FzU
         LIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737500690; x=1738105490;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idp2ccfv6vzfDb52aDcKOyQkMEKA557TdIJWjaVzR94=;
        b=N2fMc7psHGDxBv0elcq4cE6YC+Zm6ayfbnewbL0Svgn20m0wRV42AgMIbT2NwGyhIz
         8WI+ch0TXIOTQ2riMWuVXpVNnJ0h0p7I5qwySEPLpjvmqowbK1LmgO6wvxTeH4kiDl/V
         obQgeVouffLKtz2SjIbclptJ97vAUfBCW5PaHvW+nv/jx+C1ieEcDhDk2CFoWYyuai4b
         rIHY7JLaTN+3ogeh1uRnNewL0L5iSQChLsSgvz5Rj3RmYwMbkJILTPD6MLtY+NFzgV0s
         RsGBlwXAEG8KTUkdj51mj4NIrz94O8tQFdz59zt9S39nTdEoZdvXBeW9U3DAgexY8PLw
         47dA==
X-Gm-Message-State: AOJu0YwYecEMQtnJcTbwdsWKbZZtnclphXo98UuFmHnnkOh7AUswvai3
	za70JMBZkbqowFQ99VvPdNohw2AV9aEEkTY2ezCEGJ7jljpzI36Zen0RtCcFMqc1G+/NsIj5src
	/AXA397elrlhkZGNg85XgZovMoeN0fg==
X-Gm-Gg: ASbGncv3jW5gIX+XjAM3GuJw+HKIL3r7j3TPZF7bwSqaEDoM0nFKN1oLwEJwAWo04t6
	J+NO3WdR1tVR1JCyA+FRQgg0PtjrWAASJF2N9etO+R1/U8J+D97A=
X-Google-Smtp-Source: AGHT+IGtl+m1mnahkssKzHYKpyON24RVpmUN7zKr9XDfDATl9KYwvtLOBKMKHQGbNurfxf5JXVOO8f+KL07axuHcT9M=
X-Received: by 2002:a2e:be21:0:b0:302:1d24:8db7 with SMTP id
 38308e7fff4ca-3072ca99e8dmr69950911fa.19.1737500689282; Tue, 21 Jan 2025
 15:04:49 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 21 Jan 2025 15:04:37 -0800
X-Gm-Features: AbW1kvbCNeX968mvfhzU-LeD-pgYmj7xTr7Brg85THIxtQZH_R-8rzHYhz8ecdM
Message-ID: <CANx9H-CcvnJM3_pyMEonojr9A=TrkS11PLZJ5vXvqdQwCv5H2Q@mail.gmail.com>
Subject: [meta-java] Intent to drop openjdk-7/openjre-7 support
To: "openembedded-devel@lists.openembedded.org" <Openembedded-devel@lists.openembedded.org>, 
	yocto-patches@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000061bec7062c3f674b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 23:04:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115010

--00000000000061bec7062c3f674b
Content-Type: text/plain; charset="UTF-8"

This is a heads up that we will be aggressively dropping openjdk-7 and
openjre-7 support from meta-java in the next few weeks. OpenJDK 8 is still
receiving updates, but 7 is long EOL.

We will likely retroactively drop as far back as kirkstone, because to be
brutally honest, we have been broken since before kirkstone. This is a
policy decision to be made, with feedback accepted from the community, but
as the only person actually maintaining the layer in the last few years, I
reserve the right to make major sweeping changes. Many things are broken on
a modern distro (Debian 12/Ubuntu 22.04+) even in kirkstone, so we need to
fix things that far back.

If you feel otherwise, speak up, contribute patches and approach my
employer for paid support. Otherwise your silence is golden.

--Tim

--00000000000061bec7062c3f674b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is a heads up that we will be aggressively dropping o=
penjdk-7 and openjre-7 support from meta-java in the next few weeks. OpenJD=
K 8 is still receiving updates, but 7 is long EOL.<br><br>We will likely re=
troactively drop as far back as kirkstone, because to be brutally honest, w=
e have been broken since before kirkstone. This is a policy decision to be =
made, with feedback accepted from the community, but as the only person act=
ually maintaining the layer in the last few years, I reserve the right to m=
ake major sweeping changes. Many things are broken on a modern distro (Debi=
an 12/Ubuntu 22.04+) even in kirkstone, so we need to fix things that far b=
ack.<div><br></div><div>If you feel otherwise, speak up, contribute patches=
 and approach my employer for paid support. Otherwise your silence is golde=
n.</div><div><br></div><div>--Tim</div></div>

--00000000000061bec7062c3f674b--

