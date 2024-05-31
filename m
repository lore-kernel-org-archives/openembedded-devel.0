Return-Path: <andre.draszik@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE52EC25B7C
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 11:32:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.9283.1717155115692752552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 May 2024 04:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fU9VRPc4;
 spf=pass (domain: linaro.org, ip: 209.85.128.42, mailfrom: andre.draszik@linaro.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4212e341818so4964455e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 04:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717155114; x=1717759914; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0sz9kflT8Aja45D+Fa37awllKvLm7mEDbu2gDvElGc=;
        b=fU9VRPc4ciI0lCnmhl67jDTXtm/3Bh/z3ACowx+si0Nataajn0r/tqzrngoT0cFpGt
         HXXsz7RziGDZ+ESswf0XEEgCdEZvL+E8nbzTJfJ9SHiUZ3i7Mya8A/UPzIP8LeW2AmQP
         XjtE9pLYMNjjyyW89ZfJz2460qd/t2Fd13x8n1OxGNFe8CMqYnL8uwDhuFfZldJekHqm
         QAM+FjVix5SCwjaRSotzz94BRFtN6glE6KSE0rwmztr4CLlVamTWcRCAqo1EUOM5Y0LT
         bntxqjRmlNGBf+SVAxOPAX456BWaDw/4rw6dNEhHLNmLwP/GbNtuCG4JyKT1Au6NIwRy
         nRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717155114; x=1717759914;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m0sz9kflT8Aja45D+Fa37awllKvLm7mEDbu2gDvElGc=;
        b=geP1UzrQ1oKHwHghw7ErOArR11ycpUxTgCrYZH26hEtADNdo0nD4si2MKlbKB+sFMX
         QiGB0Qve8buZdT+IN5066M2nYAhNrkTPlHNSo8TBXqULy6YlCJ2v1D824bwiZxyg2Ubz
         7JYGTw650rww7Mnxdz14ynQSIfsnBCGE0H7zkxEowL88OhqJOq/aKLFEKa+cLBf/y6z+
         x8tXYp8pneqxr6tkAOJyCVhqX3RKI4zRdmbH6FhKz7WBgpE5rLUX/V2J3ZlQ4NCYrsXD
         LiHq//K3tjiiO7Phln7sj4LgYjNahYRSv8ehHJpHuFaCMvjDD3Sls1iUQfvk3WYkcIQk
         UcOQ==
X-Gm-Message-State: AOJu0Yw13RTKgyAcJPe83iZksXuM119Yzbw9aTEj3OvsKTt6kpeoIlyU
	TqBiJETxGC3SSTsvXysrrimcBMbfZ0fGC19RcWfVle47ix+TGvAGFQ8PskbbABlNGBdKDIisXje
	4
X-Google-Smtp-Source: AGHT+IEt5F8dI+ShNarQy1H9vAoqccZsiKmtQotFCwEhiLK33tQEQ7QFPL/SM7+ixUOPX27JVbj0lA==
X-Received: by 2002:a05:6000:1745:b0:349:d810:9974 with SMTP id ffacd0b85a97d-35e0f2709b0mr1010027f8f.17.1717155113418;
        Fri, 31 May 2024 04:31:53 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062ea98sm1645602f8f.71.2024.05.31.04.31.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 04:31:52 -0700 (PDT)
Message-ID: <239ce5e43a976dbbef3c74a90bd4812970f92282.camel@linaro.org>
Subject: Re: [oe][meta-oe][PATCH] android-tools: fix adb OpenSSL patch
 (really make compatible with >= v1.1)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2024 12:31:51 +0100
In-Reply-To: <17D4393E139617B4.15404@lists.openembedded.org>
References: <17D4393E139617B4.15404@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 May 2024 11:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110654

On Thu, 2024-05-30 at 10:11 +0100, Andr=C3=A9 Draszik via lists.openembedde=
d.org wrote:
> As per the inlined patch commit message, gcc 14 is highlighting a few
> issues with the existing patch and it doesn't compile.
>=20
> Update the patch to fix.
>=20
> Note there are two recipes for android-tools in this layer - the recipe
> here and another one in
> meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools. A patch
> for the alternative android-tools version had already been posted, so
> this patch only deals with the remaining one.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

I can see this has also been fixed shortly after I had last checked, please
ignore this patch.


Cheers,
Andre'


