Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CF4CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:36:53 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v4 1/4] android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: Bengaluru, Karnataka, IN (103.117.236.194)
X-Originating-Platform: Linux Firefox 151
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 03:36:48 -0700
References: <20260524065341.82660-1-emailaddress.ashish@gmail.com> <20260524065341.82660-2-emailaddress.ashish@gmail.com> <relbc3u3fwyfvt37xybbegkc2iezia7xelbyo4tjh6n77xt4i5@dvjvs2whwggq>
In-Reply-To: <relbc3u3fwyfvt37xybbegkc2iezia7xelbyo4tjh6n77xt4i5@dvjvs2whwggq>
Message-ID: <20362.1781001408536239294@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="4VwaybAO1ZlUIfA7H3E8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:36:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127485

--4VwaybAO1ZlUIfA7H3E8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Sorry for the breakage, and thanks for catching it and helping with the par=
tial revert to fix the regression.

This was an oversight on my end.

I had verified that the build compiled fine for an RPI4 target with core-im=
age-minimal (qemuarm with GCC and CLANG) ,
but since that was only a compile-time check and I didn=E2=80=99t flash it =
on real hardware running a mainline kernel,
the missing ConfigFS scripts slipped through.

I want to avoid missing this kind of issue on future upgrades.
- Could you share the testing or sanity-checking workflow you usually follo=
w for userspace/kernel integrations like this?
- Are there specific QEMU configs, runtime checks, or review habits you rel=
y on to make sure upstream compatibility doesn=E2=80=99t break?

I=E2=80=99d like to adapt my own workflow so I can catch this kind of runti=
me regression earlier.

Thanks again for the guidance.
Ashish

--4VwaybAO1ZlUIfA7H3E8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Dmitry,<br /><br />Sorry for the breakage, and thanks for catching =
it and helping with the partial revert to fix the regression.<br /><br />Th=
is was an oversight on my end.&nbsp;</div>
<div><br />I had verified that the build compiled fine for an RPI4 target w=
ith core-image-minimal (qemuarm with GCC and CLANG) ,&nbsp;<br />but since =
that was only a compile-time check and I didn&rsquo;t flash it on real hard=
ware running a mainline kernel,</div>
<div>the missing ConfigFS scripts slipped through.</div>
<div><br />I want to avoid missing this kind of issue on future upgrades.&n=
bsp;<br />- Could you share the testing or sanity-checking workflow you usu=
ally follow for userspace/kernel integrations like this?</div>
<div>- Are there specific QEMU configs, runtime checks, or review habits yo=
u rely on to make sure upstream compatibility doesn&rsquo;t break?<br /><br=
 />I&rsquo;d like to adapt my own workflow so I can catch this kind of runt=
ime regression earlier.<br /><br />Thanks again for the guidance.<br />Ashi=
sh</div>

--4VwaybAO1ZlUIfA7H3E8--

