Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE3ACC6B01
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 04:14:54 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8675.1775103284938313986
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 21:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=glVHVAMd;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79853c0f5b9so6811327b3.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 21:14:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775103284; cv=none;
        d=google.com; s=arc-20240605;
        b=XBsNzcG9Dt2oIv01Q0HLIsjHWwolnhiDeDIDoWfofcbYvNcWNI3NokSti8t6yYh1e2
         PWTumoWtUjOhtAFwEE87k5dWsEcSiRc823D+l0FAnzjZrY6ifvjgACglnsEiXeAzs32Y
         /7nFV9fctWTVWK4W94Gh3E5OTVKg2jDxV7U8nMONX4vaFzeoeesOcyvYj5tMkeE8dZwn
         T+m23LVPs8VgWO5U3cXcFoSmqu5UnIMUq/MV1FYGVF95EkKqjs9RA+EP0GwO43Sa/vaa
         aEEtHPzwDy0iNkjSNADZX8ZSzj4GSRqC+mtJaFa5rsHOdigBCHosX2k+aMAHHxk1ERcW
         68CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ai8KZWizzGQ9SVOzDB7njlEYYNH+GU6acBKRdY5b+WU=;
        fh=sQq4UwMItvi2zQkbQsQ7gG/lHqOQ30Mc0djsN0hkevw=;
        b=k/UdlWhiyrEBVwM9kkDuIZu4DI9MFfJfaT54XlessyENJUvmCIjG+oxoHSNXi+PpdC
         mLzVbH3xCurJrlGDTkcw8uaJd14G/3vZx5v/mcrpAi/TXVsxN7hZWDNekmsE1Tbfqm6c
         rZQ4ELqXaLs+WLSLng2luC149YrM7cItwA128jeYnOIJuABLQeVNpPGSADd2h93/nMJM
         7RE/uUUubf48UyF8OSZCKUCDOsg/ZdKLhwWfU7icBrN/Zn61i55/3OUoq1VswjQb9sLO
         DOAo1o6soCAsmRwIOu8difr++tJtJIAXM3YzspLo5bEP2tZAmzsHTRp5i5jDfSQy4gG1
         orRg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775103284; x=1775708084; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ai8KZWizzGQ9SVOzDB7njlEYYNH+GU6acBKRdY5b+WU=;
        b=glVHVAMdtjFSIQoMvCFaa/KhH0s3HH5Yj1fq3wSUNMFTfTTJOAZwqlbAUvCNulxt3P
         XhqzM/kfFwbid7aaB7rMljbhVvcs0k9t75GqljEI4x/pTdTSHLpntxyV5EWthiOmqBzi
         d1jIDWXyjHE7/0JgfouCR/2X6bgoIf45+ZtEnrhiHXTmmp82Agmp2c/Aj/bc1dCykCkP
         gELtFpkbrStoo5Xquw3kJF/+L5GHZkcY6w9v8Np6d0BvECltFa5BITdLR3jOGFbAIZIt
         //4jRgODxN3ZYIZgb4H5mblHCyghTOK8Z3BFWhnTKrP+veViCZGnNNHEKcEA4tpueJ3K
         SijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775103284; x=1775708084;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ai8KZWizzGQ9SVOzDB7njlEYYNH+GU6acBKRdY5b+WU=;
        b=Eu5Ep5WKojShvNzJdrIetkd+91afWOGjMGJgP0/eT35vjCJFwrJgY8nOeSW1cJGqOV
         qUojrj6t72M3UJzQls5AD3J2MDDy7hYOTukBPBCTHj8QO5rkrAAHFsxmGjjQnB/z/G2Y
         hwlOHrLxQMSMSQefhDZhqmCuAbcK1gtMeTSancSsRi7msLkjeUnBo/28j2NiWgrPAQco
         Yx+yvkwcOdz2jd8au0x/cOKbamCnZ/xHXyQnc+Z402e54HzN7CSgs3qSMkMymCXRFnDl
         LKlG7CUq2w/mCdH5H5xkLEiVGlHex/2B9mYynH5WtI7HEV541K4g+WfBzZBOp8ppD1K+
         CBHw==
X-Gm-Message-State: AOJu0YzARg3XimiIHx2UR67XTGSMtub8A2/sHdFWl543DZvjzGNRbsyi
	tsfVKTCWXbtt6c57AqwHNwdlqbNrXyBTkBIQBPSgoNO7UUP2l97hA6qQrcJ9DI9eurIq0Aix+yV
	E89I1QnlNYiMT/XtD1RLNJ05VDK9yJpEkcNsu
X-Gm-Gg: AeBDiesS6FXobNlaBe9oANV7xzW/d3zIevjstn2dAr+oE7nKhpBsrAiqWDBv41a/CjG
	LbQuluQnQdaGhXVqPZwiMrTgG8wQwA17cO64jLCm3L3Wpir4b0wSd3W8WwJIw2Uj6z5ndGL66oh
	vbIhbS+BWAUphyf6c0eRAo7O/eGeuvdAju5GQP/UX89R8yvn4XHBSlQmCWK1s5ouD6WEOSi6QK8
	Z7VcAMhTJIrNoNZ00Q3xDdFlfbHcf3NcsFqjApDShTeO6OLET36p+1UyCZAlMWZF8L/9cIA2OHh
	ZKCmgzJ2XcxoK9cFs0LQF6Ljg9tnYOE8CT42+jDOdA/BOX3cPwZ4tAc3bMvgJTPyf/0x46u+8zh
	WZZ3yzq+VYH+T7zOL7HODgLKH
X-Received: by 2002:a05:690e:190d:b0:650:379f:3580 with SMTP id
 956f58d0204a3-650379f38a8mr4119126d50.21.1775103283713; Wed, 01 Apr 2026
 21:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775010235.git.anuj.mittal@oss.qualcomm.com>
In-Reply-To: <cover.1775010235.git.anuj.mittal@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Apr 2026 21:14:16 -0700
X-Gm-Features: AQROBzAm0lfFj6L2RNh8BIlPlxwwzxXvGhVExAAA_XpZMExQywv-yAkCGoZHpac
Message-ID: <CAMKF1srtaDLz7kx1Bdk-rrhQUw8r8qboZX6mugnN-PnOfVZkoQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 00/30] Whinlatter pull request
To: anuj.mittal@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aa590d064e7270dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 04:14:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125957

--000000000000aa590d064e7270dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Anuj, this is installed now.

On Tue, Mar 31, 2026 at 11:08=E2=80=AFPM Anuj Mittal via lists.openembedded=
.org
<anuj.mittal=3Doss.qualcomm.com@lists.openembedded.org> wrote:

> Please merge these changes in whinlatter. Tested locally and on
> autobuilder.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1420
>
> The following changes since commit
> 6f989b75a08aacdcec1edb761da5559d3443c1ef:
>
>   postfix: upgrade 3.10.6 -> 3.10.8 (2026-03-09 17:14:08 +0530)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/meta-openembedded-contrib
> stable/whinlatter-next
>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/wh=
inlatter-next
>
> for you to fetch changes up to 8bcdb0cc1dab116253b409e78fb868ced7d8397c:
>
>   bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +0530)
>
> ----------------------------------------------------------------
>
> Ankur Tyagi (4):
>   zfs: upgrade 2.2.8 -> 2.2.9
>   php: upgrade 8.4.18 -> 8.4.19
>   python3-pyjwt: Fix CVE-2026-32597
>   python3-tornado: upgrade 6.5.4 -> 6.5.5
>
> Aviv Daum (1):
>   lldpd: fix xml PACKAGECONFIG dependency
>
> Bartosz Golaszewski (1):
>   python3-gpiod: update to v2.4.1
>
> Deepak Rathore (1):
>   libssh: Fix CVE-2026-3731
>
> Gyorgy Sarvari (14):
>   packagegroups: fix foldername
>   owfs: upgrade 3.2p3 -> 3.2p4
>   python3-django: upgrade 5.2.11 -> 5.2.12
>   python3-django: upgrade 4.2.28 -> 4.2.29
>   ettercap: patch CVE-2026-3603
>   exiv2: patch CVE-2026-25884
>   exiv2: patch CVE-2026-27596
>   exiv2: patch CVE-2026-27631
>   hiawatha: fix SRC_URI
>   pcp: fix SRC_URI
>   capnproto: patch CVE-2026-32239 and CVE-2026-32240
>   imagemagick: upgrade 7.1.2-16 -> 7.1.2-17
>   python3-marshmallow: mark CVE-2025-68480 patched
>   libde265: patch CVE-2025-61147
>
> Liu Yiding (1):
>   btrfsmaintenance: upgrade 0.5 -> 0.5.2
>
> Matthias Proske (1):
>   bluealsa: fix QA issue staticdev
>
> Mingli Yu (1):
>   mariadb: Upgrade 11.4.9 -> 11.4.10
>
> Peter Kjellerstedt (1):
>   bpftrace: Update the runtime dependencies
>
> Sujeet Nayak (1):
>   libnice: make crypto library configurable via PACKAGECONFIG
>
> Wang Mingyu (4):
>   ser2net: upgrade 4.6.6 -> 4.6.7
>   imagemagick: upgrade 7.1.2-15 -> 7.1.2-16
>   jasper: upgrade 4.2.8 -> 4.2.9
>   imapfilter: upgrade 2.8.3 -> 2.8.5
>
>  .../owfs/0001-Add-build-rule-for-README.patch |   6 +-
>  .../0001-Fix-compilation-with-GCC10.patch     |  44 -----
>  .../owfs/{owfs_3.2p3.bb =3D> owfs_3.2p4.bb}     |   7 +-
>  .../packagegroup-meta-filesystems.bb          |   0
>  ...Define-strndupa-if-it-does-not-exist.patch |   5 +-
>  ...arch64-inline-assembly-for-gcc-13.1.patch} |   6 +-
>  ...admmap-Replace-uint_t-with-uint32_t.patch} |  11 +-
>  ...e-sys-stat.h-instead-of-linux-stat.h.patch |  83 +++++++++
>  .../zfs/{zfs_2.2.8.bb =3D> zfs_2.2.9.bb}        |   9 +-
>  ...nance_0.5.bb =3D> btrfsmaintenance_0.5.2.bb} |   4 +-
>  ...change-sysconfig-path-to-etc-default.patch |  18 +-
>  .../bluealsa/bluealsa_4.3.0.bb                |   1 +
>  .../libde265/libde265/CVE-2025-61147.patch    |  84 +++++++++
>  .../libde265/libde265_1.0.16.bb               |   4 +-
>  .../recipes-daemons/lldpd/lldpd_1.0.20.bb     |   2 +-
>  .../ettercap/ettercap/CVE-2026-3606.patch     |  48 ++++++
>  .../ettercap/ettercap_0.8.3.1.bb              |   4 +-
>  .../bpftrace/bpftrace_0.24.1.bb               |  11 +-
>  .../{ser2net_4.6.6.bb =3D> ser2net_4.6.7.bb}    |   2 +-
>  ...ve_11.4.9.bb =3D> mariadb-native_11.4.10.bb} |   0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +-
>  ...info-t-fails-for-certain-TZ-values-o.patch |  47 -----
>  ...move-x86-specific-loop-in-my_convert.patch |  93 ----------
>  .../{mariadb_11.4.9.bb =3D> mariadb_11.4.10.bb} |   0
>  .../CVE-2026-32239_CVE-2026-32240.patch       | 160 ++++++++++++++++++
>  .../capnproto/capnproto_1.0.2.bb              |   4 +-
>  .../php/{php_8.4.18.bb =3D> php_8.4.19.bb}      |   2 +-
>  .../{jasper_4.2.8.bb =3D> jasper_4.2.9.bb}      |   2 +-
>  .../exiv2/exiv2/CVE-2026-25884-1.patch        |  69 ++++++++
>  .../exiv2/exiv2/CVE-2026-25884-2.patch        |  25 +++
>  .../exiv2/exiv2/CVE-2026-27596-1.patch        |  71 ++++++++
>  .../exiv2/exiv2/CVE-2026-27596-2.patch        |  24 +++
>  .../exiv2/exiv2/CVE-2026-27631-1.patch        |  63 +++++++
>  .../exiv2/exiv2/CVE-2026-27631-2.patch        |  26 +++
>  meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb |  11 +-
>  ...ck_7.1.2-15.bb =3D> imagemagick_7.1.2-17.bb} |   2 +-
>  ...mapfilter_2.8.3.bb =3D> imapfilter_2.8.5.bb} |   4 +-
>  .../recipes-support/libnice/libnice_0.1.23.bb |   5 +-
>  .../libssh/libssh/CVE-2026-3731_p1.patch      |  35 ++++
>  .../libssh/libssh/CVE-2026-3731_p2.patch      | 102 +++++++++++
>  .../recipes-support/libssh/libssh_0.11.3.bb   |   2 +
>  meta-oe/recipes-support/pcp/pcp.inc           |   2 +-
>  ...ngo_4.2.28.bb =3D> python3-django_4.2.29.bb} |   2 +-
>  ...ngo_5.2.11.bb =3D> python3-django_5.2.12.bb} |   2 +-
>  ...-gpiod_2.4.0.bb =3D> python3-gpiod_2.4.1.bb} |   8 +-
>  .../python/python3-marshmallow_4.1.2.bb       |   2 +
>  .../python/python3-pyjwt/CVE-2026-32597.patch |  79 +++++++++
>  .../python/python3-pyjwt_2.10.1.bb            |   2 +
>  ...nado_6.5.4.bb =3D> python3-tornado_6.5.5.bb} |   2 +-
>  .../recipes-httpd/hiawatha/hiawatha_11.7.bb   |   2 +-
>  50 files changed, 952 insertions(+), 249 deletions(-)
>  delete mode 100644
> meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-=
GCC10.patch
>  rename meta-filesystems/recipes-filesystems/owfs/{owfs_3.2p3.bb =3D>
> owfs_3.2p4.bb} (96%)
>  rename meta-filesystems/recipes-filesystems/{packageconfigs =3D>
> packagegroups}/packagegroup-meta-filesystems.bb (100%)
>  rename
> meta-filesystems/recipes-filesystems/zfs/zfs/{aaf28a4630af60496c9d33db1d0=
6a7d7d8983422.patch
> =3D> 0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch} (94%)
>  rename
> meta-filesystems/recipes-filesystems/zfs/zfs/{0001-fs-tests-cmd-readmmap-=
Replace-uint_t-with-uint32_t.patch
> =3D> 0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch} (83%)
>  create mode 100644
> meta-filesystems/recipes-filesystems/zfs/zfs/0004-linux-use-sys-stat.h-in=
stead-of-linux-stat.h.patch
>  rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.8.bb =3D>
> zfs_2.2.9.bb} (91%)
>  rename meta-filesystems/recipes-utils/btrfsmaintenance/{
> btrfsmaintenance_0.5.bb =3D> btrfsmaintenance_0.5.2.bb} (96%)
>  create mode 100644
> meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
>  create mode 100644
> meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
>  rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.6.bb =3D>
> ser2net_4.6.7.bb} (91%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.9.bb =3D>
> mariadb-native_11.4.10.bb} (100%)
>  delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-c=
ertain-TZ-values-o.patch
>  delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_con=
vert.patch
>  rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.9.bb =3D> mariadb_11.4.10=
.bb}
> (100%)
>  create mode 100644
> meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-3224=
0.patch
>  rename meta-oe/recipes-devtools/php/{php_8.4.18.bb =3D> php_8.4.19.bb}
> (99%)
>  rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb =3D>
> jasper_4.2.9.bb} (92%)
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
>  create mode 100644
> meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
>  rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-15.bb =3D>
> imagemagick_7.1.2-17.bb} (99%)
>  rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.3.bb =3D>
> imapfilter_2.8.5.bb} (80%)
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch
>  create mode 100644
> meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch
>  rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb =3D=
>
> python3-django_4.2.29.bb} (79%)
>  rename meta-python/recipes-devtools/python/{python3-django_5.2.11.bb =3D=
>
> python3-django_5.2.12.bb} (60%)
>  rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb =3D>
> python3-gpiod_2.4.1.bb} (74%)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
>  rename meta-python/recipes-devtools/python/{python3-tornado_6.5.4.bb =3D=
>
> python3-tornado_6.5.5.bb} (93%)
>
> --
> 2.53.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125896):
> https://lists.openembedded.org/g/openembedded-devel/message/125896
> Mute This Topic: https://lists.openembedded.org/mt/118610707/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000aa590d064e7270dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Anuj, this is installed now.</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Mar 31, 2026 at 11:08=E2=80=AFPM Anuj Mittal via <a href=3D"http://l=
ists.openembedded.org">lists.openembedded.org</a> &lt;anuj.mittal=3D<a href=
=3D"mailto:oss.qualcomm.com@lists.openembedded.org">oss.qualcomm.com@lists.=
openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Please merge these changes in whinlatter. Tested locally an=
d on<br>
autobuilder.<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/buil=
ds/1420" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/81/builds/1420</a><br>
<br>
The following changes since commit 6f989b75a08aacdcec1edb761da5559d3443c1ef=
:<br>
<br>
=C2=A0 postfix: upgrade 3.10.6 -&gt; 3.10.8 (2026-03-09 17:14:08 +0530)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-opene=
mbedded-contrib</a> stable/whinlatter-next<br>
=C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded-contrib/lo=
g/?h=3Dstable/whinlatter-next" rel=3D"noreferrer" target=3D"_blank">https:/=
/git.openembedded.org/meta-openembedded-contrib/log/?h=3Dstable/whinlatter-=
next</a><br>
<br>
for you to fetch changes up to 8bcdb0cc1dab116253b409e78fb868ced7d8397c:<br=
>
<br>
=C2=A0 bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +0530)<br>
<br>
----------------------------------------------------------------<br>
<br>
Ankur Tyagi (4):<br>
=C2=A0 zfs: upgrade 2.2.8 -&gt; 2.2.9<br>
=C2=A0 php: upgrade 8.4.18 -&gt; 8.4.19<br>
=C2=A0 python3-pyjwt: Fix CVE-2026-32597<br>
=C2=A0 python3-tornado: upgrade 6.5.4 -&gt; 6.5.5<br>
<br>
Aviv Daum (1):<br>
=C2=A0 lldpd: fix xml PACKAGECONFIG dependency<br>
<br>
Bartosz Golaszewski (1):<br>
=C2=A0 python3-gpiod: update to v2.4.1<br>
<br>
Deepak Rathore (1):<br>
=C2=A0 libssh: Fix CVE-2026-3731<br>
<br>
Gyorgy Sarvari (14):<br>
=C2=A0 packagegroups: fix foldername<br>
=C2=A0 owfs: upgrade 3.2p3 -&gt; 3.2p4<br>
=C2=A0 python3-django: upgrade 5.2.11 -&gt; 5.2.12<br>
=C2=A0 python3-django: upgrade 4.2.28 -&gt; 4.2.29<br>
=C2=A0 ettercap: patch CVE-2026-3603<br>
=C2=A0 exiv2: patch CVE-2026-25884<br>
=C2=A0 exiv2: patch CVE-2026-27596<br>
=C2=A0 exiv2: patch CVE-2026-27631<br>
=C2=A0 hiawatha: fix SRC_URI<br>
=C2=A0 pcp: fix SRC_URI<br>
=C2=A0 capnproto: patch CVE-2026-32239 and CVE-2026-32240<br>
=C2=A0 imagemagick: upgrade 7.1.2-16 -&gt; 7.1.2-17<br>
=C2=A0 python3-marshmallow: mark CVE-2025-68480 patched<br>
=C2=A0 libde265: patch CVE-2025-61147<br>
<br>
Liu Yiding (1):<br>
=C2=A0 btrfsmaintenance: upgrade 0.5 -&gt; 0.5.2<br>
<br>
Matthias Proske (1):<br>
=C2=A0 bluealsa: fix QA issue staticdev<br>
<br>
Mingli Yu (1):<br>
=C2=A0 mariadb: Upgrade 11.4.9 -&gt; 11.4.10<br>
<br>
Peter Kjellerstedt (1):<br>
=C2=A0 bpftrace: Update the runtime dependencies<br>
<br>
Sujeet Nayak (1):<br>
=C2=A0 libnice: make crypto library configurable via PACKAGECONFIG<br>
<br>
Wang Mingyu (4):<br>
=C2=A0 ser2net: upgrade 4.6.6 -&gt; 4.6.7<br>
=C2=A0 imagemagick: upgrade 7.1.2-15 -&gt; 7.1.2-16<br>
=C2=A0 jasper: upgrade 4.2.8 -&gt; 4.2.9<br>
=C2=A0 imapfilter: upgrade 2.8.3 -&gt; 2.8.5<br>
<br>
=C2=A0.../owfs/0001-Add-build-rule-for-README.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0.../0001-Fix-compilation-with-GCC10.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
44 -----<br>
=C2=A0.../owfs/{<a href=3D"http://owfs_3.2p3.bb" rel=3D"noreferrer" target=
=3D"_blank">owfs_3.2p3.bb</a> =3D&gt; <a href=3D"http://owfs_3.2p4.bb" rel=
=3D"noreferrer" target=3D"_blank">owfs_3.2p4.bb</a>}=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 +-<br>
=C2=A0.../<a href=3D"http://packagegroup-meta-filesystems.bb" rel=3D"norefe=
rrer" target=3D"_blank">packagegroup-meta-filesystems.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
=C2=A0...Define-strndupa-if-it-does-not-exist.patch |=C2=A0 =C2=A05 +-<br>
=C2=A0...arch64-inline-assembly-for-gcc-13.1.patch} |=C2=A0 =C2=A06 +-<br>
=C2=A0...admmap-Replace-uint_t-with-uint32_t.patch} |=C2=A0 11 +-<br>
=C2=A0...e-sys-stat.h-instead-of-linux-stat.h.patch |=C2=A0 83 +++++++++<br=
>
=C2=A0.../zfs/{<a href=3D"http://zfs_2.2.8.bb" rel=3D"noreferrer" target=3D=
"_blank">zfs_2.2.8.bb</a> =3D&gt; <a href=3D"http://zfs_2.2.9.bb" rel=3D"no=
referrer" target=3D"_blank">zfs_2.2.9.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A09 +-<br>
=C2=A0...<a href=3D"http://nance_0.5.bb" rel=3D"noreferrer" target=3D"_blan=
k">nance_0.5.bb</a> =3D&gt; <a href=3D"http://btrfsmaintenance_0.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">btrfsmaintenance_0.5.2.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0...change-sysconfig-path-to-etc-default.patch |=C2=A0 18 +-<br>
=C2=A0.../bluealsa/<a href=3D"http://bluealsa_4.3.0.bb" rel=3D"noreferrer" =
target=3D"_blank">bluealsa_4.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0.../libde265/libde265/CVE-2025-61147.patch=C2=A0 =C2=A0 |=C2=A0 84 ++=
+++++++<br>
=C2=A0.../libde265/<a href=3D"http://libde265_1.0.16.bb" rel=3D"noreferrer"=
 target=3D"_blank">libde265_1.0.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0.../recipes-daemons/lldpd/<a href=3D"http://lldpd_1.0.20.bb" rel=3D"n=
oreferrer" target=3D"_blank">lldpd_1.0.20.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A02 +-<br>
=C2=A0.../ettercap/ettercap/CVE-2026-3606.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
48 ++++++<br>
=C2=A0.../ettercap/<a href=3D"http://ettercap_0.8.3.1.bb" rel=3D"noreferrer=
" target=3D"_blank">ettercap_0.8.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../bpftrace/<a href=3D"http://bpftrace_0.24.1.bb" rel=3D"noreferrer"=
 target=3D"_blank">bpftrace_0.24.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
=C2=A0.../{<a href=3D"http://ser2net_4.6.6.bb" rel=3D"noreferrer" target=3D=
"_blank">ser2net_4.6.6.bb</a> =3D&gt; <a href=3D"http://ser2net_4.6.7.bb" r=
el=3D"noreferrer" target=3D"_blank">ser2net_4.6.7.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ve_11.4.9.bb" rel=3D"noreferrer" target=3D"_blan=
k">ve_11.4.9.bb</a> =3D&gt; <a href=3D"http://mariadb-native_11.4.10.bb" re=
l=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.10.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0meta-oe/recipes-dbs/mysql/mariadb.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
=C2=A0...info-t-fails-for-certain-TZ-values-o.patch |=C2=A0 47 -----<br>
=C2=A0...move-x86-specific-loop-in-my_convert.patch |=C2=A0 93 ----------<b=
r>
=C2=A0.../{<a href=3D"http://mariadb_11.4.9.bb" rel=3D"noreferrer" target=
=3D"_blank">mariadb_11.4.9.bb</a> =3D&gt; <a href=3D"http://mariadb_11.4.10=
.bb" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.10.bb</a>} |=C2=A0 =
=C2=A00<br>
=C2=A0.../CVE-2026-32239_CVE-2026-32240.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
60 ++++++++++++++++++<br>
=C2=A0.../capnproto/<a href=3D"http://capnproto_1.0.2.bb" rel=3D"noreferrer=
" target=3D"_blank">capnproto_1.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0.../php/{<a href=3D"http://php_8.4.18.bb" rel=3D"noreferrer" target=
=3D"_blank">php_8.4.18.bb</a> =3D&gt; <a href=3D"http://php_8.4.19.bb" rel=
=3D"noreferrer" target=3D"_blank">php_8.4.19.bb</a>}=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0.../{<a href=3D"http://jasper_4.2.8.bb" rel=3D"noreferrer" target=3D"=
_blank">jasper_4.2.8.bb</a> =3D&gt; <a href=3D"http://jasper_4.2.9.bb" rel=
=3D"noreferrer" target=3D"_blank">jasper_4.2.9.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A02 +-<br>
=C2=A0.../exiv2/exiv2/CVE-2026-25884-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 69 ++++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2026-25884-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 25 +++<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27596-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 71 ++++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27596-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 24 +++<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27631-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 63 +++++++<br>
=C2=A0.../exiv2/exiv2/CVE-2026-27631-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 26 +++<br>
=C2=A0meta-oe/recipes-support/exiv2/<a href=3D"http://exiv2_0.28.7.bb" rel=
=3D"noreferrer" target=3D"_blank">exiv2_0.28.7.bb</a> |=C2=A0 11 +-<br>
=C2=A0...<a href=3D"http://ck_7.1.2-15.bb" rel=3D"noreferrer" target=3D"_bl=
ank">ck_7.1.2-15.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-17.bb" =
rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-17.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://mapfilter_2.8.3.bb" rel=3D"noreferrer" target=3D=
"_blank">mapfilter_2.8.3.bb</a> =3D&gt; <a href=3D"http://imapfilter_2.8.5.=
bb" rel=3D"noreferrer" target=3D"_blank">imapfilter_2.8.5.bb</a>} |=C2=A0 =
=C2=A04 +-<br>
=C2=A0.../recipes-support/libnice/<a href=3D"http://libnice_0.1.23.bb" rel=
=3D"noreferrer" target=3D"_blank">libnice_0.1.23.bb</a> |=C2=A0 =C2=A05 +-<=
br>
=C2=A0.../libssh/libssh/CVE-2026-3731_p1.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
35 ++++<br>
=C2=A0.../libssh/libssh/CVE-2026-3731_p2.patch=C2=A0 =C2=A0 =C2=A0 | 102 ++=
+++++++++<br>
=C2=A0.../recipes-support/libssh/<a href=3D"http://libssh_0.11.3.bb" rel=3D=
"noreferrer" target=3D"_blank">libssh_0.11.3.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0meta-oe/recipes-support/pcp/pcp.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0...<a href=3D"http://ngo_4.2.28.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_4.2.28.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.29.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_4.2.29.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...<a href=3D"http://ngo_5.2.11.bb" rel=3D"noreferrer" target=3D"_bla=
nk">ngo_5.2.11.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.12.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-django_5.2.12.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0...-<a href=3D"http://gpiod_2.4.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">gpiod_2.4.0.bb</a> =3D&gt; <a href=3D"http://python3-gpiod_2.4.1.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.4.1.bb</a>} |=C2=A0 =
=C2=A08 +-<br>
=C2=A0.../python/<a href=3D"http://python3-marshmallow_4.1.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-marshmallow_4.1.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0.../python/python3-pyjwt/CVE-2026-32597.patch |=C2=A0 79 +++++++++<br=
>
=C2=A0.../python/<a href=3D"http://python3-pyjwt_2.10.1.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-pyjwt_2.10.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0...<a href=3D"http://nado_6.5.4.bb" rel=3D"noreferrer" target=3D"_bla=
nk">nado_6.5.4.bb</a> =3D&gt; <a href=3D"http://python3-tornado_6.5.5.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-tornado_6.5.5.bb</a>} |=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../recipes-httpd/hiawatha/<a href=3D"http://hiawatha_11.7.bb" rel=3D=
"noreferrer" target=3D"_blank">hiawatha_11.7.bb</a>=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A050 files changed, 952 insertions(+), 249 deletions(-)<br>
=C2=A0delete mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/000=
1-Fix-compilation-with-GCC10.patch<br>
=C2=A0rename meta-filesystems/recipes-filesystems/owfs/{<a href=3D"http://o=
wfs_3.2p3.bb" rel=3D"noreferrer" target=3D"_blank">owfs_3.2p3.bb</a> =3D&gt=
; <a href=3D"http://owfs_3.2p4.bb" rel=3D"noreferrer" target=3D"_blank">owf=
s_3.2p4.bb</a>} (96%)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/{packageconfigs =3D&gt; p=
ackagegroups}/<a href=3D"http://packagegroup-meta-filesystems.bb" rel=3D"no=
referrer" target=3D"_blank">packagegroup-meta-filesystems.bb</a> (100%)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/zfs/zfs/{aaf28a4630af6049=
6c9d33db1d06a7d7d8983422.patch =3D&gt; 0002-fixes-broken-aarch64-inline-ass=
embly-for-gcc-13.1.patch} (94%)<br>
=C2=A0rename meta-filesystems/recipes-filesystems/zfs/zfs/{0001-fs-tests-cm=
d-readmmap-Replace-uint_t-with-uint32_t.patch =3D&gt; 0003-fs-tests-cmd-rea=
dmmap-Replace-uint_t-with-uint32_t.patch} (83%)<br>
=C2=A0create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs/0004-=
linux-use-sys-stat.h-instead-of-linux-stat.h.patch<br>
=C2=A0rename meta-filesystems/recipes-filesystems/zfs/{<a href=3D"http://zf=
s_2.2.8.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.2.8.bb</a> =3D&gt; <=
a href=3D"http://zfs_2.2.9.bb" rel=3D"noreferrer" target=3D"_blank">zfs_2.2=
.9.bb</a>} (91%)<br>
=C2=A0rename meta-filesystems/recipes-utils/btrfsmaintenance/{<a href=3D"ht=
tp://btrfsmaintenance_0.5.bb" rel=3D"noreferrer" target=3D"_blank">btrfsmai=
ntenance_0.5.bb</a> =3D&gt; <a href=3D"http://btrfsmaintenance_0.5.2.bb" re=
l=3D"noreferrer" target=3D"_blank">btrfsmaintenance_0.5.2.bb</a>} (96%)<br>
=C2=A0create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde2=
65/CVE-2025-61147.patch<br>
=C2=A0create mode 100644 meta-networking/recipes-support/ettercap/ettercap/=
CVE-2026-3606.patch<br>
=C2=A0rename meta-oe/recipes-connectivity/ser2net/{<a href=3D"http://ser2ne=
t_4.6.6.bb" rel=3D"noreferrer" target=3D"_blank">ser2net_4.6.6.bb</a> =3D&g=
t; <a href=3D"http://ser2net_4.6.7.bb" rel=3D"noreferrer" target=3D"_blank"=
>ser2net_4.6.7.bb</a>} (91%)<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb-native_11=
.4.9.bb" rel=3D"noreferrer" target=3D"_blank">mariadb-native_11.4.9.bb</a> =
=3D&gt; <a href=3D"http://mariadb-native_11.4.10.bb" rel=3D"noreferrer" tar=
get=3D"_blank">mariadb-native_11.4.10.bb</a>} (100%)<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-=
my_tzinfo-t-fails-for-certain-TZ-values-o.patch<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-=
specific-loop-in-my_convert.patch<br>
=C2=A0rename meta-oe/recipes-dbs/mysql/{<a href=3D"http://mariadb_11.4.9.bb=
" rel=3D"noreferrer" target=3D"_blank">mariadb_11.4.9.bb</a> =3D&gt; <a hre=
f=3D"http://mariadb_11.4.10.bb" rel=3D"noreferrer" target=3D"_blank">mariad=
b_11.4.10.bb</a>} (100%)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2=
026-32239_CVE-2026-32240.patch<br>
=C2=A0rename meta-oe/recipes-devtools/php/{<a href=3D"http://php_8.4.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">php_8.4.18.bb</a> =3D&gt; <a href=3D"=
http://php_8.4.19.bb" rel=3D"noreferrer" target=3D"_blank">php_8.4.19.bb</a=
>} (99%)<br>
=C2=A0rename meta-oe/recipes-graphics/jasper/{<a href=3D"http://jasper_4.2.=
8.bb" rel=3D"noreferrer" target=3D"_blank">jasper_4.2.8.bb</a> =3D&gt; <a h=
ref=3D"http://jasper_4.2.9.bb" rel=3D"noreferrer" target=3D"_blank">jasper_=
4.2.9.bb</a>} (92%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596=
-2.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631=
-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631=
-2.patch<br>
=C2=A0rename meta-oe/recipes-support/imagemagick/{<a href=3D"http://imagema=
gick_7.1.2-15.bb" rel=3D"noreferrer" target=3D"_blank">imagemagick_7.1.2-15=
.bb</a> =3D&gt; <a href=3D"http://imagemagick_7.1.2-17.bb" rel=3D"noreferre=
r" target=3D"_blank">imagemagick_7.1.2-17.bb</a>} (99%)<br>
=C2=A0rename meta-oe/recipes-support/imapfilter/{<a href=3D"http://imapfilt=
er_2.8.3.bb" rel=3D"noreferrer" target=3D"_blank">imapfilter_2.8.3.bb</a> =
=3D&gt; <a href=3D"http://imapfilter_2.8.5.bb" rel=3D"noreferrer" target=3D=
"_blank">imapfilter_2.8.5.bb</a>} (80%)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-373=
1_p1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-373=
1_p2.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_4.2.28.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_4.2.=
28.bb</a> =3D&gt; <a href=3D"http://python3-django_4.2.29.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_4.2.29.bb</a>} (79%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-django_5.2.11.bb" rel=3D"noreferrer" target=3D"_blank">python3-django_5.2.=
11.bb</a> =3D&gt; <a href=3D"http://python3-django_5.2.12.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-django_5.2.12.bb</a>} (60%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-gpiod_2.4.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-gpiod_2.4.0.b=
b</a> =3D&gt; <a href=3D"http://python3-gpiod_2.4.1.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-gpiod_2.4.1.bb</a>} (74%)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/=
CVE-2026-32597.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-tornado_6.5.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-tornado_6.5=
.4.bb</a> =3D&gt; <a href=3D"http://python3-tornado_6.5.5.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-tornado_6.5.5.bb</a>} (93%)<br>
<br>
-- <br>
2.53.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#125896): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/125896" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/125896</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118610707/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118610707/1997914</a><br>
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

--000000000000aa590d064e7270dc--

