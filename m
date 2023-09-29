Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4161BE82CA4
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 21:58:49 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.30343.1696024726671947322
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 14:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout07.t-online.de (Postfix) with SMTP id A50634D0C5;
	Fri, 29 Sep 2023 23:58:44 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.210]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qmLVS-1RhnCS0; Fri, 29 Sep 2023 23:58:43 +0200
Date: Fri, 29 Sep 2023 23:58:43 +0200
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-oe][PATCH] libnfs: dont install libnfs-config.cmake
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <V1PR1S.SNS6PQMSBPA81@t-online.de>
In-Reply-To: <CAMKF1soFUO1FRe803VTj-EQXZt7LX+=PgNwq8UgHzS=giqoyqA@mail.gmail.com>
References: <20230928233623.767530-1-f_l_k@t-online.de>
	<CAMKF1soFUO1FRe803VTj-EQXZt7LX+=PgNwq8UgHzS=giqoyqA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KG/qFWwEdRIc1NjRK2oo"
X-TOI-EXPURGATEID: 150726::1696024723-98FF69D6-01120261/0/0 CLEAN NORMAL
X-TOI-MSGID: 301b3ffa-1811-4379-a7a0-42bf873e27a5
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 21:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105275

--=-KG/qFWwEdRIc1NjRK2oo
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 29 2023 at 11:00:33 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> so I wonder how to reproduce the error this option suppresses.

I encountered both issues when building for aarch64 raspberrypi4 with 
up to date branches.

The first one happens to me, if I try to build recent kodi for other 
platforms than host
<https://github.com/xbmc/xbmc/blob/c94910c9671755ff5a2425c322c9ec5f4a0ed576/cmake/modules/FindNFS.cmake#L32>

and the second issue was that libnfs stopped build with clang because 
of implicit-function-declaration. As far as i remember its been here
<https://github.com/sahlberg/libnfs/blob/4755490afcd8f79421ece560a0b0ee98cf41846a/lib/socket.c#L301>


--=-KG/qFWwEdRIc1NjRK2oo
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Sep 29 2023 at 11:00:33 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">so I wonder how to reproduce the error this option suppresses.
</div></blockquote><div><br></div><div>I encountered both issues when building for aarch64 raspberrypi4 with up to date branches.</div><div><br></div><div>The first one happens to me, if I try to build recent kodi for other platforms than host&nbsp;</div><div><a href="https://github.com/xbmc/xbmc/blob/c94910c9671755ff5a2425c322c9ec5f4a0ed576/cmake/modules/FindNFS.cmake#L32">https://github.com/xbmc/xbmc/blob/c94910c9671755ff5a2425c322c9ec5f4a0ed576/cmake/modules/FindNFS.cmake#L32</a></div><div><br></div><div>and the second issue was that libnfs stopped build with clang because of implicit-function-declaration. As far as i remember its been here</div><div><a href="https://github.com/sahlberg/libnfs/blob/4755490afcd8f79421ece560a0b0ee98cf41846a/lib/socket.c#L301">https://github.com/sahlberg/libnfs/blob/4755490afcd8f79421ece560a0b0ee98cf41846a/lib/socket.c#L301</a></div></div>
--=-KG/qFWwEdRIc1NjRK2oo--


