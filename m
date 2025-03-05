Return-Path: <lukas.weiss@janitza.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FE0C19F32
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 10:56:22 +0000 (UTC)
Subject: Problems adding cppzmq to Target-SDK
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?THVrYXMgV2Vpw58=?= <lukas.weiss@janitza.de>
X-Originating-Location: Herborn, Hesse, DE (77.179.215.40)
X-Originating-Platform: Linux Chrome 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 05 Mar 2025 02:56:13 -0800
Message-ID: <wUYw.1741172173148394856.1XeG@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ixdWdtaF1T6mZ0DYUG1s"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 10:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115749

--ixdWdtaF1T6mZ0DYUG1s
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi together,
i am just trying to add *cppzmq* to my Target-SDK (from meta-openembedded L=
ayer). To do that, ive added them do RDEPENDS of my App-Recipe:

RDEPENDS : ${ PN } +=3D "cppzmq"

This does neither work for target nor for target-sdk:

>=20
> ERROR: Nothing RPROVIDES 'cppzmq' (but calc-server_latest.bb RDEPENDS on
> or otherwise requires it)
>=20

Adding *cppzmq-dev* works for Target-SDK, but not for Target-Build:

>=20
> ERROR: calc-server-latest-r0 do_package_qa: QA Issue: calc-server rdepend=
s
> on cppzmq-dev [dev-deps]
>=20

I fixed this by adding the *cppzmq-dev* to RDEPENDS of packagegroup-core-st=
andalone-sdk-target to add the dependency only direct to Target-SDK, but th=
ats a bad hack.

Any ideas how to fix this? As far as i know cppzmq is a Header-Only Project=
...

--ixdWdtaF1T6mZ0DYUG1s
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi together,&nbsp;</div>
<div>i am just trying to add <strong>cppzmq</strong> to my Target-SDK (from=
 meta-openembedded Layer). To do that, ive added them do RDEPENDS of my App=
-Recipe:</div>
<div>&nbsp;</div>
<div>
<div style=3D"color: #cccccc; background-color: #1f1f1f; font-family: 'Droi=
d Sans Mono', 'monospace', monospace; font-weight: normal; font-size: 14px;=
 line-height: 19px; white-space: pre;">
<div><span style=3D"color: #9cdcfe;">RDEPENDS</span><span style=3D"color: #=
cccccc;">:</span><span style=3D"color: #569cd6;">${</span><span style=3D"co=
lor: #9cdcfe;">PN</span><span style=3D"color: #569cd6;">}</span><span style=
=3D"color: #cccccc;"> </span><span style=3D"color: #d4d4d4;">+=3D</span><sp=
an style=3D"color: #cccccc;"> </span><span style=3D"color: #ce9178;">"cppzm=
q"</span><span style=3D"color: #ce9178;"></span></div>
</div>
</div>
<div>&nbsp;</div>
<div>This does neither work for target nor for target-sdk:</div>
<blockquote>
<div>ERROR: Nothing RPROVIDES 'cppzmq' (but calc-server_latest.bb RDEPENDS =
on or otherwise requires it)</div>
</blockquote>
<div>&nbsp;</div>
<div>Adding <strong>cppzmq-dev</strong> works for Target-SDK, but not for T=
arget-Build:</div>
<blockquote>
<div>ERROR: calc-server-latest-r0 do_package_qa: QA Issue: calc-server rdep=
ends on cppzmq-dev [dev-deps]</div>
</blockquote>
<div>&nbsp;</div>
<div>I fixed this by adding the <strong>cppzmq-dev</strong> to RDEPENDS of =
packagegroup-core-standalone-sdk-target to add the dependency only direct t=
o Target-SDK, but thats a bad hack.</div>
<div>&nbsp;</div>
<div>Any ideas how to fix this? As far as i know cppzmq is a Header-Only Pr=
oject...&nbsp;</div>

--ixdWdtaF1T6mZ0DYUG1s--

