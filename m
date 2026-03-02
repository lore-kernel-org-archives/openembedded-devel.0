Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A902FD58E51
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:45:51 +0000 (UTC)
Subject: Re: [RFC_V2] [meta-oe]: Improving ext* sparse image generation: migrating from img2simg to ext2simg_android for ext* filesystem
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: IN (1.7.105.116)
X-Originating-Platform: Windows Edge 145
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 20:45:43 -0800
References: <rGsP.1771488393837852960.eVnE@lists.openembedded.org> <a11b45eb-1ee0-4274-9780-5a86105a7a1f@gmail.com> <1030996.1771825388005282969@lists.openembedded.org>
In-Reply-To: <1030996.1771825388005282969@lists.openembedded.org>
Message-ID: <1127752.1772426743792609011@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="C8I6SUycOZyOqp5ZAz7p"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 04:45:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124798

--C8I6SUycOZyOqp5ZAz7p
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy Sarvari ,

w.r.t "What happens if you add "-Wl,-rpath=3D../${baselib} -Wl,-rpath=3D../=
../${baselib}" (or similar) to LDFLAGS?"

Added below in meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4=
sparse_1.0.bb as suggested
BUILD_LDFLAGS +=3D "-Wl,-rpath,../${baselib} -Wl,-rpath,../../${baselib}"
TARGET_LDFLAGS +=3D "-Wl,-rpath,../${baselib} -Wl,-rpath,../../${baselib}"

Can i push the patch now in master for this functionality?
or Is there any other process / feedback that i need to work?

Based on additional feedback, can work on the current implementation and sh=
are the patches again

Thanks,
Ashish Kumar Mishra

--C8I6SUycOZyOqp5ZAz7p
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Gyorgy Sarvari ,&nbsp;<br /><br />
<div style=3D"box-sizing: border-box; overflow-wrap: break-word !important;=
 color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neu=
e', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji',=
 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; =
font-style: normal; font-variant-ligatures: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start=
; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; white-space: normal; background-color: #ffffff=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial;">w.r.t "What happens if you add "-Wl,-rpath=3D..=
/${baselib} -Wl,-rpath=3D../../${baselib}" (or similar) to LDFLAGS?"</div>
<br />Added below in meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprog=
s-ext4sparse_1.0.bb as suggested<br />BUILD_LDFLAGS +=3D "-Wl,-rpath,../${b=
aselib} -Wl,-rpath,../../${baselib}"<br />TARGET_LDFLAGS +=3D "-Wl,-rpath,.=
./${baselib} -Wl,-rpath,../../${baselib}"<br /><br />Can i push the patch n=
ow in master for this functionality?</div>
<div>or Is there any other process / feedback that i need to work?</div>
<div>&nbsp;</div>
<div>Based on additional feedback, can work on the current implementation a=
nd share the patches again&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Ashish Kumar Mishra</div>
<div>&nbsp;</div>
<div>&nbsp;</div>

--C8I6SUycOZyOqp5ZAz7p--

