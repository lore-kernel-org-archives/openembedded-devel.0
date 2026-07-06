Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65171C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 18:26:24 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157854.1783362378421181718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 11:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tafhub.de header.s=dkim header.b=nEkvOX9d;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id DB53318802D4;
	Mon,  6 Jul 2026 20:26:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1783362375; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=veCCDbohcEgxfgKUgD3jko47aOvLqi+lfkqberxVfl8=;
	b=nEkvOX9dyDPx4Jwd2hzB31FbXjb3q8BPJl3IWVnOpqShFv9Bp3r973ImqJvct7Fuxrx2N/
	C0bGyn9pZ3SSqDXZ5spfAt1vvhGxLw/800FcX5EMSwrG+/30im0u/HDdCtXxf6MU7VODF2
	CuCDgk74VY/4g+sWNqfVMHCN+vtlB6Om6ai5YZYKtSRIMYYBBIFguDxcLqhEJ0jpdR2rjy
	e8I0Gh/V6H6ZiGd1XHVEboW1U4H4l6PjhlZxBAHdJ5IxzQI3hyP3CsrSM5Po/ZKLhteh5+
	NTUZpm/4m6u07thTOOxD3Hv317ybD7jhUWxQJ1ZyU8cSmL7Bv4LQ7XbM9u+84A==
From: "Tafil Avdyli" <tafil@tafhub.de>
In-Reply-To: <CAMKF1sp-cNCZGbB_fPKi5jcZNr0XZeY0nR+bZA6G37h3ogcM0g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20260706090242.2035-1-wangmy@fujitsu.com> <CAMKF1sp-cNCZGbB_fPKi5jcZNr0XZeY0nR+bZA6G37h3ogcM0g@mail.gmail.com>
Date: Mon, 06 Jul 2026 20:26:13 +0200
Cc: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
To: raj.khem@gmail.com
MIME-Version: 1.0
Message-ID: <3ee40393-c1a1-c101-5029-1be314d146e2@tafhub.de>
Subject: =?utf-8?q?Re=3A?= [oe] [meta-oe] [PATCH] =?utf-8?q?fastfetch=3A?= drop 
 drm-amdgpu and split vaapi into va-drm/va-x11
User-Agent: SOGoMail 5.12.8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 18:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128053

Hi Khem,

On Monday, July 06, 2026 18:55 CEST, "Khem Raj via lists.openembedded.o=
rg" <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

> this patch is confusing, can you clarify if this is needed. Given its=
 also
> part of the upgrade patch sent on July 1
>

The upgrade is already on master with f412e39069068707b22b1d909d86669c2=
69c8163
but it's missing the PACKAGECONFIG changes.
master-next has 40bcacffeacbe670b6d44d39895ef80395492875 as
duplicate. Drop the duplicate and take this.

Best regards
Tafil


