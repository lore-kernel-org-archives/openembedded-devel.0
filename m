Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25661CD6E55
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 03:22:15 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16669.1780370526502550028
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2026 20:22:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qR+9uZFp;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-43bfe055ffbso4854360fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2026 20:22:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780370525; cv=none;
        d=google.com; s=arc-20240605;
        b=FY4SjaUu9qLkd+vQYgBj9pG8NrFE56ZB7si61Q02RPWvCCb8+q0JRJGuUAKCkdJjBj
         pNX2l7kqPl3DzTj0nrubTUhbJcfmpyeuCadLt9uMHCrrsI50b6hZRhaDC7jS8KyhB56K
         QsMcCOaHHa70sw5ACmeYe4cfdVVp/CB9p88ng++RtlhU8aJhBQG24VUXMzvlAfHNNlJE
         26UMcBCQhShbbr4de3iX3DLRRbMFZ6VSxEJ3G+ebVFYXY4/R8P9zR2e9vwdnyafY21yV
         2GBj1WU08saRsURSOUvPH2dtw9c9klDmgfPFJj3ilfj7/RrJj/mc015goPFmKG9Sptv9
         NDEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wC++z5PJtSl8nS3lLtA+9amVUWSrowUE5AcMzRf5bGM=;
        fh=t00iliNe9pL0QaiZgATkfZzbJzbg/gzT7cLy1S2kUZs=;
        b=DNt/erQ1fkCcxXoVmfgKeIOL/Ri/G5wUguLuPo9VtdGye8svTuGOMMIUHhNAIgySlF
         EyjZqaSuzPNZnbmP6h4YQL++KDiwVWsaQvpvGJaPRt6CEJzVF26UAzh/AvJ0Ado0Thq/
         4bbnNb0su2C8X4gNLhPTlQl77eaXxd+LWhElDX7kWSVxI/edcuZh8QGTrzeYaB5ki61W
         3mNMaWZt5YvfC6kQ1faa7DEnIJWCa4lzOFor6XgkWO4gDA0iU3LNXUmuPVeMe9hBhobf
         l5CmjAZwC4rqePzVPXBPLmbDgrTdO3mlxrh6x6Cyd+l6Gx8IXekQwER7zioCwmfC2emV
         OTPg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780370525; x=1780975325; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wC++z5PJtSl8nS3lLtA+9amVUWSrowUE5AcMzRf5bGM=;
        b=qR+9uZFpGM+/DywBphxVJ+SN2piZIptAqqIMlvRyrCP+YrbwZpfPf0dwMGuqYtJdG0
         JyQTyk0FptaUqs1kvn/QWDBpFJ4hQ6/SYKjTib+Rnlf6n/wD/c527GEhnCG20PFCV2R7
         D6DE3p8vzEggewLfMce3PT6QFpTajOzrIPGDo6083037pcf5W2Uu/MJ8DtJ3JdOYDSzl
         cH8FzcS78XAf/Ddn358Zrl8arlz2c7bQREi/dKLCHkq15z7WpFoI/ha1zpgq67zLTl7i
         6eEyakjaWgC+P32uwi5Y1BlwenKO37/xrqISreGIARHAxS7wG4fGYgp7U/2lO7dj6O8+
         IuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370525; x=1780975325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wC++z5PJtSl8nS3lLtA+9amVUWSrowUE5AcMzRf5bGM=;
        b=kp8QdzrI2sRqL5IlHrtVoTPH/CWnXoRM2j1/dm7GrGtpm6qT6ue0yEISJAnhj/TrEZ
         INvdHeFKGAiIYyJRV7Zdp+RpAmuVAIj4xNkk44IJdeLFPss+rcxcDQzDAJa8vtW/a8UA
         mLxr20gzkQPenEhOkDG5Ika3anTBXh+FA8HrjMm505rr/ONLk3nl81ByCG6YMpH3TJ59
         YeKVT3Khc6MGIFA/+FWwcHiC2AULAUALZBqIXbDqaLb0+GgrXARE8+v0EKBrqjgPeDwm
         Ac+nqvvZ6Z54W31YZZpvCCKXLoQTDIk8qZjeKfICP9ZiRfOUERxTcaofqfWwV9KDj6T4
         Ba9A==
X-Gm-Message-State: AOJu0YxbGE/7Yc2A6+48v6c7whCNB//OL/FUAg6faNBunmaxIG4gJfGd
	j7toEVvXi+xOMU1UNbXD5tHOZpXQkjcROdCjsLUm0q8r/ICwnT1PDFQMI6ONGnf6hx1aP1b4gSC
	Mp0J5JMQ88X6K4gm3wZRbGhnGH2PkKu+gEL0e
X-Gm-Gg: Acq92OESzVXcm3R6M3wt0Yn8FOymi1/XEYuR1yzHWEdCjNj3sGj/n0yDII/l7Z7WZ91
	7WP+krmEcjfiSJb6WoSsFfCpoLzr3BhxQjqIbkTGyYkhx65IZvtEzV/96IOBI5JwrLSVozFAKce
	QOaCu2WgKSltvBwtEmYez3WmvdAQ9NndNQHuW8bt08JHL1rOCCy11eDQA0isUGgcRj5GbU5hGE7
	2YUzP/JvuNON8+IpFVZ4olr60XlrEWoafCBX8QYr57aQqFfAd42qOhqX0UlMu7hUH8CpqQ/L44e
	+3yvidvwCLVgFhNHQyW/
X-Received: by 2002:a05:6870:2323:b0:439:b98f:b3d3 with SMTP id
 586e51a60fabf-43ca43756d6mr8157170fac.33.1780370525523; Mon, 01 Jun 2026
 20:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260530114825.3936122-1-filipe.pires@konsulko.com>
In-Reply-To: <20260530114825.3936122-1-filipe.pires@konsulko.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 2 Jun 2026 15:21:54 +1200
X-Gm-Features: AVHnY4Jz9diPWBvA7ESfsgDlsf9kUdw4yH7NmnmuKqq82sbdjlRi8aAfaYvZBms
Message-ID: <CADySD0FTZORu5GkE5Jgss4JYiw-oHHwtmCSSGaep68=FjF+DFQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] memcached: upgrade 1.6.41 -> 1.6.42
To: filipe.pires@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 03:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127317

Thanks for your patch but there is already a pending one[1]

[1] https://lists.openembedded.org/g/openembedded-devel/message/127222


On Sat, May 30, 2026 at 11:48=E2=80=AFPM fpires96 via lists.openembedded.or=
g
<filipe.pires=3Dkonsulko.com@lists.openembedded.org> wrote:
>
> From: Filipe Pires <filipe.pires@konsulko.com>
>
> ---
>  .../memcached/{memcached_1.6.41.bb =3D> memcached_1.6.42.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-support/memcached/{memcached_1.6.41.bb =
=3D> memcached_1.6.42.bb} (95%)
>
> diff --git a/meta-networking/recipes-support/memcached/memcached_1.6.41.b=
b b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
> similarity index 95%
> rename from meta-networking/recipes-support/memcached/memcached_1.6.41.bb
> rename to meta-networking/recipes-support/memcached/memcached_1.6.42.bb
> index e41ebdb171..28d8ba3cf9 100644
> --- a/meta-networking/recipes-support/memcached/memcached_1.6.41.bb
> +++ b/meta-networking/recipes-support/memcached/memcached_1.6.42.bb
> @@ -20,7 +20,7 @@ RDEPENDS:${PN} +=3D "perl perl-module-posix perl-module=
-autoloader \
>      "
>
>  SRC_URI =3D "http://www.memcached.org/files/${BP}.tar.gz"
> -SRC_URI[sha256sum] =3D "e097073c156eeff9e12655b054f446d57374cfba5c132dcd=
be7fac64e728286a"
> +SRC_URI[sha256sum] =3D "50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73=
fc21dc8b45395de7"
>
>  CVE_STATUS[CVE-2022-26635] =3D "disputed: this is a problem of applicati=
ons using php-memcached inproperly"
>
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#127296): https://lists.openembedded.org/g/openembedde=
d-devel/message/127296
> Mute This Topic: https://lists.openembedded.org/mt/119560810/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

