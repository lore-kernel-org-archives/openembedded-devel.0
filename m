Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B360CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 09:59:07 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54057.1790589537457991246
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 02:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=hqMLDEuK;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout08.t-online.de (Postfix) with SMTP id CA8B0E84A;
	Mon, 28 Sep 2026 11:58:54 +0200 (CEST)
Received: from [192.168.178.36] ([84.163.40.132]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xB88K-3EvWeO0; Mon, 28 Sep 2026 11:58:52 +0200
Date: Mon, 28 Sep 2026 11:58:46 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] kmscon: treat platform display controllers
 as primary GPUs
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <ZPJ2MT.5L785RXUBQ6R2@t-online>
In-Reply-To: <CAMKF1soeW19NdDrgErnRf6EL8-dqUVkVXpAysW8VDVCswrDUbg@mail.gmail.com>
References: <20260928010600.87898-1-f_l_k@t-online.de>
	<CAMKF1soeW19NdDrgErnRf6EL8-dqUVkVXpAysW8VDVCswrDUbg@mail.gmail.com>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-SvlS1Tbpcw/CJSKepa9z"
X-TOI-EXPURGATEID: 150726::1790589532-C8FF6971-0114AA13/0/0 CLEAN NORMAL
X-TOI-MSGID: 40f4336d-df20-4a02-8750-6c3b8d79575d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790589534; i=f_l_k@t-online.de;
	bh=C1pGoJ3Aj+gKaPlOCz4pVgcGhbuJDMDf0ppZvh0le3o=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=hqMLDEuKZ+ldGxM/7vh45n5dl9zMkRFguyRMvpif+wmjKTNm0oeC1RU1x5JWpNmyr
	 QPpDywRAHUzMCNUMUge12oXET9Xk0ci9bEPJRP2dKxW0jRkiewTNt2SpvKZ9FHf0VG
	 eBIWJp4Q1t8FcbAq9a26jYoutIpmeW2jylbJKJLqYd+VSh7UTNA4wxZ+scPYR3IjhB
	 9KmbOsfg3vVwM1u+I4WQvK82pjD3c1rC4rFMFbQYdURO8vKuW+c0APbwTW9fp6xBd2
	 gp2pXwv2/fUh7ZZUbCcfHmIhPUrZcrWTwzCgIXIq+GKzpnQTTPpRcqgG+Prgwq2lwA
	 X3YZQz2TNkQUQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 09:59:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130429

--=-SvlS1Tbpcw/CJSKepa9z
Content-Type: text/plain; charset=windows-1251; format=flowed

On Sun, Sep 27 2026 at 19:39:13 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Whats the future plan for this patch ? it seems worthy of upstreaming.

The patch would first need to be tested a bit more thoroughly. The 
problem with AI-generated patches is that they are created much

faster than they can be tested. In this case, I noticed an issue on my 
Intel Arc card: The patch treats every DRM device without a

PCI parent as primary, so kmscon also detects the vgem device 
(card0)—which has no KMS outputs—and tries to open a display on it

every 20 ms, which floods the journal.


v2: only devices on the platform bus are treated as primary



--=-SvlS1Tbpcw/CJSKepa9z
Content-Type: text/html; charset=windows-1251

<div id="convey-body" dir="auto">On Sun, Sep 27 2026 at 19:39:13 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite">Whats the future plan for this patch ? it seems worthy of upstreaming.</blockquote><div><br></div><div><p>The patch would first need to be tested a bit more thoroughly. The problem with AI-generated patches is that they are created much</p><p>faster than they can be tested. In this case, I noticed an issue on my Intel Arc card: The patch treats every DRM device without a</p><p>PCI parent as primary, so kmscon also detects the vgem device (card0)—which has no KMS outputs—and tries to open a display on it</p><p>every 20 ms, which floods the journal.</p><p><br></p><p>v2: only devices on the platform bus are treated as primary</p></div></div>
--=-SvlS1Tbpcw/CJSKepa9z--


