Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3FECA5FF5
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 07:02:58 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30431.1768806170085082207
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jan 2026 23:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 14D3538072;
	Mon, 19 Jan 2026 08:02:48 +0100 (CET)
Received: from [192.168.178.36] ([84.163.47.39]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vhjHe-1MhKz20; Mon, 19 Jan 2026 08:02:42 +0100
Date: Mon, 19 Jan 2026 08:02:35 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCHv4] gnome-session: update 47.0.1 -> 49.2
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Message-Id: <BKN39T.PL6BQ1KB4PG53@t-online.de>
In-Reply-To: <3779680330980077579@unknownmsgid>
References: <20260118134120.116239-1-f_l_k@t-online.de>
	<CAMKF1sqckdq7nBh6k4Q00W76=9O49oLdKZTc_b=ASj-0DXa17g@mail.gmail.com>
	<351564318107549541@unknownmsgid> <3779680330980077579@unknownmsgid>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-RVUgY5r+AdoOREYoAxM5"
X-TOI-EXPURGATEID: 150726::1768806162-78FF69BB-EC0BA65B/0/0 CLEAN NORMAL
X-TOI-MSGID: 3eeae78d-ce54-4981-b051-b32a5dce7fe7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 07:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123588

--=-RVUgY5r+AdoOREYoAxM5
Content-Type: text/plain; charset=us-ascii; format=flowed

The recipes I found depending on gnome-session or gdm are:
gnome-shell, gnome-shell-extensions, gnome-panel, gnome-flashback and 
packagegroup-gnome-desktop which all of them already have
systemd in REQUIRED_DISTRO_FEATURES

On Mon, Jan 19 2026 at 07:56:43 +01:00:00, Markus Volk 
<mrksvolk@googlemail.com> wrote:
> The recipes I found depending on gnome-session or gdm are
> 
> gnome-shell gnome-shell-extensions gnome-panel and gnome-flashback 
> which all of them already have
> systemd in REQUIRED_DISTRO_FEATURES
> 
> On Mon, Jan 19 2026 at 07:43:18 +01:00:00, Markus Volk 
> <mrksvolk@googlemail.com> wrote:
>> On Sun, Jan 18 2026 at 14:24:14 -08:00:00, Khem Raj 
>> <raj.khem@gmail.com> wrote:
>>> e-session or gdm, they should also check for systemd distro feature 
>>> since the
>> 
>> 
>> I'll have a look at it. Meanwhile I found a silly c&p error in 
>> gnome-settings-daemon
>> in the systemd PACKAGECONFIG. I'll send a v2 to fix it


--=-RVUgY5r+AdoOREYoAxM5
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div><div>The recipes I found depending=
 on gnome-session or gdm are:</div><div>gnome-shell, gnome-shell-extensions=
, gnome-panel, gnome-flashback and packagegroup-gnome-desktop which all of =
them already have</div><div>systemd in REQUIRED_DISTRO_FEATURES</div></div>=
</div><div id=3D"geary-quote" dir=3D"auto"><br>On Mon, Jan 19 2026 at 07:56=
:43 +01:00:00, Markus Volk &lt;mrksvolk@googlemail.com&gt; wrote:<br><block=
quote type=3D"cite"><div id=3D"geary-body" dir=3D"auto"><div>The recipes I =
found depending on gnome-session or gdm are</div><div><br></div><div>gnome-=
shell gnome-shell-extensions gnome-panel and gnome-flashback which all of t=
hem already have</div><div>systemd in REQUIRED_DISTRO_FEATURES</div></div><=
div id=3D"geary-signature" dir=3D"auto"></div><div id=3D"geary-quote" dir=
=3D"auto"><br>On Mon, Jan 19 2026 at 07:43:18 +01:00:00, Markus Volk &lt;mr=
ksvolk@googlemail.com&gt; wrote:<br><blockquote type=3D"cite"><div id=3D"ge=
ary-body" dir=3D"auto">On Sun, Jan 18 2026 at 14:24:14 -08:00:00, Khem Raj =
&lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"cite">e-session or=
 gdm, they should also check for systemd distro feature since the</blockquo=
te><div><br></div><div><br></div><div><span style=3D"white-space-collapse: =
break-spaces;">I'll have a look at it. Meanwhile I found a silly c&amp;p er=
ror in gnome-settings-daemon</span></div><div><span style=3D"white-space-co=
llapse: break-spaces;">in the systemd PACKAGECONFIG. I'll send a v2 to fix =
it</span></div></div><div id=3D"geary-signature" dir=3D"auto"></div></block=
quote></div></blockquote></div>
--=-RVUgY5r+AdoOREYoAxM5--


