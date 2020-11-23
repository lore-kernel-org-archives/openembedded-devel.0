Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.41874.1606164875313217976
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:54:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s7bLhSQX;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id u4so18368697qkk.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CAnL15r+68pcHN2YfxkG43tY2gx2BQy9CaOem6cCCwE=;
        b=s7bLhSQXkV3iN4puhi0PmPnMvkNnfgD21igeE8/92uv+4e4oyun58gQt+ecsGmaErY
         gLE+SlYcX8ZrXkCKEQCE9tAMefS07fG3Psr80sH9jPGWYJOMqg6nKtg0plafA1sGBnv4
         tvMiYbCkrjmJDx1P/BPKms6EcnQSvJgIXE0RGMcfv9mh0o1Ye3tJmadzb6AWu5FXwu4q
         /SfvHsmIunZEL8DsrL80veZoSTxOX7xR9MCQ4pbkq48KIyFbB67j3/jPcGLl/2Ws556c
         Q8u6j+Wfs6ahEPJ8KDGiXvZfaZ/9NZ7AHIoUvi6Vz8p2IoYuNYV74FapmY50x3rHOTjn
         Ltzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CAnL15r+68pcHN2YfxkG43tY2gx2BQy9CaOem6cCCwE=;
        b=OkRRdRePCChtc8KJqVHvwkhOhN7dXDOf6MkxjQzIEVm0wmuXq8J4DfGY4uQbdq2SC4
         iN+f3jne29vtmMvHUy9zksT7263CSk4b3N0KcGn5y0htrNkl9gWNGBOzxSii6whGm+7/
         +vn/zIIhREZkcvvWDQIzspk0un60kNQqi69JJxYmxmqLL5z9eYcgnA7wTZp3YjxLsQwX
         Y49Olrb3Wp5OMWbMCA+nSUSrsjM8v65Pr9P3CT/64U2lRvOF+FVsenvJsDXjrMBzb1sx
         kDjIADjXHk7hWMfUKEjGbCuMdIZn5dYZ6Ogj5VgNAuJNrWKUpKYsUWVfPQswd9Tmazo1
         e29A==
X-Gm-Message-State: AOAM531AWc8Ed+vg2R5OlbF4vk7d6tUQR5shM+5WIMYRrmZWq4t/7oRB
	gGc3tL6z2tNmO4zAUH3VrV0eh7+qqPxMmN5vuUc=
X-Google-Smtp-Source: ABdhPJwa4DLroqJVrR5r4LU4yemDwrpQMcXb/w3/P0rTgZyokCbVtZjyq15eKIO9ABDOSbmn0ZB5lpcwTPkPOaGyjN8=
X-Received: by 2002:a05:620a:204c:: with SMTP id d12mr1507422qka.212.1606164874228;
 Mon, 23 Nov 2020 12:54:34 -0800 (PST)
MIME-Version: 1.0
References: <9a7c96e6-34e7-0331-a97b-9f5f2c423552@gmail.com>
In-Reply-To: <9a7c96e6-34e7-0331-a97b-9f5f2c423552@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Nov 2020 12:54:08 -0800
Message-ID: <CAMKF1spTFCF-BK18jvZf2rrCRM7+MKkwH2ySibuud7KqWhxttQ@mail.gmail.com>
Subject: Re: Dunfell-next merge request Nov 23
To: akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged thanks.

On Mon, Nov 23, 2020 at 11:41 AM akuster808 <akuster808@gmail.com> wrote:
>
> The following changes since commit 2a5c534d2b9f01e9c0f39701fccd7fc874945b=
1c:
>
>   python3-pykwalify: fix missing comma (2020-10-04 16:32:42 -0700)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/meta-openembedded dunfell-next
>
> for you to fetch changes up to f2d02cb71eaff8eb285a1997b30be52486c160ae:
>
>   python3-pyinotify: Add missing ctypes dependency (2020-11-15 11:13:25
> -0800)
>
> ----------------------------------------------------------------
> Anatol Belski (1):
>       chrony: Patch CVE-2020-14367
>
> Diego Rondini (5):
>       README: fix incorrect links
>       gvfs: adjust fuse packageconfig to fuse3
>       libeigen: update SRC_URI to download from gitlab
>       libeigen: update SRC_URI to use gitlab git
>       hplip: use libexecdir
>
> Gianluca Pacchiella (1):
>       Add missing dependencies for rsnapshot.
>
> Khem Raj (1):
>       ubi-utils-klibc: Remove trailing slash from S
>
> Lee Chee Yang (2):
>       glog : improve reproducibility
>       libgphoto2: improve reproducibility
>
> Mark Jonas (1):
>       python3-pyinotify: Add missing ctypes dependency
>
> Martin Jansa (1):
>       remmina: use git fetcher
>
> Ross Burton (1):
>       mpv: fetch waf in do_fetch
>
> Ulrich =C3=96lmann (1):
>       usb-modeswitch, usb-modeswitch-data: fix usrmerge
>
> Yi Zhao (1):
>       samba: upgrade 4.10.17 -> 4.10.18
>
> Zang Ruochen (2):
>       wireshark: upgrade 3.2.5 -> 3.2.6
>       wireshark: upgrade 3.2.6 -> 3.2.7
>
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.42.2.bb       |   2 +-
>  .../recipes-devtools/mtd/ubi-utils-klibc_2.0.2.bb  |   2 +-
>  meta-multimedia/README                             |   2 +-
>  .../0001-util-Simplify-input-validation.patch      |  59 ------
>  ...ild-on-FreeBSD-by-avoiding-NSS_BUFLEN_PAS.patch |  79 --------
>  ...cate-larger-buffer-if-getpwuid_r-returns-.patch |  50 -----
>  .../samba/{samba_4.10.17.bb =3D> samba_4.10.18.bb}   |   7 +-
>  .../chrony/chrony/CVE-2020-14367.patch             | 204
> +++++++++++++++++++++
>  .../recipes-support/chrony/chrony_3.5.bb           |   1 +
>  .../{wireshark_3.2.5.bb =3D> wireshark_3.2.7.bb}     |   2 +-
>  meta-oe/README                                     |   4 +-
>  meta-oe/recipes-extended/hplip/hplip_3.19.12.bb    |  14 +-
>  .../recipes-graphics/gphoto2/libgphoto2_2.5.25.bb  |   6 +
>  meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb   |  12 +-
>  meta-oe/recipes-support/glog/glog_0.3.5.bb         |   7 +
>  meta-oe/recipes-support/libeigen/libeigen_3.3.7.bb |   8 +-
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb   |   7 +-
>  meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   2 +
>  .../usb-modeswitch/usb-modeswitch-data_20191128.bb |   4 +-
>  .../usb-modeswitch/usb-modeswitch_2.6.0.bb         |   2 +-
>  .../python/python3-pyinotify_0.9.6.bb              |   3 +-
>  21 files changed, 252 insertions(+), 225 deletions(-)
>  delete mode 100644
> meta-networking/recipes-connectivity/samba/samba/0001-util-Simplify-input=
-validation.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/samba/samba/0002-util-Fix-build-on-F=
reeBSD-by-avoiding-NSS_BUFLEN_PAS.patch
>  delete mode 100644
> meta-networking/recipes-connectivity/samba/samba/0003-util-Reallocate-lar=
ger-buffer-if-getpwuid_r-returns-.patch
>  rename meta-networking/recipes-connectivity/samba/{samba_4.10.17.bb =3D>
> samba_4.10.18.bb} (97%)
>  create mode 100644
> meta-networking/recipes-support/chrony/chrony/CVE-2020-14367.patch
>  rename meta-networking/recipes-support/wireshark/{wireshark_3.2.5.bb =3D=
>
> wireshark_3.2.7.bb} (96%)
>
