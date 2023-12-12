Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7475C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 19:44:35 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.5893.1702410272973481585
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 11:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GymeXP8B;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-203198c9aa5so84455fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 11:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702410272; x=1703015072; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJc26VqXL8zinvUheULT+8efBwTurMcOKMIuXXiGB+A=;
        b=GymeXP8BKWiOL/0pUlj9eVKxLZiQuK/YgWiBHGF9JW8sy07TbwneXJEH6NoE5nUGG+
         SK7JvNjb1ApAFN4SjMjJI4/socB2dyo4QfNB8UPDPCuSZfDmgsocW5dCay6rUwiGzMUl
         CB4gzcK7ZppBOBFSFmYItNBkvI8ngeNXSwae65P4Nzx0D4pO2CqgoFeTmpotvUnBNMLg
         +1+aOSLUqEme1Q5Cr7baUUt8TAEISn77xl/6cw6LT8CiefIzidYboXp1MnMk5Gu1gPzS
         9i8kkZvnwRK9LvCC2s2E6VD7Wm7tAh/AOHXWPQsBxZ7Wgkn6A/KDhIJ4wsPcLdYxfElX
         u8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702410272; x=1703015072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJc26VqXL8zinvUheULT+8efBwTurMcOKMIuXXiGB+A=;
        b=rb1QbhmNq6f+1CnB5xCm9eIeFEZHnssOqnWQqX1GNg2eaz4dQHLQnX/GjnkJKa5fZz
         WZc+AzpQCwX/Jlk8hrm4SJzpRJb7+JIRzW8avPaL2D6AVk2MOkVPqhrnIRk1ZBzSOchx
         wSyhy0ca9Y6gl+HplSUjvnBNkycCnRgd5ELom9VHGvUPVHU5byfIkVICGXhxOt0HZPTT
         b8UuBKigNK/DWFJZnenDnWYdd7mAA9Yku50F+3OpcOOWx5RS+5zdu3lYsRUj7prDcAUB
         VkBUMJywWTpAJedQEYkDx7ueKbjmP3/wJSQhn8OiokSSUVmw4+vGU5YvkXGpH3+jOCoP
         58AA==
X-Gm-Message-State: AOJu0YydtE1fo57NkY/mlMWWm0o9gRn7Rb9beOWSaRa014eQ31lSu4nF
	nJiMZ193wSYGepLOBh8VfnS0bbfqavipNiCxzkGhPQoy
X-Google-Smtp-Source: AGHT+IHVrVifEMndKisKv0/Qw0K2pJcd+phyQueIkZpZskIUAPAO3ykVqK8RnfoEwBzDJxSET3FlytJWUmAG7aBcMX0=
X-Received: by 2002:a05:6871:459a:b0:1ef:b591:5733 with SMTP id
 nl26-20020a056871459a00b001efb5915733mr9048854oab.15.1702410272245; Tue, 12
 Dec 2023 11:44:32 -0800 (PST)
MIME-Version: 1.0
References: <20231211200926.1365050-1-William.Lyu@windriver.com>
In-Reply-To: <20231211200926.1365050-1-William.Lyu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Dec 2023 11:44:06 -0800
Message-ID: <CAMKF1so2bn7KT+-B1uKquph2BkX5=3YNq_x80rnF-+qsxdrAhw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager: Improved SUMMARY
 and added DESCRIPTION
To: william.lyu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 19:44:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107340

On Tue, Dec 12, 2023 at 11:43=E2=80=AFAM william.lyu via
lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: William Lyu <William.Lyu@windriver.com>
>
> The SUMMARY and DESCRIPTION are taken from Arch Linux wiki page:
> https://wiki.archlinux.org/title/NetworkManager
>
> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ---
>  .../networkmanager/networkmanager_1.44.0.bb                   | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.44.0.bb
> index d213ef650..0857d63b1 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.44.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.44.0.bb
> @@ -1,4 +1,6 @@
> -SUMMARY =3D "NetworkManager"
> +SUMMARY =3D "NetworkManager is a program for providing detection and con=
figuration for systems to automatically connect to networks."
> +DESCRIPTION =3D "NetworkManager is a program for providing detection and=
 configuration for systems to automatically connect to networks. NetworkMan=
ager's functionality can be useful for both wireless and wired networks. Fo=
r wireless networks, NetworkManager prefers known wireless networks and has=
 the ability to switch to the most reliable network. NetworkManager-aware a=
pplications can switch from online and offline mode. NetworkManager also pr=
efers wired connections over wireless ones, has support for modem connectio=
ns and certain types of VPN."
> +

maybe add some line breaks here

>  HOMEPAGE =3D "https://wiki.gnome.org/Projects/NetworkManager"
>  SECTION =3D "net/misc"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107339): https://lists.openembedded.org/g/openembedde=
d-devel/message/107339
> Mute This Topic: https://lists.openembedded.org/mt/103136589/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

