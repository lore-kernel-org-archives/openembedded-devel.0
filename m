Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0D4C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 18:22:32 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-incremental: cleanup RDEPENDS
To: openembedded-devel@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.68.217)
X-Originating-Platform: Linux Firefox 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 19 Apr 2024 11:22:27 -0700
References: <20240418092910.3585-1-gudnimar@noxmedical.com>
In-Reply-To: <20240418092910.3585-1-gudnimar@noxmedical.com>
Message-ID: <19341.1713550947178632768@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="fOTOEi6C09nJPoGZpzSg"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 18:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110068

--fOTOEi6C09nJPoGZpzSg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Gilbert,

First of all, thank you for your patch. But I'm getting error while buildin=
g the recipe. Output:

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

ERROR: Required build target 'python3-incremental' has no buildable provide=
rs.
Missing or unbuildable dependency chain was: ['python3-incremental', 'pytho=
n3-twisted-core', 'python3-incremental-native', 'python3-twisted-core-nativ=
e']

It would be nice if you could take a look at your free time.

Best Regards

--fOTOEi6C09nJPoGZpzSg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Gilbert,</p>
<p>First of all, thank you for your patch. But I'm getting error while buil=
ding the recipe. Output:</p>
<p>ERROR: Nothing RPROVIDES 'python3-twisted-core-native' (but virtual:nati=
ve:/opt/yocto_co/sources/meta-openembedded/meta-python/recipes-devtools/pyt=
hon/python3-incremental_22.10.0.bb RDEPENDS on or otherwise requires it)<br=
 /><br />NOTE: Runtime target 'python3-twisted-core-native' is unbuildable,=
 removing...<br />Missing or unbuildable dependency chain was: ['python3-tw=
isted-core-native']<br /><br />NOTE: Runtime target 'python3-twisted-core' =
is unbuildable, removing...<br />Missing or unbuildable dependency chain wa=
s: ['python3-twisted-core', 'python3-incremental-native', 'python3-twisted-=
core-native']<br /><br />ERROR: Required build target 'python3-incremental'=
 has no buildable providers.<br />Missing or unbuildable dependency chain w=
as: ['python3-incremental', 'python3-twisted-core', 'python3-incremental-na=
tive', 'python3-twisted-core-native']</p>
<p>It would be nice if you could take a look at your free time.</p>
<p>Best Regards</p>

--fOTOEi6C09nJPoGZpzSg--

