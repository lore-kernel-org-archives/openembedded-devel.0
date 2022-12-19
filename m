Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA4BC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 19:43:58 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.32060.1671479034335421526
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 11:43:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout03.t-online.de (Postfix) with SMTP id 6B3EE13E8F;
	Mon, 19 Dec 2022 20:43:52 +0100 (CET)
Received: from [192.168.178.83] ([84.163.36.130]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7M3D-0yTets0; Mon, 19 Dec 2022 20:43:51 +0100
Date: Mon, 19 Dec 2022 20:43:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <XGL5NR.LHXCDF0LKTW71@t-online.de>
In-Reply-To: 
	<CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
References: <20221219131041.452949-1-f_l_k@t-online.de>
	<20221219131041.452949-6-f_l_k@t-online.de>
	<CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7DFwLS+IWYpHFAx+TNIa"
X-TOI-EXPURGATEID: 150726::1671479031-62A0A2DC-E0151EEA/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c82722d-67c7-4a61-a97f-17109b4c57b6
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 19:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100110

--=-7DFwLS+IWYpHFAx+TNIa
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 19. Dez 2022 um 11:25:16 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> 10:01:37 ERROR: Nothing PROVIDES 'python3-dbusmock-native' (but
> /mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb

Sorry, I forgot that I allowed to build python3-dbusmock-native in 
oe-core. What would be the right way to fix it? I ask because I sent a 
patch for it some time ago when python3-dbusmock-native was needed for 
evolution-data-server tests and was rejected in oe-core. I don't 
remember what the problem was.
I think removing the dependency of python3-dbusmock-native would also 
work as long as it is installed on the host system. But it's not by 
default, at least for ubuntu 22.04


--=-7DFwLS+IWYpHFAx+TNIa
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 19. Dez 2022 um 11:25:16 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">10:01:37 ERROR: Nothing PROVIDES 'python3-dbusmock-native' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb</div></blockquote><div><br></div><div><div>Sorry, I forgot that I allowed to build python3-dbusmock-native in oe-core. What would be the right way to fix it? I ask because I sent a patch for it some time ago when python3-dbusmock-native was needed for evolution-data-server tests and was rejected in oe-core. I don't remember what the problem was.&nbsp;</div><div>I think removing the dependency of python3-dbusmock-native would also work as long as it is installed on the host system. But it's not by default, at least for ubuntu 22.04</div></div></div>
--=-7DFwLS+IWYpHFAx+TNIa--


