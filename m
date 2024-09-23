Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B53CF9C71
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 17:40:27 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.784.1727113226386950653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 10:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MZBOQRqT;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5e56759e6d7so2917873eaf.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 10:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727113225; x=1727718025; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjxHn6TjHI52+01GgEP8UDBc/ytLQrSlTbE73P8cD6g=;
        b=MZBOQRqTH6Ix2XFjMYNwtURJa8L73gCLWMJscAUJ4J5f0SeScOm932a95yJ22MKZIS
         h/Q5Iew8T9SGZ8uvnxxJptWr3mNHthP39/ODGPis0U9rZBdUiH4nAA5MHbm9RfJYQ/Or
         f3Q1pE9rF2BcwyD5ofVCTfvpn08a78uS7PPktTwaLQnteVxMSmj/+78jFEEi3qc2qj8B
         +BP8cjedzc/Nfl4CiKIrTlTLHzkf82jaba7FeMQVQpT9bek6hd7Wqfhfzsvl3dJtnOH4
         GbAnPyTyEj0C8x0IRYuTBppdlLDiKYcY3ohs+8FjzxRgOMmQhTq8UAX9ZKcdmmbpIlho
         bRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727113225; x=1727718025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjxHn6TjHI52+01GgEP8UDBc/ytLQrSlTbE73P8cD6g=;
        b=nkbdCwK2DggAt0SpfTzUb0qBoDNowDdQROTF5D3LvPNtnXihnLBoLXgFeyphQWc4A/
         u52Rt1LIcc+DcYH6IIleaQX+Y/KWQ4j7TtqRXGWbClv94mKh7OOVL1Ne9cEvY0Li3bdg
         uRPHKnINf/SUfJ1r0MpcqHDJKkbQbta3LV04NxVB81E0j7ty5GKYKqibb2UP6ODO7RxZ
         /vn7xAj+lJ/9yAcZOnHx13EoxxdGKIgVYlBTMydPLkJyQbUVUCAZyChybPY0ih6LCzSK
         4maFsfONlqMcGT0FrYbGiGXrAan/VX0nYzXcOM/NrouCy4rxHNozFSr1kb4Vw3fUoVS7
         4D+Q==
X-Gm-Message-State: AOJu0YxrP63defyb61EVPcYU4n5Rl0p1YKi4pdvoAH10ipUd/XqHEyTt
	lQcVqjcQyTUHsJf1EhAkiUaUWp2xPzv2bVBr2J1TzHZGhRKLH6HpbHj96FKz2XpbCGFt1d188G9
	c1WVK5UPy88XfOGNuE1ZcbpkyvaA=
X-Google-Smtp-Source: AGHT+IE4f8DURg9phSA0GxztdYBUn+Er6y3t9ZzijOm6Ie/ZaT34OTn2pydPxNQZXnKZiUjQN+pBMGvtvnCXqlYPCUA=
X-Received: by 2002:a05:6820:2296:b0:5e5:7086:ebe8 with SMTP id
 006d021491bc7-5e58b848286mr5400362eaf.0.1727113225428; Mon, 23 Sep 2024
 10:40:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240920150822.1131707-1-f_l_k@t-online.de> <20240920150822.1131707-14-f_l_k@t-online.de>
In-Reply-To: <20240920150822.1131707-14-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2024 10:39:58 -0700
Message-ID: <CAMKF1srbew8Z5e6afK3+8FZ=GSKgV4Oqu-C_YPx6S3Jue0Q-EQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 14/23] gnome-user-share: update 43.0 -> 47.0
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 17:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112462

This fails with clang, I think it will be an improvement to fix it

git/src/http.c:153:29: warning: unused parameter 'user_data'
[-Wunused-parameter]
     153 | httpd_child_setup (gpointer user_data)
         |                             ^
   ../git/src/http.c:394:3: error: call to undeclared function 'kill';
ISO C99 and later do not support implicit function declarations
[-Wimplicit-function-declaration]
     394 |                 kill (httpd_pid, SIGTERM);
         |                 ^

kill() comes from signal.h and it might be missing in this file.

On Fri, Sep 20, 2024 at 8:08=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This is gnome-user-share 47.0, a system for easy sharing of user files.
> Major changes since 47.alpha:
> - Translation updates
> Major changes since 43:
> - Increase the required Apache web server version to 2.4
> - Remove GNOME 2 migration code
> - Remove the size limit for file transfers
> - Fix leaks
> - Translation updates
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../{gnome-user-share_43.0.bb =3D> gnome-user-share_47.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gnome-user-share/{gnome-user-share_43.0.=
bb =3D> gnome-user-share_47.0.bb} (92%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_4=
3.0.bb b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> similarity index 92%
> rename from meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43=
.0.bb
> rename to meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0=
.bb
> index 6fc78dd29..4c8ad3a2a 100644
> --- a/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_43.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-user-share/gnome-user-share_47.0.bb
> @@ -14,7 +14,7 @@ inherit gnomebase gsettings features_check
>  REQUIRED_DISTRO_FEATURES =3D "systemd"
>
>  SRC_URI =3D "git://gitlab.gnome.org/GNOME/gnome-user-share.git;protocol=
=3Dhttps;branch=3Dmaster"
> -SRCREV =3D "a0e790aa9494db9d1b1f48b4fc0d2f78e112044d"
> +SRCREV =3D "77ecbaddab0ed2121859926acbfccc9cecdee0db"
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ??=3D "modules"
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112419): https://lists.openembedded.org/g/openembedde=
d-devel/message/112419
> Mute This Topic: https://lists.openembedded.org/mt/108560574/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

