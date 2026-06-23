Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8544BCD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 06:15:08 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15007.1782195302616614996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2026 23:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=pj6cNl5T;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout10.t-online.de (Postfix) with SMTP id 43D0238C20;
	Tue, 23 Jun 2026 08:15:00 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.165.53]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wbuPK-3u7Hqy0; Tue, 23 Jun 2026 08:14:50 +0200
Date: Tue, 23 Jun 2026 08:14:44 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] hwlock: update LIC_FILES_CHECKSUM
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <KOM2HT.6AX73B5LYJEI@t-online.de>
In-Reply-To: <CA+chaQcALoDLpkXf8rhjmD2S=oT7ftCn5ObrxDPd=vs2FWU8YA@mail.gmail.com>
References: <20260611124540.1132897-1-f_l_k@t-online.de>
	<CA+chaQcALoDLpkXf8rhjmD2S=oT7ftCn5ObrxDPd=vs2FWU8YA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IwSXp58OQPWHBwdVehwg"
X-TOI-EXPURGATEID: 150726::1782195290-72FFA84E-69D74387/0/0 CLEAN NORMAL
X-TOI-MSGID: fbcea140-e44d-4cea-8241-8ae10620aa60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782195300; i=f_l_k@t-online.de;
	bh=DwpHYSuwD62UREIndZQU0kY5+qY1rP3eQPKaV3zQMaI=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=pj6cNl5TWRB/Fa7EkVbQlIkUIU9kmjm41xgSt3YRVvHEGQUMVBPENnpxtzi+hzB00
	 FCtqfNP8bIG8YqMkijBOKHvtp6odbuXFuHocJK4kbHppZ1YpPJjNlrEeFfm/OMhFC+
	 n3+AZp4JL9T3JowgorcIXm4s6Cp90wsemTlxQsXoh8fDZe0hb2e8BcA5hgLev16ahA
	 JQTZmnVT4lxLdwS+cb06Y3SJvSNRPkNylDzw6UAGnI1h9EwQkTP11FlXih0gXOMdtd
	 OBdRQlJfaz3X6JO6rSCbsAjSO0wJtS/ZocloxjbqO/4lmMiVIL6H/Qfbxi5baFp4gd
	 PNHDswj2a+JUg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jun 2026 06:15:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127694

--=-IwSXp58OQPWHBwdVehwg
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Jun 22 2026 at 07:23:34 +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> Hi, was the LIC_FILES_CHKSUM change intentional?
> 
> It should be part of the upgrade to 2.14.0, right? But now in master
> there is the LIC_FILES_CHKSUM change but still with 2.12.2 version
> leading to:
> 
> ERROR: hwloc-2.12.2-r0 do_populate_lic: QA Issue: hwloc: The
> LIC_FILES_CHKSUM does not match for
> file://COPYING;md5=883e49a2e0f7142a345f9b0c01a380e7 
> <file://copying;md5=883e49a2e0f7142a345f9b0c01a380e7/>
> hwloc: The new md5 checksum is 79179bb373cd55cbd834463a514fb714

Hi, I did the LIC_FILES_CHKSUM change, because I had the same error 
after doing a master-next branch update.
By that time PV was still 2.12.2 so I can't explain, why it failed in 
my build. Maybe the recipe has been updated
without changing PV by that time?



--=-IwSXp58OQPWHBwdVehwg
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Jun 22 2026 at 07:23:34 +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Hi, was the LIC_FILES_CHKSUM change intentional?

It should be part of the upgrade to 2.14.0, right? But now in master
there is the LIC_FILES_CHKSUM change but still with 2.12.2 version
leading to:

ERROR: hwloc-2.12.2-r0 do_populate_lic: QA Issue: hwloc: The
LIC_FILES_CHKSUM does not match for
<a href="file://COPYING;md5=883e49a2e0f7142a345f9b0c01a380e7">file://COPYING;md5=883e49a2e0f7142a345f9b0c01a380e7</a>
hwloc: The new md5 checksum is 79179bb373cd55cbd834463a514fb714</div></blockquote><div><br></div><div>Hi, I did the&nbsp;<span style="white-space: break-spaces;">LIC_FILES_CHKSUM change, because I had the same error after doing a master-next branch update.</span></div><div><span style="white-space: break-spaces;">By that time PV was still 2.12.2 </span><span style="white-space: break-spaces;">so I can't explain, why it failed in my build. Maybe the recipe has been updated</span></div><div><span style="white-space: break-spaces;">without changing PV by that time?</span></div><div><span style="white-space: break-spaces;"> </span></div></div>
--=-IwSXp58OQPWHBwdVehwg--


