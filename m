Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099E4C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 11:37:33 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.6389.1702294643406120181
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 03:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id B7EFE102A2;
	Mon, 11 Dec 2023 12:37:17 +0100 (CET)
Received: from [192.168.178.67] ([84.154.173.213]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rCeb6-3Ct29Y0; Mon, 11 Dec 2023 12:37:17 +0100
Date: Mon, 11 Dec 2023 12:37:58 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCH] tracker: dont inherit gsettings
To: Ross Burton <Ross.Burton@arm.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <AZ2I5S.WGET5THHKY043@t-online.de>
In-Reply-To: <FD896675-7CF8-4941-8CD4-66141EF2A49A@arm.com>
References: <20231209170903.672584-1-f_l_k@t-online.de>
	<135B2975-FC8C-4280-BA48-1C8644375621@arm.com>
	<F52I5S.RH4KCS811OGK@t-online.de>
	<FD896675-7CF8-4941-8CD4-66141EF2A49A@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-81ITrkwKIPv1qP75ZUU1"
X-TOI-EXPURGATEID: 150726::1702294637-3DA409FB-FD744EE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 29159caa-027c-45bf-9412-5abfe79aa6d2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 11:37:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107326

--=-81ITrkwKIPv1qP75ZUU1
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Dec 11 2023 at 11:21:48 AM +00:00:00, Ross Burton 
<Ross.Burton@arm.com> wrote:
> So the class is redundant, yes.  Can you also add a check to the 
> gsettings.bbclass so its harmless instead of crashing?

something like this?
gsettings_postinstrm () {
	[ -d $D${datadir}/glib-2.0/schemas ] && glib-compile-schemas 
$D${datadir}/glib-2.0/schemas
}

glib-compile-schemas hasn't an option to not fail if the directory was 
not found

But maybe crashing isn't that bad. Helps to keep the recipes more clean 
I think?




--=-81ITrkwKIPv1qP75ZUU1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Dec 11 2023 at 11:21:48 AM +00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">So the class is redundant, yes.  Can you also add a check to the gsettings.bbclass so its harmless instead of crashing?</div></blockquote><div><br></div><div>something like this?</div><div><div>gsettings_postinstrm () {</div><div><span class="Apple-tab-span" style="white-space:pre">	</span>[ -d $D${datadir}/glib-2.0/schemas ] &amp;&amp; glib-compile-schemas $D${datadir}/glib-2.0/schemas</div><div>}</div></div><div><br></div><div>glib-compile-schemas hasn't an option to not fail if the directory was not found</div><div><br></div><div>But maybe crashing isn't that bad. Helps to keep the recipes more clean I think?</div><div><br></div><div><br></div></div>
--=-81ITrkwKIPv1qP75ZUU1--


