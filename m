Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29143CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 08:35:33 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15109.1780475724943782723
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2026 01:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=AjD/A+0K;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id C00B0AA8;
	Wed,  3 Jun 2026 10:35:22 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.172.112]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wUh4L-00iGsC0; Wed, 3 Jun 2026 10:35:21 +0200
Date: Wed, 03 Jun 2026 10:35:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: Jeroen Hofstee <oe@myspectrum.nl>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <RUR1GT.7FBB4YSJA2AH1@t-online.de>
In-Reply-To: <4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl>
References: <20260530081837.2192126-1-f_l_k@t-online.de>
	<cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
	<4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-VxlsE6RuY19btqlNzRjz"
X-TOI-EXPURGATEID: 150726::1780475721-1D7F9B05-48723122/0/0 CLEAN NORMAL
X-TOI-MSGID: b5ff0bc3-a604-426e-8895-4d1526f25bab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1780475722; i=f_l_k@t-online.de;
	bh=sKmzdNiDfidbwww8XdXHGNyLXGC+UESLGVvdMCAJqlk=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=AjD/A+0KRfo9xMuKS1PJ7/HFeIyUprnkP+ie5B+b5YFpNBGGP15dHCe/REMsKqXCj
	 Ch5A1+2NZU0cWQUJHXeEed+1hpJcykKYmOnR3bXq8CSEtEdOGIFm3TyAih8n4Vmt+T
	 U+nINZZ4mMVvDEG51uoFEgSoUT7xForq97iAnfvMKrzZFfYz8KYIYw+NPSgzRKHyoh
	 FNyJtfGcOofvWp08FFTECNwsJbkZbjNsIvUjCzk0BGejgYxSvu9KisNZSOAKS0tXiW
	 ND7mJYSU2ZyliCLXgH2qfJ/6xo/QS1RXnrpnfNE8xf4DfnPkuLeGCURP7IL0dTpZk5
	 elID76ovNS4lA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 08:35:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127376

--=-VxlsE6RuY19btqlNzRjz
Content-Type: text/plain; charset=us-ascii; format=flowed

However, 'Rejected' seemed like a somewhat inappropriate upstream 
status as well, since this was just an issue,
not a pull request, and the solution was even suggested by the 
maintainer himself. He just hasn't been able
to reproduce the problem yet, so more feedback is needed to convince 
him that people have an issue here.

Who's to blame is a different story :)

That's why I chose 'Pending', but if necessary I can of course make 
this 'Rejected'.


--=-VxlsE6RuY19btqlNzRjz
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>However, 'Rejected' seemed like a somewhat inappropriate upstream status as well, since this was just an issue,&nbsp;</div><div>not a pull request, and the solution was even suggested by the maintainer himself. He just hasn't been able</div><div>to reproduce the problem yet, so more feedback is needed to convince him that people have an issue here.</div><div><br></div><div>Who's to blame is a different story :)</div><div><br></div><div>That's why I chose 'Pending', but if necessary I can of course make this 'Rejected'.</div></div></div>
--=-VxlsE6RuY19btqlNzRjz--


