Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BA7EB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:04:58 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.249.1689372290627479756
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dSsOoS9A;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-565a8d74daeso1476274eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 15:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689372290; x=1691964290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVLcij5Kn7caVnsxs6UnkEv4ZSRZ+Zneul+QhRdWdno=;
        b=dSsOoS9Ana7kBjk5d3TvrEQ7sEDDJ3J48J/aD749QZaOeoD3iSkxHfLESOEEinrB6D
         gbw69Dcfnv0+3LS+QZFU0d5w/S/h0PdXd01Eonf+LalwcRi/eG2oZQCxDUYGzpwYGS99
         lRDM8U2RhIrFTbbJl0iudc4VXGSwmUaPpShA8qhlEJv6jMBiIT0p61gwIdMsOrEHPB4v
         v5IUnk8s2/1+IQ3rkXHYI+k0fWuCD4X/kIVyOMCg4cwbGfXuQQBjTstQbp8iykZoFnA8
         Jai+4/aIcX9qL0lCA2h8PWkNR4xP19Bx2f1f5KSWP5jyoeIVxpWcaMExP+ifUYTSGdtS
         iIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689372290; x=1691964290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVLcij5Kn7caVnsxs6UnkEv4ZSRZ+Zneul+QhRdWdno=;
        b=dueJGttDKy0I2Ss1Q3hnqT94QwH7NY2+kvuIqtsz0lZc4hpXbyzT0mJDi1TkOBpyq8
         EOC8xODaZufH6fMW8kOAby7ajkZYNeJ2XZLEhZe4fm/v8rCub2lfOMll+uak1Zl2fcv4
         11hACXuaAxl9nvEsTzTNlciVsvSkBEVPbSLW7bJ7+yThvIm5REdl4TmE+zUjh3NBWjGT
         OPS02f5WAfzHXsM+gPP4/OxGucQXY+Q5GfWYd6horJGLawdzd0gTNJlA4qv3ix6weqLG
         hWKtopwl3irLPsCMamSYQh5ZiAwbANq+lT97kcTBJyPCk8FapXALj1/AqXVHlmEj9WJb
         uzGA==
X-Gm-Message-State: ABy/qLZscFUFK4q3tBqcTNdctva2j6lWI6Av0HY3oIYNuZoGg4Nxvpkv
	wXHBbR5SR9kwp7MOgpcOfmRauRm2gnaRSZ8bTks0QKgribY=
X-Google-Smtp-Source: APBJJlGq2BgUH+0kkhqapvwetikaLnBmv+ZKKP6BYBmAWXH6wslUQIsHAaCTsptZQl6PB4kYXQzBDkBjVy4PA6pZy1E=
X-Received: by 2002:a4a:b5ca:0:b0:563:68e6:3be2 with SMTP id
 u10-20020a4ab5ca000000b0056368e63be2mr207743ooo.1.1689372289673; Fri, 14 Jul
 2023 15:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <1689296444-28141-1-git-send-email-wangmy@fujitsu.com> <1689296444-28141-3-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1689296444-28141-3-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Jul 2023 15:04:23 -0700
Message-ID: <CAMKF1srup6UtozS8i_i=gwcMAG1WO2zRyVZ_de6zLtSB9Lqx8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] wtmpdb: add new recipe
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jul 2023 22:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103870

fails to build with ptests

tests/tst-dlopen.p/tst-dlopen.c.o: file not recognized: file format
not recognized

see - https://errors.yoctoproject.org/Errors/Details/716656/

On Thu, Jul 13, 2023 at 6:01=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../recipes-extended/wtmpdb/wtmpdb_0.7.1.bb   | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
>
> diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb b/meta-oe/re=
cipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> new file mode 100644
> index 0000000000..c3b97b0630
> --- /dev/null
> +++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.7.1.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "Y2038 safe version of wtmp"
> +HOMEPAGE =3D "https://github.com/thkukuk/wtmpdb"
> +DESCRIPTION =3D "last reports the login and logout times of users and wh=
en the machine got rebooted."
> +LICENSE =3D "BSD-2-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D020090a00b69dd2af9ab82eb0003e=
a2c"
> +SECTION =3D "libs"
> +
> +SRCREV =3D "502b19a41c7a3b1b5e70969b18088683825f71f8"
> +
> +SRC_URI =3D "git://github.com/thkukuk/wtmpdb.git;branch=3Dmain;protocol=
=3Dhttps"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig systemd
> +
> +DEPENDS +=3D " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', =
'', d)} sqlite3 "
> +
> +SYSTEMD_SERVICE:${PN} =3D "wtmpdb-update-boot.service wtmpdb-rotate.serv=
ice"
> +
> +EXTRA_OEMESON =3D " -Dpamlibdir=3D${libdir}"
> +
> +do_install:append () {
> +      # Fix makefile hardcoded path assumptions for systemd (assumes $pr=
efix)
> +      # without usrmerge distro feature enabled
> +      install -d `dirname ${D}${systemd_unitdir}`
> +      mv ${D}${prefix}/lib/systemd `dirname ${D}${systemd_unitdir}`
> +}
> +
> +FILES:${PN} +=3D " ${systemd_system_unitdir} "
> +FILES:${PN} +=3D " ${libdir} "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103860): https://lists.openembedded.org/g/openembedde=
d-devel/message/103860
> Mute This Topic: https://lists.openembedded.org/mt/100132965/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

