Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFA2C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 20:26:48 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.33214.1671481606975486164
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 12:26:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id BC0B922725;
	Mon, 19 Dec 2022 21:26:44 +0100 (CET)
Received: from [192.168.178.83] ([84.163.36.130]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7Mih-0o4H7A0; Mon, 19 Dec 2022 21:26:44 +0100
Date: Mon, 19 Dec 2022 21:26:38 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <EGN5NR.S2RXE6GG096C@t-online.de>
In-Reply-To: 
	<CAMKF1sqt0WtWzAaPJx==4tncojJTD3Xz-+-+QeT+65_AzFPWew@mail.gmail.com>
References: <20221219131041.452949-1-f_l_k@t-online.de>
	<20221219131041.452949-6-f_l_k@t-online.de>
	<CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
	<XGL5NR.LHXCDF0LKTW71@t-online.de>
	<CAMKF1sqt0WtWzAaPJx==4tncojJTD3Xz-+-+QeT+65_AzFPWew@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-QbF8w2F9yg5gkChGc2Vg"
X-TOI-EXPURGATEID: 150726::1671481604-F37F2ECF-F7141C63/0/0 CLEAN NORMAL
X-TOI-MSGID: 3d193876-e6eb-4866-af23-c4570b870265
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 20:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100115

--=-QbF8w2F9yg5gkChGc2Vg
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 19. Dez 2022 um 12:15:26 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> Well I see python3-dbusmock is in core layer, it should be simple to
> bbclassextend it to provide native variant as well. What objections
> did you see ?

I see no objections besides that i already sent that patch and it was 
rejected in oe-core. The need for dbusmock was disabled in 
evolution-data-server back then by not building the tests.
Now for xdg-desktop-portal we cant disable the build of tests. There's 
only an option to not install them. I'll try to send this native expand 
to oe-core again.


--=-QbF8w2F9yg5gkChGc2Vg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 19. Dez 2022 um 12:15:26 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Well I see python3-dbusmock is in core layer, it should be simple to
bbclassextend it to provide native variant as well. What objections
did you see ?</div></blockquote><div><br></div><div>I see no objections besides that i already sent that patch and it was rejected in oe-core. The need for dbusmock was disabled in evolution-data-server back then by not building the tests.</div><div>Now for xdg-desktop-portal we cant disable the build of tests. There's only an option to not install them. I'll try to send this native expand to oe-core again.</div></div>
--=-QbF8w2F9yg5gkChGc2Vg--


