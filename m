Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C45C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 07:07:25 +0000 (UTC)
Subject: Re: [PATCH v4] ydotool: Add new package
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?QW5kcsOpIFBhaXVzY28=?= <andre.paiusco@gmail.com>
X-Originating-Location: Sittard, Limburg, NL (84.107.6.196)
X-Originating-Platform: Linux Firefox 123
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 07 Mar 2024 23:07:17 -0800
References: <CAMKF1sq8qy4zA53gTgFq2FZpZ9zvbNjpPY3DnycOVN=yFvW2xA@mail.gmail.com>
In-Reply-To: <CAMKF1sq8qy4zA53gTgFq2FZpZ9zvbNjpPY3DnycOVN=yFvW2xA@mail.gmail.com>
Message-ID: <21393.1709879703135556993@lists.openembedded.org>
X-Old-Date: Thu, 07 Mar 2024 22:35:03 -0800
Content-Type: multipart/alternative; boundary="pAZaUrFe79On3q8MU3lm"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 07:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109224
Message-ID: <20240308070717.SSHE16lS1Cl_SaF4y9vcSNqqJX3b5Tov0xJfM0ZQGcs@z>

--pAZaUrFe79On3q8MU3lm
Content-Type: text/plain; charset="utf-8"; markup=markdown
Content-Transfer-Encoding: quoted-printable

Hello,

Two things:

First, I had a patch that I forgot to add to this, where I make the ydotool=
d.service be installed as a system service instead of a user service, other=
wise the rootfs recipe fails as it can't enable it. I'd like suggestions to=
 what you feel better. Sorry for missing that. If there's a more generic op=
tion for systemd user services, let me know. =20
One option is: have a patch that whenever we have systemd as a dependency, =
we install it as system service and not user service. =20
Another option is: disable the service by default, with that I can remove t=
he hard dependency as mentioned above (seems to work just fine)

> this is an unterminated string, bitbake would have told you during
> parsing. Please test the bits before sending for review.
> It saves time.

I have no idea how this went through as last time I was only changing the p=
ackagegroup, sorry.

----=20
Edit:=20
I'm sending a new patch version (v5) applying the second option, just teste=
d, and it works fine, the only downside is the need to manually having to e=
nable the service. If we disagree, I can implement the fixes on top of that=
 one.

--pAZaUrFe79On3q8MU3lm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>Hello,</p>

<p>Two things:</p>

<p>First, I had a patch that I forgot to add to this, where I make the ydot=
oold.service be installed as a system service instead of a user service, ot=
herwise the rootfs recipe fails as it can't enable it. I'd like suggestions=
 to what you feel better. Sorry for missing that. If there's a more generic=
 option for systemd user services, let me know.<br>
One option is: have a patch that whenever we have systemd as a dependency, =
we install it as system service and not user service.<br>
Another option is: disable the service by default, with that I can remove t=
he hard dependency as mentioned above (seems to work just fine)</p>

<blockquote>
<p>this is an unterminated string, bitbake would have told you during
parsing. Please test the bits before sending for review.
It saves time.</p>
</blockquote>

<p>I have no idea how this went through as last time I was only changing th=
e packagegroup, sorry.</p>

<hr>

<p>Edit:
I'm sending a new patch version (v5) applying the second option, just teste=
d, and it works fine, the only downside is the need to manually having to e=
nable the service. If we disagree, I can implement the fixes on top of that=
 one.</p>

--pAZaUrFe79On3q8MU3lm--

