Return-Path: <adinath.mhatre@philips.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCAEC54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 06:23:16 +0000 (UTC)
Subject: Proposal to add recipe for varlink library
To: openembedded-devel@lists.openembedded.org
From: adinath.mhatre@philips.com
X-Originating-Location: Melbourne, Victoria, AU (155.190.53.6)
X-Originating-Platform: Windows Chrome 109
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 29 Jan 2023 22:23:13 -0800
Message-ID: <5hnD.1675059793281797659.30EI@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="A8pdX1YSxPyh7m8VtZAE"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jan 2023 06:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100857

--A8pdX1YSxPyh7m8VtZAE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

We want to add recipe for varlink library to meta-oe.
varlink/libvarlink: C implementation of the Varlink protocol and command li=
ne tool (github.com) ( https://github.com/varlink/libvarlink )

This recipe exists in meta-wayland
meta-wayland/libvarlink_git.bb at master =C2=B7 MarkusVolk/meta-wayland (gi=
thub.com) ( https://github.com/MarkusVolk/meta-wayland/blob/master/recipes-=
extended/libvarlink/libvarlink_git.bb )

But varlink is an IPC alternative to dbus and its doesn=E2=80=99t have depe=
ndency on wayland.
So, we don=E2=80=99t want to include meta-wayland as we don=E2=80=99t need.

We have asked meta-wayland author regarding same and he is ok with moving v=
arlink outside of meta-wayland.
Upstream libvarlink recipe to poky/meta-oe =C2=B7 Issue #4 =C2=B7 MarkusVol=
k/meta-wayland (github.com) ( https://github.com/MarkusVolk/meta-wayland/is=
sues/4 )

Also, we have asked openembedded-core, he suggests us to add it to meta-oe.
openembedded-core@lists.openembedded.org | Proposal to add recipe for varli=
nk library ( https://lists.openembedded.org/g/openembedded-core/topic/96563=
314#176437 )

Should we add this recipe to meta-oe/recipe-core?

--A8pdX1YSxPyh7m8VtZAE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>We want to add recipe for varlink library to meta-oe.</div>
<div><a href=3D"https://github.com/varlink/libvarlink">varlink/libvarlink: =
C implementation of the Varlink protocol and command line tool (github.com)=
</a></div>
<div>&nbsp;</div>
<div>This recipe exists in meta-wayland</div>
<div><a href=3D"https://github.com/MarkusVolk/meta-wayland/blob/master/reci=
pes-extended/libvarlink/libvarlink_git.bb">meta-wayland/libvarlink_git.bb a=
t master &middot; MarkusVolk/meta-wayland (github.com)</a></div>
<div>&nbsp;</div>
<div>But varlink is an IPC alternative to dbus and its doesn&rsquo;t have d=
ependency on wayland.</div>
<div>So, we don&rsquo;t want to include meta-wayland as we don&rsquo;t need=
.</div>
<div>&nbsp;</div>
<div>We have asked meta-wayland author regarding same and he is ok with mov=
ing varlink outside of meta-wayland.</div>
<div><a href=3D"https://github.com/MarkusVolk/meta-wayland/issues/4">Upstre=
am libvarlink recipe to poky/meta-oe &middot; Issue #4 &middot; MarkusVolk/=
meta-wayland (github.com)</a></div>
<div>&nbsp;</div>
<div>Also, we have asked openembedded-core, he suggests us to add it to met=
a-oe.</div>
<div><a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/96=
563314#176437">openembedded-core@lists.openembedded.org | Proposal to add r=
ecipe for varlink library</a></div>
<div>&nbsp;</div>
<div>Should we add this recipe to meta-oe/recipe-core?</div>

--A8pdX1YSxPyh7m8VtZAE--

