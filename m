Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA79C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 18:25:52 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-txdbus: cleanup RDEPENDS
To: openembedded-devel@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.68.217)
X-Originating-Platform: Linux Firefox 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Apr 2024 11:25:51 -0700
References: <20240418092553.3408-1-gudnimar@noxmedical.com>
In-Reply-To: <20240418092553.3408-1-gudnimar@noxmedical.com>
Message-ID: <19341.1713551151329376805@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RDQbQ34S7nuVWifQeBvQ"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 18:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110069

--RDQbQ34S7nuVWifQeBvQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Getting the similar error when I build this recipe too. Output:

ERROR: Nothing RPROVIDES 'python3-twisted-core-native' (but virtual:native:=
/opt/yocto_co/sources/meta-openembedded/meta-python/recipes-devtools/python=
/python3-incremental_22.10.0.bb RDEPENDS on or otherwise requires it)

NOTE: Runtime target 'python3-twisted-core-native' is unbuildable, removing=
...
Missing or unbuildable dependency chain was: ['python3-twisted-core-native'=
]

NOTE: Runtime target 'python3-twisted-core' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['python3-twisted-core', 'pyth=
on3-incremental-native', 'python3-twisted-core-native']

ERROR: Required build target 'python3-txdbus' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-txdbus', 'python3-tw=
isted-core', 'python3-incremental-native', 'python3-twisted-core-native']

--RDQbQ34S7nuVWifQeBvQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div id=3D"msgbody236925509">
<div class=3D"forcebreak" dir=3D"auto">
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
</div>
</div>

--RDQbQ34S7nuVWifQeBvQ--

