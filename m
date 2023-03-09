Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B47CC61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 17:44:23 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.20717.1678383861965669580
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 09:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j3dXdNx+;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id bk32so2235604oib.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678383861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KS4hxmSzWFQNR8MDQlSgkXzMuhxeF6w/Y8mJocMts44=;
        b=j3dXdNx+qEVtk5vHhpGNDkModXocTLQWU671F8Depjzussc1RfsPvG/lhW+mDkdlGk
         Eh/d21xsRU0uNmtHQ0RlAuz3uiH/MDt+tWCQIeq4McGBuIjXozNQTBCu5UoEQP01rClW
         /i8Cy1IiWccipH+rwIbkxjZPsTvbK1cpSt7hkn3WtsivyDN3N+10COMv1T5v92iDImc/
         EHiuXrfQXCyW6JcBN5ayRnmdFfXBXcRU6R8Ee/2dmKn+knX/Tq2cWlKPrkcmI6+TY3DF
         Ey+a7DLUJMke8RVIMOQm/J826/EE1Jp8xSx3RExOizr77N7lEo26ADcFi9gTOzCol2lE
         fPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678383861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KS4hxmSzWFQNR8MDQlSgkXzMuhxeF6w/Y8mJocMts44=;
        b=bembAwBxfbHMsT69ebPRg72hRx93KvjPLdZsNhW6APviK3eXHIUb/+5wh80AKtHNLE
         vCLCo2zhgbnO9Y9kdqr597EKGwSqM1kFW/JcfMa/wkU5n4oVL+rKqJ2DhrCpeB2AFzb4
         0fxHd6+yDFWHkKibOMFK3HO4Jh2Q+W0L27TJKcbIgiJu9LOb6crXbRAFykVz8jwhi9s4
         yYwhj5dqWFUQ0QbWR8DU51kZqeqQugp+fIGQpCNyS6GKWEP4kmoLq0XMOR2Cln+fIThT
         LHR9mc79DHusy9kD4kh0COiXZ93wbJSUzMmSdJPGxd+EEjZ/h0DuNzC4ANXRYrfD8sY6
         1S+g==
X-Gm-Message-State: AO0yUKX8rdsoC3cRpeTBUTgHuTrrrYWtPAz/a/pXnfJknXRjhgRXwXBj
	2w/+o2Xj9PQFIfKO5sIzdW3D90lM3HTvuusaCc3pND+E
X-Google-Smtp-Source: AK7set+2YeZXje4IZdelBHbSdtEWuVKc6QBRT2rnM4C/H7dnG1Wr8+M99CJYDeRFmbILGtVNUTRPuSpYKFRJqO/KwL4=
X-Received: by 2002:a05:6808:8ed:b0:384:371a:a413 with SMTP id
 d13-20020a05680808ed00b00384371aa413mr6827301oic.4.1678383859849; Thu, 09 Mar
 2023 09:44:19 -0800 (PST)
MIME-Version: 1.0
References: <20230309083942.1182203-1-changqing.li@windriver.com> <20230309083942.1182203-2-changqing.li@windriver.com>
In-Reply-To: <20230309083942.1182203-2-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Mar 2023 09:43:53 -0800
Message-ID: <CAMKF1sovWqgd9SuiQBv_Ov-jDmZu4wB4gt9AV4SOxu_x5Q-1Ww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] redis: upgrade 6.2.9 -> 6.2.11
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 17:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101462

already applied

On Thu, Mar 9, 2023 at 12:39=E2=80=AFAM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-extended/redis/{redis_6.2.9.bb =3D> redis_6.2.11.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/redis/{redis_6.2.9.bb =3D> redis_6.2.11.=
bb} (96%)
>
> diff --git a/meta-oe/recipes-extended/redis/redis_6.2.9.bb b/meta-oe/reci=
pes-extended/redis/redis_6.2.11.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_6.2.9.bb
> rename to meta-oe/recipes-extended/redis/redis_6.2.11.bb
> index 100c2a2a5..5a410bf4c 100644
> --- a/meta-oe/recipes-extended/redis/redis_6.2.9.bb
> +++ b/meta-oe/recipes-extended/redis/redis_6.2.11.bb
> @@ -17,7 +17,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.ta=
r.gz \
>             file://GNU_SOURCE.patch \
>             file://0006-Define-correct-gregs-for-RISCV32.patch \
>             "
> -SRC_URI[sha256sum] =3D "9661b2c6b1cc9bf2999471b37a4d759fa5e747d408142c18=
af8792ebd8384a2a"
> +SRC_URI[sha256sum] =3D "8c75fb9cdd01849e92c23f30cb7fe205ea0032a38d11d46a=
f191014e9acc3098"
>
>  inherit autotools-brokensep update-rc.d systemd useradd
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101439): https://lists.openembedded.org/g/openembedde=
d-devel/message/101439
> Mute This Topic: https://lists.openembedded.org/mt/97492249/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

