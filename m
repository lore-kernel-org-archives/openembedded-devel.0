Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCCDC7882E
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 11:59:49 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.16485.1726833586858527206
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 04:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id E8BAEF449;
	Fri, 20 Sep 2024 13:59:22 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.38.23]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srcID-49IHDM0; Fri, 20 Sep 2024 13:59:21 +0200
Date: Fri, 20 Sep 2024 14:00:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: update 2.44.3 -> 2.46.0
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <FC14KS.G22B53FBJ0212@t-online.de>
In-Reply-To: <CAMKF1srYntLyTC+rixg+4UgYB8pyCUB7q26nsJWp5ntKM38OJg@mail.gmail.com>
References: <20240918184731.54155-1-f_l_k@t-online.de>
	<CAMKF1srYntLyTC+rixg+4UgYB8pyCUB7q26nsJWp5ntKM38OJg@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oAOk05y/AgoanwVkHoJB"
X-TOI-EXPURGATEID: 150726::1726833561-077FC4D7-ADEDD7A5/0/0 CLEAN NORMAL
X-TOI-MSGID: fa44ee4e-31a8-48b5-a215-f3d7ec1ddfc3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 11:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112403

--=-oAOk05y/AgoanwVkHoJB
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Sep 18 2024 at 04:03:40 PM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> it fails to compile on riscv64 and perhaps this commit is to blame

Yes, looks like this commit is the reason. That missing RISCV64 
register errors sounds quite unfamiliar to me and I always get lost for 
hours looking at the webkitgtk code. I'll check if this issue was 
already addressed  and if so maybe also has been fixed. If not, I'll 
file an issue for it. The webkitgtk update brings great usability 
improvements for epiphany but is not a build requirement for epiphany 
47.0. Also current gnome-online-accounts seems to work well without the 
webkitgtk update.  Therefore no need to hurry


--=-oAOk05y/AgoanwVkHoJB
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Sep 18 2024 at 04:03:40 PM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">it fails to compile on riscv64 and perhaps this commit is to blame</div></blockquote><div><br></div><div>Yes, looks like this commit is the reason. That missing RISCV64 register errors sounds quite unfamiliar to me and I always get lost for hours looking at the webkitgtk code. I'll check if this issue was already addressed &nbsp;and if so maybe also has been fixed. If not, I'll file an issue for it. The webkitgtk update brings great usability improvements for epiphany but is not a build requirement for epiphany 47.0. Also current gnome-online-accounts seems to work well without the webkitgtk update. &nbsp;Therefore no need to hurry</div></div>
--=-oAOk05y/AgoanwVkHoJB--


