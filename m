Return-Path: <chen_heyun@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7ABC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 05:39:39 +0000 (UTC)
Subject: Re: [[meta-oe][PATCH]aer-inject:add new recipe] [[meta-oe][PATCH]aer-inject:add new recipe]
To: openembedded-devel@lists.openembedded.org
From: "chenheyun" <chen_heyun@163.com>
X-Originating-Location: Chongqing, CN (183.66.200.41)
X-Originating-Platform: Windows Chrome 122
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 24 Mar 2024 22:39:35 -0700
References: <20240324140659.237067-1-chen_heyun@163.com>
In-Reply-To: <20240324140659.237067-1-chen_heyun@163.com>
Message-ID: <29470.1711345175727733393@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="L3WZEPpOFg43R28BUreE"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 05:39:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109567

--L3WZEPpOFg43R28BUreE
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi
it is ok to install aer-intall to usr.
like this:
"
do_install() {
echo ${PREFIX}
echo ${D}
oe_runmake 'DESTDIR=3D${D}' *'PREFIX=3D/usr/'* install
}
FILES:${PN} +=3D *"/usr/aer-inject* "
"
i reply before this mail. but i dont find history. so i reply newly.
thanks for your suggestions very much!

--L3WZEPpOFg43R28BUreE
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

hi<br />&nbsp; &nbsp; it is ok to install aer-intall to usr.<br />&nbsp; &n=
bsp; like this:<br />"<br />
<div>do_install() {</div>
<div>&nbsp; &nbsp; echo ${PREFIX}</div>
<div>&nbsp; &nbsp; echo ${D}</div>
<div>&nbsp; &nbsp; oe_runmake 'DESTDIR=3D${D}'<strong> 'PREFIX=3D/usr/'</st=
rong> install</div>
<div>}</div>
<div>FILES:${PN} +=3D <strong>"/usr/aer-inject</strong>"</div>
"<br />&nbsp; &nbsp;i reply before this mail. but i dont find history. so i=
 reply newly.<br />&nbsp; thanks for your suggestions very much!<br />

--L3WZEPpOFg43R28BUreE--

