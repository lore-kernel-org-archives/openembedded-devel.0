Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61694C61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 10:58:46 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.6027.1677063524552193888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Feb 2023 02:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout01.t-online.de (Postfix) with SMTP id 7715513351;
	Wed, 22 Feb 2023 11:58:42 +0100 (CET)
Received: from [192.168.178.83] ([79.219.232.91]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pUmpe-35q5RI0; Wed, 22 Feb 2023 11:58:42 +0100
Date: Wed, 22 Feb 2023 11:58:36 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] gparted: update 1.4.0 -> 1.5.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <OHAHQR.LWV3ENHBSP012@t-online.de>
In-Reply-To: 
	<CAMKF1sr_aiQ_eN_4X_-5hVxbwcDt37444uQQaBBjG7+4wQB8Kg@mail.gmail.com>
References: <20230221200625.494020-1-f_l_k@t-online.de>
	<495GQR.QDJEIFZLC9252@t-online.de>
	<CAMKF1sr_aiQ_eN_4X_-5hVxbwcDt37444uQQaBBjG7+4wQB8Kg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-pVWlXMF5YTdGgFKyK3Ba"
X-TOI-EXPURGATEID: 150726::1677063522-41FE9C4D-37F8BB88/0/0 CLEAN NORMAL
X-TOI-MSGID: 6eefec09-1747-4c88-aa97-3003533db738
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Feb 2023 10:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101208

--=-pVWlXMF5YTdGgFKyK3Ba
Content-Type: text/plain; charset=us-ascii; format=flowed

A hard dependency on polkit was introduced. v2 should fix it

Am Mi, 22. Feb 2023 um 01:05:16 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> seeing failures with arm/clang -
> <https://errors.yoctoproject.org/Errors/Details/695674/>
> 
> On Tue, Feb 21, 2023 at 12:08 PM Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>> 
>>  sent again because of an error message during mail delivery
>> 
>>  Am Di, 21. Feb 2023 um 21:06:25 +0100 schrieb Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>>:
>> 
>>  - Remove unneeded patches Signed-off-by: Markus Volk 
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> --- 
>> ...t-use-NULL-where-boolean-is-expected.patch | 33 
>> ------------------- .../files/0001-use-posix-basename.patch | 30 
>> ----------------- .../{gparted_1.4.0.bb => gparted_1.5.0.bb} | 6 
>> ++-- 3 files changed, 2 insertions(+), 67 deletions(-) delete mode 
>> 100644 
>> meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch 
>> delete mode 100644 
>> meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch 
>> rename meta-gnome/recipes-extended/gparted/{gparted_1.4.0.bb => 
>> gparted_1.5.0.bb} (78%) diff --git 
>> a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch 
>> b/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch 
>> deleted file mode 100644 index 1b0d24024..000000000 --- 
>> a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-boolean-is-expected.patch 
>> +++ /dev/null @@ -1,33 +0,0 @@ -From 
>> 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mon Sep 17 00:00:00 2001 
>> -From: Khem Raj <raj.khem@gmail.com> -Date: Thu, 27 Jan 2022 
>> 23:02:20 -0800 -Subject: [PATCH] Do not use NULL where boolean is 
>> expected - -Fixes -src/GParted_Core.cc:73:57: error: static_cast 
>> from 'nullptr_t' to 'PedPartitionFlag' (aka '_PedPartitionFlag') is 
>> not allowed -| for ( PedPartitionFlag flag = 
>> ped_partition_flag_next( static_cast<PedPartitionFlag>( NULL ) ) ; 
>> -| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -| 1 error generated. - 
>> -Upstream-Status: Pending -Signed-off-by: Khem Raj 
>> <raj.khem@gmail.com> ---- - src/GParted_Core.cc | 2 +- - 1 file 
>> changed, 1 insertion(+), 1 deletion(-) - -diff --git 
>> a/src/GParted_Core.cc b/src/GParted_Core.cc -index f7ac970..3290c66 
>> 100644 ---- a/src/GParted_Core.cc -+++ b/src/GParted_Core.cc -@@ 
>> -70,7 +70,7 @@ GParted_Core::GParted_Core() - 
>> ped_exception_set_handler( ped_exception_handler ) ; - - //get valid 
>> flags ... -- for ( PedPartitionFlag flag = ped_partition_flag_next( 
>> static_cast<PedPartitionFlag>( NULL ) ) ; -+ for ( PedPartitionFlag 
>> flag = ped_partition_flag_next( static_cast<PedPartitionFlag>( false 
>> ) ) ; - flag ; - flag = ped_partition_flag_next( flag ) ) - flags 
>> .push_back( flag ) ; --- -2.35.0 - diff --git 
>> a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch 
>> b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch 
>> deleted file mode 100644 index aae200e27..000000000 --- 
>> a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.patch 
>> +++ /dev/null @@ -1,30 +0,0 @@ -Subject: [PATCH] BCache_Info.cc: use 
>> posix basename - -gnu 'basename' is undeclared for cplusplus if 
>> using musl. Use posix basename instead. - 
>> -fdebug-prefix-map=TOPDIR/build/tmp/work/cortexa57-yoe-linux-musl/gparted/1.4.0-r0/ 
>> -recipe-sysroot-native=-fvisibility-inlines-hidden -c -o 
>> Dialog_Disklabel.o ../../ -gparted-1.4.0/src/Dialog_Disklabel.cc 
>> ../../gparted-1.4.0/src/BCache_Info.cc:52:33: - -error: use of 
>> undeclared identifier 'basename'; did you mean 'g_basename'? - 
>> return "/dev/" + Glib::ustring(basename(buf)); - ^~~~~~~~ - 
>> g_basename - -Signed-off-by: Markus Volk <f_l_k@t-online.de> - 
>> -Upstream-Status: Submitted - 
>> -https://gitlab.gnome.org/GNOME/gparted/-/merge_requests/99 - ---- 
>> a/src/BCache_Info.cc 2022-03-02 22:04:17.000000000 +0100 -+++ 
>> b/src/BCache_Info.cc 2022-04-09 15:02:56.932218665 +0200 -@@ -17,7 
>> +17,7 @@ - - #include "BCache_Info.h" - --#include <string.h> // GNU 
>> version of basename() -+#include <libgen.h> // POSIX version of 
>> basename() - #include <unistd.h> - #include <glibmm/ustring.h> - 
>> #include <glibmm/fileutils.h> diff --git 
>> a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb 
>> b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb similarity 
>> index 78% rename from 
>> meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb rename to 
>> meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb index 
>> dde5a02ab..be7a96ea8 100644 --- 
>> a/meta-gnome/recipes-extended/gparted/gparted_1.4.0.bb +++ 
>> b/meta-gnome/recipes-extended/gparted/gparted_1.5.0.bb @@ -3,17 
>> +3,15 @@ HOMEPAGE = "http://gparted.org/index.php" LICENSE = 
>> "GPL-2.0-only" LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" -inherit 
>> autotools pkgconfig python3native gnome-help gtk-icon-cache 
>> features_check +inherit autotools pkgconfig python3native gettext 
>> gnome-help gtk-icon-cache features_check ANY_OF_DISTRO_FEATURES = 
>> "${GTK3DISTROFEATURES}" SRC_URI = " \ 
>> ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz 
>> \ 
>> file://0001-Install-polkit-action-unconditionally-executable-pke.patch 
>> \ - file://0001-Do-not-use-NULL-where-boolean-is-expected.patch \ - 
>> file://0001-use-posix-basename.patch \ " -SRC_URI[sha256sum] = 
>> "e5293a792e53fdbeba29c4a834113cd9603d0d639330da931a468bf3687887be" 
>> +SRC_URI[sha256sum] = 
>> "3c95ea26a944083ff1d9b17639b1e2ad9758df225dc751ff407b2a6aa092a8de" 
>> UPSTREAM_CHECK_URI = 
>> "https://sourceforge.net/projects/gparted/files/gparted/" 
>> UPSTREAM_CHECK_REGEX = "gparted-(?P<pver>\d+\.(\d+)+(\.\d+)+)"
>>  --
>>  2.34.1
>> 
>> 
>> 
>> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101202): 
> <https://lists.openembedded.org/g/openembedded-devel/message/101202>
> Mute This Topic: <https://lists.openembedded.org/mt/97117595/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-pVWlXMF5YTdGgFKyK3Ba
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>A hard dependency on polkit was in=
troduced. v2 should fix it</div></div><div id=3D"geary-quote" dir=3D"auto">=
<br>Am Mi, 22. Feb 2023 um 01:05:16 -0800 schrieb Khem Raj &lt;raj.khem@gma=
il.com&gt;:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"=
white-space: break-spaces;">seeing failures with arm/clang -
<a href=3D"https://errors.yoctoproject.org/Errors/Details/695674/">https://=
errors.yoctoproject.org/Errors/Details/695674/</a>

On Tue, Feb 21, 2023 at 12:08 PM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-=
online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 sent again because of an error message during mail delivery

 Am Di, 21. Feb 2023 um 21:06:25 +0100 schrieb Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;:

 - Remove unneeded patches Signed-off-by: Markus Volk &lt;<a href=3D"mailto=
:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; --- ...t-use-NULL-where-boole=
an-is-expected.patch | 33 ------------------- .../files/0001-use-posix-base=
name.patch | 30 ----------------- .../{gparted_1.4.0.bb =3D&gt; gparted_1.5=
.0.bb} | 6 ++-- 3 files changed, 2 insertions(+), 67 deletions(-) delete mo=
de 100644 meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-wh=
ere-boolean-is-expected.patch delete mode 100644 meta-gnome/recipes-extende=
d/gparted/files/0001-use-posix-basename.patch rename meta-gnome/recipes-ext=
ended/gparted/{gparted_1.4.0.bb =3D&gt; gparted_1.5.0.bb} (78%) diff --git =
a/meta-gnome/recipes-extended/gparted/files/0001-Do-not-use-NULL-where-bool=
ean-is-expected.patch b/meta-gnome/recipes-extended/gparted/files/0001-Do-n=
ot-use-NULL-where-boolean-is-expected.patch deleted file mode 100644 index =
1b0d24024..000000000 --- a/meta-gnome/recipes-extended/gparted/files/0001-D=
o-not-use-NULL-where-boolean-is-expected.patch +++ /dev/null @@ -1,33 +0,0 =
@@ -From 9af84e1c08a2159c10baf13244e2c8a7d7e837e9 Mon Sep 17 00:00:00 2001 =
-From: Khem Raj &lt;raj.khem@gmail.com&gt; -Date: Thu, 27 Jan 2022 23:02:20=
 -0800 -Subject: [PATCH] Do not use NULL where boolean is expected - -Fixes=
 -src/GParted_Core.cc:73:57: error: static_cast from 'nullptr_t' to 'PedPar=
titionFlag' (aka '_PedPartitionFlag') is not allowed -| for ( PedPartitionF=
lag flag =3D ped_partition_flag_next( static_cast&lt;PedPartitionFlag&gt;( =
NULL ) ) ; -| ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -| 1 error generated. -=
 -Upstream-Status: Pending -Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&=
gt; ---- - src/GParted_Core.cc | 2 +- - 1 file changed, 1 insertion(+), 1 d=
eletion(-) - -diff --git a/src/GParted_Core.cc b/src/GParted_Core.cc -index=
 f7ac970..3290c66 100644 ---- a/src/GParted_Core.cc -+++ b/src/GParted_Core=
.cc -@@ -70,7 +70,7 @@ GParted_Core::GParted_Core() - ped_exception_set_han=
dler( ped_exception_handler ) ; - - //get valid flags ... -- for ( PedParti=
tionFlag flag =3D ped_partition_flag_next( static_cast&lt;PedPartitionFlag&=
gt;( NULL ) ) ; -+ for ( PedPartitionFlag flag =3D ped_partition_flag_next(=
 static_cast&lt;PedPartitionFlag&gt;( false ) ) ; - flag ; - flag =3D ped_p=
artition_flag_next( flag ) ) - flags .push_back( flag ) ; --- -2.35.0 - dif=
f --git a/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename=
.patch b/meta-gnome/recipes-extended/gparted/files/0001-use-posix-basename.=
patch deleted file mode 100644 index aae200e27..000000000 --- a/meta-gnome/=
recipes-extended/gparted/files/0001-use-posix-basename.patch +++ /dev/null =
@@ -1,30 +0,0 @@ -Subject: [PATCH] BCache_Info.cc: use posix basename - -gn=
u 'basename' is undeclared for cplusplus if using musl. Use posix basename =
instead. - -fdebug-prefix-map=3DTOPDIR/build/tmp/work/cortexa57-yoe-linux-m=
usl/gparted/1.4.0-r0/ -recipe-sysroot-native=3D-fvisibility-inlines-hidden =
-c -o Dialog_Disklabel.o ../../ -gparted-1.4.0/src/Dialog_Disklabel.cc ../.=
./gparted-1.4.0/src/BCache_Info.cc:52:33: - -error: use of undeclared ident=
ifier 'basename'; did you mean 'g_basename'? - return "/dev/" + Glib::ustri=
ng(basename(buf)); - ^~~~~~~~ - g_basename - -Signed-off-by: Markus Volk &l=
t;f_l_k@t-online.de&gt; - -Upstream-Status: Submitted - -https://gitlab.gno=
me.org/GNOME/gparted/-/merge_requests/99 - ---- a/src/BCache_Info.cc 2022-0=
3-02 22:04:17.000000000 +0100 -+++ b/src/BCache_Info.cc 2022-04-09 15:02:56=
.932218665 +0200 -@@ -17,7 +17,7 @@ - - #include "BCache_Info.h" - --#inclu=
de &lt;string.h&gt; // GNU version of basename() -+#include &lt;libgen.h&gt=
; // POSIX version of basename() - #include &lt;unistd.h&gt; - #include &lt=
;glibmm/ustring.h&gt; - #include &lt;glibmm/fileutils.h&gt; diff --git a/me=
ta-gnome/recipes-extended/gparted/gparted_1.4.0.bb b/meta-gnome/recipes-ext=
ended/gparted/gparted_1.5.0.bb similarity index 78% rename from meta-gnome/=
recipes-extended/gparted/gparted_1.4.0.bb rename to meta-gnome/recipes-exte=
nded/gparted/gparted_1.5.0.bb index dde5a02ab..be7a96ea8 100644 --- a/meta-=
gnome/recipes-extended/gparted/gparted_1.4.0.bb +++ b/meta-gnome/recipes-ex=
tended/gparted/gparted_1.5.0.bb @@ -3,17 +3,15 @@ HOMEPAGE =3D "http://gpar=
ted.org/index.php" LICENSE =3D "GPL-2.0-only" LIC_FILES_CHKSUM =3D "file://=
COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f" -inherit autotools pkgconfi=
g python3native gnome-help gtk-icon-cache features_check +inherit autotools=
 pkgconfig python3native gettext gnome-help gtk-icon-cache features_check A=
NY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}" SRC_URI =3D " \ ${SOURCEF=
ORGE_MIRROR}/project/${BPN}/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.gz \ file:=
//0001-Install-polkit-action-unconditionally-executable-pke.patch \ - file:=
//0001-Do-not-use-NULL-where-boolean-is-expected.patch \ - file://0001-use-=
posix-basename.patch \ " -SRC_URI[sha256sum] =3D "e5293a792e53fdbeba29c4a83=
4113cd9603d0d639330da931a468bf3687887be" +SRC_URI[sha256sum] =3D "3c95ea26a=
944083ff1d9b17639b1e2ad9758df225dc751ff407b2a6aa092a8de" UPSTREAM_CHECK_URI=
 =3D "https://sourceforge.net/projects/gparted/files/gparted/" UPSTREAM_CHE=
CK_REGEX =3D "gparted-(?P&lt;pver&gt;\d+\.(\d+)+(\.\d+)+)"
 --
 2.34.1


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#101202): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101202">https://lists.openembedded.org/g/openembed=
ded-devel/message/101202</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97117595/3618=
223">https://lists.openembedded.org/mt/97117595/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-pVWlXMF5YTdGgFKyK3Ba--


