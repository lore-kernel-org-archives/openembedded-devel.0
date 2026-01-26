Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF0DD19513
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 19:12:59 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28656.1769454776355965153
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 11:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIH3WKnH;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: skandigraun@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c5389c3cd2so567674485a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454775; x=1770059575; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DLru9KfBJDh6y7h3aNdp9K8Pmx25hfFlLSbkSRkqPBE=;
        b=eIH3WKnHvcW/dCCQI0oyt0t4V4qhaFLsbWvtpVJJ7b2oMTn1ccQfJ+K3P361UE9KI+
         8Wzk51Vk7G3LaTs8nXpkL5FkwnAaUIcNsFUC667TfNjFLJl+LuQ9A+0oftlyxmy+K9pe
         nBEhHdj/LcmrZrg+uxdgRAY6V4HCwzR5donOk1zP5DtbmvpNHpHN8BSNprpvtYKm56jW
         BMGd6zN9cxLKA5YNgzX27MJuBgyTVlEfSmWTy0hyM7VWLGImCrQLrOafyik+3ZGJrAPg
         wMZVxuxPDfzWUu9ukGja7chNa+zJlkW4P6jKKrX/3YK/0jOpvkwCtkJG8QPt5Su95Od6
         QR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454775; x=1770059575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLru9KfBJDh6y7h3aNdp9K8Pmx25hfFlLSbkSRkqPBE=;
        b=OfSW8H3cwAmoHRFoEI6sRmNYqEstvP/95LDIv/fQnar5Wbo1pAeECiehrQ0fpKAT4Y
         0g0dPn1JICzoJYL0y1bgY3V0aqeDe/XgtfLXWsl0zkcb3l8knPcA+oakbji88/OPrhYQ
         IF7lkENA6vUFJId2y+1qr7HRkE0QBY9k1zPdfv99L4+fut0rXK+swsg1WbbZFvF/8n47
         iU9lBGVqA30jEz0tWxrv6pWSqh45M02dO4Eo/CoEnih0kW/JVmc1/GWivH+/AAaI+etH
         nq7WxJYZ5sD/BAKb72dTfi2MxRilqGYY7xx4XA3nW9Y4EM/72lA/cslSaoPRwlmt+MvC
         gM7w==
X-Forwarded-Encrypted: i=1; AJvYcCXDpTNenS4kafvOiDAmqz5iCa9sfZaONw+aPNUO+VMm6eLRuUZ7ySe+VZUyDPPcl1Z2CupE92KBQELU74fE8X6KHyI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxoojIAxc/hELgm/X88VWiOVAJdCpwIhUbGgAJ+W0meVo/HHyQh
	sK44yJ1k57qIvtvpDLAVKEpskHmGIgZz32Vf9tYZy2N11pGy8QdntZY/
X-Gm-Gg: AZuq6aL11XX+Lqzx63384ZzkXNLWSP5tM9ya5W7c2OxkcQtYCQN3aRYe7DaA3+QIr3/
	gGzDKxudT5wSZSvhNJcQ0w0R7/Y0qyoiBC/GarlAj1kULAaDWL1O6g1P11kZfsuQ7SSLO9yd24I
	HZq0sR9+KWcVAjU7YFuwHFhWSJZbAnmKjoBCfqSy6Uvo4NYOuxBG+XRVJ3LpXbM+mM2mp5+qsP+
	megsJfj8SxMtoeQsw0J63GZbtBu+eOktESFBBgHcYxMUXuByVF4ChWTIautWXqLoX/pVJAta/D0
	s9Wt8txKMtQaNDLnl9FT1k7XTVrvno702r5kJeq3Jo4LqrRc215TAzxuLIrhLB+qVY/PTpl3QDI
	dFMWxxebECpm1RGFlVyfGIsAZ/ScbxJCtX225nL2FmD483Uo5G4A5SiSgl64EVC0wOc60AzqWQ0
	SbgFcxcRm2/KcQbPs9LAo=
X-Received: by 2002:ae9:c203:0:b0:8c6:ff91:3cfb with SMTP id af79cd13be357-8c6ff913dc3mr370163185a.21.1769454775289;
        Mon, 26 Jan 2026 11:12:55 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894ac89dc32sm63291786d6.51.2026.01.26.11.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 11:12:54 -0800 (PST)
Message-ID: <b00a1784-b64f-4a31-82d1-bdc4806f3ff6@gmail.com>
Date: Mon, 26 Jan 2026 20:12:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][PATCH] openl2tp: Fix do_package_qa Issue
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260126071627.4466-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260126071627.4466-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 19:12:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123889

On 1/26/26 08:16, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> Fix following issue when using customized kernel without kernel-module-l2tp-ppp enabled.
> ERROR: openl2tp-1.8-r0 do_package_qa: QA Issue: openl2tp-ptest rdepends on kernel-module-l2tp-ppp, but it isn't a build dependency? [build-deps]

But does it make sense to build ptests for this recipe with such a
kernel? I'd expect that it fails the latest at runtime due to the
missing module (but most likely during buildtime, due to missing RDEPENDS)
Instead of disabling this check (which seems to work as expected),
wouldn't it be better to disable ptest completely in user layer
(bbappend, local.conf...)?

Or maybe the module could be moved to RRECOMMENDS, so it won't be a hard
dependency. Ptests would still fail at runtime (with incompatible kernel
config), but the build and qa checks could go on.

> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> index 4e5b45891d..ac9dece2f9 100644
> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> @@ -97,3 +97,5 @@ do_install_ptest () {
>  
>  RDEPENDS:${PN} = "ppp ppp-l2tp bash"
>  RDEPENDS:${PN}-ptest += "rpcbind kernel-module-l2tp-ppp procps-ps tcl"
> +
> +INSANE_SKIP:${PN}-ptest += "build-deps"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123859): https://lists.openembedded.org/g/openembedded-devel/message/123859
> Mute This Topic: https://lists.openembedded.org/mt/117464733/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


