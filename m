Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261EEC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 18:23:45 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19313.1787768619276301158
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 11:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QKwuJ6IX;
 spf=pass (domain: gmail.com, ip: 74.125.224.44, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66b32bb75beso1959867d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 11:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787768618; cv=none;
        d=google.com; s=arc-20260327;
        b=DgZefGRPKTAQfgmnpNf9EMNdssXhiksO9aqTfVUXvcxlE0PkIRxIqtfCeQ2bXxcuMV
         tiw4WXG/DdbDLEnn/VKibxFXVImtSbXHN/BPhwbtpsteoyWEJ2P5IFe2d0WCQRVl0LdU
         Ojhhjc937JCl9XRfC9tVKIj+mOeFM0+UakfpXPKMhJJfPt1AaH2EU9q0VC/qb8XXqYvd
         5mBugyG4nSrss8XggLhRIG7bpKJdiMbpEEiQL3jwqhrAKMbkHmJL9PZF7c3hHnRQlY4f
         VVQQLjtQqazOsiwatc49l4NXm5aMX0xi2+StKa4CpjJNmpw0b6FBDWLAJrdGKM34LnZx
         26Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jILk6vaPiAJKIDygR5TFDWN8PwZR8SqjxrJ+pJOZiTM=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=WLbCcHue69/3yQSECg8XIhkeuvm2kifA6hW0ACTi6g7S5ZwbV2auTiLYXlzHbUZ8N2
         J30I+v22cQnKoS31OvfXACOFYJaBiA2f8XNP3j4HQxoZrSXW8jZKzlFt0wm95JFCGZ0Y
         VqG9t3kapMjgnIq1FjqbSjjXl3HKU0pWKXC5LNsh6d/jwmS1Pa1LsJLyQx7QeaVeoYwU
         rvvf3DC1yVEn19Kt20eZZ0Q1GawdxckKOOVFn1I1bDupF49iO4QDRrcADO2FolfCCUgH
         CllTM5u6i6QQ/Dyu9SLVDkWcH4+ueB2X1B7PywO6/X/4lfEEDVl8dVeDe8KK2xSfis1b
         K//Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787768618; x=1788373418; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jILk6vaPiAJKIDygR5TFDWN8PwZR8SqjxrJ+pJOZiTM=;
        b=QKwuJ6IXiHrsd31XMLZPnft/QfiBP21RikJwlB30/5HyXOZeLWEiuu3a2pxZeax8ov
         hJ/FxecQXoqvXE0ymYkzdWRgfRmACyETpsxFsVRWDy6nRGAZViWEJAN8/tau4WyOSr90
         84ussinD+EnBAa3EsjxAyOm/cKdYaAP6PbL8ksQ5DDE6lff3KMtlr4gQ+81aH6lV/JWc
         LgkvNhf4N8GKBfDuOhtckK5VfJpmDqlPYwC9fSfm3hCr6plmYUTE9gfhT7fy2PMwZwux
         DVuwZldJ3tSgcdSL9W6GPTA+og14SF38YxuM5XDePBzMXmdwwFnMKkNl9Fo6/Ixl0chz
         DNSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787768618; x=1788373418;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jILk6vaPiAJKIDygR5TFDWN8PwZR8SqjxrJ+pJOZiTM=;
        b=izyEsCPdJoQjaI7j5nr45UtYFfMqcvPWH3OALFrtXHEfM0m7/qud677W7VzBFxzZl3
         Mx7ig7DXOidl76TsKeqhYiz9m39IxDwoYjZVsox3Yl3N4DRB5GTha+ReWxxCn5GfKYiv
         jM+TejY0HnpjA/Zojo1CrkNtKqDC39OEcHJKUs6F6pMSERxSmTmbF6jx5MEWfohMOEKb
         JH9HmzPJmezrf0eoP00HzjMgroJiWodvGMsync9pV19LHoFClnLHf5b5TpqG5sjgN7rx
         rGJSmzqG+8lcE78+lgpWMZo+6RXVOubc+MXBObDeptZIyvFt2F1DuBTRpXCF2eWquc0W
         zwLQ==
X-Gm-Message-State: AFuF++ktZoXItbCs5l1IQ+7kJO/mmJCrhsSv5uq32ja2kDVtO7ymF36+
	5BOt8aXtAvfAT+edr6N6g9AOxoaoa9PPTkCjQMKGak2PqBnelj/+lnIo2VUdlbEeVMY/go/jJE2
	N6qosrfaPy4NcJnodcAL5e+VC7PPmQKQ=
X-Gm-Gg: AR+sD11v06Gn/Yq6RaRmLCPYOFTLN30qv+9uFmS5IUPYI5OXi4+8fZJlHjHWKnMBhRW
	bNhPBcBuNjAJk0Fvw39z6hZV8GIxQQFS1GzYPb1xZeAzOOs8vuMeckx7rkRusPIVTQ7P4F0Ux8d
	cvKlkqmSwh6fiCizNGUJC9YOVZEd4HWwC/6evVJH6Koivzdc5DpIQaHfg//yfkFhIknGkzivj3+
	dadk4iX4F+I18Cc+ORArHxKKJlHUYmp3mEC3N0sVAmIsTmlVpBEFy2FIIcmTwq4zAKc0/fEVEdM
	vbkTwMtJXfP1rN0is9ZQAYJwnxWl8iwupQtj3rJ4KxTvWg7l0BM/hbTNZOpmYExbCs2VP+lBsih
	1COwCcbB+5Jj9CKcWir5AbphYbHXgT7YM+lyEBy0Bl5df5JcspEJk3+blrAS67yEjW4twv+x6om
	L4ljlEHE/m4dsUeihBKuIfjU+2PVxLL3Cfiv4D7Pa4AdXP4c5V/n3RMup6H7r0d+7QN5gEbHa2X
	3TDGCfyz89piovK
X-Received: by 2002:a53:e6c2:0:b0:66c:c661:3297 with SMTP id
 956f58d0204a3-66d256acbf5mr2390433d50.8.1787768618050; Wed, 26 Aug 2026
 11:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787738715.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1787738715.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Aug 2026 11:23:11 -0700
X-Gm-Features: AcwNN1V0HOZscvM0XRGxjalF8yFBBXaTmbXlC7fbF8oH1VDOs2agx1DUj6pxi7c
Message-ID: <CAMKF1soHC_5MLhAYNeqaiBTPXC=cQsN1CdU3WgrRqJhuDAJJ4Q@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/49] Wrynose pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006b6a320659f751b6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 18:23:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129519

--0000000000006b6a320659f751b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is applied now. Thanks Anuj

On Wed, Aug 26, 2026 at 3:10=E2=80=AFAM Anuj Mittal via lists.openembedded.=
org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in wrynose. Tested locally and on autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1749
>
> The following changes since commit
> 6bf0d8ad57b33950bab4c7f6c037e1ccb6f6e2eb:
>
>   sdbus-c++-libsystemd: add .git to github repository url (2026-08-07
> 08:21:30 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Danujm/wry=
nose
>
> for you to fetch changes up to 14282a02be9c74a1276a7cda7d6c89e054699a11:
>
>   libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR
> scrubbing (2026-08-26 07:13:01 +0530)
>
> ----------------------------------------------------------------
>
> Abhishek Bachiphale (1):
>   poppler: fix CVE-2026-10118
>
> Ankur Tyagi (12):
>   mpd: fix build error with libupnp v1.14.30 onwards
>   thin-provisioning-tools: upgrade 1.3.1 -> 1.3.3
>   hiredis: upgrade 1.3.0 -> 1.3.1
>   postfix: upgrade 3.10.12 -> 3.10.13
>   firewalld: upgrade 2.2.1 -> 2.2.3
>   file-roller: upgrade 44.5 -> 44.7
>   gnome-software: upgrade 50.0 -> 50.3
>   gdm: upgrade 50.1 -> 50.2
>   gvfs: upgrade 1.60.1 -> 1.60.2
>   cjose: upgrade 0.6.2.7 -> 0.6.2.8
>   swagger-ui: upgrade 5.32.11 -> 5.32.12
>   swagger-ui: upgrade 5.32.13 -> 5.32.14
>
> Darsh Kelaiya (10):
>   python3-aiohttp: fix CVE-2026-34993
>   python3-aiohttp: fix CVE-2026-47265
>   python3-aiohttp: fix CVE-2026-50269
>   python3-aiohttp: fix CVE-2026-54274
>   python3-aiohttp: fix CVE-2026-54275
>   python3-aiohttp: fix CVE-2026-54276
>   python3-aiohttp: fix CVE-2026-54277
>   python3-aiohttp: fix CVE-2026-54278
>   python3-aiohttp: fix CVE-2026-54279
>   python3-aiohttp: fix CVE-2026-54280
>
> Deepak Rathore (1):
>   redis: avoid LTO for clang builds
>
> Devansh Patel (3):
>   python3-filelock: set CVE_PRODUCT
>   python3-web3: add CVE_PRODUCT mapping
>   python3-httplib2: correct CVE_PRODUCT mapping
>
> Hetvi Thakar (9):
>   python3-pyjwt: Fix CVE-2026-48522
>   python3-pyjwt: Fix CVE-2026-48523
>   python3-pyjwt: Fix CVE-2026-48524
>   python3-pyjwt: Fix CVE-2026-48525
>   python3-pyjwt: Fix CVE-2026-48526
>   python3-twisted: Fix CVE-2026-42304
>   python3-ujson: Fix CVE-2026-54911
>   python3-web3: Fix CVE-2026-40072
>   libssh: upgrade 0.11.4 -> 0.11.5
>
> Khem Raj (4):
>   libsdl3-image: upgrade 3.4.2 -> 3.4.4
>   python3-psycopg: upgrade 3.3.3 -> 3.3.4
>   samba: upgrade 4.23.8 -> 4.23.11
>   libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR
>     scrubbing
>
> Omkar Patil (1):
>   openvpn: fix CVE-2026-13117
>
> Preeti Sachan (1):
>   libfastjson: fix rsyslogd segfault crash at load
>
> Rouven Rastetter (1):
>   vboxguestdrivers: Provide target kernel version
>
> Tugrul Kukul (1):
>   jq: fix CVE-2026-39956
>
> Vijay Anusuri (1):
>   giflib: Fix CVE-2026-26740
>
> Wang Mingyu (4):
>   python3-httplib2: upgrade 0.31.2 -> 0.32.0
>   libsdl3: upgrade 3.4.4 -> 3.4.8
>   gvfs: upgrade 1.60.0 -> 1.60.1
>   swagger-ui: upgrade 5.32.12 -> 5.32.13
>
>  ...ile-roller_44.5.bb =3D> file-roller_44.7.bb} |   5 +-
>  .../gdm/{gdm_50.1.bb =3D> gdm_50.2.bb}          |   2 +-
>  ...oftware_50.0.bb =3D> gnome-software_50.3.bb} |   5 +-
>  .../gvfs/{gvfs_1.60.0.bb =3D> gvfs_1.60.2.bb}   |   2 +-
>  .../musicpd/mpd/0001-upnp-allow-1.14.30.patch |  45 +
>  .../recipes-multimedia/musicpd/mpd_0.24.9.bb  |   1 +
>  ...{firewalld_2.2.1.bb =3D> firewalld_2.2.3.bb} |   2 +-
>  .../{samba_4.23.8.bb =3D> samba_4.23.11.bb}     |   2 +-
>  ...{postfix_3.10.12.bb =3D> postfix_3.10.13.bb} |   2 +-
>  .../openvpn/openvpn/CVE-2026-13117.patch      |  46 +
>  .../recipes-support/openvpn/openvpn_2.7.0.bb  |   1 +
>  .../giflib/giflib/CVE-2026-26740.patch        |  40 +
>  .../recipes-devtools/giflib/giflib_6.1.2.bb   |   1 +
>  .../jq/jq/CVE-2026-39956.patch                |  55 ++
>  meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   1 +
>  ...copg_3.3.3.bb =3D> python3-psycopg_3.3.4.bb} |   2 +-
>  .../{hiredis_1.3.0.bb =3D> hiredis_1.3.1.bb}    |   4 +-
>  meta-oe/recipes-extended/redis/redis_8.0.6.bb |   4 +
>  .../rsyslog/libfastjson_1.2304.0.bb           |   1 +
>  ...-image_3.4.2.bb =3D> libsdl3-image_3.4.4.bb} |   2 +-
>  .../{libsdl3_3.4.4.bb =3D> libsdl3_3.4.8.bb}    |   2 +-
>  .../{cjose_0.6.2.7.bb =3D> cjose_0.6.2.8.bb}    |   2 +-
>  .../{libssh_0.11.4.bb =3D> libssh_0.11.5.bb}    |   4 +-
>  .../poppler/poppler/CVE-2026-10118.patch      |  46 +
>  .../poppler/poppler_25.12.0.bb                |   1 +
>  .../thin-provisioning-tools-crates.inc        | 196 ++--
>  ....1.bb =3D> thin-provisioning-tools_1.3.3.bb} |   2 +-
>  .../vboxguestdrivers_7.2.8.bb                 |   4 +-
>  .../libhtml/libhtml-tree-perl_5.07.bb         |   7 -
>  .../libmodule-build-tiny-perl_0.048.bb        |   7 -
>  .../python/files/CVE-2026-40072.patch         | 861 ++++++++++++++++++
>  .../python/files/CVE-2026-42304_p1.patch      | 299 ++++++
>  .../python/files/CVE-2026-42304_p2.patch      |  30 +
>  .../python/files/CVE-2026-42304_p3.patch      |  33 +
>  .../python/files/CVE-2026-42304_p4.patch      | 318 +++++++
>  .../python/files/CVE-2026-42304_p5.patch      | 218 +++++
>  .../python/files/CVE-2026-42304_p6.patch      |  23 +
>  .../python/files/CVE-2026-48522.patch         | 126 +++
>  .../python/files/CVE-2026-48523.patch         | 115 +++
>  .../python/files/CVE-2026-48524.patch         | 125 +++
>  .../python/files/CVE-2026-48525.patch         | 146 +++
>  .../python/files/CVE-2026-48526.patch         | 126 +++
>  .../python3-aiohttp/CVE-2026-34993.patch      | 478 ++++++++++
>  .../python3-aiohttp/CVE-2026-47265.patch      |  64 ++
>  .../python3-aiohttp/CVE-2026-50269.patch      |  81 ++
>  .../python3-aiohttp/CVE-2026-54274.patch      | 182 ++++
>  .../python3-aiohttp/CVE-2026-54275.patch      | 115 +++
>  .../python3-aiohttp/CVE-2026-54276.patch      | 287 ++++++
>  .../python3-aiohttp/CVE-2026-54277.patch      | 249 +++++
>  .../python3-aiohttp/CVE-2026-54278.patch      | 182 ++++
>  .../python3-aiohttp/CVE-2026-54279.patch      | 295 ++++++
>  .../python3-aiohttp/CVE-2026-54280.patch      | 138 +++
>  .../python/python3-aiohttp_3.13.5.bb          |  13 +
>  .../python/python3-filelock_3.25.2.bb         |   2 +
>  ...2_0.31.2.bb =3D> python3-httplib2_0.32.0.bb} |   4 +-
>  .../python/python3-pyjwt_2.12.1.bb            |   7 +
>  .../python/python3-twisted_25.5.0.bb          |   8 +
>  .../python/python3-ujson/CVE-2026-54911.patch | 253 +++++
>  .../python/python3-ujson_5.12.1.bb            |   2 +
>  .../python/python3-web3_7.12.1.bb             |   3 +
>  ...er-ui_5.32.11.bb =3D> swagger-ui_5.32.14.bb} |   4 +-
>  61 files changed, 5161 insertions(+), 120 deletions(-)
>  rename meta-gnome/recipes-gnome/file-roller/{file-roller_44.5.bb =3D>
> file-roller_44.7.bb} (82%)
>  rename meta-gnome/recipes-gnome/gdm/{gdm_50.1.bb =3D> gdm_50.2.bb} (96%)
>  rename meta-gnome/recipes-gnome/gnome-software/{gnome-software_50.0.bb
> =3D> gnome-software_50.3.bb} (86%)
>  rename meta-gnome/recipes-gnome/gvfs/{gvfs_1.60.0.bb =3D> gvfs_1.60.2.bb=
}
> (97%)
>  create mode 100644
> meta-multimedia/recipes-multimedia/musicpd/mpd/0001-upnp-allow-1.14.30.pa=
tch
>  rename
> meta-networking/dynamic-layers/meta-python/recipes-connectivity/firewalld=
/{
> firewalld_2.2.1.bb =3D> firewalld_2.2.3.bb} (99%)
>  rename meta-networking/recipes-connectivity/samba/{samba_4.23.8.bb =3D>
> samba_4.23.11.bb} (99%)
>  rename meta-networking/recipes-daemons/postfix/{postfix_3.10.12.bb =3D>
> postfix_3.10.13.bb} (99%)
>  create mode 100644
> meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
>  create mode 100644
> meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
>  create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patch
>  rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.3.bb =3D>
> python3-psycopg_3.3.4.bb} (85%)
>  rename meta-oe/recipes-extended/hiredis/{hiredis_1.3.0.bb =3D>
> hiredis_1.3.1.bb} (91%)
>  rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.4.2.bb =3D>
> libsdl3-image_3.4.4.bb} (90%)
>  rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.4.bb =3D>
> libsdl3_3.4.8.bb} (97%)
>  rename meta-oe/recipes-support/cjose/{cjose_0.6.2.7.bb =3D>
> cjose_0.6.2.8.bb} (88%)
>  rename meta-oe/recipes-support/libssh/{libssh_0.11.4.bb =3D>
> libssh_0.11.5.bb} (90%)
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/CVE-2026-10118.patch
>  rename meta-oe/recipes-support/thin-provisioning-tools/{
> thin-provisioning-tools_1.3.1.bb =3D> thin-provisioning-tools_1.3.3.bb}
> (97%)
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-40072.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-42304_p1.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-42304_p2.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-42304_p3.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-42304_p4.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-42304_p5.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-42304_p6.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-48522.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-48523.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-48524.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-48525.patch
>  create mode 100644
> meta-python/recipes-devtools/python/files/CVE-2026-48526.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-34993.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-47265.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-50269.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54274.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54275.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54276.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54277.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54278.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54279.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54280.patch
>  rename meta-python/recipes-devtools/python/{python3-httplib2_0.31.2.bb
> =3D> python3-httplib2_0.32.0.bb} (76%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-ujson/CVE-2026-54911.patch
>  rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.11.bb
> =3D> swagger-ui_5.32.14.bb} (85%)
>
> --
> 2.54.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#129516):
> https://lists.openembedded.org/g/openembedded-devel/message/129516
> Mute This Topic: https://lists.openembedded.org/mt/120934698/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006b6a320659f751b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is applied now. Thanks Anuj</div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, Aug 26, 2026 at 3:10=E2=80=AFAM Anuj Mittal via <a href=3D"http://lists=
.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=3D"=
mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.open=
embedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Please merge these changes in wrynose. Tested locally and on au=
tobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1749" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1749</a><br>
<br>
The following changes since commit 6bf0d8ad57b33950bab4c7f6c037e1ccb6f6e2eb=
:<br>
<br>
=C2=A0 sdbus-c++-libsystemd: add .git to github repository url (2026-08-07 =
08:21:30 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> anujm/wrynose<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Danujm/wrynose" rel=3D"noreferrer" target=3D"_blank">https://git.open=
embedded.org/meta-openembedded-contrib/log/?h=3Danujm/wrynose</a><br>
<br>
for you to fetch changes up to 14282a02be9c74a1276a7cda7d6c89e054699a11:<br=
>
<br>
=C2=A0 libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR s=
crubbing (2026-08-26 07:13:01 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Abhishek Bachiphale (1):<br>
=C2=A0 poppler: fix CVE-2026-10118<br>
<br>
Ankur Tyagi (12):<br>
=C2=A0 mpd: fix build error with libupnp v1.14.30 onwards<br>
=C2=A0 thin-provisioning-tools: upgrade 1.3.1 -&gt; 1.3.3<br>
=C2=A0 hiredis: upgrade 1.3.0 -&gt; 1.3.1<br>
=C2=A0 postfix: upgrade 3.10.12 -&gt; 3.10.13<br>
=C2=A0 firewalld: upgrade 2.2.1 -&gt; 2.2.3<br>
=C2=A0 file-roller: upgrade 44.5 -&gt; 44.7<br>
=C2=A0 gnome-software: upgrade 50.0 -&gt; 50.3<br>
=C2=A0 gdm: upgrade 50.1 -&gt; 50.2<br>
=C2=A0 gvfs: upgrade 1.60.1 -&gt; 1.60.2<br>
=C2=A0 cjose: upgrade 0.6.2.7 -&gt; 0.6.2.8<br>
=C2=A0 swagger-ui: upgrade 5.32.11 -&gt; 5.32.12<br>
=C2=A0 swagger-ui: upgrade 5.32.13 -&gt; 5.32.14<br>
<br>
Darsh Kelaiya (10):<br>
=C2=A0 python3-aiohttp: fix CVE-2026-34993<br>
=C2=A0 python3-aiohttp: fix CVE-2026-47265<br>
=C2=A0 python3-aiohttp: fix CVE-2026-50269<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54274<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54275<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54276<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54277<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54278<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54279<br>
=C2=A0 python3-aiohttp: fix CVE-2026-54280<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 redis: avoid LTO for clang builds<br>
<br>
Devansh Patel (3):<br>
=C2=A0 python3-filelock: set CVE_PRODUCT<br>
=C2=A0 python3-web3: add CVE_PRODUCT mapping<br>
=C2=A0 python3-httplib2: correct CVE_PRODUCT mapping<br>
<br>
Hetvi Thakar (9):<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48522<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48523<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48524<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48525<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-48526<br>
=C2=A0 python3-twisted: Fix CVE-2026-42304<br>
=C2=A0 python3-ujson: Fix CVE-2026-54911<br>
=C2=A0 python3-web3: Fix CVE-2026-40072<br>
=C2=A0 libssh: upgrade 0.11.4 -&gt; 0.11.5<br>
<br>
Khem Raj (4):<br>
=C2=A0 libsdl3-image: upgrade 3.4.2 -&gt; 3.4.4<br>
=C2=A0 python3-psycopg: upgrade 3.3.3 -&gt; 3.3.4<br>
=C2=A0 samba: upgrade 4.23.8 -&gt; 4.23.11<br>
=C2=A0 libhtml-tree-perl, libmodule-build-tiny-perl: Drop obsolete TMPDIR<b=
r>
=C2=A0 =C2=A0 scrubbing<br>
<br>
Omkar Patil (1):<br>
=C2=A0 openvpn: fix CVE-2026-13117<br>
<br>
Preeti Sachan (1):<br>
=C2=A0 libfastjson: fix rsyslogd segfault crash at load<br>
<br>
Rouven Rastetter (1):<br>
=C2=A0 vboxguestdrivers: Provide target kernel version<br>
<br>
Tugrul Kukul (1):<br>
=C2=A0 jq: fix CVE-2026-39956<br>
<br>
Vijay Anusuri (1):<br>
=C2=A0 giflib: Fix CVE-2026-26740<br>
<br>
Wang Mingyu (4):<br>
=C2=A0 python3-httplib2: upgrade 0.31.2 -&gt; 0.32.0<br>
=C2=A0 libsdl3: upgrade 3.4.4 -&gt; 3.4.8<br>
=C2=A0 gvfs: upgrade 1.60.0 -&gt; 1.60.1<br>
=C2=A0 swagger-ui: upgrade 5.32.12 -&gt; 5.32.13<br>
<br>
=C2=A0...<a href=3D"http://ile-roller_44.5.bb" rel=3D"noreferrer" target=3D=
"_blank">ile-roller_44.5.bb</a> =3D&gt; <a href=3D"http://file-roller_44.7.=
bb" rel=3D"noreferrer" target=3D"_blank">file-roller_44.7.bb</a>} |=C2=A0 =
=C2=A05 +-<br>
=C2=A0.../gdm/{<a href=3D"http://gdm_50.1.bb" rel=3D"noreferrer" target=3D"=
_blank">gdm_50.1.bb</a> =3D&gt; <a href=3D"http://gdm_50.2.bb" rel=3D"noref=
errer" target=3D"_blank">gdm_50.2.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://oftware_50.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">oftware_50.0.bb</a> =3D&gt; <a href=3D"http://gnome-software_50.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">gnome-software_50.3.bb</a>} |=C2=A0 =
=C2=A05 +-<br>
=C2=A0.../gvfs/{<a href=3D"http://gvfs_1.60.0.bb" rel=3D"noreferrer" target=
=3D"_blank">gvfs_1.60.0.bb</a> =3D&gt; <a href=3D"http://gvfs_1.60.2.bb" re=
l=3D"noreferrer" target=3D"_blank">gvfs_1.60.2.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../musicpd/mpd/0001-upnp-allow-1.14.30.patch |=C2=A0 45 +<br>
=C2=A0.../recipes-multimedia/musicpd/<a href=3D"http://mpd_0.24.9.bb" rel=
=3D"noreferrer" target=3D"_blank">mpd_0.24.9.bb</a>=C2=A0 |=C2=A0 =C2=A01 +=
<br>
=C2=A0...{<a href=3D"http://firewalld_2.2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">firewalld_2.2.1.bb</a> =3D&gt; <a href=3D"http://firewalld_2.2.=
3.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_2.2.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://samba_4.23.8.bb" rel=3D"noreferrer" target=3D"=
_blank">samba_4.23.8.bb</a> =3D&gt; <a href=3D"http://samba_4.23.11.bb" rel=
=3D"noreferrer" target=3D"_blank">samba_4.23.11.bb</a>}=C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A02 +-<br>
=C2=A0...{<a href=3D"http://postfix_3.10.12.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.12.bb</a> =3D&gt; <a href=3D"http://postfix_3.10.1=
3.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.13.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../openvpn/openvpn/CVE-2026-13117.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 +<br>
=C2=A0.../recipes-support/openvpn/<a href=3D"http://openvpn_2.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">openvpn_2.7.0.bb</a>=C2=A0 |=C2=A0 =C2=A0=
1 +<br>
=C2=A0.../giflib/giflib/CVE-2026-26740.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 40 +<br>
=C2=A0.../recipes-devtools/giflib/<a href=3D"http://giflib_6.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">giflib_6.1.2.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A01 +<br>
=C2=A0.../jq/jq/CVE-2026-39956.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 55 ++<br>
=C2=A0meta-oe/recipes-devtools/jq/<a href=3D"http://jq_1.8.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">jq_1.8.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A01 +<br>
=C2=A0...<a href=3D"http://copg_3.3.3.bb" rel=3D"noreferrer" target=3D"_bla=
nk">copg_3.3.3.bb</a> =3D&gt; <a href=3D"http://python3-psycopg_3.3.4.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-psycopg_3.3.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://hiredis_1.3.0.bb" rel=3D"noreferrer" target=3D=
"_blank">hiredis_1.3.0.bb</a> =3D&gt; <a href=3D"http://hiredis_1.3.1.bb" r=
el=3D"noreferrer" target=3D"_blank">hiredis_1.3.1.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0meta-oe/recipes-extended/redis/<a href=3D"http://redis_8.0.6.bb" rel=
=3D"noreferrer" target=3D"_blank">redis_8.0.6.bb</a> |=C2=A0 =C2=A04 +<br>
=C2=A0.../rsyslog/<a href=3D"http://libfastjson_1.2304.0.bb" rel=3D"norefer=
rer" target=3D"_blank">libfastjson_1.2304.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0...-<a href=3D"http://image_3.4.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">image_3.4.2.bb</a> =3D&gt; <a href=3D"http://libsdl3-image_3.4.4.bb" =
rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.4.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libsdl3_3.4.4.bb" rel=3D"noreferrer" target=3D=
"_blank">libsdl3_3.4.4.bb</a> =3D&gt; <a href=3D"http://libsdl3_3.4.8.bb" r=
el=3D"noreferrer" target=3D"_blank">libsdl3_3.4.8.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://cjose_0.6.2.7.bb" rel=3D"noreferrer" target=3D=
"_blank">cjose_0.6.2.7.bb</a> =3D&gt; <a href=3D"http://cjose_0.6.2.8.bb" r=
el=3D"noreferrer" target=3D"_blank">cjose_0.6.2.8.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://libssh_0.11.4.bb" rel=3D"noreferrer" target=3D=
"_blank">libssh_0.11.4.bb</a> =3D&gt; <a href=3D"http://libssh_0.11.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libssh_0.11.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A04 +-<br>
=C2=A0.../poppler/poppler/CVE-2026-10118.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
46 +<br>
=C2=A0.../poppler/<a href=3D"http://poppler_25.12.0.bb" rel=3D"noreferrer" =
target=3D"_blank">poppler_25.12.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../thin-provisioning-tools-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
96 ++--<br>
=C2=A0....<a href=3D"http://1.bb" rel=3D"noreferrer" target=3D"_blank">1.bb=
</a> =3D&gt; <a href=3D"http://thin-provisioning-tools_1.3.3.bb" rel=3D"nor=
eferrer" target=3D"_blank">thin-provisioning-tools_1.3.3.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../<a href=3D"http://vboxguestdrivers_7.2.8.bb" rel=3D"noreferrer" t=
arget=3D"_blank">vboxguestdrivers_7.2.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../libhtml/<a href=3D"http://libhtml-tree-perl_5.07.bb" rel=3D"noref=
errer" target=3D"_blank">libhtml-tree-perl_5.07.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A07 -<br>
=C2=A0.../<a href=3D"http://libmodule-build-tiny-perl_0.048.bb" rel=3D"nore=
ferrer" target=3D"_blank">libmodule-build-tiny-perl_0.048.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 -<br>
=C2=A0.../python/files/CVE-2026-40072.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 861 ++++++++++++++++++<br>
=C2=A0.../python/files/CVE-2026-42304_p1.patch=C2=A0 =C2=A0 =C2=A0 | 299 ++=
++++<br>
=C2=A0.../python/files/CVE-2026-42304_p2.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
30 +<br>
=C2=A0.../python/files/CVE-2026-42304_p3.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
33 +<br>
=C2=A0.../python/files/CVE-2026-42304_p4.patch=C2=A0 =C2=A0 =C2=A0 | 318 ++=
+++++<br>
=C2=A0.../python/files/CVE-2026-42304_p5.patch=C2=A0 =C2=A0 =C2=A0 | 218 ++=
+++<br>
=C2=A0.../python/files/CVE-2026-42304_p6.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
23 +<br>
=C2=A0.../python/files/CVE-2026-48522.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 126 +++<br>
=C2=A0.../python/files/CVE-2026-48523.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 115 +++<br>
=C2=A0.../python/files/CVE-2026-48524.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 125 +++<br>
=C2=A0.../python/files/CVE-2026-48525.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 146 +++<br>
=C2=A0.../python/files/CVE-2026-48526.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 126 +++<br>
=C2=A0.../python3-aiohttp/CVE-2026-34993.patch=C2=A0 =C2=A0 =C2=A0 | 478 ++=
++++++++<br>
=C2=A0.../python3-aiohttp/CVE-2026-47265.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
64 ++<br>
=C2=A0.../python3-aiohttp/CVE-2026-50269.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
81 ++<br>
=C2=A0.../python3-aiohttp/CVE-2026-54274.patch=C2=A0 =C2=A0 =C2=A0 | 182 ++=
++<br>
=C2=A0.../python3-aiohttp/CVE-2026-54275.patch=C2=A0 =C2=A0 =C2=A0 | 115 ++=
+<br>
=C2=A0.../python3-aiohttp/CVE-2026-54276.patch=C2=A0 =C2=A0 =C2=A0 | 287 ++=
++++<br>
=C2=A0.../python3-aiohttp/CVE-2026-54277.patch=C2=A0 =C2=A0 =C2=A0 | 249 ++=
+++<br>
=C2=A0.../python3-aiohttp/CVE-2026-54278.patch=C2=A0 =C2=A0 =C2=A0 | 182 ++=
++<br>
=C2=A0.../python3-aiohttp/CVE-2026-54279.patch=C2=A0 =C2=A0 =C2=A0 | 295 ++=
++++<br>
=C2=A0.../python3-aiohttp/CVE-2026-54280.patch=C2=A0 =C2=A0 =C2=A0 | 138 ++=
+<br>
=C2=A0.../python/<a href=3D"http://python3-aiohttp_3.13.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-aiohttp_3.13.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 13 +<br>
=C2=A0.../python/<a href=3D"http://python3-filelock_3.25.2.bb" rel=3D"noref=
errer" target=3D"_blank">python3-filelock_3.25.2.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://2_0.31.2.bb" rel=3D"noreferrer" target=3D"_blank=
">2_0.31.2.bb</a> =3D&gt; <a href=3D"http://python3-httplib2_0.32.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-httplib2_0.32.0.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.12.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pyjwt_2.12.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +<br>
=C2=A0.../python/<a href=3D"http://python3-twisted_25.5.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-twisted_25.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
=C2=A0.../python/python3-ujson/CVE-2026-54911.patch | 253 +++++<br>
=C2=A0.../python/<a href=3D"http://python3-ujson_5.12.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-ujson_5.12.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0.../python/<a href=3D"http://python3-web3_7.12.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-web3_7.12.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0...<a href=3D"http://er-ui_5.32.11.bb" rel=3D"noreferrer" target=3D"_=
blank">er-ui_5.32.11.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.14.bb=
" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32.14.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A061 files changed, 5161 insertions(+), 120 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/file-roller/{<a href=3D"http://file-r=
oller_44.5.bb" rel=3D"noreferrer" target=3D"_blank">file-roller_44.5.bb</a>=
 =3D&gt; <a href=3D"http://file-roller_44.7.bb" rel=3D"noreferrer" target=
=3D"_blank">file-roller_44.7.bb</a>} (82%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gdm/{<a href=3D"http://gdm_50.1.bb" r=
el=3D"noreferrer" target=3D"_blank">gdm_50.1.bb</a> =3D&gt; <a href=3D"http=
://gdm_50.2.bb" rel=3D"noreferrer" target=3D"_blank">gdm_50.2.bb</a>} (96%)=
<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-software/{<a href=3D"http://gno=
me-software_50.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome-software_50=
.0.bb</a> =3D&gt; <a href=3D"http://gnome-software_50.3.bb" rel=3D"noreferr=
er" target=3D"_blank">gnome-software_50.3.bb</a>} (86%)<br>
=C2=A0rename meta-gnome/recipes-gnome/gvfs/{<a href=3D"http://gvfs_1.60.0.b=
b" rel=3D"noreferrer" target=3D"_blank">gvfs_1.60.0.bb</a> =3D&gt; <a href=
=3D"http://gvfs_1.60.2.bb" rel=3D"noreferrer" target=3D"_blank">gvfs_1.60.2=
.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/000=
1-upnp-allow-1.14.30.patch<br>
=C2=A0rename meta-networking/dynamic-layers/meta-python/recipes-connectivit=
y/firewalld/{<a href=3D"http://firewalld_2.2.1.bb" rel=3D"noreferrer" targe=
t=3D"_blank">firewalld_2.2.1.bb</a> =3D&gt; <a href=3D"http://firewalld_2.2=
.3.bb" rel=3D"noreferrer" target=3D"_blank">firewalld_2.2.3.bb</a>} (99%)<b=
r>
=C2=A0rename meta-networking/recipes-connectivity/samba/{<a href=3D"http://=
samba_4.23.8.bb" rel=3D"noreferrer" target=3D"_blank">samba_4.23.8.bb</a> =
=3D&gt; <a href=3D"http://samba_4.23.11.bb" rel=3D"noreferrer" target=3D"_b=
lank">samba_4.23.11.bb</a>} (99%)<br>
=C2=A0rename meta-networking/recipes-daemons/postfix/{<a href=3D"http://pos=
tfix_3.10.12.bb" rel=3D"noreferrer" target=3D"_blank">postfix_3.10.12.bb</a=
> =3D&gt; <a href=3D"http://postfix_3.10.13.bb" rel=3D"noreferrer" target=
=3D"_blank">postfix_3.10.13.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CV=
E-2026-13117.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26=
740.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-39956.patc=
h<br>
=C2=A0rename meta-oe/recipes-devtools/python/{<a href=3D"http://python3-psy=
copg_3.3.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-psycopg_3.3.3.b=
b</a> =3D&gt; <a href=3D"http://python3-psycopg_3.3.4.bb" rel=3D"noreferrer=
" target=3D"_blank">python3-psycopg_3.3.4.bb</a>} (85%)<br>
=C2=A0rename meta-oe/recipes-extended/hiredis/{<a href=3D"http://hiredis_1.=
3.0.bb" rel=3D"noreferrer" target=3D"_blank">hiredis_1.3.0.bb</a> =3D&gt; <=
a href=3D"http://hiredis_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">hir=
edis_1.3.1.bb</a>} (91%)<br>
=C2=A0rename meta-oe/recipes-graphics/libsdl3/{<a href=3D"http://libsdl3-im=
age_3.4.2.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3-image_3.4.2.bb</=
a> =3D&gt; <a href=3D"http://libsdl3-image_3.4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">libsdl3-image_3.4.4.bb</a>} (90%)<br>
=C2=A0rename meta-oe/recipes-graphics/libsdl3/{<a href=3D"http://libsdl3_3.=
4.4.bb" rel=3D"noreferrer" target=3D"_blank">libsdl3_3.4.4.bb</a> =3D&gt; <=
a href=3D"http://libsdl3_3.4.8.bb" rel=3D"noreferrer" target=3D"_blank">lib=
sdl3_3.4.8.bb</a>} (97%)<br>
=C2=A0rename meta-oe/recipes-support/cjose/{<a href=3D"http://cjose_0.6.2.7=
.bb" rel=3D"noreferrer" target=3D"_blank">cjose_0.6.2.7.bb</a> =3D&gt; <a h=
ref=3D"http://cjose_0.6.2.8.bb" rel=3D"noreferrer" target=3D"_blank">cjose_=
0.6.2.8.bb</a>} (88%)<br>
=C2=A0rename meta-oe/recipes-support/libssh/{<a href=3D"http://libssh_0.11.=
4.bb" rel=3D"noreferrer" target=3D"_blank">libssh_0.11.4.bb</a> =3D&gt; <a =
href=3D"http://libssh_0.11.5.bb" rel=3D"noreferrer" target=3D"_blank">libss=
h_0.11.5.bb</a>} (90%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-1=
0118.patch<br>
=C2=A0rename meta-oe/recipes-support/thin-provisioning-tools/{<a href=3D"ht=
tp://thin-provisioning-tools_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank"=
>thin-provisioning-tools_1.3.1.bb</a> =3D&gt; <a href=3D"http://thin-provis=
ioning-tools_1.3.3.bb" rel=3D"noreferrer" target=3D"_blank">thin-provisioni=
ng-tools_1.3.3.bb</a>} (97%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-40072.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-42304_p1.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-42304_p2.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-42304_p3.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-42304_p4.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-42304_p5.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-42304_p6.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-48522.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-48523.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-48524.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-48525.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026=
-48526.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-34993.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-47265.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-50269.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54274.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54275.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54276.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54277.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54278.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54279.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-aiohtt=
p/CVE-2026-54280.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-httplib2_0.31.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-httplib2_=
0.31.2.bb</a> =3D&gt; <a href=3D"http://python3-httplib2_0.32.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-httplib2_0.32.0.bb</a>} (76%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-ujson/=
CVE-2026-54911.patch<br>
=C2=A0rename meta-webserver/recipes-devtools/swagger-ui/{<a href=3D"http://=
swagger-ui_5.32.11.bb" rel=3D"noreferrer" target=3D"_blank">swagger-ui_5.32=
.11.bb</a> =3D&gt; <a href=3D"http://swagger-ui_5.32.14.bb" rel=3D"noreferr=
er" target=3D"_blank">swagger-ui_5.32.14.bb</a>} (85%)<br>
<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#129516): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/129516" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/129516</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120934698/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120934698/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000006b6a320659f751b6--

