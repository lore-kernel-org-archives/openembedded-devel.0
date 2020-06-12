Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.686.1591995651348064017
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 14:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=sd3Qp9Lf;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.175, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qt1-f175.google.com with SMTP id z1so8220799qtn.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Esie9DaPu/emcs7ASi6M1ERcw6qR7N58s4zP+c0WcrQ=;
        b=sd3Qp9LfkjxWBUDWcQ0zsAmZMOVMDH8xvjNV9p8HuBOCQWYNUXU+i9gnoCQ3jiXknT
         K8u16CaEjePDURGlJ9vFwoHPO2oRc5bcBzjUUf0QgVwo/eIp7tVp4x3w4MpYYJb74Ke5
         CLRlL5Oa6CYZ3II7+ZIvppubJ163L528tnzPkHEkfJuKFUoYKbTaz30t87hTJ3584idY
         vza3soMHpuFurfTDpPWTOWZkny6qsWWRyR3IPin4mUkOMJccbdc0thUoB5g1e7kC6Awa
         nbJK9Z4er9AOpbuml3oPhQzyHta8q13aHIoC/VPZlXsAJ9u9xOxY+K98bSSAg8dlmTSn
         OBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Esie9DaPu/emcs7ASi6M1ERcw6qR7N58s4zP+c0WcrQ=;
        b=tCS1fTIdtJD+HtIDhMo2akDrTSdL+BdOHqaa8wnp4ZqbfvGzb7y5e67pREm33Rk0VU
         yWYHj8ZmAW+c5SBp6COHEk0x1zKDF85swK3D9q4lsaGjD5668Q3HJrjtpMl13sG5YgNv
         P5yAW1wA5V7iPWIcMB5BcP3Kk35eYPPPrziiVdBuCOD8QxODxA9EmXnZOGxw4Kt7e2HD
         AQzaNiUz15LyhGZFQFv0F9nwYcLsTUV+HMfZZz4P+b43P/JRG1HnDdi+PAGsBr+DGwV8
         UKZ0kfWDH7RrVFxSUfNCPb3GuFZEAGnGRVHBcI2m/wJdcy7Cq/C7GQHunVUagSTlCTFD
         HdnA==
X-Gm-Message-State: AOAM531g1Ye7b3k3ddPKc7axz0goQDavgAn+PrN6kjG1rx0KTEZaJWpb
	XyGgG7gUrACVGlft7yAnQ2WRs9Ua4amsRw==
X-Google-Smtp-Source: ABdhPJzEFGaPs4DoFKoSIQiNb1cImXTsmyurpQa006dlsE6bHc0OEVdLGPqfceAvuROVyqI0HNwZjw==
X-Received: by 2002:aed:2062:: with SMTP id 89mr4914004qta.327.1591995650188;
        Fri, 12 Jun 2020 14:00:50 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id r5sm5993875qtc.40.2020.06.12.14.00.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 14:00:49 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f173.google.com with SMTP id g62so8204055qtd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 14:00:49 -0700 (PDT)
X-Received: by 2002:ac8:35d9:: with SMTP id l25mr5125401qtb.374.1591995648872;
 Fri, 12 Jun 2020 14:00:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200612183607.108989-1-otavio@ossystems.com.br> <93cc762c-be2e-ef93-7159-36bb2daf78ef@gmail.com>
In-Reply-To: <93cc762c-be2e-ef93-7159-36bb2daf78ef@gmail.com>
Date: Fri, 12 Jun 2020 18:00:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrEo6EPnrX95nkM8z5Pj1xe+KaLaUmRYxhi6A00PvOd+w@mail.gmail.com>
Message-ID: <CAP9ODKrEo6EPnrX95nkM8z5Pj1xe+KaLaUmRYxhi6A00PvOd+w@mail.gmail.com>
Subject: Re: [oe] [dunfell-backport meta-python PATCH 01/22] python3-argh: Add recipe version 0.26.2
To: akuster808 <akuster808@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing <openembedded-devel@lists.openembedded.org>, 
	Domarys Correa <domarys.correa@ossystems.com.br>, Khem Raj <raj.khem@gmail.com>, 
	Otavio Salvador <otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 12 de jun. de 2020 =C3=A0s 17:56, akuster808
<akuster808@gmail.com> escreveu:
> On 6/12/20 11:35 AM, Otavio Salvador wrote:
>
> From: Domarys Correa <domarys.correa@ossystems.com.br>
>
> Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit ae8968122461df7e1fa39138f32caa35218bb71f)
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> Am I missing the context around "dunfell-fallback" ? Was there a cover le=
tter that would explain that I missed?
>
> Generally adding new packages don't fall inside a Stable branch policy.
>
> please clarify.

We are moving packages from multiple layer (with even duplicated
recipes) to meta-python. Those recipes we are adding so we could use
labgrid. It was sent to master and I'd like to backport so we could
later clean this up.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
