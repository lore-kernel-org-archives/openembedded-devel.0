Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6217FC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 17:28:44 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.51838.1710955717759482738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 10:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id D575B15A0C;
	Wed, 20 Mar 2024 18:28:30 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmzjp-4BXh0i0; Wed, 20 Mar 2024 18:28:29 +0100
Date: Wed, 20 Mar 2024 18:28:43 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <VVPNAS.FCPMXAAPQ9Y82@t-online.de>
In-Reply-To: <CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
References: <17BE205582F63951.29196@lists.openembedded.org>
	<P19LAS.XNJ0HDKLN7IM@t-online.de>
	<CAMKF1sr=j4b+r45zt+mvkD0kqUDoWofzLabiFhCDj=RFaDyq0g@mail.gmail.com>
	<CAMKF1sqhYPiFY3AfwDzydNJaJuF8ye_ng2OuynGH6y+uyenKiA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-klNH0ElcA4FWc4kCrtTb"
X-TOI-EXPURGATEID: 150726::1710955709-94855968-9ACAB069/0/0 CLEAN NORMAL
X-TOI-MSGID: f6eeffaa-5e64-4b0f-b9ff-c680e5cbe0d5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 17:28:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109494

--=-klNH0ElcA4FWc4kCrtTb
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 09:22:01 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> next issue, it can not find heimdal krb5 module.

This can probably be fixed by adding:
PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON 
-DWITH_KRB5_NO_NTLM_FALLBACK=ON,-DWITH_KRB5=OFF,krb5"

I'll send a patch for the krb issue but this will take a few days, 
because I'm not at home for the next days

The bigger problem seems to be the ffmpeg dependency.  A commercial 
license is not necessarily required to use swscale.


--=-klNH0ElcA4FWc4kCrtTb
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 09:22:01 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">next issue, it can not find heimdal krb5 module.</div></blockquote><div><br></div><div>This can probably be fixed by adding:</div><div>PACKAGECONFIG[krb5] = "-DWITH_KRB5=ON -DWITH_KRB5_NO_NTLM_FALLBACK=ON,-DWITH_KRB5=OFF,krb5"</div><div><br></div><div>I'll send a patch for the krb issue but this will take a few days, because I'm not at home for the next days</div><div><br></div><div>The bigger problem seems to be the ffmpeg dependency. &nbsp;A commercial license is not necessarily required to use swscale.</div></div>
--=-klNH0ElcA4FWc4kCrtTb--


