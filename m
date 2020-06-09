Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
 by mx.groups.io with SMTP id smtpd.web10.813.1591715946175436671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2020 08:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=yAs21k2K;
 spf=pass (domain: burtonini.com, ip: 209.85.167.66, mailfrom: ross@burtonini.com)
Received: by mail-lf1-f66.google.com with SMTP id h188so12717199lfd.7
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2020 08:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHbmpVnSz88M+LA5XfnVyqw/xV05mMXeaHZ7+SJ+d1Q=;
        b=yAs21k2K8czdXTF03sbgi2d+3zjiGb+kqBv7j8avNEI2l0CahE8XvucUqXyhtkVx04
         +eQ/0FHG76BaR19VdwdZeYKZaGw5Cyxi6+EI/g3PBZ3SGQ3PCmITqhnofHrE8f+ALWBb
         G3VCNhq4yvdpDGj2QAdp8EdCUVqF0ryHteykr4HJn8VJUuNxjLEuNhlQPYgIWSEEN6Ow
         dJaCEbvuUmy/uMhtAtep9L5x1+NcBSL5BoH4+8QRfP98vlh8pPMNyFAhwBjn6QZRlB25
         Fb8PSIfOxJwvNOZJ93O8C7war5FD552fiUeIGWRIPgUxm9jcGRczTri2yKOSftyTS4WL
         WMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHbmpVnSz88M+LA5XfnVyqw/xV05mMXeaHZ7+SJ+d1Q=;
        b=BJ+3QUl2eJmXMtsThp14e4SMLz4MikQ2vX2QY7/ri/cZyyY40DzhkusWIcXKP8pGH1
         6YGoR+F8Zy7qhjFlF/UvPqepn8E+Ph8uQLpG2PAWejT5J3O7VYkXgfn9Cf59+ATKKiBQ
         PE1ja4sQ3F2T/Cqxw4pucfSkSLyyJzCbEFE8xt5gcAn+KusYt5+8+2IDcjd/siWUEh8I
         g9GgegEYuO+h5WFVDv0DomubB/f1w8SKrYuL/jywaq8LiumQusGK8t+9nbEkCnbFTJK8
         yzwVrGJpmO/v+Z6PTTOKsZeI9XlB1K/GK62ekoU0VoU4tnH9Q1azF4jjDLTmjoUDgBfi
         O4VA==
X-Gm-Message-State: AOAM530XuCGUtNM+ehbvMv16G1WMZqE4hHtxBaYy2+nR6xiWuy2tO3IG
	kMt7pkqxbAvBo1DolZILrK3w/OoRQ7NWJ6/pp/0WSA==
X-Google-Smtp-Source: ABdhPJyrRQ4U1IO+V00tFSdYY3+Gq35D6hK6yIPZVNBtzVYILoT2ZUA2s7L7mFxI9PYX5QeG2wx3+194yIdOmPANr58=
X-Received: by 2002:a05:6512:108f:: with SMTP id j15mr15849311lfg.19.1591715943037;
 Tue, 09 Jun 2020 08:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200609142957.187352-1-arthur.she@linaro.org>
In-Reply-To: <20200609142957.187352-1-arthur.she@linaro.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 9 Jun 2020 16:18:51 +0100
Message-ID: <CAAnfSTsWiS2FSXsyFbN894_vBExYY_Bxnwwi9OTqYNCr6n9_Sg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] igt-gpu-tools: add new package
To: Arthur She <arthur.she@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2020 at 15:30, Arthur She <arthur.she@linaro.org> wrote:
> +SRCREV = "${AUTOREV}"

No.

Either use a release tag, of if you really need git HEAD then use a
specific SHA instead of autorev.

AUTOREV means a network operation on every parse, and reproducible
builds become impossible.

Ross
