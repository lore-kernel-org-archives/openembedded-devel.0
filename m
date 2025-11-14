Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F17CDB478
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 02:36:25 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9548.1763087780144465246
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 18:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout05.t-online.de (Postfix) with SMTP id AFBF91309;
	Fri, 14 Nov 2025 03:36:17 +0100 (CET)
Received: from [192.168.178.36] ([84.163.32.97]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vJjfY-2AOEwS0; Fri, 14 Nov 2025 03:36:13 +0100
Date: Fri, 14 Nov 2025 03:36:07 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] fex: add recipe
To: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <783P5T.46ELW3NU5ONA2@t-online.de>
In-Reply-To: <CAMKF1srJz=zBHjUWNECb2OAn9Q6v0gV4YNkjoVefGz_yaSnENA@mail.gmail.com>
References: <20251114020447.2540986-1-f_l_k@t-online.de>
	<CAMKF1srJz=zBHjUWNECb2OAn9Q6v0gV4YNkjoVefGz_yaSnENA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-E6etVlf8mazPS78/BChl"
X-TOI-EXPURGATEID: 150726::1763087773-4E7FA4C1-7BE534C0/0/0 CLEAN NORMAL
X-TOI-MSGID: a4b683e6-8743-4ce8-ac42-06f182d8010e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 02:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121670

--=-E6etVlf8mazPS78/BChl
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Nov 13 2025 at 18:18:40 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> You. can just add LDFLAGS += "-fuse-ld=lld" instead of demanding the 
> distro feature
> that will make it work with wider variety of distro settings, not 
> many OE distros default to LLD yet.

It works like that. But I also added the feature_check because I was 
afraid that it would break meta-openembedded world build.
If you try to build fex with gcc toolchain it will throw an error


--=-E6etVlf8mazPS78/BChl
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Nov 13 2025 at 18:18:40 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div>You. can just add LDFLAGS&nbsp;+= "-fuse-ld=lld" instead of demanding the distro feature</div><div>that will make it work with wider variety of distro settings, not many OE distros default to LLD yet.</div></blockquote><div><br></div><div>It works like that. But I also added the feature_check because I was afraid that it would break meta-openembedded world build.</div><div>If you try to build fex with gcc toolchain it will throw an error</div></div>
--=-E6etVlf8mazPS78/BChl--


