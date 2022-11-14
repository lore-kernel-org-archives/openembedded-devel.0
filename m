Return-Path: <wojciech@rbmail.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1C4C433FE
	for <webhook@archiver.kernel.org>; Mon, 14 Nov 2022 10:23:39 +0000 (UTC)
Subject: #error [kirkstone] mariadb-native is unbuildable for 2 reasons
To: openembedded-devel@lists.openembedded.org
From: wojciech@rbmail.pl
X-Originating-Location: FR (147.135.209.109)
X-Originating-Platform: Linux Firefox 106
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 14 Nov 2022 02:23:34 -0800
Message-ID: <l50T.1668421414074374713.i1ex@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="UaULVQeAgJ698DCe06XJ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Nov 2022 10:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99584

--UaULVQeAgJ698DCe06XJ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I found 2 bugs in 'mariadb-native' package in 'kirkstone' branch.

1. Missing 'gnutls-native' in DEPENDS
2. Unable to successfuly perform 'do_compile' task:

The migration notes for 'kirkstone' states: https://docs.yoctoproject.org/4=
.0.5/migration-guides/migration-4.0.html#fetching-changes
" Network access from tasks is now disabled by default on kernels which sup=
port this feature (on most recent distros such as CentOS 8 and Debian 11 on=
wards). This means that tasks accessing the network need to be marked as su=
ch with the network flag. "

But during compilation there is a place in some CMakeLists.txt being downlo=
aded libfmt-8.0.1 from the internet, so the possibility to download it must=
 be unlocked in the recipe:

do_compile[network] =3D "1".

Finally my bbappend (mariadb-native_10.7.%.bbappend) looked like this:

DEPENDS:append =3D " gnutls-native"
do_compile[network] =3D "1"

Regards,
Wojciech

--UaULVQeAgJ698DCe06XJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi,<br /><br />I found 2 bugs in 'mariadb-native' package in 'kirkstone'=
 branch.<br /><br />1. Missing 'gnutls-native' in DEPENDS<br />2. Unable to=
 successfuly perform 'do_compile' task:<br /><br />The migration notes for =
'kirkstone' states: https://docs.yoctoproject.org/4.0.5/migration-guides/mi=
gration-4.0.html#fetching-changes<br />"<em>Network access from tasks is no=
w disabled by default on kernels which support this feature (on most recent=
 distros such as CentOS 8 and Debian 11 onwards). This means that tasks acc=
essing the network need to be marked as such with the <code class=3D"docuti=
ls literal notranslate"><span class=3D"pre">network</span></code> flag.</em=
>"<br /><br />But during compilation there is a place in some CMakeLists.tx=
t being downloaded libfmt-8.0.1 from the internet, so the possibility to do=
wnload it must be unlocked in the recipe:<br /><br />do_compile[network] =
=3D "1".<br /><br />Finally my bbappend (mariadb-native_10.7.%.bbappend) lo=
oked like this:<br /><br />DEPENDS:append =3D " gnutls-native"<br />do_comp=
ile[network] =3D "1"<br /><br />Regards,<br />Wojciech</p>

--UaULVQeAgJ698DCe06XJ--

