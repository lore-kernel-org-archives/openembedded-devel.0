Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD32C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:18:39 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.461.1693415915458047794
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id 736211333;
	Wed, 30 Aug 2023 19:18:33 +0200 (CEST)
Received: from [192.168.178.62] ([84.163.36.217]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qbOps-4LfCcK0; Wed, 30 Aug 2023 19:18:33 +0200
Date: Wed, 30 Aug 2023 19:18:27 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 2/5] phodav: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-Id: <R2S70S.L8N6P908L9OA1@t-online.de>
In-Reply-To: <17803607F91A1414.30071@lists.openembedded.org>
References: <20230825054449.2315061-1-f_l_k@t-online.de>
	<20230825054449.2315061-2-f_l_k@t-online.de>
	<CA+chaQfBkvt2hPuRaoYNVOc8O2iY=mZUzp=e8s3vDYkgMc6QWw@mail.gmail.com>
	<PN270S.7RY9ZI8V292C2@t-online.de>
	<CA+chaQcirkkrsQ=or+yEA1nu4SQbviwz-2h0dmSSbdXi27VeHw@mail.gmail.com>
	<17803607F91A1414.30071@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Xml8wCB237JF+kNFpYU+"
X-TOI-EXPURGATEID: 150726::1693415913-3952BD37-022BFA2C/0/0 CLEAN NORMAL
X-TOI-MSGID: ed6c3bfb-b577-4dd3-9590-7ca2c3007c43
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 17:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104675

--=-Xml8wCB237JF+kNFpYU+
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Aug 30 2023 at 06:27:37 PM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> but was there some 3/3 (possibly with fix for libosinfo?

One sidenote to libosinfo. It requests that /usr/share/pci.ids file 
exists uncompressed but by default the recipe in oe-core creates a 
'pci.ids.gz'. I locally avoid this by overriding PCI_CONF_FLAG from a 
bbappend to contain ZLIB=no


--=-Xml8wCB237JF+kNFpYU+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Aug 30 2023 at 06:27:37 PM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite">but was there some 3/3 (possibly with fix for libosinfo?</blockquote><div><br></div><div>One sidenote to libosinfo. It requests that /usr/share/pci.ids file exists uncompressed but by default the recipe in oe-core creates a 'pci.ids.gz'. I locally avoid this by overriding PCI_CONF_FLAG from a bbappend to contain ZLIB=no</div></div>
--=-Xml8wCB237JF+kNFpYU+--


