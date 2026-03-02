Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74EBD58E47
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:33:01 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.153337.1772425976359211283
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout07.t-online.de (Postfix) with SMTP id 39A10E535;
	Mon,  2 Mar 2026 05:32:54 +0100 (CET)
Received: from [192.168.178.36] ([84.154.170.43]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vwuxh-1yv8T20; Mon, 2 Mar 2026 05:32:53 +0100
Date: Mon, 02 Mar 2026 05:32:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-oe][PATCH] pavucontrol: add x11 to REQUIRED_DISTRO_FEATURES
To: Changqing Li <changqing.li@windriver.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Message-Id: <OM89BT.UBC7D2XUOBIJ1@t-online.de>
In-Reply-To: <e0292a8d-208b-4964-b750-5b21e15b6e27@windriver.com>
References: <20260228054848.3197690-1-changqing.li@windriver.com>
	<WAP8BT.7MCV16N6W4811@t-online.de>
	<e0292a8d-208b-4964-b750-5b21e15b6e27@windriver.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8tuJfkh9rmaqQ+ZKCckt"
X-TOI-EXPURGATEID: 150726::1772425974-7A7F649A-AEB40893/0/0 CLEAN NORMAL
X-TOI-MSGID: e7b8314b-793d-402b-8568-7164ce011f89
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 04:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124797

--=-8tuJfkh9rmaqQ+ZKCckt
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Mar 2 2026 at 09:46:08 +08:00:00, Changqing Li 
<changqing.li@windriver.com> wrote:
> I suppose we can only remove it since pangomm
> 
> not need it,  but I don't know how to check it.  Maybe upstream not 
> accept the previous patch with similar reason?   So I resend this 
> patch.
> 
> But if you can ensure that x11 is not needed by pangomm, I think your 
> previous patch is better to fix the issue.
> 
I can't ensure this but I did grep the pangomm code for usual suspects 
and also had a look at pango and cairo in oe-core which both can
enable/disable x11 support depending on DISTRO_FEATURES and as far as I 
remember I also set up a build with DISTRO_FEATURES:remove = "x11"
and verified that pavucontrol was still buildable.

I'm adding Khem Raj to the discussion. Maybe he can tell if there were 
any problems with the patches.


--=-8tuJfkh9rmaqQ+ZKCckt
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Mar 2 2026 at 09:46:08 +08:00:00, Changqing Li &lt;changqing.li@windriver.com&gt; wrote:<br><blockquote type="cite"><p>I suppose
      we can only remove it since&nbsp;pangomm</p>
    <p>not need it,&nbsp; but I don't know how to check it.&nbsp;&nbsp;Maybe upstream
      not accept the previous patch with similar reason?&nbsp; &nbsp;So I resend
      this patch.</p>
    <p>But if you can ensure that x11 is not needed by&nbsp;pangomm, I think
      your previous patch is better to fix the issue.</p></blockquote><div>I can't ensure this but I did grep the pangomm code for usual suspects and also had a look at pango and cairo in oe-core which both ca<span style="white-space-collapse: break-spaces;">n</span></div><div><span style="white-space-collapse: break-spaces;">enable/disable </span><span style="white-space-collapse: break-spaces;">x11 support depending on DISTRO_FEATURES and as far as I remember I also set up a build with DISTRO_FEATURES:remove = "x11"</span></div><div><span style="white-space-collapse: break-spaces;">and verified that pavucontrol was still buildable.</span></div><div><br></div><div>I'm adding Khem Raj to the discussion. Maybe he can tell if there were any problems with the patches.</div></div>
--=-8tuJfkh9rmaqQ+ZKCckt--


