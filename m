Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5CBC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 16:01:45 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web09.252.1668009700506310641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 08:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout09.t-online.de (Postfix) with SMTP id 4D6BBAF0E;
	Wed,  9 Nov 2022 17:01:38 +0100 (CET)
Received: from [192.168.178.128] ([84.163.39.174]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1osnWD-0g2HXk0; Wed, 9 Nov 2022 17:01:37 +0100
Date: Wed, 09 Nov 2022 17:01:31 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <JI83LR.6DI8KX778AKI@t-online.de>
In-Reply-To: <9CE090EB-662D-4CCB-B3EC-D103E13575FA@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
	<D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
	<1725ECAD7BE80329.32043@lists.openembedded.org>
	<C123LR.D2SJ40BPAVYN@t-online.de>
	<9CE090EB-662D-4CCB-B3EC-D103E13575FA@arm.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-91Uhy1S1j/8R/5IdAfj3"
X-TOI-EXPURGATEID: 150726::1668009697-C3FF99D3-94D4F25C/0/0 CLEAN NORMAL
X-TOI-MSGID: 90f605d9-4846-4123-a8c9-9b324937e96e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 16:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99500

--=-91Uhy1S1j/8R/5IdAfj3
Content-Type: text/plain; charset=us-ascii; format=flowed

At least they have a point for correctness by calling it 
build-dependency instead of runtime-dependency.

I take your point that this difference shouldn't matter because hwdata 
is allarch, but simply removing 'native: true'
does not fix the problem. hwdata will then be found, but the correct 
value will not be read here:
hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')


| Run-time dependency hwdata found: YES 0.364
|
| ../git/backend/drm/meson.build:4:1: ERROR: File 
/usr/share/hwdata/pnp.ids does not exist.



> 
> I call that a bug in wlroots.  It should be looking in the sysroot.
> 
> Ross
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99499): 
> <https://lists.openembedded.org/g/openembedded-devel/message/99499>
> Mute This Topic: <https://lists.openembedded.org/mt/94909525/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-91Uhy1S1j/8R/5IdAfj3
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>At least they have a point for correctness by calling it build-dependency instead of runtime-dependency.</div><div><br></div><div>I take your point that this difference shouldn't matter because hwdata is allarch, but simply removing 'native: true'</div><div>does not fix the problem. hwdata will then be found, but the correct value will not be read here:&nbsp;</div><div>hwdata_dir = hwdata.get_variable(pkgconfig: 'pkgdatadir')</div></div><div><code><span class="p"><br></span></code></div><div><code><span class="p"><br></span></code></div><div><div>| Run-time dependency hwdata found: YES 0.364</div><div>|&nbsp;</div><div>| ../git/backend/drm/meson.build:4:1: ERROR: File /usr/share/hwdata/pnp.ids does not exist.</div></div><div><br></div><div><br></div></div><div id="geary-quote" dir="auto"><br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
I call that a bug in wlroots.  It should be looking in the sysroot.

Ross

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#99499): <a href="https://lists.openembedded.org/g/openembedded-devel/message/99499">https://lists.openembedded.org/g/openembedded-devel/message/99499</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/94909525/3618223">https://lists.openembedded.org/mt/94909525/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-91Uhy1S1j/8R/5IdAfj3--


