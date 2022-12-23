Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FC5C4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 20:29:51 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.82132.1671827384466427107
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Dec 2022 12:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout04.t-online.de (Postfix) with SMTP id 0B6FB1CD3F;
	Fri, 23 Dec 2022 21:29:42 +0100 (CET)
Received: from [192.168.0.126] ([24.134.105.89]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p8ofi-2Pskm80; Fri, 23 Dec 2022 21:29:38 +0100
Date: Fri, 23 Dec 2022 21:29:32 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-oe][PATCHv2 2/3] appstream: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <892DNR.GF7N2KDTW3DF1@t-online.de>
In-Reply-To: 
	<CAMKF1so-WoJbp5Z5ZPr-rKy7ZGT9PkH5sP3xpFO6JBEuWGBTGQ@mail.gmail.com>
References: <20221223031104.13517-1-f_l_k@t-online.de>
	<20221223031104.13517-2-f_l_k@t-online.de>
	<CAMKF1spuGssCTbYU9wcUKH_iNTvLoWUip+s0F4ava5sO1tgo8g@mail.gmail.com>
	<CAMKF1so-WoJbp5Z5ZPr-rKy7ZGT9PkH5sP3xpFO6JBEuWGBTGQ@mail.gmail.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-eR/DUYHRH6/mnndo0dOD"
X-TOI-EXPURGATEID: 150726::1671827378-EEFEF7E2-5080AA7E/0/0 CLEAN NORMAL
X-TOI-MSGID: 621ecdf2-786b-4560-8e14-485b69ac9d4f
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 20:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100203

--=-eR/DUYHRH6/mnndo0dOD
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Dec 23 2022 at 10:14:25 AM -0800, Khem Raj <raj.khem@gmail.com> 
wrote:
> It seems it needs appstream-native perhaps..

appstreamcli is created for the target and then this binary (created in 
${B}) is used as build dependency and thus fails cross-compilation. I 
patched it to use /usr/bin/appstreamcli for the native task, thinking 
that this binary will be available in almost all distributions. But it 
seems that it is missing at least for you.

Kind of a similar issue like crosscompiling gobject introspection


--=-eR/DUYHRH6/mnndo0dOD
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Dec 23 2022 at 10:14:25 AM -0800, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It seems it needs appstream-native perhaps..</div></blockquote><div><br></div><div>appstreamcli is created for the target and then this binary (created in ${B}) is used as build dependency and thus fails cross-compilation. I patched it to use /usr/bin/appstreamcli for the native task, thinking that this binary will be available in almost all distributions. But it seems that it is missing at least for you.</div><div><br></div><div>Kind of a similar issue like crosscompiling gobject introspection</div></div>
--=-eR/DUYHRH6/mnndo0dOD--


