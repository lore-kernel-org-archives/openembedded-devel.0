Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.34150.1610371102356242909
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jan 2021 05:18:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SnpknNt5;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: marek.belisko@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id q22so24731524eja.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 Jan 2021 05:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=3kqcXa5FofAf03iX2KIeUt1dwldMw3XNR+1xU5uy1kw=;
        b=SnpknNt5n83jWTR3ICx5vUG9A/DS7KXUQ5LyMYAnDorS4+CH3zhZSEvjjqhiT9G1OK
         fOAoVQ5xikObc680JVs54LSpH+9is9oJ7bJHygRHgt1inTCkjZzvGzPl6gJcVAovR2zJ
         7dnuCp/TehxlCnFCKLBM7hf8Yb6juSXjxpBFlGNqmx6cPrtOklB2M6Gh9Kk7p81ojAU9
         nVkIQzZLAykEvOxoQFWoYa20Nt75DuCnH1aoKOLeDYBDKKa87W0CScUkmwXWW09ifKiv
         jxyrCLUBEOiUtQeBBcn+jhDi7ivAn4Axy2dEZk5uTB9T1wKF+uj+n62TQ4WdKj1gjWPf
         Hygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=3kqcXa5FofAf03iX2KIeUt1dwldMw3XNR+1xU5uy1kw=;
        b=VKl85yXPBQtTi9hY3V4/YRQfKnOUbl88G+qWo4jKVuO5y4/n4pi9pquXtjb3cAwG9X
         tzrH1JNxqpBagKzPQPsy3cC5hhZwFz+to254nhkj+xgyIAeIePK0WZYUysrNaHdLYhjk
         2Egk4XM1u0zYczU+SeXHAFPB+x0qLtZPIsXVrY+4dNN3ThktWruQOqgAGTWOwh3rUNuv
         9mKrhNIP8fiAaNLE+mInnXdHQsnNjVbsChZASQDRNt9oW0x+vVqV6nhwaTvtJOh7kugr
         Raod7OQRrNCef0KEIzWgMrmpKcENaVoycUZMC/egfi0sYtvHHqpM8UzUGR0wIMeTofgy
         uYIQ==
X-Gm-Message-State: AOAM531Gk5Wl+mC3Mu7E5mp1FXnYZW/bWMji2xgLGqE9+2EsttaCWbft
	+nvLBzxJDDb5p9iYhC6LAiVeamg8w0FMyFFIdilQt+pu9I64Rg==
X-Google-Smtp-Source: ABdhPJzip1i3w2Pdm2jlByFFu68tJM1wz+AlBSNGXTAKdBm/QZEyBy9ZTMVFZYy2p1yZF+mJrV9/YR+zo3CLNm4eeYQ=
X-Received: by 2002:a17:906:a015:: with SMTP id p21mr11317597ejy.49.1610371100502;
 Mon, 11 Jan 2021 05:18:20 -0800 (PST)
MIME-Version: 1.0
From: "Marek Belisko" <marek.belisko@gmail.com>
Date: Mon, 11 Jan 2021 14:18:09 +0100
Message-ID: <CAAfyv35iGwiKWorpEthr_CCDj_dVQUT0PW6MacAA+4k3h=foWQ@mail.gmail.com>
Subject: nodejs complation fails on dunfell
To: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to compile nodejs12 from dunfell branch for
raspberrypi0-wifi and getting following issue:

/usr/include/c++/9.3.0/atomic:254: undefined reference to `__atomic_load_8'

For raspberrypi3 build it works perfectly fine. relevant flags are:
-march=armv6 -mfpu=vfp -mfloat-abi=hard -mtune=arm1176jzf-s

Strange is that nodejs8 from rocko branch works fine for
raspberrypi0-wifi. Any ideas?

Thanks and regards,

marek
