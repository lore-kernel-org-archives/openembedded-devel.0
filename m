Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D239C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 16:25:28 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.20250.1739377523010338698
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 08:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout03.t-online.de (Postfix) with SMTP id 2F875297;
	Wed, 12 Feb 2025 17:25:04 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.47]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tiFXr-0If7nk0; Wed, 12 Feb 2025 17:25:03 +0100
Date: Wed, 12 Feb 2025 17:19:29 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome] [PATCH 17/66] msgraph: upgrade 0.2.3 -> 0.3.3
To: wangmy@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	"wangmy via lists.openembedded.org"
	<wangmy=fujitsu.com@lists.openembedded.org>
Message-Id: <H0WKRS.6N3N2FQDS83Z@t-online.de>
In-Reply-To: <1739178095-26432-17-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
	<1739178095-26432-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-hwsf+9C/Y8bzRgLNzFf+"
X-TOI-EXPURGATEID: 150726::1739377503-8E7F399F-D02F1F6B/0/0 CLEAN NORMAL
X-TOI-MSGID: 24d7e3f7-8749-4ef7-9f6a-2a163ff53874
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 16:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115448

--=-hwsf+9C/Y8bzRgLNzFf+
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mo, Feb 10 2025 at 17:00:46 +08:00:00, wangmy via 
lists.openembedded.org <wangmy=fujitsu.com@lists.openembedded.org> 
wrote:
> msgraph

The msgraph update breaks gvfs:
| Run-time dependency msgraph-0.1 found: NO (tried pkgconfig)
|
| ../gvfs-1.56.1/meson.build:434:16: ERROR: Dependency "msgraph-0.1" 
not found, tried pkgconfig

gvfs 1.57 will be a requirement to be able to use msgraph-0.2 and the 
update is problematic because it requires glib-2.0 update in oe-core

I dont know if there is interest in getting the gnome 48 updates into 
oe-core before feature freeze, but if not, this update should be delayed


--=-hwsf+9C/Y8bzRgLNzFf+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mo, Feb 10 2025 at 17:00:46 +08:00:00, wangmy via lists.openembedded.org &lt;wangmy=fujitsu.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">msgraph</div></blockquote><div><br></div><div>The msgraph update breaks gvfs:</div><div><div>| Run-time dependency msgraph-0.1 found: NO (tried pkgconfig)</div><div>|&nbsp;</div><div>| ../gvfs-1.56.1/meson.build:434:16: ERROR: Dependency "msgraph-0.1" not found, tried pkgconfig</div></div><div><br></div><div>gvfs 1.57 will be a requirement to be able to use msgraph-0.2 and the update is problematic because it requires glib-2.0 update in oe-core</div><div><br></div><div>I dont know if there is interest in getting the gnome 48 updates into oe-core before feature freeze, but if not, this update should be delayed</div></div>
--=-hwsf+9C/Y8bzRgLNzFf+--


