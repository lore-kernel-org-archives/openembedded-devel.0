Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2C8EFEDA02
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 18:21:22 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83258.1773771674863088814
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 11:21:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=dZ1YADC1;
 spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id CBE62BCF;
	Tue, 17 Mar 2026 19:20:36 +0100 (CET)
Received: from [192.168.178.36] ([84.154.160.82]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w2Z1p-4Kkpai0; Tue, 17 Mar 2026 19:20:29 +0100
Date: Tue, 17 Mar 2026 19:20:24 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] jq: Use Git to fetch the code
To: peter.kjellerstedt@axis.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <0Y22CT.71SU5UJGTSVH2@t-online.de>
In-Reply-To: <20260313232357.1729272-1-pkj@axis.com>
References: <20260313232357.1729272-1-pkj@axis.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Hy+ER4bcl5ArCLguMrMV"
X-TOI-EXPURGATEID: 150726::1773771629-86FFA9A3-175B5F29/0/0 CLEAN NORMAL
X-TOI-MSGID: 4f9cc043-75ee-463b-b70d-a02a71281ad9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1773771636; i=f_l_k@t-online.de;
	bh=vPP/Pz4iTZZc+KAhVXNfOm9bvGQeNaW08POW+h5T05c=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=dZ1YADC1+3rH3Oe4/NL12Ijm8cG8Mo5WPq6Jlub7DTyDfnA6Pl5mRIRz2X1V/L/WS
	 aQEu1vpBmdOgarMzY6g5FuwoUshziQQujTDTsUs8AuOXGqlmtDlrPfwIKm/zuytLQT
	 1ZY/OZRdJ1nc9V2nCMoHj6lBsNj6aDbHhl2O79P4AO3lYy+sEltwsqvdtDu7Ta0EF4
	 3inmBC9tOvMU3LFAehpI0wIEeGVW32inWYSWA8P5RcMSVYehKeXUxfTBdYcZkAOmYH
	 aHk3IMnUOMe2a7BOXx6DaP3DLDvKoZYivnL9x0ycrvmDtkogbPux2K6wIvk0bISwyp
	 Iw03XFLxsEfQw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 18:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125330

--=-Hy+ER4bcl5ArCLguMrMV
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sat, Mar 14 2026 at 00:23:57 +01:00:00, Peter Kjellerstedt via 
lists.openembedded.org 
<peter.kjellerstedt=axis.com@lists.openembedded.org> wrote:
> jq

I see this failure in jq:
| cc1: fatal error: src/lexer.c: No such file or directory


'inherit autotools-brokensep' fixed the issue for me


--=-Hy+ER4bcl5ArCLguMrMV
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sat, Mar 14 2026 at 00:23:57 +01:00:00, Peter Kjellerstedt via lists.openembedded.org &lt;peter.kjellerstedt=axis.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">jq</div></blockquote><div><br></div><div>I see this failure in jq:</div><div>| cc1: fatal error: src/lexer.c: No such file or directory</div><div><br></div><div><br></div><div>'inherit autotools-brokensep' fixed the issue for me</div></div>
--=-Hy+ER4bcl5ArCLguMrMV--


