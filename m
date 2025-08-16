Return-Path: <WXbet@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D239ECA0EE6
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 12:14:02 +0000 (UTC)
Subject: gitpkgv.bbclass: Issue when using BB_GIT_SHALLOW = "0"
To: openembedded-devel@lists.openembedded.org
From: "WXbet" <WXbet@proton.me>
X-Originating-Location: Baunatal, Hesse, DE (94.31.119.11)
X-Originating-Platform: Windows Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 16 Aug 2025 05:14:00 -0700
Message-ID: <bZIg.1755335040414657878.EimK@lists.openembedded.org>
X-Old-Date: Sat, 16 Aug 2025 02:04:00 -0700
Content-Type: multipart/alternative; boundary="8hpo3xW1OMb8NWERzKt8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Aug 2025 12:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118978
Message-ID: <20250816121400.Am9mpXmiosHreWDYCYOoQvLXYtieCv-kUnjlyDmKl6Q@z>

--8hpo3xW1OMb8NWERzKt8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In oe-alliance build system we use this setting for all git repositiories t=
o fetch from:
BB_GIT_SHALLOW_DEPTH =3D "1"
BB_GIT_SHALLOW =3D "1"
There changes in bitbake fetcher module the last months that result in gitN=
one0 ipk files now, when recipes using inherit gitpkgv class.
Seems the gitpkgv class is not able to fetch any tag information anymore.

Question: Are we doing anything wrong? Is this combination not supported an=
ymore?

--8hpo3xW1OMb8NWERzKt8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>In oe-alliance build system we use this setting for all git repositior=
ies to fetch from:<br />BB_GIT_SHALLOW_DEPTH =3D "1"<br />BB_GIT_SHALLOW =
=3D "1"</div>
<div>There changes in bitbake fetcher module the last months that result in=
 gitNone0 ipk files now, when recipes using inherit gitpkgv class.<br />See=
ms the gitpkgv class is not able to fetch any tag information anymore.</div=
>
<div><br />Question: Are we doing anything wrong? Is this combination not s=
upported anymore?</div>

--8hpo3xW1OMb8NWERzKt8--

