Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BCBC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 15:17:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37348.1782487054475191363
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 08:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=OxeYQkGO;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id 3494F37FEE;
	Fri, 26 Jun 2026 17:17:32 +0200 (CEST)
Received: from [192.168.178.63] ([79.219.237.60]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wd8J1-0z2J3w0; Fri, 26 Jun 2026 17:17:23 +0200
Date: Fri, 26 Jun 2026 17:17:18 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH 2/2] packagegroup-meta-multimedia:
 add libdvdread to RDEPENDS
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <USV8HT.R1GK1GTAJBUN@t-online.de>
In-Reply-To: <CAMKF1soM6i6ktktY3MAvwOf7Z1Uz=MXGYxkdkE2xabPwJNJo8A@mail.gmail.com>
References: <20260624133044.1093352-1-f_l_k@t-online.de>
	<20260624133044.1093352-2-f_l_k@t-online.de>
	<CAMKF1sp3_iZ-NaFJ3qrdEFiOAwqXw+WDCZPtmiF1_4vfP-iRDA@mail.gmail.com>
	<4MS8HT.AOOYBUNON62K2@t-online.de>
	<CAMKF1soM6i6ktktY3MAvwOf7Z1Uz=MXGYxkdkE2xabPwJNJo8A@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6eotkfaNov2476IoG4S3"
X-TOI-EXPURGATEID: 150726::1782487044-E67FBA3A-B1FB327B/0/0 CLEAN NORMAL
X-TOI-MSGID: f3dbac72-fc4c-4ec4-8185-fdb4bcafcc72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782487052; i=f_l_k@t-online.de;
	bh=M2GaS2a42oLOH28WnXpuEAgBD7yLGAvSfTstdpXIcQs=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=OxeYQkGOvTT/YKx/q7jBLNVl+F93LudsPPYraqV/IZDV7Y0+cdEqCVYXh5oTAFG1B
	 5RsBZuQecQX8H4RezK0G+nIOHygn8BIj8z14xOz/wkrm3FJDrZbL3IkvJAtJsmzV6n
	 j8FtDKYdGujJG1OWAjIXCbB80gfVHFsrRpaYbNJ/mfFKtDPPRZezUw9a2C3g5T5jVj
	 YAlUa0rdyt8WMWURKBsdCSVwtHIVLu06ZzZ5FsOLtXmNzwaW6gJ0yAxeB710T12vFX
	 r91OAOjPpbH7mf28adWEyUz43emqwJJ4ShAFDlphu4csrYRB++DBSuS+3QeLlUCWvC
	 Pkti8EOD1JqUw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 15:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127804

--=-6eotkfaNov2476IoG4S3
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Fr, 26. Jun 2026 um 08:00:14 -07:00:00 schrieb Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org>:
> These are libraries, they should be pulled by shlibs code, I am not 
> sure if its needed to be added to packagegroups explicitly

I added libdvdread only, because I had removed it earlier. If thats not 
needed, even better!


--=-6eotkfaNov2476IoG4S3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Fr, 26. Jun 2026 um 08:00:14 -07:00:00 schrieb Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt;:<br><blockquote type="cite">These are libraries, they should be pulled by shlibs code, I am not sure if its needed to be added to packagegroups&nbsp;explicitly</blockquote><div><br></div><div>I added libdvdread only, because I had removed it earlier. If thats not needed, even better!</div></div>
--=-6eotkfaNov2476IoG4S3--


