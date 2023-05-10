Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301BAC77B75
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 00:33:06 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.5379.1683678777410430920
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 17:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PDqoaQPr;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-39400a8354cso1242775b6e.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 17:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683678776; x=1686270776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15twhrlVIf0IddMVywCEvqN/54gtbx2p4QacNxMtsik=;
        b=PDqoaQPrZ41988QyAuF8XBqamijOJDy2NRkN8bB5Z6k4LPv3hEnPvuvWxIf8GrcBB2
         YPbUSELci0tFAypNSsO2BzDtbYkd2y17yqx/Cqi8ZEpwp78nf9oxLxzrlGMhhPsqYjr3
         77cBk9D0zd+LoO6AA+rNYR50UN3Hsj7dZKqN2OULNmV3r4rVp3Yk7UkVrroqv68hY9P/
         L3zlp45lp8M2cn5BQZPV8/yoEgfvUPXHxayul2DTPKn+OSPMcfqVxiEshsZk8fdvkVQc
         dYqN9RlXDCuN/fKJaD5Gy9mCrfeT3b2h9PrMOW3lcVvIphD7cWWjz1nJ3J2PT3vAHv9D
         EwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683678777; x=1686270777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15twhrlVIf0IddMVywCEvqN/54gtbx2p4QacNxMtsik=;
        b=FCAcWfGOqBOKJ7yzi15mWXeyX4S4sp4wa4sjmXK2kVEDSgfgCIxqrDnRlyH0IL0Mv9
         j/yPtRWw+EiHSrXfP9bh5GPODN1MbP4uuYSFYOn9pNHwtPAenoUZLuEuiLEIgBy8HkPx
         aC+FLSO0VCKvzEroaJDqqO5nL7YgNHmUXBSNu3QnjGl1e82np1PW46e94BsjwiKIwR9k
         bLst98B71zSlisd+3WoOgJdlwrTeiyINdhvV64HXajeaIpfOkc2+1CNss2dRthDx1Pth
         f1n3SPHE6dyVkmr5doSXIIE/uNnncHpcaJkDLIf+7s2owVK4q+WeqETB3viyHIhRY4Lx
         o/Hw==
X-Gm-Message-State: AC+VfDzz/xR+U0LjItfDcn1ttMzfGp+k2Cbn0O38zTw7SfKp4AEfaDSW
	rLwcfP0oJDk35N/AWJE76Wwwh5sqMJNki+cYlYcYPZ5IO2g=
X-Google-Smtp-Source: ACHHUZ4wuy2fl37C1AbQStQx7X/O95tSwFsDk+kLZ9WAzD0mRvEIR5YRH0+dTvswLdSHI2j/unNUIPcd3bFTYcWb8tE=
X-Received: by 2002:aca:d19:0:b0:38b:eb6b:315f with SMTP id
 25-20020aca0d19000000b0038beb6b315fmr2062512oin.41.1683678776491; Tue, 09 May
 2023 17:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <1683621888-1304-1-git-send-email-wangmy@fujitsu.com> <1683621888-1304-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1683621888-1304-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2023 17:32:30 -0700
Message-ID: <CAMKF1sp=y3viBFbj_xkqCY4QAieXP3NdFdw-__0BKiRuiT736w@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH V2] libplist: upgrade 2.2.0 -> 2.3.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 00:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102518

I think this is the next issue
Seeing build failures for usbmuxd while building with musl/qemux86_64

| ../../git/src/conf.c:235:2: error: call to undeclared function
'plist_read_from_filename'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
|         plist_read_from_filename(&config, config_file);
|         ^
| ../../git/src/conf.c:235:2: note: did you mean 'plist_read_from_file'?
| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/usbmuxd/1.1.2+gi=
tAUTOINC+f50e52f339-r0/recipe-sysroot/usr/include/plist/plist.h:843:17:
note: 'plist_read_from_file' declared here
|     plist_err_t plist_read_from_file(const char *filename, plist_t
*plist, plist_format_t *format);
|                 ^
| ../../git/src/conf.c:259:12: error: call to undeclared function
'plist_write_to_filename'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
|         int res =3D plist_write_to_filename(config, config_file,
PLIST_FORMAT_XML);
|                   ^
| ../../git/src/conf.c:259:12: note: did you mean 'plist_write_to_file'?
| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/usbmuxd/1.1.2+gi=
tAUTOINC+f50e52f339-r0/recipe-sysroot/usr/include/plist/plist.h:885:17:
note: 'plist_write_to_file' declared here
|     plist_err_t plist_write_to_file(plist_t plist, const char
*filename, plist_format_t format, plist_write_options_t options);
|                 ^
| ../../git/src/conf.c:293:6: error: call to undeclared function
'plist_read_from_filename'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
|         if (plist_read_from_filename(&config, config_file)) {
|             ^
| ../../git/src/conf.c:433:7: error: call to undeclared function
'plist_write_to_filename'; ISO C99 and later do not support implicit
function declarations [-Wimplicit-function-declaration]
|         if (!plist_write_to_filename(plist, device_record_file,
PLIST_FORMAT_XML)) {
|              ^
| 4 errors generated.
| make[2]: *** [Makefile:568: usbmuxd-conf.o] Error 1

On Tue, May 9, 2023 at 1:45=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Changes:
>   * Rename PLIST_UINT to PLIST_INT and add plist_new_int() and plist_get_=
int_val()
>   * Add support for JSON format
>   * Add support for OpenStep format
>   * Introduce error codes and format constants
>   * Add return value to import/export functions to allow returning error =
codes
>   * Add new plist_sort function
>   * Add several human-readable output-only formats
>   * Add new plist_write_to_string/_stream/_file functions
>   * Add new plist_print function
>   * Add new plist_read_from_file function
>   * Add new plist_mem_free() function
>   * Add a few C++ methods
>   * Add C++ interface test
>   * Add PLIST_NULL type
>   * Some code housekeeping (mostly clang-tidy)
> - Breaking:
>   * plist_from_memory() gets additional parameter
> - Bugfixes:
>   * Fix multiple bugs in all of the parsers
>   * Fix handling of PLIST_UID nodes
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libimobiledevice/{libplist_2.2.0.bb =3D> libplist_2.3.0.bb} | 2 +-
>  meta-oe/recipes-extended/libimobiledevice/libplist_git.bb     | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.2.0.bb =3D>=
 libplist_2.3.0.bb} (95%)
>
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb =
b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
> similarity index 95%
> rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
> rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
> index daaff00395..0ca21314ac 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.3.0.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
>  inherit autotools pkgconfig python3native python3targetconfig
>
> -SRCREV =3D "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
> +SRCREV =3D "72480212cd8ec0ab8d0b5064df52c146cac603b4"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb b/=
meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> index 82f3e4d0c9..8f5a7f166f 100644
> --- a/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> +++ b/meta-oe/recipes-extended/libimobiledevice/libplist_git.bb
> @@ -8,9 +8,9 @@ DEPENDS =3D "libxml2 glib-2.0 swig python3"
>
>  inherit autotools pkgconfig python3native python3targetconfig
>
> -PV =3D "2.2.0+git${SRCPV}"
> +PV =3D "2.3.0"
>
> -SRCREV =3D "db93bae96d64140230ad050061632531644c46ad"
> +SRCREV =3D "72480212cd8ec0ab8d0b5064df52c146cac603b4"
>  SRC_URI =3D "git://github.com/libimobiledevice/libplist;protocol=3Dhttps=
;branch=3Dmaster"
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102494): https://lists.openembedded.org/g/openembedde=
d-devel/message/102494
> Mute This Topic: https://lists.openembedded.org/mt/98779663/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

