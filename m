Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BE9C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 21:03:19 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.5056.1715634196743583303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 May 2024 14:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout09.t-online.de (Postfix) with SMTP id B742C1FDB2;
	Mon, 13 May 2024 23:03:14 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.44.250]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s6cpG-4VfHu40; Mon, 13 May 2024 23:03:14 +0200
Date: Mon, 13 May 2024 23:03:47 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] malcontent-ui: add malcontent to
 RDEPENDS
To: Martin Jansa <martin.jansa@gmail.com>
Cc: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
Message-Id: <BUZFDS.4175JRWDQOCF@t-online.de>
In-Reply-To: <CA+chaQfXGRSwepv6+DS2fYx6ashYnHN0mXx7qc9-XjGcEL-nLw@mail.gmail.com>
References: <20240513200825.39767-1-f_l_k@t-online.de>
	<CA+chaQfXGRSwepv6+DS2fYx6ashYnHN0mXx7qc9-XjGcEL-nLw@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-QWOLrm9i6WRdXnPYJbGW"
X-TOI-EXPURGATEID: 150726::1715634194-45395322-42CE20B6/0/0 CLEAN NORMAL
X-TOI-MSGID: 703f94a9-da62-4cfb-8fff-bea41ca16026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 May 2024 21:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110345

--=-QWOLrm9i6WRdXnPYJbGW
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, May 13 2024 at 10:30:31 PM +02:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> If libmalcontent-ui-1.so.1 links with libmalcontent-0.so.0 then this
> should be build-time DEPENDS (and then shlibs code in do_package will
> automatically add malcontent to RDEPENDS.

This error is caused by adding malcontent to the DEPENDS field in 
PACKAGECONFIG like I did in gnome-control-center. After enabling this  
in my build the error occurred.
But in the end this RDPEND is not wrong I guess? I've split the package 
in two and without this RDEPEND it would be possible to install 
libmalcontent-ui without libmalcontent which would then be broken


--=-QWOLrm9i6WRdXnPYJbGW
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, May 13 2024 at 10:30:31 PM +02:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">If libmalcontent-ui-1.so.1 links with libmalcontent-0.so.0 then this
should be build-time DEPENDS (and then shlibs code in do_package will
automatically add malcontent to RDEPENDS.</div></blockquote><div><br></div><div>This error is caused by adding malcontent to the DEPENDS field in PACKAGECONFIG like I did in gnome-control-center. After enabling this &nbsp;in my build the error occurred.</div><div>But in the end this RDPEND is not wrong I guess? I've split the package in two and without this RDEPEND it would be possible to install libmalcontent-ui without libmalcontent which would then be broken &nbsp;</div></div>
--=-QWOLrm9i6WRdXnPYJbGW--


