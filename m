Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E38C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 18:10:44 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.52937.1710958238672632152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 11:10:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id AD1A15EDA;
	Wed, 20 Mar 2024 19:10:36 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rn0OZ-0Sp6qe0; Wed, 20 Mar 2024 19:10:35 +0100
Date: Wed, 20 Mar 2024 19:10:48 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <0URNAS.2AWVCV53YYT41@t-online.de>
In-Reply-To: <17BE8A4D584EEFD1.29196@lists.openembedded.org>
References: <17BE205582F63951.29196@lists.openembedded.org>
	<P19LAS.XNJ0HDKLN7IM@t-online.de>
	<CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
	<CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
	<VVPNAS.FCPMXAAPQ9Y82@t-online.de>
	<CAMKF1srGvQ3d-L=PR4r3H_tMvbb9jwcgMz6kx6FD1LuVebY-TA@mail.gmail.com>
	<17BE8A4D584EEFD1.29196@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-wSPTS/9cFPwYlPE8lNLg"
X-TOI-EXPURGATEID: 150726::1710958236-2F7FDC95-D24B6074/0/0 CLEAN NORMAL
X-TOI-MSGID: bc199251-ffde-4ab9-8698-66e860cdb470
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 18:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109498

--=-wSPTS/9cFPwYlPE8lNLg
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 06:49:43 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> their dependencies are which are not yet in master branch of the core

I tried to mention in the commit message, if an update requires a 
change to oe-core.

For now that would be
gnome-settings-daemon, which requires gsettings-desktop-schemas 46.0
gnome-calculator, which requires libsoup with vala support
gnome-calendar, which requires libadwaita-1.5.0

additionally to complete the gnome-46 port there would be
nautilus, which will require glib-2.80
gnome-console and gnome-terminal, which will require vte 0.76


--=-wSPTS/9cFPwYlPE8lNLg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 06:49:43 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">their dependencies are which are not yet in master branch of the core</div></blockquote><div><br></div><div>I tried to mention in the commit message, if an update requires a change to oe-core.</div><div><br></div><div>For now that would be</div><div>gnome-settings-daemon, which requires gsettings-desktop-schemas 46.0</div><div>gnome-calculator, which requires libsoup with vala support</div><div>gnome-calendar, which requires libadwaita-1.5.0</div><div><br></div><div>additionally to complete the gnome-46 port there would be</div><div>nautilus, which will require glib-2.80</div><div>gnome-console and gnome-terminal, which will require vte 0.76&nbsp;</div></div>
--=-wSPTS/9cFPwYlPE8lNLg--


