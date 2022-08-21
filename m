Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E5DC00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 14:01:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web08.7065.1661090496972489614
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 07:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 584CC8E63;
	Sun, 21 Aug 2022 16:01:34 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.36.214]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oPlW6-1scNyC0; Sun, 21 Aug 2022 16:01:30 +0200
Date: Sun, 21 Aug 2022 16:01:25 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: RE: [oe] [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <DMXYGR.GU3KE5WIU42D1@t-online.de>
In-Reply-To: <52f6ee030dbf4e88a86e3702a5303d57@axis.com>
References: <20220820191150.5699-1-f_l_k@t-online.de>
	<52f6ee030dbf4e88a86e3702a5303d57@axis.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BwmdFz4+mJv9OaxKsSGv"
X-TOI-EXPURGATEID: 150726::1661090490-01447F1E-23BF70F0/0/0 CLEAN NORMAL
X-TOI-MSGID: 8a118098-87da-4111-b11b-cf9f608a8f43
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Aug 2022 14:01:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98346

--=-BwmdFz4+mJv9OaxKsSGv
Content-Type: text/plain; charset=us-ascii; format=flowed


i tried to follow your suggestions,
Thanks

Am So, 21. Aug 2022 um 12:49:24 +0000 schrieb Peter Kjellerstedt 
<peter.kjellerstedt@axis.com>:
> AFAIK, there are no current examples of "gstreamer" being used a
> distro feature. What is it supposed to mean? When is it supposed to
> be used? Why is it needed?


I found an example of this, but I must confess that this was in an old 
third-party layer. What I want this DISTRO_FEATURE for is the ability 
to use it to enable/disable gstreamer support in recipes. Not just here 
in pipewire. The same goes for Jack. Is this already used as a 
DISTRO_FEATURE? If so, maybe we could use it to make the Jack server 
depend on it instead of always building it as it currently does?


--=-BwmdFz4+mJv9OaxKsSGv
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><br></div><div><div>i tried to follow your suggestions,</div><div>Thanks</div></div><div><br></div>Am So, 21. Aug 2022 um 12:49:24 +0000 schrieb Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">AFAIK, there are no current examples of "gstreamer" being used a 
distro feature. What is it supposed to mean? When is it supposed to 
be used? Why is it needed?</div></blockquote><div><br></div><div><div><br></div><div>I found an example of this, but I must confess that this was in an old third-party layer. What I want this DISTRO_FEATURE for is the ability to use it to enable/disable gstreamer support in recipes. Not just here in pipewire. The same goes for Jack. Is this already used as a DISTRO_FEATURE? If so, maybe we could use it to make the Jack server depend on it instead of always building it as it currently does?</div></div></div>
--=-BwmdFz4+mJv9OaxKsSGv--


