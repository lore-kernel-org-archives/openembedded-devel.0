Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BBCC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 05:45:30 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.14468.1684215921717356146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 22:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 2B4EA1FBF;
	Tue, 16 May 2023 07:45:18 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.228.204]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pynUr-079ow40; Tue, 16 May 2023 07:45:17 +0200
Date: Tue, 16 May 2023 07:45:12 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 4/7] evince: update 44.0 -> 44.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <CBLQUR.NXO420D7LTJ43@t-online.de>
In-Reply-To: 
	<CAMKF1soBAvB2NQQCTFMGAp3+AG-EGzzUnAumgRg0ciH1_poG=w@mail.gmail.com>
References: <20230516043458.6180-1-f_l_k@t-online.de>
	<20230516043458.6180-4-f_l_k@t-online.de>
	<CAMKF1soBAvB2NQQCTFMGAp3+AG-EGzzUnAumgRg0ciH1_poG=w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XGb3KQtKXk0a3kNrz94h"
X-TOI-EXPURGATEID: 150726::1684215917-49620266-32166610/0/0 CLEAN NORMAL
X-TOI-MSGID: 0ba91634-9da4-4225-a686-cd9c18b1920a
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 05:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102619

--=-XGb3KQtKXk0a3kNrz94h
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 15. Mai 2023 um 22:26:45 -0700 schrieb Khem Raj 
<raj.khem@gmail.com>:
> do these files get compiled into binary ? if so then it might be too
> late to edit these paths out. Perhaps they should
> be removed before they get compiled in.

The buildpath doesn't get compiled into binary, I checked that.
Probably glib-mkenum will fail, if the paths get changed before it got 
compiled. The buildpath is included to ev-view-type-builtins.c like 
this:
/* enumerations from "ev-jobs.h" */
#include 
"/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/evince/44.0-r0/build/../evince-44.0/libview/ev-jobs.h"

And i guess thats needed so ev-jobs.h could be found


--=-XGb3KQtKXk0a3kNrz94h
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 15. Mai 2023 um 22:26:45 -0700 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">do these files get compiled into binary ? if so then it might be too
late to edit these paths out. Perhaps they should
be removed before they get compiled in.</div></blockquote><div><br></div><div>The buildpath doesn't get compiled into binary, I checked that.&nbsp;</div><div>Probably glib-mkenum will fail, if the paths get changed before it got compiled. The buildpath is included to&nbsp;<span style="caret-color: rgb(48, 48, 48); color: rgb(48, 48, 48); white-space: break-spaces; background-color: rgb(232, 232, 232);">ev-view-type-builtins.c</span>&nbsp;like this:</div><div><div>/* enumerations from "ev-jobs.h" */</div><div>#include "/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/evince/44.0-r0/build/../evince-44.0/libview/ev-jobs.h"</div></div><div><br></div><div>And i guess thats needed so ev-jobs.h could be found</div></div>
--=-XGb3KQtKXk0a3kNrz94h--


