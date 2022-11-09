Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C395CC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 13:41:50 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web08.3311.1668001304623065391
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 05:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout11.t-online.de (Postfix) with SMTP id 85103F07D;
	Wed,  9 Nov 2022 14:41:42 +0100 (CET)
Received: from [192.168.178.128] ([84.163.39.174]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oslKo-3i9w000; Wed, 9 Nov 2022 14:41:42 +0100
Date: Wed, 09 Nov 2022 14:41:36 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <C123LR.D2SJ40BPAVYN@t-online.de>
In-Reply-To: <1725ECAD7BE80329.32043@lists.openembedded.org>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
	<D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
	<1725ECAD7BE80329.32043@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Qr7q4LtxlYEXs5/3rpXA"
X-TOI-EXPURGATEID: 150726::1668001302-73FF081F-75A6F38C/0/0 CLEAN NORMAL
X-TOI-MSGID: 44eae72e-c64e-4610-ac88-59194f76f1a4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 13:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99498

--=-Qr7q4LtxlYEXs5/3rpXA
Content-Type: text/plain; charset=us-ascii; format=flowed

| Dependency gbm found: YES 22.2.2 (cached)
| Checking for function "gbm_bo_get_fd_for_plane" with dependency gbm: 
YES
| Found CMake: 
/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/wlroots/0.15.1-r0/recipe-sysroot-native/usr/bin/cmake 
(3.24.2)
| Build-time dependency hwdata found: NO (tried pkgconfig and cmake)
|
| ../git/backend/drm/meson.build:6:1: ERROR: File 
/usr/share/hwdata/pnp.ids does not exist.
|
| A full log can be found at 
/home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/wlroots/0.15.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: exit code 1 from a shell command.

With DEPEND on hwdata instead of hwdata-native it fails like this.



--=-Qr7q4LtxlYEXs5/3rpXA
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div><div>| Dependency gbm found: YES 22.2.2 (cached)</div><div>| Checking for function "gbm_bo_get_fd_for_plane" with dependency gbm: YES</div><div>| Found CMake: /home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/wlroots/0.15.1-r0/recipe-sysroot-native/usr/bin/cmake (3.24.2)</div><div>| Build-time dependency hwdata found: NO (tried pkgconfig and cmake)</div><div>|&nbsp;</div><div>| ../git/backend/drm/meson.build:6:1: ERROR: File /usr/share/hwdata/pnp.ids does not exist.</div><div>|&nbsp;</div><div>| A full log can be found at /home/flk/poky/build-intel/tmp/work/corei7-64-poky-linux/wlroots/0.15.1-r0/build/meson-logs/meson-log.txt</div><div>| ERROR: meson failed</div><div>| WARNING: exit code 1 from a shell command.</div></div><div><br></div><div>With DEPEND on hwdata instead of hwdata-native it fails like this.</div></div>
--=-Qr7q4LtxlYEXs5/3rpXA--


