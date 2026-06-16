Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77CECD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 05:58:20 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148089.1781589492597973445
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jun 2026 22:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=VoZ7c0Ah;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd97.aul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout08.t-online.de (Postfix) with SMTP id 498F4EE51;
	Tue, 16 Jun 2026 07:57:38 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.171.30]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wZMno-0QhwWG0; Tue, 16 Jun 2026 07:57:36 +0200
Date: Tue, 16 Jun 2026 07:57:30 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multrimedia][PATCHv2] libdvdread: switch to meson
 buildsystem
To: Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Message-Id: <U7NPGT.2FI600IZ4H5H2@t-online.de>
In-Reply-To: <CAMKF1sqdnApLQLRANTfimRqnqTUKvfzpkSa-EJ+JbmCzLr6tiQ@mail.gmail.com>
References: <20260615144348.7946-1-f_l_k@t-online.de>
	<CAMKF1sqdnApLQLRANTfimRqnqTUKvfzpkSa-EJ+JbmCzLr6tiQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-YZSILCoSF+rP71k6OTSm"
X-TOI-EXPURGATEID: 150726::1781589456-F4FF6A3A-A62C91DD/0/0 CLEAN NORMAL
X-TOI-MSGID: 1240cc30-f829-4e8a-98fe-8ceea559f28e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781589458; i=f_l_k@t-online.de;
	bh=8m3mz0QXf4534H8kK61np9C4uPJlTCKumPqD+3kQlzE=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=VoZ7c0AhTShuq5SefHha8wuYrFfXMslr2uUECHySvIDtxz5Ie2GIEWTammjnC8GZR
	 9usqccYD1MApQHyTguCeN9OVp9xepveVJR3j+YhPNUkkaLdxDmOpwp+BdMJuVF6Olo
	 D8VhFpl4+Ft+6cDZiFxKaRwrtslnl0XlY0zzPq4zLAcE2Bo3Jf9pkzS6oMu+T4a51q
	 KAP7WMaIXIchpZ9ZovNABGiB2PsAR+KFBt6FNtlPhi1KsMtvNUuWjM7uE8R/7fGc2p
	 rVbgMr/lVEnVKZlU8SaCEZjr7+GA3hfJnIg+fOsJCJvhU8JQB5rm1whwEupvfCPm6x
	 ZQFVR/btIIlkQ==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 05:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127602

--=-YZSILCoSF+rP71k6OTSm
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 15. Jun 2026 um 11:39:57 -07:00:00 schrieb Khem Raj 
<raj.khem@gmail.com>:
> I realize there are more recipes in other layers eg meta-gnome 
> depending on it. So moving to multimedia layer is perhaps not gonna 
> work

One possible solution could be to add libdvdnav and libdvdcss to 
meta-oe as well,
or to use dynamic-layers for the recipes in meta-gnome that depend on 
libdvdread

The simplest solution, of course, would be to disable libdvdcss by 
default again


--=-YZSILCoSF+rP71k6OTSm
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 15. Jun 2026 um 11:39:57 -07:00:00 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite">I realize there are more recipes in other layers eg meta-gnome depending on it. So moving to multimedia layer is perhaps not gonna work&nbsp;</blockquote><div><br></div><div><div>One possible solution could be to add libdvdnav and libdvdcss to meta-oe as well,</div><div>or to use dynamic-layers for the recipes in meta-gnome that depend on libdvdread</div><div><br></div><div>The simplest solution, of course, would be to disable libdvdcss by default again</div></div></div>
--=-YZSILCoSF+rP71k6OTSm--


