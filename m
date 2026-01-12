Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE0BCF45C1
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 19:00:35 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40984.1768244430069918335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 11:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout11.t-online.de (Postfix) with SMTP id B77B71CDB5;
	Mon, 12 Jan 2026 20:00:27 +0100 (CET)
Received: from [192.168.178.36] ([79.219.236.125]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vfN9O-2Yd1Dk0; Mon, 12 Jan 2026 20:00:26 +0100
Date: Mon, 12 Jan 2026 20:00:20 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] btop: update 1.4.5 -> 1.4.6
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <K4MR8T.7KIKIKY4AX1B@t-online.de>
In-Reply-To: <CAMKF1soYoKRdX8bpQ5GK62DmXxyjEw7c3Acgob=xys6okTWOjg@mail.gmail.com>
References: <20260110115148.9069-1-f_l_k@t-online.de>
	<CAMKF1soYoKRdX8bpQ5GK62DmXxyjEw7c3Acgob=xys6okTWOjg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PmlptEUzYxgig91Pty19"
X-TOI-EXPURGATEID: 150726::1768244426-B67FB830-C3FF1032/0/0 CLEAN NORMAL
X-TOI-MSGID: 16d1df5c-2ec8-4034-8fd1-f676ff5f1fef
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 19:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123389

--=-PmlptEUzYxgig91Pty19
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Jan 12 2026 at 10:23:19 -08:00:00, Khem Raj via 
lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> 
wrote:
> adding native gtest dep is causing build problems with clang/lld as 
> it now finds the native version instead of target version.

My mistake. I thought it would require native googletest for testing 
but it actually wants to link for target.

Did some testing and either

DEPENDS = "googletest"
or
EXTRA_OECMAKE += "-DBUILD_TESTING=OFF"

would fix the issue as well.

Maybe the latter would be the better fix since tests are not being 
installed and run on target?


--=-PmlptEUzYxgig91Pty19
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Jan 12 2026 at 10:23:19 -08:00:00, Khem Raj via lists.openembedded.org &lt;raj.khem=gmail.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite">adding native gtest dep is causing build problems with clang/lld as it now finds the native version instead of target version.</blockquote><div><br></div><div><div>My mistake. I thought it would require native googletest for testing but it actually wants to link for target.</div><div><br></div><div>Did some testing and either&nbsp;</div><div><br></div><div>DEPENDS = "googletest"</div><div>or</div><div>EXTRA_OECMAKE += "-DBUILD_TESTING=OFF"</div><div><br></div><div>would fix the issue as well.</div><div><br></div><div>Maybe the latter would be the better fix since tests are not being installed and run on target?</div></div></div>
--=-PmlptEUzYxgig91Pty19--


