Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web12.3002.1616575696382469807
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 01:48:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=O1wulWBJ;
 spf=pass (domain: blade-group.com, ip: 209.85.222.41, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ua1-f41.google.com with SMTP id g5so7591320uan.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 01:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gAfarEvOlSUX2/OxUIzEyzg5W699bMjvdFoQHakg12w=;
        b=O1wulWBJqyuvtqnwdaf0wV+amcbyu+ZpEJKQMNGAyk8gjRpC9Nc+NMZR3+nuSabJ5h
         PHteKf3gedDm4P+zORP+xL3qQXsHEP47OknZhZ3NHcfP6i/8y7ibtrQAYl+Btz7XtTW2
         mQwosOGVp2oEtiXH92QkJCsBW/taJG3Fpymf/GjWN0Xr58pY8pVG/7PnwXoNtNCK5F01
         OAKiV5x7VPvo0eXhefc/5TR0aDFllQcLp0J9/rSiaqcbhxFBP3diR3mB6M4iMUQaku2W
         y6zktiGvoWURWoCx0Yb9Ak8UxYTjmEEd3NShtRkMAu8Q4mENcfENKVmjtR9c3rbMhd1q
         UJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gAfarEvOlSUX2/OxUIzEyzg5W699bMjvdFoQHakg12w=;
        b=gYM2Njt/CYyZYrid/92rP476ViQkAciJHoHvqXl8sRlRHY/8EadxJI3WOpIj4Ms+YF
         NpaVYtR6FEZqRzEIlksUZQ+NSdLjmvSj76/VI/SLjxlZiBAWF/bRuuTxsh8gH5nV1MSP
         AOX6cBPpONswZDDjUU+Y9ebtWO3tzDCDJ+M1HYBo5uB7mW4z7YIH9s51BS5zcvLXc0TT
         eMPw8tThuK4GkO5fW/x+bdKvOdGgw7rWBAyeeEWR1nt0cW3+gZjfJBx3RLU/yP9ZNdC2
         hecRcpygnWmgqigR1KHXBGq6RZEOKIdSIUcJidndW+YW9gU2yieQJ+BDB9oafKUwusCC
         emwQ==
X-Gm-Message-State: AOAM532ZjL4N4HcC6NRSFP8CVL7TaSaKcJi+oIptG7SKo2VhZT5EWFz3
	vXy0jBBtHBMQK7sgPteG4xDH/vNt/JDdnHTJW2iLZw==
X-Google-Smtp-Source: ABdhPJyPrW6Bk7JkwGTv4VqHAT/S7wrQnfYQ3pUoB9dR4wLIYuNveCRdTuGygrhG3Oq9Jo2bt91AAwLCQjKreaWwHP8=
X-Received: by 2002:a9f:2341:: with SMTP id 59mr861221uae.30.1616575695443;
 Wed, 24 Mar 2021 01:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210323171107.812146-1-yann@blade-group.com> <PH0PR11MB4902C7290C76EC692025A1D9D7639@PH0PR11MB4902.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB4902C7290C76EC692025A1D9D7639@PH0PR11MB4902.namprd11.prod.outlook.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 24 Mar 2021 09:48:04 +0100
Message-ID: <CA+4=imZS3P8J3G-xnCCOjg1+ck9iUk3SGB7UmguTaHXw+V-HXQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS
To: "Oleksiy Obitotskyi -X (oobitots - GLOBALLOGIC INC at Cisco)" <oobitots@cisco.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksiy,

Le mer. 24 mars 2021 =C3=A0 09:23, Oleksiy Obitotskyi -X (oobitots -
GLOBALLOGIC INC at Cisco) <oobitots@cisco.com> a =C3=A9crit :
>
> Could you please look into https://autobuilder.yoctoproject.org/typhoon/#=
/builders/88/builds/1071/steps/12/logs/stdio
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing PROVIDES 'ffmpeg' (but /home/pokybuild/yocto-worker/meta-o=
e/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb =
DEPENDS on or otherwise requires it)
> ffmpeg was skipped: because it has a restricted license 'commercial'. Whi=
ch is not whitelisted in LICENSE_FLAGS_WHITELIST
> NOTE: Multiple providers are available for runtime ssh (dropbear, openssh=
)
> Consider defining a PREFERRED_RPROVIDER entry to match ssh
> ERROR: Nothing RPROVIDES 'mpv' (but /home/pokybuild/yocto-worker/meta-oe/=
build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb RD=
EPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'mpv'
> NOTE: Runtime target 'mpv' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['mpv']
> ERROR: Nothing RPROVIDES 'mpv-dev' (but /home/pokybuild/yocto-worker/meta=
-oe/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.b=
b RDEPENDS on or otherwise requires it)
> No eligible RPROVIDERs exist for 'mpv-dev'
> NOTE: Runtime target 'mpv-dev' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['mpv-dev']

The autobuilder tries to build mpv, but it seems it does not attempt
to build ffmpeg.  I infer from this that it is
deciding what builds to attempt based on the lack of LICENSE_FLAGS,
right ?  Then wouldn't it be possible
to catch this situation and consider the build failure as "expected"
because its cause is simply
"cannot test because of a LICENSE_FLAGS in a dependency" ?

For more context, see my "[RFC] ffmpeg: make LICENSE_FLAGS fine-grained" pa=
tch.

Best regards,
--=20
Yann




>
> Regards,
> Oleksiy
>
> ________________________________________
> From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists=
.openembedded.org> on behalf of Yann Dirson <yann.dirson@blade-group.com>
> Sent: Tuesday, March 23, 2021 19:11
> To: openembedded-devel@lists.openembedded.org
> Cc: Yann Dirson
> Subject: [oe] [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS
>
> From: Yann Dirson <yann@blade-group.com>
>
> This flag does not describe the mpv package, but ffmpeg instead.
> It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.
>
> It is above all not needed, the real problem is even more clear without i=
t:
>
>  ffmpeg was skipped: because it has a restricted license 'commercial'. Wh=
ich is not whitelisted i  LICENSE_FLAGS_WHITELIST
>  ERROR: Required build target 'mpv' has no buildable providers.
>  Missing or unbuildable dependency chain was: ['mpv', 'ffmpeg']
>
> Signed-off-by: Yann Dirson <yann@blade-group.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.32.0.bb
> index e04925d0f..6a3fd9715 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
> @@ -12,9 +12,6 @@ DEPENDS +=3D " \
>  LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D91f1cb870c1cc2d31351a4d25=
95441cb"
>
> -# While this item does not require it, it depends on ffmpeg which does
> -LICENSE_FLAGS =3D "commercial"
> -
>  SRCREV_mpv =3D "70b991749df389bcc0a4e145b5687233a03b4ed7"
>  SRC_URI =3D " \
>      git://github.com/mpv-player/mpv;name=3Dmpv \
> --
> 2.30.2
>


--
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech
