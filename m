Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3385CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 06:46:31 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.7918.1727160390022685441
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 23:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZoHc+5lj;
 spf=pass (domain: linaro.org, ip: 209.85.128.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6de14e0f050so38683337b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 23:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727160389; x=1727765189; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EqlTvrrw5unQOiqfuT8QWWzLwSLeNDlzTLMfBRbzftg=;
        b=ZoHc+5ljFDrsjfLtCiIY0Zero3IUqjIMANjX8VslTA7/DIca7xf03zamg1G+YXnhIB
         fB/w/NAU743n5N3HfpXD+TvI7XV/gGncHDV0iQNaX84Qp8a0eoRhAnQBoJTLG9cOr7Uc
         H3dM0iuYFBVwQeuxkz2awNTfiEj5BbsykOs6I4Lmp4sJIhWx5zKVoqArR1g1vIUdWD5h
         oxUpzDxI7QEFpNV+JFlm/rFzixuQmH0BKD85IPtIsZ7RmvZH+bDgsBy19Qjc2TExzv1K
         bwETKHAO7FUnwlvp6pk8FxQOhn4dH6NG6rLK6P38YGh8qmEI1tE7E2DORqjq1YoktvKe
         KiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727160389; x=1727765189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqlTvrrw5unQOiqfuT8QWWzLwSLeNDlzTLMfBRbzftg=;
        b=vSZgbOzvYuCX0eCgTXAaUHVS0auGQ8ZxmEgnN74rJA8U5YxCgSCydo6bVjqq/OG+aq
         WnoZAm2kJsZjLPw1BfKFfJ+wBgR2276ksc4wuhVt+vIvlLuhcUdCXe6C+/FKbph0JLnN
         cbigRehRpI1PTAfzhxurFJaaYPIXurXZO35LV1nJu86L1OkeLH86XEPs5b7TiRD5iiUe
         5uVeT5Ec+Q7sGOJ5gq8o7KGaI8TTycvgeI0b7kt01bdBJuG/TKm/llVlN26KOowy0xUO
         zBODOSH4ScwRh4ejqWSMs5gMMIie4mQkbYM5QNpvjCEtBgzLK8knI1oAqseP+NI8RaXn
         kDRA==
X-Gm-Message-State: AOJu0YzWK80Vioq8+OPogRYsQbGLJtI8J8B4gv6ZiGxVNQSefl4HFEm8
	P8Ke+y7Vd1ULOH4Aucak7auMNkKvp/jx203qQ+avVTyMnS9JJr8i3LjM+ckvPrpbMsh7DluQXuq
	VmqZZ4OpEae6B6VJHM/8DVhY/JvyAMBP6Jf9BFg==
X-Google-Smtp-Source: AGHT+IF4nS6wkg5s9GTSfgoBgSUa6ePBCAqmzhOPI4/ONXjC3B1c5ByUjAUgOLEt/xYtvQITghdifHywwCDuRRiIXkw=
X-Received: by 2002:a05:690c:48c4:b0:6db:a7d3:6410 with SMTP id
 00721157ae682-6dfeefe5f02mr123652847b3.44.1727160389153; Mon, 23 Sep 2024
 23:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
In-Reply-To: <20240924063229.2309109-1-quic_raghuvar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 08:46:18 +0200
Message-ID: <CAA8EJpq=RbpZRMhLanTD1_r_DOfXcLgdqr+kM0AjVL2_KSuThw@mail.gmail.com>
Subject: Re: [meta-oe][scarthgap][PATCH 1/3] android-tools-adbd.service:
 Update ConditionPathExists to /etc
To: Raghuvarya S <quic_raghuvar@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 06:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112474

On Tue, 24 Sept 2024 at 08:36, Raghuvarya S <quic_raghuvar@quicinc.com> wrote:
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

