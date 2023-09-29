Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A47E7734B
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:34:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.31015.1696026842533965513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout01.t-online.de (Postfix) with SMTP id 17249386BC;
	Sat, 30 Sep 2023 00:34:00 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.210]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qmM3Y-0rUHp20; Sat, 30 Sep 2023 00:33:56 +0200
Date: Sat, 30 Sep 2023 00:34:03 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] libnfs: dont install libnfs-config.cmake
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <ROQR1S.P33F0FS6C4YH@t-online.de>
In-Reply-To: <CAMKF1soFUO1FRe803VTj-EQXZt7LX+=PgNwq8UgHzS=giqoyqA@mail.gmail.com>
References: <20230928233623.767530-1-f_l_k@t-online.de>
	<CAMKF1soFUO1FRe803VTj-EQXZt7LX+=PgNwq8UgHzS=giqoyqA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-CVGvKGmPbi6+CMevqk2d"
X-TOI-EXPURGATEID: 150726::1696026836-4DA8BD65-602494DF/0/0 CLEAN NORMAL
X-TOI-MSGID: ae2df6e7-23a6-4eaf-9a68-f2451bd3ee30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 22:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105280

--=-CVGvKGmPbi6+CMevqk2d
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 29 2023 at 11:00:33 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> so I removed it
> locally with clang and it seems to work for couple of arches
> arm64/x86_64

Should I send a v2 and remove the CFLAG? Since you can build for arm64, 
maybe the problem is on my side?
I am not really in need of this hack. clang17 also still has some minor 
issues with onevpl from meta-intel. Nothing major, but there are still 
enough minor issues to keep me from using clang toolchain regulary.


--=-CVGvKGmPbi6+CMevqk2d
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Sep 29 2023 at 11:00:33 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">so I removed it
locally with clang and it seems to work for couple of arches
arm64/x86_64</div></blockquote><div><br></div><div><div>Should I send a v2 and remove the CFLAG? Since you can build for arm64, maybe the problem is on my side?</div><div>I am not really in need of this hack. clang17 also still has some minor issues with onevpl from meta-intel. Nothing major, but there are still enough minor issues to keep me from using clang toolchain regulary.</div></div></div>
--=-CVGvKGmPbi6+CMevqk2d--


