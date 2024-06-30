Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B51C27C4F
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 14:03:57 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25644.1719756234747764060
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 07:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout08.t-online.de (Postfix) with SMTP id D14A7C6BF;
	Sun, 30 Jun 2024 16:03:52 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.39.138]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sNv9i-29IrxY0; Sun, 30 Jun 2024 16:03:51 +0200
Date: Sun, 30 Jun 2024 16:04:56 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] flatpak: add PACKAGECONFIG for dconf
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <8GCWFS.HOQT3OTWLG1A1@t-online.de>
In-Reply-To: <CA+chaQd=64U=MZXsr5BMwtcsF=AmhMCLPKVULvcoyOCi2UznVw@mail.gmail.com>
References: <20240629060010.8833-1-f_l_k@t-online.de>
	<CA+chaQd=64U=MZXsr5BMwtcsF=AmhMCLPKVULvcoyOCi2UznVw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6YKEilF0+UPDyNyOsAUH"
X-TOI-EXPURGATEID: 150726::1719756231-3D98AC7B-0F9AD125/0/0 CLEAN NORMAL
X-TOI-MSGID: 938c75d1-a33d-4008-96bc-30a8f449bac4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Jun 2024 14:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111166

--=-6YKEilF0+UPDyNyOsAUH
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Jun 30 2024 at 09:09:15 AM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> Is the runtime dependency added automatically in do_package? Or why
> didn't you keep it as 4th param in PACKAGECONFIG?

I took a look at $[WORKDIR}/flatpak.specs and dconf was listed there 
for BuildRequires an Requires.
That suggests to me that it is added automatically. But maybe I'm wrong 
here?


--=-6YKEilF0+UPDyNyOsAUH
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Jun 30 2024 at 09:09:15 AM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Is the runtime dependency added automatically in do_package? Or why
didn't you keep it as 4th param in PACKAGECONFIG?</div></blockquote><div><br></div><div><div>I took a look at $[WORKDIR}/flatpak.specs and dconf was listed there for BuildRequires an Requires.</div><div>That suggests to me that it is added automatically. But maybe I'm wrong here?</div></div></div>
--=-6YKEilF0+UPDyNyOsAUH--


