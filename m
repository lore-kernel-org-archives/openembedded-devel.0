Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0076CC83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 18:05:21 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] tk: add INCLUDEDIR for tcl9.0
To: openembedded-devel@lists.openembedded.org
From: "Alper Ak" <alperyasinak1@gmail.com>
X-Originating-Location: Istanbul, TR (176.33.67.97)
X-Originating-Platform: Linux Firefox 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 30 Jun 2025 11:05:16 -0700
References: <20250630151655.3505250-1-f_l_k@t-online.de>
In-Reply-To: <20250630151655.3505250-1-f_l_k@t-online.de>
Message-ID: <25294.1751306716982813583@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="LUpjkuPb7Ur945KOILj0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 18:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118183

--LUpjkuPb7Ur945KOILj0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

I recently sent a patch similar to yours. Yes, this really solves the probl=
em, but there seem to be two things to think about:

1) if tcl and tk can be upgraded independently (tcl recipe is in poky, tk i=
s in meta-oe), this may cause failure if tcl is upgraded without upgrading =
tk. We are telling him to look at =E2=80=9C-I${STAGING_INCDIR}/tcl${VER}=E2=
=80=9D but when tcl is upgraded, if tk isn't upgraded to the same version, =
it will probably fail.

2) tk uses pkgconfig that's the way for tcl to tell tk where to find its he=
aders. When I look at the compile logs, it really tells but there is a situ=
ation like this in include path:

-I.../recipe-sysroot/usr/include/sources/tcl9.0.1/generic

Somehow, the "sources" is added to the path from somewhere, and it must be =
/usr/include/tcl9.0.1/generic

I know that the "tcl.h" file is available in both ../recipe-sysroot/usr/inc=
lude/tcl9.0/ and ../recipe-sysroot/usr/include/tcl9.0.1/generic/=C2=A0 but =
considering the path provided to the compiler as an include, we should use =
the generic one.

I have been sick for a while and haven't had much time to look at the situa=
tion with pkgconfig. I wanted to write to see if it might help you.

--LUpjkuPb7Ur945KOILj0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Markus,<br /><br />I recently sent a patch similar to yours. Yes, t=
his really solves the problem, but there seem to be two things to think abo=
ut:<br /><br />1) if tcl and tk can be upgraded independently (tcl recipe i=
s in poky, tk is in meta-oe), this may cause failure if tcl is upgraded wit=
hout upgrading tk. We are telling him to look at &ldquo;-I${STAGING_INCDIR}=
/tcl${VER}&rdquo; but when tcl is upgraded, if tk isn't upgraded to the sam=
e version, it will probably fail.<br /><br />
<div>2) tk uses pkgconfig that's the way for tcl to tell tk where to find i=
ts headers. When I look at the compile logs, it really tells but there is a=
 situation like this in include path:<br /><br /></div>
<div>-I.../recipe-sysroot/usr/include/sources/tcl9.0.1/generic<br /><br /><=
/div>
<div>Somehow, the "sources" is added to the path from somewhere, and it mus=
t be /usr/include/tcl9.0.1/generic<br /><br /></div>
<div>I know that the "tcl.h" file is available in both ../recipe-sysroot/us=
r/include/tcl9.0/ and ../recipe-sysroot/usr/include/tcl9.0.1/generic/&nbsp;=
 but considering the path provided to the compiler as an include, we should=
 use the generic one.<br /><br />I have been sick for a while and haven't h=
ad much time to look at the situation with pkgconfig. I wanted to write to =
see if it might help you.</div>
</div>

--LUpjkuPb7Ur945KOILj0--

