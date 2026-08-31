Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BA5C624A4
	for <webhook@archiver.kernel.org>; Mon, 31 Aug 2026 12:33:30 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28465.1788179603181662800
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2026 05:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JmsR27p8;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: claus.stovgaard@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so4962918a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 05:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179601; x=1788784401; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=McqlbsIOJ1KdeMcke2fBpRuLTjrP6HjNa4Sa2hFOZLw=;
        b=JmsR27p8N0S60SNHddrzfK1FTqchurne5h3ALRq2dSnFUuwwJoEAW3XF4+6KmV4SFa
         iQM7xC2aTE8EG2iACnGqWeZQZ+NOT3e9OH4wTD7rBo2KlGkFkCshUH3JIkRlzad8bX/j
         idiJmtu0SaHBVRrH685s0IpxKKWsl93ita0lfUSI7DsIBRvKsfaQE9f8bnVmjUs0+HwI
         ZfdCGhSQFkg/7UR9/DxoKxXoHNXV3KuGTLiX+iskr8aJUw7GQjnp7/gGt6L1Mv72ZEZk
         0ZBvv3KWsv3yg53Fn03dwjC1IdifPqjzIAwsEVmsRn0HkW9wnFLMkPkI3FdJkb+Ylcjz
         8BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179601; x=1788784401;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=McqlbsIOJ1KdeMcke2fBpRuLTjrP6HjNa4Sa2hFOZLw=;
        b=PUgGQWHZTmxRDo9x0XdXKJhG9Cpuu1a8gD/wU8790TqID1iq9DJ1GRZx+5YOdswR7z
         2UDSk5/2TI2K40ETrWqprobPiZuNWJjW5YEARq7gdmNW4mpYnWcJZWswczNNnOgXhHE5
         Wy1qfPWI02/sGBDu+UJ0I6CU/jjUgCs8GD7oUkG1sE3ZccfUZC0e0C9Pxd5fQg6P1B1g
         /FuhnxIGBA8RhFNj512/F0Hr3+Ta9wFSI76+elbsG9v6HEw5ryzhIh4HO8PHcT7qAn93
         b0m7U/3D4rpBk7BCcQcFbslqGeTHOa7ew8Gs3FPNlpjZ8mMO6qRvWvfV7/Cx50gF1mD0
         8law==
X-Gm-Message-State: AFuF++lLeIw9aiIqF5+SkmpgDKgY2JHmQab9WIQ9bRjOxUjE66m6a9z8
	f+/a4Y5VOXTWJVuwagAJMoeGCuyQ7YR/ckWk9SeqROktLV0Pt+o6Dvqn2qB+fg==
X-Gm-Gg: AR+sD10qYRbTyrUGlHTi4PGcDCIbgysmrX3br1qgZPyNsF13hLf+C2wa2EZCBaU33LI
	WyNieqZvoeZegL8RpRw52LuzWqquRVW87vTuBj7/Jg21Hps+YAtCiUaYB74PFB1dYRGdybJnNg3
	0oT5XpBByOojJ6KYQDNjLmmerEanb1j4oOcnwhhVCrCafKUMQa6roFvFd5CXbEPmSIvK55zcGg5
	BTCe3nDN20cEnaxS8hF7X/Fua+fVy4mSPTvkDPK0pgN/iXjGmcyltBAmy8KbpMjuOfIm9txebBX
	QLFWdqf9T2+s99kVyhruEkUAJvsHJOx1vEND9suot27jjze0Lh3uO6xLj0AIK+Vf9Op7r3zS6UO
	kY+omvPZMLxS7IiwcS79PnM0Npvp1mhRi6JUrA/1AK72NLZiC55cHREpIUGYrGmdLj+pVFnAJXt
	u1kF1KTQJLGhCRseBkkYxqEI/lXz5Xft7WTIV0B7Ep4u+5cp28jmfEgK7HoKtyegIeljbF39K2r
	10rJYw9qhWGPAuRDVbU+X0tEpS/trQ=
X-Received: by 2002:a17:906:4ed4:b0:c25:6c9a:88bc with SMTP id a640c23a62f3a-c25b3d8a1d8mr7246666b.19.1788179601169;
        Mon, 31 Aug 2026 05:33:21 -0700 (PDT)
Received: from [10.6.153.68] ([92.241.207.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm450398466b.6.2026.08.31.05.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:33:20 -0700 (PDT)
Message-ID: <103f7572ffdb430fe8b62a5952a2d1f8259a6c96.camel@gmail.com>
Subject: Re: [oe] [PATCH] android-tools: Install bootimg utilities
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Claus Stovgaard <claus@stovgaard.com>, dmitry.baryshkov@oss.qualcomm.com
Date: Mon, 31 Aug 2026 14:33:19 +0200
In-Reply-To: <18D0DE585042602A.892917@lists.openembedded.org>
References: <18D0DE585042602A.892917@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2026 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129613

On Mon, 2026-08-31 at 12:51 +0200, Claus Stovgaard via
lists.openembedded.org wrote:
> =C2=A0
> +do_install:append:class-native() {
> +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
> +=C2=A0=C2=A0=C2=A0 install -m0755 ${S}/system/tools/mkbootimg/mkbootimg.=
py
> ${D}${bindir}
> +=C2=A0=C2=A0=C2=A0 install -m0755 ${S}/system/tools/mkbootimg/unpack_boo=
timg.py
> ${D}${bindir}
> +}
>=20

Hi folks. I am a bit in doubt about if RDEPENDS for the python scripts
is needed. As the scripts are using "core" functions, I would expect
the python available from the env is able to run them and have not
added any RDEPENDS.

Regards
Claus

