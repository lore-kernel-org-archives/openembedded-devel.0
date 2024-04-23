Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6350DC04FF8
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 06:44:50 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-txdbus: cleanup RDEPENDS
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 22 Apr 2024 23:44:48 -0700
References: <19341.1713551151329376805@lists.openembedded.org>
In-Reply-To: <19341.1713551151329376805@lists.openembedded.org>
Message-ID: <24843.1713854688239114556@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="s6846O5cl9l4hUTnJ97Z"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 06:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110115

--s6846O5cl9l4hUTnJ97Z
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 06:25 PM, Alper Ak wrote:

>=20
>=20
>=20
> Getting the similar error when I build this recipe too. Output:
>=20
>=20
>=20
> ERROR: Nothing RPROVIDES 'python3-twisted-core-native' (but
> virtual:native:/opt/yocto_co/sources/meta-openembedded/meta-python/recipe=
s-devtools/python/python3-incremental_22.10.0.bb
> RDEPENDS on or otherwise requires it)
>=20
> NOTE: Runtime target 'python3-twisted-core-native' is unbuildable,
> removing...
> Missing or unbuildable dependency chain was:
> ['python3-twisted-core-native']
>=20
> NOTE: Runtime target 'python3-twisted-core' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['python3-twisted-core',
> 'python3-incremental-native', 'python3-twisted-core-native']
>=20
> ERROR: Required build target 'python3-txdbus' has no buildable providers.
> Missing or unbuildable dependency chain was: ['python3-txdbus',
> 'python3-twisted-core', 'python3-incremental-native',
> 'python3-twisted-core-native']
>=20
>=20

Hi Alper, sorry for the double email, I forgot to send to 'Group'.

I could reproduce this on my side and 've fixed this issue by correcting th=
e python3-incremental patch here:https://lists.openembedded.org/g/openembed=
ded-devel/topic/meta_python_patch_v2/105685490 on my end this resolves the =
issue with building the python3-txdbus recipe. I tested on the master branc=
h.

--s6846O5cl9l4hUTnJ97Z
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 06:25 PM, Alper Ak wrote:<br />
<blockquote>
<p>Getting the similar error when I build this recipe too. Output:</p>
<p>ERROR: Nothing RPROVIDES 'python3-twisted-core-native' (but virtual:nati=
ve:/opt/yocto_co/sources/meta-openembedded/meta-python/recipes-devtools/pyt=
hon/python3-incremental_22.10.0.bb RDEPENDS on or otherwise requires it)<br=
 /><br />NOTE: Runtime target 'python3-twisted-core-native' is unbuildable,=
 removing...<br />Missing or unbuildable dependency chain was: ['python3-tw=
isted-core-native']<br /><br />NOTE: Runtime target 'python3-twisted-core' =
is unbuildable, removing...<br />Missing or unbuildable dependency chain wa=
s: ['python3-twisted-core', 'python3-incremental-native', 'python3-twisted-=
core-native']<br /><br />ERROR: Required build target 'python3-txdbus' has =
no buildable providers.<br />Missing or unbuildable dependency chain was: [=
'python3-txdbus', 'python3-twisted-core', 'python3-incremental-native', 'py=
thon3-twisted-core-native']</p>
</blockquote>
Hi Alper, sorry for the double email, I forgot to send to 'Group'.<br /><br=
 />I could reproduce this on my side and 've fixed this issue by correcting=
 the python3-incremental patch here:https://lists.openembedded.org/g/openem=
bedded-devel/topic/meta_python_patch_v2/105685490 on my end this resolves t=
he issue with building the python3-txdbus recipe. I tested on the master br=
anch.

--s6846O5cl9l4hUTnJ97Z--

