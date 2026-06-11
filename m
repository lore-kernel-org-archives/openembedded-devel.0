Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAFCCD98C7
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 21:11:46 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56917.1781212300291845813
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 14:11:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=ExM+8MZc;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout11.t-online.de (Postfix) with SMTP id 0C6111CCE8;
	Thu, 11 Jun 2026 23:11:38 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.168.237]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXmga-3SmIO80; Thu, 11 Jun 2026 23:11:36 +0200
Date: Thu, 11 Jun 2026 23:11:31 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] cairomm: fix LIC_FILES_CHECKSUM
To: raj.khem@gmail.com
Cc: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Message-Id: <77KHGT.POOUGQLQCU6T@t-online.de>
In-Reply-To: <CAMKF1soU7MJBKh1QxLvYZXyFZY4PJy2rZ31cuXoLKUToZgLUHg@mail.gmail.com>
References: <20260611205607.2081431-1-f_l_k@t-online.de>
	<CAMKF1soU7MJBKh1QxLvYZXyFZY4PJy2rZ31cuXoLKUToZgLUHg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XatFwv16Z8MhHOLsYAeR"
X-TOI-EXPURGATEID: 150726::1781212297-20FF683F-D3AB5B7C/0/0 CLEAN NORMAL
X-TOI-MSGID: c2f60fbf-1793-4ea2-9cb3-308040035365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781212297; i=f_l_k@t-online.de;
	bh=/6U87YYSNMTMga/dPa92foEd50VvfzaYyl7eqmbMwtA=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=ExM+8MZcGvIi+m7nxtbHMt+sc/aDKzoYMDydLtSb+TbMYqRvR7j8Y2BZanRfZx8Up
	 f2MRIxdxJZc4aCheHPpfvJ00dVg/Vix99pG8IR/1/lOtLnKH5qn9snJflcvTfGectN
	 t8aFjBczph7UM5Eu4U9mrAYkAhyVqDKPekZ2NUhwxaNFa8SbnD8+R47we/PWFl5o8G
	 adch1jpXtfygmmcXq5de2CmaNU2dQ2RD+JJHHvIr3L6AnzEJ/Mtt/s4vbE5qfY+MmK
	 TqTA61OXklyu8w7yEZMPDngTh2uwI3CEQcCdJ+z2TTkgmlpsH2WjRkGfKpkzaI1tTB
	 w6xhA43AM1VeA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 21:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127536

--=-XatFwv16Z8MhHOLsYAeR
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 11. Jun 2026 um 14:01:07 -07:00:00 schrieb Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org>:
> I wonder if it needs to be backported to older branches as well. If 
> so how D are does it have to go.

I think this has just been changed recently since I  see this error 
only after the recent recipe updates:

ERROR: cairomm-1.16-1.18.1-r0 do_populate_lic: QA Issue: cairomm-1.16: 
The LIC_FILES_CHKSUM does not match for 
file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9 
<file://copying;md5=c46bda00ffbb0ba1dac22f8d087f54d9/>
cairomm-1.16: The new md5 checksum is 4bf661c1e3793e55c8d1051bc5e0ae21
cairomm-1.16: Here is the selected license text:
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
                  GNU LESSER GENERAL PUBLIC LICENSE
                       Version 2.1, February 1999

 Copyright (C) 1991, 1999 Free Software Foundation, Inc.
 <<https://fsf.org/>>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

[This is the first released version of the Lesser GPL. It also counts
 as the successor of the GNU Library Public License, version 2, hence
...
school, if any, to sign a "copyright disclaimer" for the library, if
necessary. Here is a sample; alter the names:

  Yoyodyne, Inc., hereby disclaims all copyright interest in the
  library `Frob' (a library for tweaking knobs) written by James Random 
Hacker.

  <signature of Moe Ghoul>, 1 April 1990
  Moe Ghoul, President of Vice

That's all there is to it!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
cairomm-1.16: Check if the license information has changed in 
/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/cairomm-1.16/1.18.1/sources/cairomm-1.18.1/COPYING 
to verify that the LICENSE value "LGPL-2.0-only" remains valid 
[license-checksum]
ERROR: cairomm-1.16-1.18.1-r0 do_populate_lic: Fatal QA errors were 
found, failing task.
ERROR: Logfile of failure stored in: 
/home/flk/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/cairomm-1.16/1.18.1/temp/log.do_populate_lic.1866026
ERROR: Task 
(/home/flk/bitbake/bitbake-builds/oe/layers/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.bb:do_populate_lic) 
failed with exit code '1'



--=-XatFwv16Z8MhHOLsYAeR
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Do, 11. Jun 2026 um 14:01:07 -07:00:=
00 schrieb Khem Raj via lists.openembedded.org &lt;raj.khem=3Dgmail.com@lis=
ts.openembedded.org&gt;:<br><blockquote type=3D"cite">I wonder if it needs =
to be backported to older branches as well. If so how D are does it have to=
 go.</blockquote><div><br></div><div>I think this has just been changed rec=
ently since I &nbsp;see this error only after the recent recipe updates:</d=
iv><div><br></div><div>ERROR: cairomm-1.16-1.18.1-r0 do_populate_lic: QA Is=
sue: cairomm-1.16: The LIC_FILES_CHKSUM does not match for <a href=3D"file:=
//COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f54d9">file://COPYING;md5=3Dc46b=
da00ffbb0ba1dac22f8d087f54d9</a></div><div>cairomm-1.16: The new md5 checks=
um is 4bf661c1e3793e55c8d1051bc5e0ae21</div><div>cairomm-1.16: Here is the =
selected license text:</div><div>vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv=
vvvvvvvvvvvvvvvvvvvvvvvvvvvv</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; GNU LESSER GENERAL PUBLIC LICENSE</div><div>&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;Version 2.1, February 1999</div><div><br></div><div>&nbsp;Copyright (C)=
 1991, 1999 Free Software Foundation, Inc.</div><div>&nbsp;&lt;<a href=3D"h=
ttps://fsf.org/">https://fsf.org/</a>&gt;</div><div>&nbsp;Everyone is permi=
tted to copy and distribute verbatim copies</div><div>&nbsp;of this license=
 document, but changing it is not allowed.</div><div><br></div><div>[This i=
s the first released version of the Lesser GPL.  It also counts</div><div>&=
nbsp;as the successor of the GNU Library Public License, version 2, hence</=
div><div>...</div><div>school, if any, to sign a "copyright disclaimer" for=
 the library, if</div><div>necessary.  Here is a sample; alter the names:</=
div><div><br></div><div>&nbsp; Yoyodyne, Inc., hereby disclaims all copyrig=
ht interest in the</div><div>&nbsp; library `Frob' (a library for tweaking =
knobs) written by James Random Hacker.</div><div><br></div><div>&nbsp; &lt;=
signature of Moe Ghoul&gt;, 1 April 1990</div><div>&nbsp; Moe Ghoul, Presid=
ent of Vice</div><div><br></div><div>That's all there is to it!</div><div>^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^</div>=
<div>cairomm-1.16: Check if the license information has changed in /home/fl=
k/bitbake/bitbake-builds/oe/build/tmp/work/corei7-64-oe-linux/cairomm-1.16/=
1.18.1/sources/cairomm-1.18.1/COPYING to verify that the LICENSE value "LGP=
L-2.0-only" remains valid [license-checksum]</div><div>ERROR: cairomm-1.16-=
1.18.1-r0 do_populate_lic: Fatal QA errors were found, failing task.</div><=
div>ERROR: Logfile of failure stored in: /home/flk/bitbake/bitbake-builds/o=
e/build/tmp/work/corei7-64-oe-linux/cairomm-1.16/1.18.1/temp/log.do_populat=
e_lic.1866026</div><div>ERROR: Task (/home/flk/bitbake/bitbake-builds/oe/la=
yers/meta-openembedded/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.1.b=
b:do_populate_lic) failed with exit code '1'</div><div><br></div></div>
--=-XatFwv16Z8MhHOLsYAeR--


