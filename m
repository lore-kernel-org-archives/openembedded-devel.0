Return-Path: <tim.dylla.ext@rohde-schwarz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2831CC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:51:43 +0000 (UTC)
Subject: Re: [kirkstone][meta-networking][PATCH] net-snmp: fix memory leak
To: openembedded-devel@lists.openembedded.org
From: tim.dylla.ext@rohde-schwarz.com
X-Originating-Location: CH (147.161.235.82)
X-Originating-Platform: Linux Firefox 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Mar 2025 07:51:33 -0700
References: <AM0PR06MB4260E942DA834864F38DE7DBABD12@AM0PR06MB4260.eurprd06.prod.outlook.com>
In-Reply-To: <AM0PR06MB4260E942DA834864F38DE7DBABD12@AM0PR06MB4260.eurprd06.prod.outlook.com>
Message-ID: <15989.1742827718915937909@lists.openembedded.org>
X-Old-Date: Mon, 24 Mar 2025 07:48:38 -0700
Content-Type: multipart/alternative; boundary="u8DvfCIMTSrXLFLDvICM"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116210
Message-ID: <20250324145133.-CPbNC6g1j15M0fNwSzjRv5YGO7Ry17zvNp24VRI1Oo@z>

--u8DvfCIMTSrXLFLDvICM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Confirmed (if that's of interest),

I second Piotr Lewicki in all aspects, the patch in its current form breaks=
 building of net-snmp recipe.

...Patching patches, patching patches.... :)

All the best,

Tim Dylla

>=20
> The patch is not applying not only because of the special characters, but
> also due to wrong lines where the unload_all_mibs(void) is pointing to.
> I suggest to:
> 1. Revert the "net-snmp: fix memory leak" patch, because all images that
> use net-snmp are not building at the moment (at least in my setup).
> 2. Fix the patch- all the info is in this email. Removing lines with
> special character is one thing, another is updating the line numbers in
> the second hunk so that it applies without any problems.
>=20
> Best,
> Piotr Lewicki
> Common Linux Team
> E-mail: piotr.l.lewicki@...
> http://www.hitachienergy.com/
>

--u8DvfCIMTSrXLFLDvICM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Confirmed (if that's of interest),&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp; I second Piotr Lewicki in all aspects, the patch in its c=
urrent form breaks building of net-snmp recipe. <br /><br />...Patching pat=
ches, patching patches.... :)<br /><br />All the best,</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tim Dylla</div>
<div>&nbsp;</div>
<blockquote>
<div>The patch is not applying not only because of the special characters, =
but also due to wrong lines where the unload_all_mibs(void) is pointing to.=
<br />I suggest to:<br />1. Revert the "net-snmp: fix memory leak" patch, b=
ecause all images that use net-snmp are not building at the moment (at leas=
t in my setup).<br />2. Fix the patch- all the info is in this email. Remov=
ing lines with special character is one thing, another is updating the line=
 numbers in the second hunk so that it applies without any problems.<br /><=
br />Best,<br />Piotr Lewicki<br />Common Linux Team<br />E-mail: piotr.l.l=
ewicki@...<br /><a href=3D"http://www.hitachienergy.com/" target=3D"_blank"=
 rel=3D"noopener">http://www.hitachienergy.com/</a></div>
</blockquote>

--u8DvfCIMTSrXLFLDvICM--

