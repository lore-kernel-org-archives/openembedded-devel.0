Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F36C02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 07:05:17 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.82606.1738566308954705004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 23:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iHl7lmSi;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-71e15717a2dso2282153a34.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 23:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738566308; x=1739171108; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjSYiB3J8Yo6kLp0+SaLCV6LEp4T1LwDVzhr0ygKcWk=;
        b=iHl7lmSifMv2kOG/RixCW6pBuRAZTqP6qAYgngXpFM/OmxtOzaHt9nQFcw27UhzSSB
         UmQRp/i//tDj1YDRigpCyYJZb38Wi/DwSXAMvxvJppkW0hAIFF49l9OMRpldVFLthX6n
         nAjYkKApocWiXLwV7EJqoZisd0YP6DlMyHeHOTvqas88hE3ATs0j0eUMJDo5vyznwsrq
         yvpO8KHcqVg6ft6o3YrDUMgZV/xUD2wd0azmUuhfn6C1Y7e19pkK1c+HpTmUyZcFGYJR
         zbLq259GXI8VOhA0GCvV+nYt+xBikFiyOWO7zTvBmwfTnSxOVf6tErYjfzoMgPYHwtCt
         P8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738566308; x=1739171108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjSYiB3J8Yo6kLp0+SaLCV6LEp4T1LwDVzhr0ygKcWk=;
        b=q9a+Q/ASFbOoU9BxqKtoUGKb8tFbbCsRwMFvXFYdK25z5QbIb0lcrS+xgJY+e/MkX2
         eCnNbKHitOlxtB3+tM1c1vt/hVDoPuQvjesOkVHJRmyVM0DMiOuoWL2CqbB++ZzDnJge
         i7AUMGEJKdSzFM+HSZs/n11AUIyHQbZSK79kZ7YiB8vE5v3dGSQFaz60JDI03vLPHbDa
         yzT0lQGiTAkflqdpI7a9eZR/jUJlMAb4dyarOLRgkl6rbPoYK5JXO0MFkt3O5RzBTWiu
         MCHnUUvWYjpGXbdjrX+njL3D22RJcfsTur0RgJHCM3LHE2jkWtf5iz4Ofv0fEU9XNn9V
         QGuQ==
X-Gm-Message-State: AOJu0YwTUmPsAaGQTrlubTr+zGYvjIXNHoXiTAkh8eC6wHc9Qc5TTpEA
	G3o5UqCk1ObFyco04WFpLvYXsagBIRp7N3BCxgwh/Yb7tPe2u0+B6oKlodUsxt/IcxemXGm9Hm6
	sgGIZat/hH9izj0QMO6NhxyqCAH8=
X-Gm-Gg: ASbGncsymieh2npcjJCYSLgoAyFhVDjW8HNrX5jxDsGN/G65Bux3f3fSIG93z4e3wQO
	QOu4/RNwxbHYIh60K/Z8YhVXkHMBJb+qvPyfDPJTj0AMqgG8xUH1psl5QkZdVwfQQcNknoc49
X-Google-Smtp-Source: AGHT+IGabgRMZHLO8DsIDkaLQW1qwKsHLDub/FYan/4PqdU++Djrby0TRt8OTgMvdTLDQcsXD7nUBNbhNaYh5Ckwmy0=
X-Received: by 2002:a05:6830:6316:b0:71d:f361:5cfb with SMTP id
 46e09a7af769-7265672f5f7mr14111750a34.5.1738566308088; Sun, 02 Feb 2025
 23:05:08 -0800 (PST)
MIME-Version: 1.0
References: <20250201170240.2880-1-alex.kiernan@gmail.com>
In-Reply-To: <20250201170240.2880-1-alex.kiernan@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 2 Feb 2025 23:04:42 -0800
X-Gm-Features: AWEUYZn7losEyCKm8XJGkTR8-WiGwNK7gYlbj5yd6XbQBnOfGD72SOSJu2KPFdU
Message-ID: <CAMKF1sqj9fCQr8rwXHDi0CSp-+tqGW+6GWPzuRu_hmgBsqVwOg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/3] mdns: Upgrade 2559.40.32 -> 2559.60.39.0.1
To: alex.kiernan@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 07:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115234

I am seeing

NOTE: Multiple providers are available for runtime libnss-mdns
(libnss-mdns, mdns)
Consider defining a PREFERRED_RPROVIDER entry to match libnss-mdns

Does this need to apply along with relevant patches you sent to oe-core ml =
?

On Sat, Feb 1, 2025 at 9:03=E2=80=AFAM Alex Kiernan via lists.openembedded.=
org
<alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>  .../mdns/{mdns_2559.40.32.bb =3D> mdns_2559.60.39.0.1.bb}         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-protocols/mdns/{mdns_2559.40.32.bb =3D> m=
dns_2559.60.39.0.1.bb} (99%)
>
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb b/=
meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
> similarity index 99%
> rename from meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
> rename to meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
> index 9cc6708d18c5..6fea434de81a 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_2559.40.32.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_2559.60.39.0.1.bb
> @@ -28,7 +28,7 @@ SRC_URI =3D "git://github.com/apple-oss-distributions/m=
DNSResponder;protocol=3Dhttps
>             file://0004-Add-definition-for-MAX.patch \
>             "
>  BRANCH =3D "rel/mDNSResponder-2559"
> -SRCREV =3D "0b8a5dbcefd6cc72846385aebfe4f6111f2814cb"
> +SRCREV =3D "e8a63bd04dda3f83a80f1dbc6db03e7806d87c11"
>
>  # We install a stub Makefile in the top directory so that the various ch=
ecks
>  # in base.bbclass pass their tests for a Makefile, this ensures (that am=
ongst
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115213): https://lists.openembedded.org/g/openembedde=
d-devel/message/115213
> Mute This Topic: https://lists.openembedded.org/mt/110937760/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

