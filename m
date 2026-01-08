Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2AA3CF6BE5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 07:56:59 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1763.1767859010785931561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 23:56:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout07.t-online.de (Postfix) with SMTP id AA2EFF119;
	Thu,  8 Jan 2026 08:55:57 +0100 (CET)
Received: from [192.168.178.36] ([79.219.236.196]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vdks2-0iVzsm0; Thu, 8 Jan 2026 08:55:50 +0100
Date: Thu, 08 Jan 2026 08:55:45 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] pavucontrol: update 5.0 -> 6.2
To: raj.khem=gmail.com@lists.openembedded.org
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <XOCJ8T.VL088O6HWHTL@t-online.de>
In-Reply-To: <CAMKF1so9F3aB_r=F78ZqY4JFkn3-3oDEHBMFyW=fi7kTvrU9ow@mail.gmail.com>
References: <20260107173104.211861-1-f_l_k@t-online.de>
	<CAMKF1so9F3aB_r=F78ZqY4JFkn3-3oDEHBMFyW=fi7kTvrU9ow@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-MYQP/G6qn54OGg4bqYq/"
X-TOI-EXPURGATEID: 150726::1767858950-E3FD6C6F-6B872C00/0/0 CLEAN NORMAL
X-TOI-MSGID: c19db9d7-3938-4baa-8b30-6c241dceadfa
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 07:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123254

--=-MYQP/G6qn54OGg4bqYq/
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Jan 7 2026 at 21:23:40 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> I guess distro features should match between these two recipes

Theoretically xfce4-pulseaudio-plugin should still be useable without 
egl since it depends on gtk3 but after the pavucontrol update it would 
become an indirect requirement by pulling in gtk4.
If it would be still desired to be able run xfce without gl requirement 
it may also be possible to keep the old pavucontrol recipe as 
'pavucontrol-gtk3' present in meta-xfce,
set the RRECOMMENDS to 'pavucontrol-gtk3' and add make 'pavucontrol' 
and 'pavucontrol-gtk3' mutually exclusive?

Otherwise both solutions you suggested should fix the issue I suppose.

But which way should we take?


--=-MYQP/G6qn54OGg4bqYq/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Jan 7 2026 at 21:23:40 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite">I guess distro features should match between these two recipes</blockquote><div><br></div><div>Theoretically xfce4-pulseaudio-plugin should still be useable without egl since it depends on gtk3 but after the pavucontrol update it would become an indirect requirement by pulling in gtk4.</div><div>If it would be still desired to be able run xfce without gl requirement it may also be possible to keep the old pavucontrol recipe as 'pavucontrol-gtk3' present in meta-xfce,</div><div>set the RRECOMMENDS to 'pavucontrol-gtk3' and add make 'pavucontrol' and 'pavucontrol-gtk3' mutually exclusive?</div><div><br></div><div>Otherwise both solutions you suggested should fix the issue I suppose.</div><div><br></div><div>But which way should we take?</div></div>
--=-MYQP/G6qn54OGg4bqYq/--


