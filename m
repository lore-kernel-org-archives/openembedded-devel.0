Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54945C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 13:13:05 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.20640.1756386778050196768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 06:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id 26B77F1B3;
	Thu, 28 Aug 2025 15:12:56 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.170.236]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1urcQw-1dUyFE0; Thu, 28 Aug 2025 15:12:54 +0200
Date: Thu, 28 Aug 2025 15:12:48 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] packagegroup-gnome-desktop is not a desktop
To: mike.looijmans@topic.nl
Cc: openembedded-devel@lists.openembedded.org,
	"Mike Looijmans via lists.openembedded.org"
	<mike.looijmans=topic.nl@lists.openembedded.org>
Message-Id: <CPGP1T.6G37LRX8WW3G3@t-online.de>
In-Reply-To: <76eb2d12-a879-412c-8790-8f1993686e95@topic.nl>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.13b3af35-2da3-4280-b2c7-1a64bf69f8ab@emailsignatures365.codetwo.com>
	<AM8PR04MB777917B82BD9D98FD50CF2E1ED38A@AM8PR04MB7779.eurprd04.prod.outlook.com>
	<DCEO1T.WIMW7AB6YK7K3@t-online.de>
	<76eb2d12-a879-412c-8790-8f1993686e95@topic.nl>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jhLBI5lDrUjLmUYQbc3F"
X-TOI-EXPURGATEID: 150726::1756386774-C17F9A73-964167DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 9f6b685f-da00-4202-9071-66d128e40864
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 13:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119129

--=-jhLBI5lDrUjLmUYQbc3F
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Aug 28 2025 at 14:39:44 +02:00:00, mike.looijmans@topic.nl 
wrote:
> I now just end up with an image that has tons of "gnome" things 
> installed, but nothing really gets started and there's no clue as to 
> what should be running...

gdm should be started automatically using systemd service:
flk@intel-corei7-64:~$ sudo systemctl status gdm
Password:
* gdm.service - GNOME Display Manager
     Loaded: loaded (/usr/lib/systemd/system/gdm.service; enabled; 
preset: enabled)
     Active: active (running) since Thu 2025-08-28 15:01:08 CEST; 51s 
ago
 Invocation: fb3be9d01865490aa251ee2393f6d5b4
   Main PID: 1111 (gdm)
      Tasks: 4 (limit: 154363)
     Memory: 5.5M (peak: 9.8M)
        CPU: 40ms
     CGroup: /system.slice/gdm.service
             `-1111 /usr/sbin/gdm


Which OpenEmbedded branch are you on? I remember sending corrections 
for starting gdm some time ago:
<https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=d4ac4dcb70faeed3e3a933c378bfbcbe25a1f260>

I also build for gnome but that is far from being a tiny image:
<https://codeberg.org/flk/meta-image/src/commit/8ab5f7a156e44e30dd637361e0b9c1474537af4a/recipes-core/images/image.inc>
<https://codeberg.org/flk/meta-gnome-image/src/branch/master/recipes-core/images/gnome-image.bb>



--=-jhLBI5lDrUjLmUYQbc3F
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Thu, Aug 28 2025 at 14:39:44 +02:00:=
00, mike.looijmans@topic.nl wrote:<br><blockquote type=3D"cite">I now just =
end up with an image that
      has tons of "gnome" things installed, but nothing really gets
      started and there's no clue as to what should be running...</blockquo=
te><div><br></div><div>gdm should be started automatically using systemd se=
rvice:</div><div>flk@intel-corei7-64:~$ sudo systemctl status gdm</div><div=
>Password:&nbsp;</div><div>* gdm.service - GNOME Display Manager</div><div>=
&nbsp; &nbsp; &nbsp;Loaded: loaded (/usr/lib/systemd/system/gdm.service; en=
abled; preset: enabled)</div><div>&nbsp; &nbsp; &nbsp;Active: active (runni=
ng) since Thu 2025-08-28 15:01:08 CEST; 51s ago</div><div>&nbsp;Invocation:=
 fb3be9d01865490aa251ee2393f6d5b4</div><div>&nbsp; &nbsp;Main PID: 1111 (gd=
m)</div><div>&nbsp; &nbsp; &nbsp; Tasks: 4 (limit: 154363)</div><div>&nbsp;=
 &nbsp; &nbsp;Memory: 5.5M (peak: 9.8M)</div><div>&nbsp; &nbsp; &nbsp; &nbs=
p; CPU: 40ms</div><div>&nbsp; &nbsp; &nbsp;CGroup: /system.slice/gdm.servic=
e</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`-1111 /usr/sbi=
n/gdm</div><div><br></div><div><br></div><div>Which OpenEmbedded branch are=
 you on? I remember sending corrections for starting gdm some time ago:</di=
v><div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=
=3Dmaster-next&amp;id=3Dd4ac4dcb70faeed3e3a933c378bfbcbe25a1f260">https://g=
it.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&amp;id=3Dd4ac=
4dcb70faeed3e3a933c378bfbcbe25a1f260</a></div><div><br></div><div>I also bu=
ild for gnome but that is far from being a tiny image:</div><div><a href=3D=
"https://codeberg.org/flk/meta-image/src/commit/8ab5f7a156e44e30dd637361e0b=
9c1474537af4a/recipes-core/images/image.inc">https://codeberg.org/flk/meta-=
image/src/commit/8ab5f7a156e44e30dd637361e0b9c1474537af4a/recipes-core/imag=
es/image.inc</a></div><div><a href=3D"https://codeberg.org/flk/meta-gnome-i=
mage/src/branch/master/recipes-core/images/gnome-image.bb">https://codeberg=
.org/flk/meta-gnome-image/src/branch/master/recipes-core/images/gnome-image=
.bb</a></div><div><br></div></div>
--=-jhLBI5lDrUjLmUYQbc3F--


