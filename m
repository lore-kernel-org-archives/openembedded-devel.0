Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E748FC61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 18:42:14 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.773.1700851326752442360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Nov 2023 10:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout03.t-online.de (Postfix) with SMTP id 2CDAA4AE0A;
	Fri, 24 Nov 2023 19:42:05 +0100 (CET)
Received: from [192.168.178.67] ([84.154.165.244]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r6b7r-36Jmim0; Fri, 24 Nov 2023 19:42:04 +0100
Date: Fri, 24 Nov 2023 19:42:24 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-networking][PATCH] libcacard: fix version string in
 libcacard.pc
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <OA5N4S.5LC9T7JG7BGL@t-online.de>
In-Reply-To: <CAMKF1sqAMXU_dXB-wTP8i5HU=+iLXnGq7X_M=cmVAQ6Yj8ZAVw@mail.gmail.com>
References: <179A4086F38671FD.6421@lists.openembedded.org>
	<WQ4L4S.ID0ZVJAVHQ0O3@t-online.de>
	<CAMKF1sqAMXU_dXB-wTP8i5HU=+iLXnGq7X_M=cmVAQ6Yj8ZAVw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gqCgS5tcsvFjkLm0Rllz"
X-TOI-EXPURGATEID: 150726::1700851324-5C820986-2B55013A/0/0 CLEAN NORMAL
X-TOI-MSGID: 41c0b782-5730-4fae-9f4a-0ea07471a051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 18:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107048

--=-gqCgS5tcsvFjkLm0Rllz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I'm not quite sure if this is needed at all. I think it was caused by=20
btrfs fs corruption. I managed to break btrfs several times in the last=20
months.
Fortunately never beyond repair but I'll definitely will switch back to=20
ext4 for home directory of my build machine

On Thu, Nov 23 2023 at 08:50:21 AM -08:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> On Thu, Nov 23, 2023 at 8:35=E2=80=AFAM <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Adding git-native to DEPENDS also fixes this issue. This should be=20
>> the preferred way to fix I guess?
>=20
> as long as it does not go over network it might be ok although it
> elongates the depchain a bit
> you can also insert the PV instead of hardcoding the version, that way
> you dont have to worry about updating the patch with every version
> bump
>=20
>>=20
>>  On Thu, Nov 23 2023 at 01:33:02 PM +01:00:00, Markus Volk=20
>> <f_l_k@t-online.de <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>> ---=20
>> ...n.build-set-hardcoded-version-string.patch | 34=20
>> +++++++++++++++++++ .../recipes-support/spice/libcacard_2.8.1.bb | 5=20
>> ++- 2 files changed, 38 insertions(+), 1 deletion(-) create mode=20
>> 100644=20
>> meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-har=
dcoded-version-string.patch=20
>> diff --git=20
>> a/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-h=
ardcoded-version-string.patch=20
>> b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-h=
ardcoded-version-string.patch=20
>> new file mode 100644 index 000000000..b9d31c458 --- /dev/null +++=20
>> b/meta-networking/recipes-support/spice/libcacard/0001-meson.build-set-h=
ardcoded-version-string.patch=20
>> @@ -0,0 +1,34 @@ +From dbfc08b9dc879e21bfacbd153948d21db36d50cd Mon=20
>> Sep 17 00:00:00 2001 +From: Markus Volk <f_l_k@t-online.de> +Date:=20
>> Thu, 23 Nov 2023 13:20:40 +0100 +Subject: [PATCH] meson.build: set=20
>> hardcoded version string + +Signed-off-by: Markus Volk=20
>> <f_l_k@t-online.de> + +This fixes version string in the pkgconfig=20
>> file and thus unbreaks spice build +| spice-common| Run-time=20
>> dependency libcacard found: NO +| +|=20
>> ../git/subprojects/spice-common/meson.build:144:16: ERROR:=20
>> Dependency lookup for libcacard with method 'pkgconfig' failed:=20
>> Invalid version, need 'libcacard' ['>=3D 2.5.1'] found 'UNKNOWN'. +|=20
>> +| A full log can be found at=20
>> /home/flk/poky/build/tmp/work/corei7-64-poky-linux/spice/0.15.2/build/me=
son-logs/meson-log.txt=20
>> +| ERROR: meson failed + +Upstream-Status: Inappropriate=20
>> [oe-specific] +--- + meson.build | 2 +- + 1 file changed, 1=20
>> insertion(+), 1 deletion(-) + +diff --git a/meson.build=20
>> b/meson.build +index 9cfe248..00745e5 100644 +--- a/meson.build ++++=20
>> b/meson.build +@@ -1,5 +1,5 @@ + project('libcacard', 'c', 'cpp', +-=20
>> version: run_command('build-aux/git-version-gen',=20
>> '@0@/.tarball-version'.format(meson.source_root()), check:=20
>> true).stdout().strip(), ++ version: '2.8.1', + license: 'LGPLv2.1',=20
>> + default_options: ['warning_level=3D2'], + ) +-- +2.42.0 + diff --git=20
>> a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb=20
>> b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb index=20
>> c81322e68..44cccba9d 100644 ---=20
>> a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb +++=20
>> b/meta-networking/recipes-support/spice/libcacard_2.8.1.bb @@ -6,7=20
>> +6,10 @@ DEPENDS =3D "glib-2.0 pcsc-lite nss" SRCREV =3D=20
>> "7b07684ea6698d4885ff2062350ad8798a04de42" -SRC_URI =3D=20
>> "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3Dhttps;branc=
h=3Dmaster"=20
>> +SRC_URI =3D " \ +=20
>> git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3Dhttps;branch=
=3Dmaster=20
>> \ + file://0001-meson.build-set-hardcoded-version-string.patch \ +"=20
>> S =3D "${WORKDIR}/git"
>>  --
>>  2.42.0
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all me=
ssages sent to=20
>> this group. View/Reply Online (#107022):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/107022>=20
>> Mute This Topic:=20
>> <https://lists.openembedded.org/mt/102765737/3618223> Group Owner:=20
>> openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>=20
>> Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--=-gqCgS5tcsvFjkLm0Rllz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>I'm not quite sure if this is need=
ed at all. I think it was caused by btrfs fs corruption. I managed to break=
 btrfs several times in the last months.</div><div>Fortunately never beyond=
 repair but I'll definitely will switch back to ext4 for home directory of =
my build machine</div></div><div id=3D"geary-quote" dir=3D"auto"><br>On Thu=
, Nov 23 2023 at 08:50:21 AM -08:00:00, Khem Raj &lt;raj.khem@gmail.com&gt;=
 wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"whit=
e-space: break-spaces;">On Thu, Nov 23, 2023 at 8:35=E2=80=AFAM &lt;<a href=
=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 Adding git-native to DEPENDS also fixes this issue. This should be the pre=
ferred way to fix I guess?
</blockquote>
as long as it does not go over network it might be ok although it
elongates the depchain a bit
you can also insert the PV instead of hardcoding the version, that way
you dont have to worry about updating the patch with every version
bump

<blockquote>
 On Thu, Nov 23 2023 at 01:33:02 PM +01:00:00, Markus Volk &lt;<a href=3D"m=
ailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt; --- ...n.build-set-hardcoded-version-string.patch | 34 =
+++++++++++++++++++ .../recipes-support/spice/libcacard_2.8.1.bb | 5 ++- 2 =
files changed, 38 insertions(+), 1 deletion(-) create mode 100644 meta-netw=
orking/recipes-support/spice/libcacard/0001-meson.build-set-hardcoded-versi=
on-string.patch diff --git a/meta-networking/recipes-support/spice/libcacar=
d/0001-meson.build-set-hardcoded-version-string.patch b/meta-networking/rec=
ipes-support/spice/libcacard/0001-meson.build-set-hardcoded-version-string.=
patch new file mode 100644 index 000000000..b9d31c458 --- /dev/null +++ b/m=
eta-networking/recipes-support/spice/libcacard/0001-meson.build-set-hardcod=
ed-version-string.patch @@ -0,0 +1,34 @@ +From dbfc08b9dc879e21bfacbd153948=
d21db36d50cd Mon Sep 17 00:00:00 2001 +From: Markus Volk &lt;f_l_k@t-online=
.de&gt; +Date: Thu, 23 Nov 2023 13:20:40 +0100 +Subject: [PATCH] meson.buil=
d: set hardcoded version string + +Signed-off-by: Markus Volk &lt;f_l_k@t-o=
nline.de&gt; + +This fixes version string in the pkgconfig file and thus un=
breaks spice build +| spice-common| Run-time dependency libcacard found: NO=
 +| +| ../git/subprojects/spice-common/meson.build:144:16: ERROR: Dependenc=
y lookup for libcacard with method 'pkgconfig' failed: Invalid version, nee=
d 'libcacard' ['&gt;=3D 2.5.1'] found 'UNKNOWN'. +| +| A full log can be fo=
und at /home/flk/poky/build/tmp/work/corei7-64-poky-linux/spice/0.15.2/buil=
d/meson-logs/meson-log.txt +| ERROR: meson failed + +Upstream-Status: Inapp=
ropriate [oe-specific] +--- + meson.build | 2 +- + 1 file changed, 1 insert=
ion(+), 1 deletion(-) + +diff --git a/meson.build b/meson.build +index 9cfe=
248..00745e5 100644 +--- a/meson.build ++++ b/meson.build +@@ -1,5 +1,5 @@ =
+ project('libcacard', 'c', 'cpp', +- version: run_command('build-aux/git-v=
ersion-gen', '@0@/.tarball-version'.format(meson.source_root()), check: tru=
e).stdout().strip(), ++ version: '2.8.1', + license: 'LGPLv2.1', + default_=
options: ['warning_level=3D2'], + ) +-- +2.42.0 + diff --git a/meta-network=
ing/recipes-support/spice/libcacard_2.8.1.bb b/meta-networking/recipes-supp=
ort/spice/libcacard_2.8.1.bb index c81322e68..44cccba9d 100644 --- a/meta-n=
etworking/recipes-support/spice/libcacard_2.8.1.bb +++ b/meta-networking/re=
cipes-support/spice/libcacard_2.8.1.bb @@ -6,7 +6,10 @@ DEPENDS =3D "glib-2=
.0 pcsc-lite nss" SRCREV =3D "7b07684ea6698d4885ff2062350ad8798a04de42" -SR=
C_URI =3D "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=3Dhttp=
s;branch=3Dmaster" +SRC_URI =3D " \ + git://gitlab.freedesktop.org/spice/li=
bcacard.git;protocol=3Dhttps;branch=3Dmaster \ + file://0001-meson.build-se=
t-hardcoded-version-string.patch \ +" S =3D "${WORKDIR}/git"
 --
 2.42.0
 -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all messa=
ges sent to this group. View/Reply Online (#107022): <a href=3D"https://lis=
ts.openembedded.org/g/openembedded-devel/message/107022">https://lists.open=
embedded.org/g/openembedded-devel/message/107022</a> Mute This Topic: <a hr=
ef=3D"https://lists.openembedded.org/mt/102765737/3618223">https://lists.op=
enembedded.org/mt/102765737/3618223</a> Group Owner: <a href=3D"mailto:open=
embedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists=
.openembedded.org</a> Unsubscribe: <a href=3D"https://lists.openembedded.or=
g/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded=
-devel/unsub</a> [<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a=
>] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
</blockquote></div></blockquote></div>
--=-gqCgS5tcsvFjkLm0Rllz--


