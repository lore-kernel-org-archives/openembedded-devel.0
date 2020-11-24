Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.45315.1606177452968471589
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 16:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qfCPuhLQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id n9so3516054qvp.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 16:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=czT+weGRxCkWML6rcOFhF/CflucduMdhNhSd8UETSmw=;
        b=qfCPuhLQIXP9AY6FGm7vYdfXU6Carxm6CMQBlkaXRogm47u2NtNDgo0RRN3Cg8ma/r
         bAxVuQhkUUavN5bOmwA7Kp0VcW2nDjv569Ar4fuT/fnC5U5kahYooEi+TaJSa+kHhuA+
         IrYUhPqQFdC1XLlr6rkSFU7r6ElEErTWY4VuYbb4Lt/poWNMGatFmL/bGaPuzS3/n7He
         BhH2KWv8TDjt3MicDY0sFCMYSLA+GppPz7WWYU8DgyFGZANYwbQx3dEgkd6j4HChLLG3
         GWfYhyGpoLIJBupq0w8z2a+VzmloDoJkVgdBxlMVFh7BvO3f1NB966ptFS198W27V2CZ
         N2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=czT+weGRxCkWML6rcOFhF/CflucduMdhNhSd8UETSmw=;
        b=NTAopmOUXSWhR1kJ1fQN8+25F+MeSXlZzslt5dn9VQWMdW6bvnmcMhGpDVVeA5Uvoj
         YzvXo/vewcVkOSVWiiRQJluOGos+QoYTw32AisBaP+/lV2PuvfzFr6sI1VMstJYs/AnI
         Qi7trxsS09qsRv3KxABA0LFdpYdksnRxTlqJz4j/K7WOD05jF99Z9hhm/A0PN7qYVo81
         QP7K0Yafcv1qtDI4W21bWZsqmYdd9KdPWpEWb1qN4Q5N2C97JkhXS59hg7oIpRBnha5Z
         QS1N1nCJUSBlOS9cAE2Rv65YAaX1dc0MBxyrblZ7a57blEHuANo9rnIkKP6zuPAm0Nm0
         90LQ==
X-Gm-Message-State: AOAM5319DghGzB5jDiO3r/qCiCyC/S3UhWwMbDMoSgE1TgnOWdJwiX88
	m1RBcsnsr31OSddZe6CzGrRLUyFs8+rGcVPimDQ=
X-Google-Smtp-Source: ABdhPJwinsgXl9L71+prtxc8bKKBtYILsIQgGf69PXVKZRi5wlzSJnriqN6SyL60pheg0g8wfUaX67jmr5InRkHvrJk=
X-Received: by 2002:ad4:524d:: with SMTP id s13mr2252734qvq.19.1606177452018;
 Mon, 23 Nov 2020 16:24:12 -0800 (PST)
MIME-Version: 1.0
References: <20201123235417.2012834-1-raj.khem@gmail.com> <a9ac4751-3b7c-18c6-8c76-44112829d710@kernel.org>
In-Reply-To: <a9ac4751-3b7c-18c6-8c76-44112829d710@kernel.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Nov 2020 16:23:45 -0800
Message-ID: <CAMKF1so9Qs+VHxeAffGwX8cW9si3C9k5BS6FjSdSSG7RFv6USg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] heaptrack: Mark RISCV host incompatible
To: Sinan Kaya <okaya@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 4:04 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 11/23/2020 6:54 PM, Khem Raj wrote:
> > +# libiunwind is not yet ported to RISCV
>
>
> Small typo here libiunwind vs. libunwind.
>
> Reviewed-by: Sinan Kaya <okaya@kernel.org>
>

Thanks, fixed in master-next

> otherwise.
