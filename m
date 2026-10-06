Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D262CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 10:32:54 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42389.1791282769945068899
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2026 03:32:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=mqgRxeV9;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout06.t-online.de (Postfix) with SMTP id 7EB569C4;
	Tue,  6 Oct 2026 12:32:47 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.33.153]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xE2TW-4TUozI0; Tue, 6 Oct 2026 12:32:46 +0200
Date: Tue, 06 Oct 2026 12:32:40 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH] ibus: let the build compiler find its
 own C standard option
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <HMEHMT.AUIATE1O297G3@t-online>
In-Reply-To: <CAMKF1srjsORgQAGVfLTgR5GCEuaH96kxDHGxG_3jseR+nPYVWg@mail.gmail.com>
References: <20261006094610.1636779-1-f_l_k@t-online.de>
	<CAMKF1srjsORgQAGVfLTgR5GCEuaH96kxDHGxG_3jseR+nPYVWg@mail.gmail.com>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fYk5tRo6NcUy9UAdZGeQ"
X-TOI-EXPURGATEID: 150726::1791282766-6AFFA837-76A659BF/0/0 CLEAN NORMAL
X-TOI-MSGID: d7d32a4b-3dd5-43a9-b698-5e5d27400685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791282767; i=f_l_k@t-online.de;
	bh=JgJAXf8Ohq+H9oRb/QhUe6YT6FnwmBsQfocxFIcTR+U=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=mqgRxeV93Gl933PdKpqjjLr3fPjf4Bn69zY5S61KrAtHZAzzYzyWSQeIi0XbLLH/p
	 EeyaMAzVfPkP5VVWzZg+7xYpiQc36PMm0ZOWOk5Vv+FbHi6PvafPMZE+AxnEJWavzQ
	 orGKcgbbEV48RkULybvBu8/ilKyyNV+u4CZ6U4vG4AMf8VlW9DYR1wIiXYU0mL7InW
	 I2jFAAzsRBw+js9Q2vkaoYMm4MBs2r0cxyvBBkxIjJRinrnpfTfipj8m//rkcWBrp2
	 UPQXFqPX5msE8Flz34O6IxJ9fCoPGctonznYOd/0haO9ZDhNNPpu/z1eCN6wBGRiw3
	 VqCSj2aiiyQMg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Oct 2026 10:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130634

--=-fYk5tRo6NcUy9UAdZGeQ
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Oct 6 2026 at 11:49:38 +02:00:00, Khem Raj <raj.khem@gmail.com> 
wrote:
> ell.

ibus 1.5.35 (currently at rc1) adds a meson build, and with it the 
recipe no longer needs the m4 macro: the build tools run through the 
qemu exe wrapper. I'll send the update to 1.5.35 as RFC since it is not 
released yet. It depends on a change to the libx11 recipe in oe-core: 
the compose table generator now reads the X11 locale data from the 
target sysroot, so libx11 stages it there instead of in the native 
sysroot. I'll send that patch to the oe-core list as RFC as well, 
noting that it has to go in together with the ibus update.


--=-fYk5tRo6NcUy9UAdZGeQ
Content-Type: text/html; charset=us-ascii

<div id="convey-body" dir="auto">On Tue, Oct 6 2026 at 11:49:38 +02:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">ell.&nbsp;</blockquote><div><br></div><div>ibus 1.5.35 (currently at rc1) adds a meson build, and with it the recipe no longer needs the m4 macro: the build tools run through the qemu exe wrapper. I'll send the update to 1.5.35 as RFC since it is not released yet. It depends on a change to the libx11 recipe in oe-core: the compose table generator now reads the X11 locale data from the target sysroot, so libx11 stages it there instead of in the native sysroot. I'll send that patch to the oe-core list as RFC as well, noting that it has to go in together with the ibus update.</div></div>
--=-fYk5tRo6NcUy9UAdZGeQ--


