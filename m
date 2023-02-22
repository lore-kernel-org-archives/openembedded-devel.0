Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CD7C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 09:05:45 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web11.4528.1677056742770061207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 01:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P5sJQUnr;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id bg11so7059181oib.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 01:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOH1P/NJBkhtvr8KfE/ebEMGNaoHxt0BMMLnEhnAFsg=;
        b=P5sJQUnrYJTPmvCrjGSJC27jtBg7V/X1IdW+v4AmhQ/P2HzZPnzoDyMLpFmF/m+vJx
         vn/tZJaxbvKxe6Zf5E4jVnkTOkdjLDHw58wL/wKa2SydLUh9ueVIVHI4g30cNa5W+7v4
         nS6lg8keShLyxUhC8YorF25UtHbiAplnHMr8v/F+dV9DqdETU1VXdaG6eyqoi0O1dwn8
         0PRbbwXaCJQr5yj014ctSy+pZVdXGebCEgFiFPVC7QDLaOWbNhSiO0fgXnVLDi4bmJAb
         Ha7QQW/+gujaz6QIOikEIqtikz23Ps9hdDAtRHKj2UogWJ9qrIuZCuST0rcsqJBSpa6X
         PLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOH1P/NJBkhtvr8KfE/ebEMGNaoHxt0BMMLnEhnAFsg=;
        b=DWz54qxYo6U1yXNxD1vKFOj5zkebp4Q9zA4nslU8cjs9ajw0BknDkWCRzv2RR6cUNl
         6Y+gnWfybYIq0aqioj+ZSeT5MqhEaMWkm8KMunccnnUZXwblDoTD53u43JIqZ8Msf/ET
         aMnl1eZTm5jxbCwMXREVVehnz1HWEmo51C6AjpRkRmSuZonGzUHCnSGsEDEVngJuJyCE
         cLpFSQ3GVp8hSy7aIuP9kWBU3s8UOfzaC6jN5jBBPS15z42hUMol+Ytt0vp0UVVCyTme
         3vEHjJWnuLU7tT6pnxhNd/yjcaNMP/juALy409NDtVfsc+pD/L+NDwQ1u5XhmdnBcCqg
         wjsA==
X-Gm-Message-State: AO0yUKX+tmftWu1L9wGNVHbS6Dv7NEbKD+5P0mncMsMzWx2JIgip8CTa
	rdsG3YIII33mTlpH6tcPAE1JCst9sZ4RYmiOZ1YInVt4dR0=
X-Google-Smtp-Source: AK7set+bHIbPJslKQWnnEcFSkOCnIS/whArOYVJtDwQD/q7mxR/fRrkup8MopD8q5NSRzeQF9dX7VlAAN5otbcI/6rc=
X-Received: by 2002:a05:6808:331a:b0:37b:592b:ec39 with SMTP id
 ca26-20020a056808331a00b0037b592bec39mr1007771oib.262.1677056741857; Wed, 22
 Feb 2023 01:05:41 -0800 (PST)
MIME-Version: 1.0
References: <20230221200625.494020-1-f_l_k@t-online.de> <495GQR.QDJEIFZLC9252@t-online.de>
In-Reply-To: <495GQR.QDJEIFZLC9252@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Feb 2023 01:05:16 -0800
Message-ID: <CAMKF1sr_aiQ_eN_4X_-5hVxbwcDt37444uQQaBBjG7+4wQB8Kg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gparted: update 1.4.0 -> 1.5.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 09:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101202

seeing failures with arm/clang -
https://errors.yoctoproject.org/Errors/Details/695674/

On Tue, Feb 21, 2023 at 12:08 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> sent again because of an error message during mail delivery
>
> Am Di, 21. Feb 2023 um 21:06:25 +0100 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> - Remove unneeded patches Signed-off-by: Markus Volk <f_l_k@t-online.de> =
--- ...t-use-NULL-where-boolean-is-expected.patch | 33 ------------------- =
.../files/0001-use-posix-basename.patch | 30 ----------------- .../{gparted=
_1.4.0.bb =3D> gparted_1.5.0.bb} | 6 ++-- 3 files changed, 2 insertions(+),=
 67 deletions(-) delete mode 100644 meta-gnome/recipes-extended/gparted/fil=
es/0001-Do-not-use-NULL-where-boolean-is-expected.patch delete mode 100644 =
meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch ren=
ame meta-gnome/recipes-extended/gparted/{gparted_1.4.0.bb =3D> gparted_1.5.=
0.bb} (78%) diff --git a/meta-gnome/recipes-extended/gparted/files/0001-Do-=
not-use-NULL-where-boolean-is-expected.patch b/meta-gnome/recipes-extended/=
gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch deleted =
file mode 100644 index 1b0d24024..000000000 --- a/meta-gnome/recipes-extend=
ed/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch +++ /=
dev/null @@ -1,33 +0,0 @@ -From 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mo=
n Sep 17 00:00:00 2001 -From: Khem Raj <raj.khem@gmail.com> -Date: Thu, 27 =
Jan 2022 23:02:20 -0800 -Subject: [PATCH] Do not use NULL where boolean is =
expected - -Fixes -src/GParted_Core.cc:73:57: error: static_cast from 'null=
ptr_t' to 'PedPartitionFlag' (aka '_PedPartitionFlag') is not allowed -| fo=
r ( PedPartitionFlag flag =3D ped_partition_flag_next( static_cast<PedParti=
tionFlag>( NULL ) ) ; -| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -| 1 error g=
enerated. - -Upstream-Status: Pending -Signed-off-by: Khem Raj <raj.khem@gm=
ail.com> ---- - src/GParted_Core.cc | 2 +- - 1 file changed, 1 insertion(+)=
, 1 deletion(-) - -diff --git a/src/GParted_Core.cc b/src/GParted_Core.cc -=
index f7ac970..3290c66 100644 ---- a/src/GParted_Core.cc -+++ b/src/GParted=
_Core.cc -@@ -70,7 +70,7 @@ GParted_Core::GParted_Core() - ped_exception_se=
t_handler( ped_exception_handler ) ; - - //get valid flags ... -- for ( Ped=
PartitionFlag flag =3D ped_partition_flag_next( static_cast<PedPartitionFla=
g>( NULL ) ) ; -+ for ( PedPartitionFlag flag =3D ped_partition_flag_next( =
static_cast<PedPartitionFlag>( false ) ) ; - flag ; - flag =3D ped_partitio=
n_flag_next( flag ) ) - flags .push_back( flag ) ; --- -2.35.0 - diff --git=
 a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch =
b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch d=
eleted file mode 100644 index aae200e27..000000000 --- a/meta-gnome/recipes=
-extended/gparted/files/0001-use-posix-basename.patch +++ /dev/null @@ -1,3=
0 +0,0 @@ -Subject: [PATCH] BCache_Info.cc: use posix basename - -gnu 'base=
name' is undeclared for cplusplus if using musl. Use posix basename instead=
. - -fdebug-prefix-map=3DTOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gpa=
rted/1.4.0-r0/ -recipe-sysroot-native=3D-fvisibility-inlines-hidden -c -o D=
ialog_Disklabel.o ../../ -gparted-1.4.0/src/Dialog_Disklabel.cc ../../gpart=
ed-1.4.0/src/BCache_Info.cc:52:33: - -error: use of undeclared identifier '=
basename'; did you mean 'g_basename'? - return "/dev/" + Glib::ustring(base=
name(buf)); - ^~~~~~~~ - g_basename - -Signed-off-by: Markus Volk <f_l_k@t-=
online.de> - -Upstream-Status: Submitted - -https://gitlab.gnome.org/GNOME/=
gparted/-/merge_requests/99 - ---- a/src/BCache_Info.cc 2022-03-02 22:04:17=
.000000000 +0100 -+++ b/src/BCache_Info.cc 2022-04-09 15:02:56.932218665 +0=
200 -@@ -17,7 +17,7 @@ - - #include "BCache_Info.h" - --#include <string.h>=
 // GNU version of basename() -+#include <libgen.h> // POSIX version of bas=
ename() - #include <unistd.h> - #include <glibmm/ustring.h> - #include <gli=
bmm/fileutils.h> diff --git a/meta-gnome/recipes-extended/gparted/gparted_1=
.4.0.bb b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb similarity i=
ndex 78% rename from meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb r=
ename to meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb index dde5a02=
ab..be7a96ea8 100644 --- a/meta-gnome/recipes-extended/gparted/gparted_1.4.=
0.bb +++ b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb @@ -3,17 +3=
,15 @@ HOMEPAGE =3D "http://gparted.org/index.php" LICENSE =3D "GPL-2.0-onl=
y" LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f" -inherit autotools pkgconfig python3native gnome-help gtk-icon-cache f=
eatures_check +inherit autotools pkgconfig python3native gettext gnome-help=
 gtk-icon-cache features_check ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEAT=
URES}" SRC_URI =3D " \ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-$=
{PV}/${BPN}-${PV}.tar.gz \ file://0001-Install-polkit-action-unconditionall=
y-executable-pke.patch \ - file://0001-Do-not-use-NULL-where-boolean-is-exp=
ected.patch \ - file://0001-use-posix-basename.patch \ " -SRC_URI[sha256sum=
] =3D "e5293a792e53fdbeba29c4a834113cd9603d0d639330da931a468bf3687887be" +S=
RC_URI[sha256sum] =3D "3c95ea26a944083ff1d9b17639b1e2ad9758df225dc751ff407b=
2a6aa092a8de" UPSTREAM_CHECK_URI =3D "https://sourceforge.net/projects/gpar=
ted/files/gparted/" UPSTREAM_CHECK_REGEX =3D "gparted-(?P<pver>\d+\.(\d+)+(=
\.\d+)+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101197): https://lists.openembedded.org/g/openembedde=
d-devel/message/101197
> Mute This Topic: https://lists.openembedded.org/mt/97117595/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

