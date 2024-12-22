Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE26E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 08:30:05 +0000 (UTC)
Subject: Re: [meta-oe][scarthgap][PATCH 1/4] Use 7zip 24.09 to replace p7zip 16.02
To: openembedded-devel@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 22 Dec 2024 00:29:59 -0800
References: <20241222081612.239474-1-hongxu.jia@windriver.com>
In-Reply-To: <20241222081612.239474-1-hongxu.jia@windriver.com>
Message-ID: <14778.1734856199190674571@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="jZmTWz7SkGMNoXkl7TgT"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Dec 2024 08:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114462

--jZmTWz7SkGMNoXkl7TgT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

The p7zip is too old and dead since 2016 and has many vulnerable CVEs, such=
 as:
CVE-2024-11612
CVE-2024-11477
CVE-2023-52169
CVE-2023-52168
CVE-2023-40481
CVE-2023-31102
CVE-2023-1576
CVE-2022-47069

The 7z is a standalone command, and the version of all affected recipes (an=
droid-tools, python3-rarfile, xarchiver) has no change between master and s=
carthgap
so I back ported the new 7zip recipe to scarthgap to instead of p7zip, I th=
ink the regression is little

//Hongxu

--jZmTWz7SkGMNoXkl7TgT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Armin,</div>
<div>&nbsp;</div>
<div>The p7zip is too old and dead since 2016 and has many <span class=3D"r=
ed">vulnerable</span> CVEs, such as:</div>
<div>CVE-2024-11612<br />CVE-2024-11477 &nbsp; &nbsp;<br />CVE-2023-52169<b=
r />CVE-2023-52168<br />CVE-2023-40481<br />CVE-2023-31102<br />CVE-2023-15=
76<br />CVE-2022-47069</div>
<div>&nbsp;</div>
<div>The 7z is a standalone command, and the version of all affected recipe=
s (android-tools, python3-rarfile, xarchiver) has no change between master =
and scarthgap</div>
<div>so I back ported the new 7zip recipe to scarthgap to instead of p7zip,=
 I think the regression is little</div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--jZmTWz7SkGMNoXkl7TgT--

