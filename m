Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22846CD8CB9
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:57:28 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81694.1781017046148949094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=bUKF6Xos;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout04.t-online.de (Postfix) with SMTP id 667CF1054;
	Tue,  9 Jun 2026 16:57:03 +0200 (CEST)
Received: from [192.168.178.63] ([84.154.170.36]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wWxsy-3WkgD20; Tue, 9 Jun 2026 16:57:00 +0200
Date: Tue, 09 Jun 2026 16:56:55 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: Khem Raj <raj.khem@gmail.com>
Cc: jeroen@myspectrum.nl, openembedded-devel@lists.openembedded.org
Message-Id: <VIDDGT.4G2WON9M88WE@t-online.de>
In-Reply-To: <CAMKF1srL-CgP594CTzd-h1TPGVQx3bjgayOxvhxP67D9rNnpBw@mail.gmail.com>
References: <20260530081837.2192126-1-f_l_k@t-online.de>
	<cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
	<4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl>
	<RUR1GT.7FBB4YSJA2AH1@t-online.de>
	<194e3c6b-3c34-4cdb-a0dd-f168374888e9@myspectrum.nl>
	<CAMKF1srL-CgP594CTzd-h1TPGVQx3bjgayOxvhxP67D9rNnpBw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ajZas8p1gebiqLUUWIwi"
X-TOI-EXPURGATEID: 150726::1781017020-F5FF94E2-947DA839/0/0 CLEAN NORMAL
X-TOI-MSGID: 4d5b5278-1851-4ac5-9b5d-7c7c373a3eb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781017023; i=f_l_k@t-online.de;
	bh=bzFjKd50qoQQeFJi4BpVWmF7Sa6T2FC+5ELb1EBTCE8=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=bUKF6XosafYYrdWf8k/qd96KHKdqpukuTtFJLQ7EdDC0yU6f36VyLssC6TNMWZii/
	 J/j0qxThhD+gF7eA7HLBFk0K189oe/+7BDh5+OC4Qwy5bDLG4gbLQeMGSfDHdM+6DK
	 XoGgWldzAOg431uPdrPK6vIwzlHp/IDRzoAfrpw3P79R4ARg35cE3PHvhvDAw2WLcr
	 NUN4CxFFXGpKKsuhpJEbnidZ3TjQOvDTtEVB04qyui6ak/Bm7gjchwpJf9r6rSd8bP
	 uAyYg06Rno/trfx9KdttQA+KrwbxN+VY+19NFnKDRI0JTSNU/CgUXzG7aXO7m+QI6p
	 TwloBYg1vclKA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127500

--=-ajZas8p1gebiqLUUWIwi
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 7. Jun 2026 um 14:04:24 -07:00:00 schrieb Khem Raj 
<raj.khem@gmail.com>:
> yeah, I think if upstream is not taking this patch lets disable the 
> warning temporarily and see what lands as right fix.

This would just disable the warning without patching the code:
CFLAGS += "-Wno-error=maybe-uninitialized"


We already have this added for DEBUG_OPTIMIZATION:
DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"

 I assume it makes sense to keep this line as well since that CFLAGS 
entry is only meant to be temporary ?



--=-ajZas8p1gebiqLUUWIwi
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 7. Jun 2026 um 14:04:24 -07:00:00 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite">yeah, I think if upstream is not taking this patch lets disable the warning temporarily and see what lands as right fix.</blockquote><div><br></div><div>This would just disable the warning without patching the code:</div><div><div>CFLAGS += "-Wno-error=maybe-uninitialized"</div><div><br></div><div><br></div><div>We already have this added for DEBUG_OPTIMIZATION:</div><div>DEBUG_OPTIMIZATION:append = " -Wno-error=maybe-uninitialized"</div></div><div><br></div><div>&nbsp;I assume it makes sense to keep this line as well since that CFLAGS entry is only meant to be temporary ?</div><div><br></div></div>
--=-ajZas8p1gebiqLUUWIwi--


