Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFACFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 16:35:46 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.34164.1728232537557294738
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 09:35:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZlxNZTtX;
 spf=pass (domain: linaro.org, ip: 209.85.128.176, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6dbb24ee2ebso35802607b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 09:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728232537; x=1728837337; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E/KoePep4SGWYYDlBr5y+mXvBORs9ly3ZESTYlZz1tI=;
        b=ZlxNZTtXgcwETlxYvhbFipklTIOtuve6N9L2QMwf/SroeNzZZjR87gy4lOJd83z5sB
         sLCHtXglivsYHhu7cERjBqJdO23aZXlpK91TDG89CWiqAot9+X4b9glkuyAiYjcaSiwz
         aRd5+NzQbciCCOaZ35hpGcnD9l8T5q5OEtRyF/lna9T/yJuXQn957ZjjIznI/NQd5DUH
         KE2/DWq/AWnx+lq/PzNKhTs4NPAoG4gjkkBVoskQPi83yD/DfETbHZ7vfopoM0+11got
         ZgWjsHJx6lVllH4G/JrfFeCr9TlDEh0TUfvFNjpP9XcmoEG+bp8crbzqrAkw2JN2oIHY
         eRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728232537; x=1728837337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E/KoePep4SGWYYDlBr5y+mXvBORs9ly3ZESTYlZz1tI=;
        b=WRna7fu3NkaQD3DI11A3UGBODN5Jjwfxl2+PV9QeAsVTDwkWAxHFs0DRJEpyjWMcTe
         /9W1HaFytb4edY2QR6MNU3zI92wgqcpFbXcLwlgxZhAUKdgs5RlZZMx03lIxRWQPkXAX
         K/amklOXBCQD5jgA7EJro6WqCg8rl9JDXdOgiD+15y8MNQYtuOkY+EplV3Mg7DHaQkfY
         CqMhxdpmG3B9Gy3bmbChM2+0W6/qdtnrT0QeUOXMoC3mRmDgE1qNalsGF/uGxhleDfHB
         yC8DqRvuNecZfAz9x8p+IcxgkYANnb2gX617ZV9L3xnfeYDPl3ez8IrXWo6jw6/HgKn1
         hHag==
X-Gm-Message-State: AOJu0YzyAgVYEAVfkRqpt0HpL1oA5nu+ULWm3+FBW31liTDIOQq6ZjSc
	IfQG/N8bGClcXoSPma4ogqJoFBn0fSJwWbCx095inFSMtLbpVurA8kA2yEKqBdL0mNUCuPJtj+b
	jNzD5lbT58lzULSMF7xjggnrxxEpdanYiw9y5ME9ClUovnLDpjThWJGjRy30=
X-Google-Smtp-Source: AGHT+IEkuFAn+kmPvQMUmllCuoomns4WhKiRYfoDE6m1+2IEjMu8K0Ib2pUtaUf/BkpIEQ7JoLX0pJthlfDyovsJOkU=
X-Received: by 2002:a05:690c:6610:b0:6e2:a962:d80f with SMTP id
 00721157ae682-6e2c6fcb63emr71887107b3.8.1728232536714; Sun, 06 Oct 2024
 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240926054822.1274824-1-quic_raghuvar@quicinc.com>
In-Reply-To: <20240926054822.1274824-1-quic_raghuvar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 6 Oct 2024 18:35:25 +0200
Message-ID: <CAA8EJpqpquucGWP1u=EO3McdrG0TNuBayZyTQNOYMxz=LE04BQ@mail.gmail.com>
Subject: Re: [meta-oe][kirkstone][PATCH 1/2] android-tools-adbd.service:
 Update ConditionPathExists to /etc
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 16:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112686

On Thu, 26 Sept 2024 at 07:50, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
>
> To ensure android-tools-adbd.service starts at boot, the path
> for ConditionPathExists must be present at build time. /etc is
> more suitable for build-time files than /var, which is for
> runtime files. Changed ConditionPathExists from
> /var/usb-debugging-enabled to /etc/usb-debugging-enabled
>
> Backport-of: 8106cfe769aa ("android-tools-adbd.service: Change /var to /etc in ConditionPathExists")
> CC: Khem Raj <raj.khem@gmail.com>
> CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Raghuvarya S <quic_raghuvar@quicinc.com>
> ---
>  .../android-tools/android-tools/android-tools-adbd.service      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

For the series:
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

