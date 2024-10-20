Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB75ED3C927
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 03:58:27 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.18755.1729396706978015226
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Oct 2024 20:58:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout06.t-online.de (Postfix) with SMTP id 33B0F2A1A5;
	Sun, 20 Oct 2024 05:58:25 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.175.81]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t2N5E-214VBg0; Sun, 20 Oct 2024 05:58:25 +0200
Date: Sun, 20 Oct 2024 06:00:28 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] snapper: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <S4ZMLS.LVMSY47J6K89@t-online.de>
In-Reply-To: <CAMKF1sopLEXWs+9GuF5rE=o+cThN01X0-0xkiAafVsXNWnb2Ng@mail.gmail.com>
References: <20241018131724.3051-1-f_l_k@t-online.de>
	<CAMKF1srcCF_yCHMuqaeCT2UxC_ZgKN=S_bVzCsQMmHQRidt+sw@mail.gmail.com>
	<CAMKF1sopLEXWs+9GuF5rE=o+cThN01X0-0xkiAafVsXNWnb2Ng@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-0kQ9vzamGjoX2U0qVo1J"
X-TOI-EXPURGATEID: 150726::1729396705-257F85DD-C5744FD0/0/0 CLEAN NORMAL
X-TOI-MSGID: e511ea0c-668d-483e-999b-38cd4ed4e538
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Oct 2024 03:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113066

--=-0kQ9vzamGjoX2U0qVo1J
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

The problem has already been fixed in Alpine Linux. Added a patch found=20
there

Additionally, I also added dependencies for e2fsprogs and ncurses,=20
since snapper links to -ltinfo and a runtime dependency of=20
util-linux-mount

On Sat, Oct 19 2024 at 06:40:56 PM -07:00:00, Khem Raj=20
<raj.khem@gmail.com> wrote:
> On Fri, Oct 18, 2024 at 9:23=E2=80=AFAM Khem Raj <raj.khem@gmail.com=20
> <mailto:raj.khem@gmail.com>> wrote:
>>=20
>>  On Fri, Oct 18, 2024 at 6:15=E2=80=AFAM Markus Volk via=20
>> lists.openembedded.org
>>  <f_l_k=3Dt-online.de@lists.openembedded.org=20
>> <mailto:f_l_k=3Dt-online.de@lists.openembedded.org>> wrote:
>>  >
>>  > Snapper is a tool for Linux file system snapshot management.=20
>> Apart from
>>  > the obvious creation and deletion of snapshots it can compare=20
>> snapshots
>>  > and revert differences between them. In simple terms, this allows=20
>> root
>>  > and non-root users to view older versions of files and revert=20
>> changes.
>>  >
>>  > Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  > ---
>>  >  .../recipes-support/snapper/snapper_0.11.2.bb | 35=20
>> +++++++++++++++++++
>>  >  1 file changed, 35 insertions(+)
>>  >  create mode 100644=20
>> meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>>  >
>>  > diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb=20
>> b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>>  > new file mode 100644
>>  > index 000000000..2759cdafb
>>  > --- /dev/null
>>  > +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
>>  > @@ -0,0 +1,35 @@
>>  > +SUMMARY =3D "Snapper is a tool for Linux file system snapshot=20
>> management"
>>  > +HOMEPAGE =3D "<https://github.com/openSUSE/snapper>"
>>  > +LICENSE =3D "GPL-2.0-only"
>>  > +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe"=20
>> <file://copying;md5=3D751419260aa954499f7abaabaa882bbe/>
>>  > +
>>  > +DEPENDS =3D "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
>>  > +
>>  > +# Build separation is slightly broken
>>  > +inherit autotools-brokensep pkgconfig gettext
>>  > +
>>  > +SRC_URI =3D=20
>> "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;branch=3Dmaster"
>>  > +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
>>  > +
>>  > +S =3D "${WORKDIR}/git"
>>  > +
>>  > +PACKAGECONFIG ?=3D "${@bb.utils.filter=20
>> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'api-documentation=20
>> systemd pam', d)}"
>>  > +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
>>  > +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
>>  > +PACKAGECONFIG[api-documentation] =3D=20
>> "--enable-doc,--disable-doc,libxslt-native=20
>> docbook-xsl-stylesheets-native"
>>  > +
>>  > +# Avoid HOSTTOOLS path in binaries
>>  > +export DIFFBIN=3D"${bindir}/diff"
>>  > +export RMBIN =3D "${bindir}/rm"
>>  > +export TOUCHBIN =3D "${bindir}/touch"
>>  > +export CPBIN =3D "${bindir}/cp"
>>  > +
>>  > +
>>  > +do_install:append() {
>>  > +       install -d ${D}${sysconfdir}/sysconfig
>>  > +       install -m0644 ${S}/data/default-config=20
>> ${D}${sysconfdir}/sysconfig/snapper
>>  > +}
>>  > +
>>  > +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd=20
>> ${libdir}/zypp ${libdir}/security ${datadir}"
>>  > +# bash is needed for the testsuite
>>  > +RDEPENDS:${PN} =3D "bash diffutils util-linux"
>>=20
>>  It would be good to package test binary and resources into=20
>> ${PN}-ptest package
>>  and then attach the needed rdeps to ${PN}-ptest package also look=20
>> into
>>  inheriting
>>  ptest class which should provide a basic build block for adding=20
>> ptests.
>>=20
>=20
> it fails to build with musl see
> <https://errors.yoctoproject.org/Errors/Details/809996/>
>=20
> stavfs64 is not needed if we are already using LFS64, we can just use
> statvfs even on glibc
> otherwise add -D_LARGEFILE64_SOURCE with musl builds to cflags
>=20
>>  > --
>>  > 2.47.0
>>  >
>>  >
>>  > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  > Links: You receive all messages sent to this group.
>>  > View/Reply Online (#112978):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/112978>
>>  > Mute This Topic:=20
>> <https://lists.openembedded.org/mt/109081580/1997914>
>>  > Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel+owner@lists.openembedded.org>
>>  > Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  >


--=-0kQ9vzamGjoX2U0qVo1J
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>The problem has already been fixed=
 in Alpine Linux. Added a patch found there</div><div><br></div><div>Additi=
onally, I also added dependencies for e2fsprogs and ncurses, since snapper =
links to -ltinfo and a runtime dependency of util-linux-mount</div></div><d=
iv id=3D"geary-quote" dir=3D"auto"><br>On Sat, Oct 19 2024 at 06:40:56 PM -=
07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D=
"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">On Fri=
, Oct 18, 2024 at 9:23=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:
<blockquote>
 On Fri, Oct 18, 2024 at 6:15=E2=80=AFAM Markus Volk via lists.openembedded=
.org
 &lt;<a href=3D"mailto:f_l_k=3Dt-online.de@lists.openembedded.org">f_l_k=3D=
t-online.de@lists.openembedded.org</a>&gt; wrote:
 &gt;
 &gt; Snapper is a tool for Linux file system snapshot management. Apart fr=
om
 &gt; the obvious creation and deletion of snapshots it can compare snapsho=
ts
 &gt; and revert differences between them. In simple terms, this allows roo=
t
 &gt; and non-root users to view older versions of files and revert changes=
.
 &gt;
 &gt; Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f=
_l_k@t-online.de</a>&gt;
 &gt; ---
 &gt;  .../recipes-support/snapper/snapper_0.11.2.bb | 35 +++++++++++++++++=
++
 &gt;  1 file changed, 35 insertions(+)
 &gt;  create mode 100644 meta-oe/recipes-support/snapper/snapper_0.11.2.bb
 &gt;
 &gt; diff --git a/meta-oe/recipes-support/snapper/snapper_0.11.2.bb b/meta=
-oe/recipes-support/snapper/snapper_0.11.2.bb
 &gt; new file mode 100644
 &gt; index 000000000..2759cdafb
 &gt; --- /dev/null
 &gt; +++ b/meta-oe/recipes-support/snapper/snapper_0.11.2.bb
 &gt; @@ -0,0 +1,35 @@
 &gt; +SUMMARY =3D "Snapper is a tool for Linux file system snapshot manage=
ment"
 &gt; +HOMEPAGE =3D "<a href=3D"https://github.com/openSUSE/snapper">https:=
//github.com/openSUSE/snapper</a>"
 &gt; +LICENSE =3D "GPL-2.0-only"
 &gt; +LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe" "=3D"">file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe"</a>
 &gt; +
 &gt; +DEPENDS =3D "acl boost btrfs-tools dbus json-c libxml2 lvm2 zlib"
 &gt; +
 &gt; +# Build separation is slightly broken
 &gt; +inherit autotools-brokensep pkgconfig gettext
 &gt; +
 &gt; +SRC_URI =3D "git://github.com/openSUSE/snapper.git;protocol=3Dhttps;=
branch=3Dmaster"
 &gt; +SRCREV =3D "6c603565f36e9996d85045c8012cd04aba5f3708"
 &gt; +
 &gt; +S =3D "${WORKDIR}/git"
 &gt; +
 &gt; +PACKAGECONFIG ?=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.util=
s.filter</a>('DISTRO_FEATURES', 'api-documentation systemd pam', d)}"
 &gt; +PACKAGECONFIG[pam] =3D "--enable-pam,--disable-pam,libpam"
 &gt; +PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd"
 &gt; +PACKAGECONFIG[api-documentation] =3D "--enable-doc,--disable-doc,lib=
xslt-native docbook-xsl-stylesheets-native"
 &gt; +
 &gt; +# Avoid HOSTTOOLS path in binaries
 &gt; +export DIFFBIN=3D"${bindir}/diff"
 &gt; +export RMBIN =3D "${bindir}/rm"
 &gt; +export TOUCHBIN =3D "${bindir}/touch"
 &gt; +export CPBIN =3D "${bindir}/cp"
 &gt; +
 &gt; +
 &gt; +do_install:append() {
 &gt; +       install -d ${D}${sysconfdir}/sysconfig
 &gt; +       install -m0644 ${S}/data/default-config ${D}${sysconfdir}/sys=
config/snapper
 &gt; +}
 &gt; +
 &gt; +FILES:${PN} +=3D "${libdir}/pam_snapper ${libdir}/systemd ${libdir}/=
zypp ${libdir}/security ${datadir}"
 &gt; +# bash is needed for the testsuite
 &gt; +RDEPENDS:${PN} =3D "bash diffutils util-linux"

 It would be good to package test binary and resources into ${PN}-ptest pac=
kage
 and then attach the needed rdeps to ${PN}-ptest package also look into
 inheriting
 ptest class which should provide a basic build block for adding ptests.

</blockquote>
it fails to build with musl see
<a href=3D"https://errors.yoctoproject.org/Errors/Details/809996/">https://=
errors.yoctoproject.org/Errors/Details/809996/</a>

stavfs64 is not needed if we are already using LFS64, we can just use
statvfs even on glibc
otherwise add -D_LARGEFILE64_SOURCE with musl builds to cflags

<blockquote> &gt; --
 &gt; 2.47.0
 &gt;
 &gt;
 &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 &gt; Links: You receive all messages sent to this group.
 &gt; View/Reply Online (#112978): <a href=3D"https://lists.openembedded.or=
g/g/openembedded-devel/message/112978">https://lists.openembedded.org/g/ope=
nembedded-devel/message/112978</a>
 &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/1090815=
80/1997914">https://lists.openembedded.org/mt/109081580/1997914</a>
 &gt; Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openemb=
edded.org">openembedded-devel+owner@lists.openembedded.org</a>
 &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded=
-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a>=
 [<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
 &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
 &gt;
</blockquote></div></blockquote></div>
--=-0kQ9vzamGjoX2U0qVo1J--


