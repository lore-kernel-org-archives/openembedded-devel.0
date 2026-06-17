Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A7ECD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 15:12:35 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17758.1781709152454302104
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 08:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=HDB1g4xY;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout06.t-online.de (Postfix) with SMTP id D29C79D7;
	Wed, 17 Jun 2026 17:12:29 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.174.202]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wZrwG-1RuzY00; Wed, 17 Jun 2026 17:12:24 +0200
Date: Wed, 17 Jun 2026 17:12:19 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multrimedia][PATCHv2] libdvdread: switch to meson
 buildsystem
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-Id: <JK7SGT.4OESSG3Y31UL2@t-online.de>
In-Reply-To: <18B97A3475AF1490.267903@lists.openembedded.org>
References: <20260615144348.7946-1-f_l_k@t-online.de>
	<CAMKF1sqdnApLQLRANTfimRqnqTUKvfzpkSa-EJ+JbmCzLr6tiQ@mail.gmail.com>
	<18B97A3475AF1490.267903@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-jjpENAUMBqLZbVj2DkL2"
X-TOI-EXPURGATEID: 150726::1781709144-227FB8DC-6DC07E02/0/0 CLEAN NORMAL
X-TOI-MSGID: d9b111f6-98d8-4dfd-96b3-035a9c09d17b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781709149; i=f_l_k@t-online.de;
	bh=lN4MGIbFUQSpe5uoKLjJeMpIy7jI32CJedQUgAIAnw4=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=HDB1g4xYSFL8FgLbdQ3CJe13edQWKMyTetN0WIOX4CnLzDqDzTvNlLP5pyQyjGvzL
	 Jfugd3ZJq7Ypd5aOUCDsLAQyOJbaYpfqxQPr3NQALqPKcIgbtBvS7cfjL068419ZWn
	 jWu7i7+3FG+5lQ4UgjcbuAg1rfwYEKcZEtCxJvf9z0eLiDo4OHx1pT1HLqa7Mj1XGi
	 RnPpG/aCTdArb3qRvylRrQeNgJ+UJJbQxkhF8opTjoHSAgoi9FeH4jlpNW23/Z5R0P
	 DzcfToKO5FDaFCs2DLZgLw/XZVh2TDdqZO9YM3y98DZ2pXzUGuGf5yuIQq4g41UGo3
	 8zm/2dkdygCpw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 15:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127660

--=-jjpENAUMBqLZbVj2DkL2
Content-Type: text/plain; charset=us-ascii; format=flowed

gnome-disk-utility was the only recipe I found in meta-gnome that uses 
libdvdread.
I sent a patch that moves the recipe to dynamic-layers. Let me know if 
you want
the issue fixed in a different way

Am Di, 16. Jun 2026 um 07:57:30 +02:00:00 schrieb Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org>:
> Am Mo, 15. Jun 2026 um 11:39:57 -07:00:00 schrieb Khem Raj 
> <raj.khem@gmail.com>:
>> I realize there are more recipes in other layers eg meta-gnome 
>> depending on it. So moving to multimedia layer is perhaps not gonna 
>> work
> 
> One possible solution could be to add libdvdnav and libdvdcss to 
> meta-oe as well,
> or to use dynamic-layers for the recipes in meta-gnome that depend on 
> libdvdread
> 
> The simplest solution, of course, would be to disable libdvdcss by 
> default again


--=-jjpENAUMBqLZbVj2DkL2
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">gnome-disk-utility was the only recipe =
I found in meta-gnome that uses libdvdread.<div>I sent a patch that moves t=
he recipe to dynamic-layers. Let me know if you want</div><div>the issue fi=
xed in a different way</div></div><div id=3D"geary-quote" dir=3D"auto"><br>=
Am Di, 16. Jun 2026 um 07:57:30 +02:00:00 schrieb Markus Volk via lists.ope=
nembedded.org &lt;f_l_k=3Dt-online.de@lists.openembedded.org&gt;:<br><block=
quote type=3D"cite"><div id=3D"geary-body" dir=3D"auto">Am Mo, 15. Jun 2026=
 um 11:39:57 -07:00:00 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blo=
ckquote type=3D"cite">I realize there are more recipes in other layers eg m=
eta-gnome depending on it. So moving to multimedia layer is perhaps not gon=
na work&nbsp;</blockquote><div><br></div><div><div>One possible solution co=
uld be to add libdvdnav and libdvdcss to meta-oe as well,</div><div>or to u=
se dynamic-layers for the recipes in meta-gnome that depend on libdvdread</=
div><div><br></div><div>The simplest solution, of course, would be to disab=
le libdvdcss by default again</div></div></div>
</blockquote></div>
--=-jjpENAUMBqLZbVj2DkL2--


