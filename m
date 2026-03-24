Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA905E9A75E
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:20:45 +0000 (UTC)
Subject: Re: [meta-oe][PATCH v2] image_types_sparse: switch ext* conversion to ext2simg_android
To: openembedded-devel@lists.openembedded.org
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.207.56.197)
X-Originating-Platform: Windows Edge 146
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Mar 2026 03:20:40 -0700
References: <20260323091500.1196198-1-git-patches@bmwtechworks.in> <1c0a5fcf-f673-47ba-a989-adcf5691fdbc@gmail.com> <534956.1774332632649907279@lists.openembedded.org>
In-Reply-To: <534956.1774332632649907279@lists.openembedded.org>
Message-ID: <561924.1774347640737667744@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="wjzfEtpoWvtJtmIY6dtz"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125550

--wjzfEtpoWvtJtmIY6dtz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

*A:* Dropping dynamic-layer/selinux/android-tools over deafult as per
https://lists.openembedded.org/g/openembedded-devel/topic/117415388
- Looked at this (topic/117415388 discussion), the discussion leds to remov=
al of only config file which was duplicated
Recipes are not to be dropped
The duplicated config files were removed by Commit-Id: c276518790 in meta-o=
penembedded (master)
*
B:* Is the proposed patch dependent on "selinux"
- This implementaion is not directly depending on SELINUX but dpendent on h=
igher version of Android
The higher version is available under dynamic-layer/selinux and that why th=
e changes on dynamic-layer
*C:* Recheck if selinux dependcy is still there in android-tools
If no selinux dependcy , move it to default meta-oe layer
- Working on this and will share the observation

- Will use weak assignment for preferred_version in V3 of patch

Thanks ,
Ashish

--wjzfEtpoWvtJtmIY6dtz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><strong>A: </strong>Dropping dynamic-layer/selinux/android-tools over =
deafult as per&nbsp;<br />&nbsp; &nbsp; &nbsp;https://lists.openembedded.or=
g/g/openembedded-devel/topic/117415388<br />- Looked at this (topic/1174153=
88 discussion), the discussion leds to removal of only config file which wa=
s duplicated&nbsp;<br />&nbsp; &nbsp;Recipes are not to be dropped&nbsp;<br=
 />&nbsp; &nbsp;The duplicated config files were removed by Commit-Id: c276=
518790 in meta-openembedded (master)<br /><strong><br />B: </strong>Is the =
proposed patch dependent on "selinux"</div>
<div>- This implementaion is not directly depending on SELINUX but dpendent=
 on higher version of Android<br />&nbsp; &nbsp;The higher version is avail=
able under dynamic-layer/selinux and that why the changes on dynamic-layer<=
/div>
<div>&nbsp;
<div><strong>C: </strong>Recheck if selinux dependcy is still there in andr=
oid-tools<br />&nbsp; &nbsp; &nbsp;If no selinux dependcy , move it to defa=
ult meta-oe layer&nbsp;<br />- Working on this and will share the observati=
on&nbsp;</div>
<br />- Will use weak assignment for preferred_version in V3 of patch&nbsp;=
<br /><br />Thanks ,<br />Ashish&nbsp;<br /><br /></div>
<div>&nbsp;</div>

--wjzfEtpoWvtJtmIY6dtz--

