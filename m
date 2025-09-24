Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05A6CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:25:40 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.23020.1758741935887280703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YqJs5yjR;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-ea5bc345eddso162817276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758741935; x=1759346735; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wE8S66G1rb97jU95Fyh5cxl2A4115MIiziiZKeU4gm0=;
        b=YqJs5yjRjJLCga5XObQVObfevLIUL0zmJh2fYQLQjdo3Pa+PzhKZ+PU6cUopcc0XSH
         trmt/eQyuBv7nsPH3VfLPkhwkYTGCmNdCG6P6O5FI9jguNDGMYYsSieW1GQubJTqsoyF
         FveBXf7uUxls1t/EXYPnl6XQd8TB9Egjwv8QAaDylJSGtnv/sRRCaVlmGu3jWTWPI8Xb
         VXtfGQVcXFBelIOo2wUdTLFggUN9WA/Ud3buSIZUtFwcNDvow+jIs+GfHSYZrN9v3/A+
         PVIY1ym+q5YEMc+Xg9NykiFomb8dXqDyAEhnnKb/7S0IQwg7YLwmJc1cBZHLr/WVgsA3
         MRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758741935; x=1759346735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wE8S66G1rb97jU95Fyh5cxl2A4115MIiziiZKeU4gm0=;
        b=Pu8JNQmrD3l7kpIsw5ACBU9kGIoS2lV5K60wFODjYYRC+dIxrH3ZoouLXJFDJJAYBx
         kJ5KNIPsTmHPlwcIUDunLJ5VUI/V7hazUYvpEQkUDHUYaMvb15IRFp78AveU/XZtSwRl
         dQwTrY4sb0ABhJAgavZKcmawZM9P5hcv7/4lMJWsvihp1YbP5EckteVsL1Uoaneg2vm8
         WsTIR+U2hIf5ejHZYRUUI64pKkKFkp9db8PRbf7+nmU8+G657Ud5hMq8l62BI0jQWVZh
         Mf1N+Yd3RVcccrcfCKz4WRcyjks29zFDFlguFCfdbZgdhvSjAXKVjfVgOvavttSEtj0p
         2PnQ==
X-Gm-Message-State: AOJu0Yy4YA6Z0tbwqbVFqrAHa12Qjfc6b4s2/R1xulfrpDiDtUvGypgq
	CobvfqhejxhAaKIaYl3c8qntAIv/TfPTScJnehGwpYqwx5HYIRQeTiDC0QloXdqh8G+hL/BriFN
	uM1I78z4luTEJu7ZAvH/Bx0Twynkl0IY=
X-Gm-Gg: ASbGnct9cdPZjmsagVPejlK8i6Jv32pXqG+ZHUwspNPRcZKhw35gxmSRfhv82RzIHYD
	+HH5CVMHTptgctQHY1KQzF5JVdpBKImBU/wQkQw64Wm4aUVKbVTderyDLaks0KuwZV/PhBbzCg7
	ukOqEkc45Srh3kBnHUY8fqEYzmsBvPKJTF6OMQdQ8NBuO2q7GAoZr4yjPDZJrM4+iXpE0kTyBoe
	U2vTr820uKG5iwUz45zvcnF9HV8MH23ZTKirL/c
X-Google-Smtp-Source: AGHT+IE57uFELVMlfmcYIFBJYsLLZwv+1EwR71aWO+cjhz61yFW2wl5s65FM0pvfK/zDw5eT5SVaHuFxiPskaxYn4jA=
X-Received: by 2002:a05:6902:120b:b0:eb3:782c:66b1 with SMTP id
 3f1490d57ef6-eb37fc2ed16mr1163695276.21.1758741934945; Wed, 24 Sep 2025
 12:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250924185113.40093-1-jan.vermaete@gmail.com>
 <45A18B2C-FA43-4EA4-8E79-102E11E5C092@arm.com> <CABF_=yiLOVcWmOiSYUTvLkUCDD_SYsjCifnAvvvQGo5h2AiSCQ@mail.gmail.com>
 <AB025FE6-65EB-4765-BA1D-C972F34AB346@arm.com>
In-Reply-To: <AB025FE6-65EB-4765-BA1D-C972F34AB346@arm.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Wed, 24 Sep 2025 21:25:24 +0200
X-Gm-Features: AS18NWAdIcSed3GDA4r3odxlpkyQugyaIPH0pmztOX6kmGGynkjicT7dtZGuzts
Message-ID: <CABF_=yggL1veU7ss4qq+fdtxX3zzDd5ifsFvM95poSGBd7ktbw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyproj: added native + nativesdk
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119837

I did not run the -nativesdk.  But got the point.

Should I make a ticket or something about the '=3D+' in the documentation?
(https://docs.yoctoproject.org/singleindex.html#term-BBCLASSEXTEND)

On Wed, Sep 24, 2025 at 9:12=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 24 Sep 2025, at 20:03, jan vermaete <jan.vermaete@gmail.com> wrote:
> >
> > I did build the -native within a project with meta-ros.
>
> So not the nativesdk? If it=E2=80=99s not tested, don=E2=80=99t enable it=
.
>
> I=E2=80=99m pushing back on this because often people add native and nati=
vesdk but never test the nativesdk, which then promptly breaks anyone doing=
 a world build.
>
> Ross



--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

