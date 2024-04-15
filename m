Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64639C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:32:17 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.18727.1713180731533223048
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:32:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout04.t-online.de (Postfix) with SMTP id A817010C2;
	Mon, 15 Apr 2024 13:32:09 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.43.130]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwKZB-1phRmy0; Mon, 15 Apr 2024 13:32:06 +0200
Date: Mon, 15 Apr 2024 13:32:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] edid-decode: allow to build native variant
To: Ross Burton <Ross.Burton@arm.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <1QEZBS.61V5422DWMEK@t-online.de>
In-Reply-To: <DDAA3D7E-61F0-4774-BAB1-8996BAC56833@arm.com>
References: <20240414125805.2253456-1-f_l_k@t-online.de>
	<DDAA3D7E-61F0-4774-BAB1-8996BAC56833@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-OMKXEFHkcVKPNH5E2mER"
X-TOI-EXPURGATEID: 150726::1713180726-3D18BC7B-CF894AD4/0/0 CLEAN NORMAL
X-TOI-MSGID: e9721bf1-5670-40c9-b4de-3e8b4d78a9a3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 11:32:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109958

--=-OMKXEFHkcVKPNH5E2mER
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15 2024 at 11:07:45 AM +00:00:00, Ross Burton=20
<Ross.Burton@arm.com> wrote:
> Surely that=FFs a bug in the meson.build?  It doesn=FFt want to find=20
> a native binary.

Its added here, I think mostly for testing purpose:

<https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/m=
eson.build#L1>
<https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/m=
eson.build#L10>
<https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/m=
eson.build#L59>
<https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/m=
eson.build#L66>

If edid-decode is added a s a native dependency, an additional binary=20
will be installed '/usr/bin/di-edid-decode'


--=-OMKXEFHkcVKPNH5E2mER
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Mon, Apr 15 2024 at 11:07:45 AM +00:=
00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type=
=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Sur=
ely that=FFs a bug in the meson.build?  It doesn=FFt want to find a native =
binary.
</div></blockquote><div><br></div><div>Its added here, I think mostly for t=
esting purpose:</div><div><br></div><div><a href=3D"https://gitlab.freedesk=
top.org/emersion/libdisplay-info/-/blob/main/test/meson.build#L1">https://g=
itlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/meson.build=
#L1</a></div><div><a href=3D"https://gitlab.freedesktop.org/emersion/libdis=
play-info/-/blob/main/test/meson.build#L10">https://gitlab.freedesktop.org/=
emersion/libdisplay-info/-/blob/main/test/meson.build#L10</a></div><div><a =
href=3D"https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main=
/test/meson.build#L59">https://gitlab.freedesktop.org/emersion/libdisplay-i=
nfo/-/blob/main/test/meson.build#L59</a></div><div><a href=3D"https://gitla=
b.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/meson.build#L66=
">https://gitlab.freedesktop.org/emersion/libdisplay-info/-/blob/main/test/=
meson.build#L66</a></div><div><br></div><div>If edid-decode is added a s a =
native dependency, an additional binary will be installed '/usr/bin/di-edid=
-decode'</div></div>
--=-OMKXEFHkcVKPNH5E2mER--


