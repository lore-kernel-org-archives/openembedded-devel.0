Return-Path: <WXbet@proton.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE645CA0EE4
	for <webhook@archiver.kernel.org>; Sat, 16 Aug 2025 12:15:52 +0000 (UTC)
Subject: gitpkgv.bbclass: Issue when using BB_GIT_SHALLOW = "1"
To: openembedded-devel@lists.openembedded.org
From: "WXbet" <WXbet@proton.me>
X-Originating-Location: Baunatal, Hesse, DE (94.31.119.11)
X-Originating-Platform: Windows Chrome 138
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 16 Aug 2025 05:15:49 -0700
Message-ID: <vox3.1755346549855678236.CfD2@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="BO7c15ghNSLorv413ZZo"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Aug 2025 12:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118979

--BO7c15ghNSLorv413ZZo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In oe-alliance build system we use this setting for all git repositiories t=
o fetch from:
BB_GIT_SHALLOW_DEPTH =3D "1"
BB_GIT_SHALLOW =3D "1"
There are changes in bitbake fetcher module the last months that result in =
gitNone0 ipk files now, when recipes using inherit gitpkgv class.
Seems the gitpkgv class is not able to fetch tag information anymore.

Question: Are we doing something wrong? Is this combination not supported a=
nymore?

--BO7c15ghNSLorv413ZZo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>In oe-alliance build system we use this setting for all git repositior=
ies to fetch from:<br />BB_GIT_SHALLOW_DEPTH =3D "1"<br />BB_GIT_SHALLOW =
=3D "1"<br />There are changes in bitbake fetcher module the last months th=
at result in gitNone0 ipk files now, when recipes using inherit gitpkgv cla=
ss.<br />Seems the gitpkgv class is not able to fetch tag information anymo=
re.</div>
<div>&nbsp;</div>
<div>Question: Are we doing something wrong? Is this combination not suppor=
ted anymore?</div>
</div>

--BO7c15ghNSLorv413ZZo--

