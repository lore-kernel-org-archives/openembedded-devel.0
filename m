Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D34FD4F23
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:44:14 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2740.1773168253620487634
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eK3VzfYy;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40f1ffba6a0so4746341fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 11:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773168253; cv=none;
        d=google.com; s=arc-20240605;
        b=VKD9aS7brE6v1T9uVTS9coU4FqDv0FWipVCRZk4xxGy3fqI75CqsZSux+ygRdqFv7v
         7yqXdXJcY7suYr++3uvsK8dW1r6VcQZS8Xqf/zLS4+s/HCa9QY9FSnr3mrYRJ/QwIV3Q
         bTzy/mBvEln4FVR7I2JAlectPCxyuqIGOEQFIxGMao4W5gJO0Oi+Bd5X/U9lI39LC2+D
         w/LLcXdAve3wfn9YDiYH23OhBWWrWoZs8d3WP8QrB/qbBcgEnCcc19R5QBwfhaSlRKGp
         kOhEOnUdAm0jelImxqF/SARMPsGKDCJ8imNPxVuw875bZnW6Fl1dSTp5ms7Q2CR7Ggez
         TGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ibKM3l6J93C/gOvIhMPooVnXI+5F6LSaHhIk9ewIJ7g=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=FXi/2cCu0XJt459stsDufeYlsa1vIlfwJf79Een1lTCcrsCK5x+u5SYAD4HZOtRIhS
         fOnzrERNT8o2RAkRHsNtAc8bRG6HDEfpgpsAz68rhsioNueuzoNK5KO8g3+YX7VeJ57M
         NYovHhcTla9WxNYgxPpbRWGCtJZwCNIGtZcX1OitA/OiFI3A4MsjXdxytZxgRiSq+4Y/
         GSN4AiDjb6zG/JuZpnilbic9LARbLXeKtoqFnspQRaTe1WxLnXE2Od1PydXxwo+F3G9N
         aO2HbTczyGss64B43eZSAsAwypVzC5j00gzaeRbWul/vMwt0RgmcCZtuK606Au0drqEi
         +nUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773168253; x=1773773053; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibKM3l6J93C/gOvIhMPooVnXI+5F6LSaHhIk9ewIJ7g=;
        b=eK3VzfYyt23bGYnSDqCMeOrka10EINDSRHScvU0q+7yyWZVxduSHOkoxnzfzE8RZMM
         H7q5erUPIqETtmn0eZBTG/dskbwhGeWK/RJc2bM5cDKt8Tl8UpyKoRYLtLQJ8ObQYbde
         MYaf3OM2SCwxjoptWX1PiR28Ff3i4gZdj87zi/zOvga5oiM4sIC2zhDLvK7HKMN3gpMx
         Jux1Zu31hqTY8O1xMSKVSSO4ApAGDO4atCg0Spg4J3VrbBOoMOrMLsgaFqbXBxIONEp2
         /+u6dXzAW2oX74M4+3Qk7UhZ1tWjmbDL82MVwnbqfpl4lsn0YDFEF4MB0fFzQQUMijIX
         S20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773168253; x=1773773053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ibKM3l6J93C/gOvIhMPooVnXI+5F6LSaHhIk9ewIJ7g=;
        b=VAvHvLlv5+t9UP9Kwsr7GV8X/PKBeliCRlLzunQ0rw29WDtQdMLudq2hM4M9kg0wKa
         MNguLBGuWksZhpSXHij0BFI0KdDIPaVzNHnMFutllkQe6gplSCykHqAWm3D9xnSGAVp0
         ACKMP/77mLNRmUKx+zlzQSbE+8kzIlBTpEZJsd1x2zpkFnCSE3CI6gLDNCwefGIhP644
         hGWxHI1GrWj55LQSw4hvzEnlogqYFeFG6K0mCE/G8ciq3daNvfB1AhGYaK/Up6VA4N0+
         GCb9/zPp0rI1DzBzduveVaUmuayjqaOMOw+tVXNf5OzonNJteJwZvbLcTBhX1QEXKHc0
         pnPQ==
X-Gm-Message-State: AOJu0YxxNq2ZdZubBdZR7XXm9R2FjYzdfWvu/Mc06ap1EkMyvdb4wqbQ
	s2CE8rCPKCx1RNMSzNrYtNaEm3qyGK0WgQQS0Bl79VHgJOm1Bu5mR8OBXla9mS/ikOcNgdSv1PO
	EPGoaYJso+d2yZqVwGlEMAQFgmCZ1aDA=
X-Gm-Gg: ATEYQzxCGbrn9YEW3zupJ7uvrWPZfrpRldLCZmPVjyDSNaa/4GDidzhwCJrK42hPx4U
	VWH4EMh9jqipIFp7qEsgWMCoYxSgoCbGHksmyH1f8TV2s6iA1eKbmWD5LBF49ljA+KMwbXicdgU
	DxtJvZB5yMqc/QicpgQXjs6rHfFx+2v6KbvvqQiv9sW3bRqwNjrhuAvDCgbnfmcScoRKw4vfV+/
	uJWQHV+izdz++G/wSD9NMH3CvW+Wob7ENqGnz0IAzI1DgW+D2RjtWxsf/x4C8NPLfzUFaC+bY3+
	pGThWwGZ
X-Received: by 2002:a05:6870:5589:b0:409:68f6:569b with SMTP id
 586e51a60fabf-416e400369cmr8878020fac.12.1773168252721; Tue, 10 Mar 2026
 11:44:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260310121726.1115244-1-skandigraun@gmail.com> <20260310121726.1115244-2-skandigraun@gmail.com>
In-Reply-To: <20260310121726.1115244-2-skandigraun@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 11 Mar 2026 07:44:01 +1300
X-Gm-Features: AaiRm5306mwRPOYMz1Z-pozJQByKiq0-S0bj-qwk5Z1vo67OLMJo3TaSyqplnlI
Message-ID: <CADySD0FuPi9w8JWMjkrDG3wQ-e4GGdjRRZegoX+He823g8BQZQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][whinlatter][PATCH 2/2] python3-django: upgrade
 4.2.28 -> 4.2.29
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 18:44:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125036

On Wed, Mar 11, 2026 at 1:17=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Contains fiuxes for CVE-2026-25673 and CVE-2026-25674.

typo, "fiuxes"-> "fixes"

>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../{python3-django_4.2.28.bb =3D> python3-django_4.2.29.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb =3D=
> python3-django_4.2.29.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb=
 b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-django_4.2.28.bb
> rename to meta-python/recipes-devtools/python/python3-django_4.2.29.bb
> index 2c6d33991c..ded9e6fc1f 100644
> --- a/meta-python/recipes-devtools/python/python3-django_4.2.28.bb
> +++ b/meta-python/recipes-devtools/python/python3-django_4.2.29.bb
> @@ -1,7 +1,7 @@
>  require python3-django.inc
>  inherit python_setuptools_build_meta
>
> -SRC_URI[sha256sum] =3D "a4b9cd881991add394cafa8bb3b11ad1742d1e1470ba99c3=
ef53dc540316ccfe"
> +SRC_URI[sha256sum] =3D "86d91bc8086569c8d08f9c55888b583a921ac1f95ed3bdc7=
d5659d4709542014"
>
>  RDEPENDS:${PN} +=3D "\
>      python3-sqlparse \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125027): https://lists.openembedded.org/g/openembedde=
d-devel/message/125027
> Mute This Topic: https://lists.openembedded.org/mt/118239500/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

