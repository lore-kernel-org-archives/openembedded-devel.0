Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BB9C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:49:09 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.21208.1747910944780089005
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 03:49:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DaAOzL5W;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso75723146d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747910944; x=1748515744; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U9cxN9wQLCKLiUupS6MODKZQwyjK76GouOZ62vTjQXQ=;
        b=DaAOzL5WseNvy/BM63I41LXkwcbPiKHL/hTwBEvEkOCw8D9ZAacrvOf803X2rWQS9n
         wllytb+XrEoWSqQ3LGP8HRjKcbI0FSnvwOLraS2+C7CO1uuFvsv1KuopwxIscbXzZSgE
         MTowMLanM2Uu3Dy9iedaT7IZ7sQn5T0tpRiCQVE/J967mVqiEELUjiGRYs5EmvbxfJAE
         7DnyZX8oA1bdXevc4Uuj4WIq9Tg+PQSfP38cYMk7VVg6r9fKEyy58aqyN+1Qn/Kqt/2v
         csWEG1DEFknXosWKwLHO2PTJJoKARDTr6VMco1jowiurvwnxJlOH7DrL9NBWNPKzq4M2
         bVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747910944; x=1748515744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9cxN9wQLCKLiUupS6MODKZQwyjK76GouOZ62vTjQXQ=;
        b=vQviWoLJd6xJh0q0tu/NfidRoqMrP4N8yo/991QmDb98y/7BWjiZbidAqpjVed3CNy
         inPr0rvGAkcDTSA4XYFG31GDIWK9Wrqwice8RaBQcalEGmkIaLAHVzJVptEIScnNUmd5
         FsIMTcm9oKD5NeBtWngMA0MAhUT8ao6WGegJ2uiAPNzoggiG0JGhUdv4A+Krlz1cSCTX
         l0B0YztJPgWciMsUqmPrvaNauDJRsFyEjDzu/oig5Gidk8Azm4BQpdjzcHLM3C1ciTDD
         biqSfcsjn7YE0BadfAAQSB9Eu+onziLT7DvpoY9fkALK2e8pAw6qRK4UY9kUxAyWya4F
         rXjA==
X-Forwarded-Encrypted: i=1; AJvYcCVWIGbv25zK4d5rRs+XeEwtZE5Uk4aA8d9cAf96rTYOdTwFmATWNcD3Cn6n8Tmy3+90CfIFBM1R9X/HvBHgvHhQ6K4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx3kWLhd62Mb0nJQZt/lhE2vqRZlztGgKbk/w4d5+WT3GRW+Q49
	UtBb3w1ARDphh3eBPEmrwS+TZJrzfEhKPAXEvndg4qhUQoZsvHibIZbeYc17ld1qlmqGqt0AnOd
	U52iM0HvEC0RbHn7Qe+GO0dD6zzhbXTU=
X-Gm-Gg: ASbGnctIapcZs5SXzjLwXvtQLGCau5L0tfovh+Po8hygcdhRZSumLiLyRzLpTEOAxKl
	Nl2wS19Lowo21Z1yBcT6Yv58c6rwDiUR5B5cdS2DCLCPbL9GJemHf529yEiLJWnGcDrMq0qW8Kz
	/Cf3qVcIa3pZ6bZMAih9Ck2d+x/jOZ6+JbuA==
X-Google-Smtp-Source: AGHT+IFeUr5Kqy44iJq0vohG6Q2i/1Vn1J1XhFeL9bXfIj8AEamxtt0Sm1Ic1Tk7lBzLv4uovT7hm363L/NLKAF2cZk=
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id
 6a1803df08f44-6f8b080f716mr377562206d6.5.1747910943752; Thu, 22 May 2025
 03:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB5896AC2C723041187F4A5BE9B792A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
 <84313a55-b94c-4de4-a26b-f1c341edd54d@bp.renesas.com> <CANNYZj9O7D5Eq2eeXxuD+VfO65i6VUHis2vOQ+ZYsfxJhk2aog@mail.gmail.com>
 <18414313C64AFFDA.26643@lists.openembedded.org> <OS3PR01MB58969DAE6D53C31F87A3E851B799A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
In-Reply-To: <OS3PR01MB58969DAE6D53C31F87A3E851B799A@OS3PR01MB5896.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 22 May 2025 12:48:52 +0200
X-Gm-Features: AX0GCFuGxkvc8AINdyDMmOR3L1-javmHKbhZi_mUT-I2GKiOqZFQvKH_SDR8XQ0
Message-ID: <CANNYZj-fNChMXMuQ8L8RcmS04wQ7iTYc9Fi54swJWgvkDB+SJA@mail.gmail.com>
Subject: Re: [oe] [issue][meta-oe][walnascar] yocto-layer-check not passing
 for BSP layer when meta-oe is a dependency
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>, Ross Burton <Ross.Burton@arm.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 10:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117584

On Thu, 22 May 2025 at 12:42, Chris Paterson
<Chris.Paterson2@renesas.com> wrote:
> We still have issues with these recipes though.
>
> Is it okay to just mark these recipes as machine-specific? (e.g. PACKAGE_ARCH = "${MACHINE_ARCH}")
> Or is this just hiding an underlaying issue?

If RRECOMMENDS in these recipes are accurate, then yes, I think the
above is the correct fix:

# binutils: readelf,objdump might be used for deeper analysis
# coreutils: dd with iflag=skip_bytes oflag=seek_bytes in some cases
# kernel-dev: /boot/config is used
# perl: sometimes used when other tools (dd, rdmsr/wdmsr) are missing
RRECOMMENDS:${PN} = "\
    binutils \
    coreutils \
    kernel-dev \
    perl \
"


Alex

