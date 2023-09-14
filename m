Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC1EEAA57
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 16:28:31 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.301.1694708904610516479
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Sep 2023 09:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 78B3120845;
	Thu, 14 Sep 2023 18:28:22 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.167.3]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qgpCY-20K1vE0; Thu, 14 Sep 2023 18:28:22 +0200
Date: Thu, 14 Sep 2023 18:28:16 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCH] libdca: add recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <4RHZ0S.429LO849YY5W1@t-online.de>
In-Reply-To: <CAMKF1srwzjtOq1vxfhMcEsb1YQmFbMbRidfcYT=tW6CRYck6hg@mail.gmail.com>
References: <20230914154206.2143189-1-f_l_k@t-online.de>
	<CAMKF1srwzjtOq1vxfhMcEsb1YQmFbMbRidfcYT=tW6CRYck6hg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-DKrsRFFJOH/ymWtUvX48"
X-TOI-EXPURGATEID: 150726::1694708902-921947F0-7870C991/0/0 CLEAN NORMAL
X-TOI-MSGID: 3552f177-e2dc-4c42-b669-038756b1a7ca
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Sep 2023 16:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104876

--=-DKrsRFFJOH/ymWtUvX48
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Sep 14 2023 at 09:14:26 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> 
> if we change it into
>  $(LN_S)f libdca.a "$(DESTDIR)$(libdir)/libdts.a"
> 
> Then it becomes relative and can be submitted upstream as well.

This change has already been requested some years ago:
<https://code.videolan.org/videolan/libdca/-/issues/3>

Anyway, the static lib isn't built by default so this would add a 
broken symlink to the package I guess ?


--=-DKrsRFFJOH/ymWtUvX48
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Sep 14 2023 at 09:14:26 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
if we change it into
 $(LN_S)f libdca.a "$(DESTDIR)$(libdir)/libdts.a"

Then it becomes relative and can be submitted upstream as well.</div></blockquote><div><br></div><div>This change has already been requested some years ago:</div><div><a href="https://code.videolan.org/videolan/libdca/-/issues/3">https://code.videolan.org/videolan/libdca/-/issues/3</a></div><div><br></div><div>Anyway, the static lib isn't built by default so this would add a broken symlink to the package I guess ?</div></div>
--=-DKrsRFFJOH/ymWtUvX48--


