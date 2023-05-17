Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84128C77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 11:27:19 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.46859.1684322832161638040
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 May 2023 04:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout01.t-online.de (Postfix) with SMTP id A01F734C7E;
	Wed, 17 May 2023 13:27:10 +0200 (CEST)
Received: from [192.168.178.156] ([84.163.40.181]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pzFJE-290AdM0; Wed, 17 May 2023 13:27:08 +0200
Date: Wed, 17 May 2023 13:27:02 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 4/7] evince: update 44.0 -> 44.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <2TVSUR.670ER26ODOD91@t-online.de>
In-Reply-To: 
	<CAMKF1sovUY6aPaA6wPrKgiAuEXiz8bdG6519fJEPmoc_gztaLA@mail.gmail.com>
References: <20230516043458.6180-1-f_l_k@t-online.de>
	<20230516043458.6180-4-f_l_k@t-online.de>
	<CAMKF1soBAvB2NQQCTFMGAp3+AG-EGzzUnAumgRg0ciH1_poG=w@mail.gmail.com>
	<175F89755DC86A25.20583@lists.openembedded.org>
	<2NLQUR.Y193GFGMC2W51@t-online.de>
	<CAMKF1sovUY6aPaA6wPrKgiAuEXiz8bdG6519fJEPmoc_gztaLA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oJZ+LBajsFIarnKP6oZn"
X-TOI-EXPURGATEID: 150726::1684322828-F9FEC283-BC728F62/0/0 CLEAN NORMAL
X-TOI-MSGID: 28cb421c-697d-48eb-96f6-61d6694caf13
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 May 2023 11:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102646

--=-oJZ+LBajsFIarnKP6oZn
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 16. Mai 2023 um 07:57:44 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> I wonder if ${B} should be replaced with usr/src/debug/

Thats true. I've sent a v2, that edits the line like this:
/* enumerations from "ev-jobs.h" */
#include "/usr/src/debug/evince/44.1-r0/libview/ev-jobs.h"


--=-oJZ+LBajsFIarnKP6oZn
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 16. Mai 2023 um 07:57:44 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I wonder if ${B} should be replaced with usr/src/debug/</div></blockquote><div><br></div><div>Thats true. I've sent a v2, that edits the line like this:</div><div><div>/* enumerations from "ev-jobs.h" */</div><div>#include "/usr/src/debug/evince/44.1-r0/libview/ev-jobs.h"</div></div></div>
--=-oJZ+LBajsFIarnKP6oZn--


