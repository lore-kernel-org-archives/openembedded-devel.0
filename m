Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13578.1795774838915852429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 02:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=pvyC6L4F;
 spf=pass (domain: smile.fr, ip: 209.85.218.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso1444327466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 02:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795774837; x=1796379637; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T0vu7z+AoMLwC8GKRGVn1TkAcYDUy0ME+DQfWZH7qWs=;
        b=pvyC6L4FaGOGt4uOJ+//Ea0/Wu5hd0WnuoEbtObosuzKh2MTr9EsbpbDjBIWDdCF8P
         BivsUu4HhGA+MO6InkCQSmG16gkidYaMaZkDfvZJZuWvQXkO5VAOvwVHU6Fv+zmfKTnN
         Xo9PgCHDa7TX/BdiezDLJg5y0KXINy1JUGIg83dbXWeHHN1EnaOo9+DlOaGwrZXQnaJM
         iUSH947KOM8qxCI2OVqfyiMTWVxDJxWNATQmCkDqkIT/X4sU88LmuC3CSrGKHNM3VmVY
         8qwt5pC/vQZaagQhOpGcgcYgLphKXOggQ7gyOS4oCsygLwGD0NII/v+AezyV5mfdkvOV
         euJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774837; x=1796379637;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0vu7z+AoMLwC8GKRGVn1TkAcYDUy0ME+DQfWZH7qWs=;
        b=13tsR/RgvuY6btlbP6UpGMlVIPHXGR1hjA7IScMMBjS2nQnRfO40SyxI9+LM6GC27c
         aXeic921PupGj7NguEp545nCUnCi6LDqyhD5yJtXJbuQNdVyAYFkSnTMqMZncXFz8+h8
         ebakKCj80BYfQYJkSimI1OEqnZFj+TvuoTMfGPH9K6waQeRkR2oUkx415zn68wOzMgRg
         pOkw8YxfTq6A3SHVLzyPg7GGsT3/8KbPAvqsV68DAcUQgqUf01r4RY1Tk3R9OGSfHZWF
         f3BUEDkDBgD5ZrxxNG/vU1Gdxib1+9e7BpynjKZdgXrmOG/Jlq9u9fnKGl38PbDEKwmf
         ogCg==
X-Gm-Message-State: APuU4Z9mRS3WkwoNJwAL298QL259weFs+x4zsnGwRYD0LbhnjhH20MS2
	SifJItozmwnemR8rIGPXRy9NcHVqc0lebXPHCCsQA/oGZ+XRCexB7rhaKgKvT7HKfOk=
X-Gm-Gg: AZFdTZdUx5+e1PKaY2GnVuflM7L2EPyBmmXSohX+Cy3KUjJeTMduGKdTVGoJxCAPCL1
	jBZsfvo/42c44hodk4dLvgpXK3/q8QxS0ZyzEwwy17byfuiFEflnq/vlbSH1ib5OUv0PkQCgCfH
	hiocFh5cECc0ga2xPeJVD6Ljee139OmopB6pRD4ucx/4VlaOpuK0oio/+UiMYHKrXvDXVY0uJhP
	Flv1xQoCXRNMxROW1IkU9V8NrhTMQmmov0TlwMzKnDCgGE4qmyx+dMQYdo7Ew2GPadMJQw4CqV0
	rXk96EQeLDEc/JxS33bwPUDmHk6n0FFXmFpPZOLTaogBFtbA4731M0/y8f9kdENNLOf+im+zJ3Y
	kcWfCfhMIL1ZwJQkxb6TrXZCrscR3gd4Q+IPkS5Ga4P400tj0O/T1ebK2Fl4vx3GJrFRJVgumoa
	rNpqoJ9e23hs8CO/WxuOddWiIEt7xJW1fn2qNghk2vY9UMz3HrdHVFFZi0+VIr87abTi5aL0pvm
	016Q80n8uhRiv7zrMs3/+7xmfxQZJs2PKJu5wqxXs6bjHdPJvuB6vcp2u847ThmL9Sx4wy/LIDB
	NdBNGvDFf40uCrFRYQRCA4vgQ7unQJaH6FeXNBrxc43kOpwIyGmI7M8CUUtcQPID2JQMmrGRKGm
	lZBdlki3PIox0p6gccw==
X-Received: by 2002:a17:907:c0a:b0:c51:5589:31dd with SMTP id a640c23a62f3a-c5155898474mr1697622866b.22.1795774836787;
        Fri, 27 Nov 2026 02:20:36 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00cc21977260b4339d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:cc21:9772:60b4:339d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm44467364f8f.0.2026.11.27.02.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:20:36 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 11:20:36 +0100
Message-Id: <DN5X1UWDQQQL.TCAN20KAZLGL@smile.fr>
Cc: <openembedded-devel@lists.openembedded.org>, "Khem Raj"
 <khem.raj@oss.qualcomm.com>
To: "Khem Raj" <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 00/69] Upstream version check fixes
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
 <DN5TR7XMD64W.1WVHLUD7CNKRM@smile.fr>
 <CAMKF1srO2W8yWC5v_jOnk6VM37WJ3ct-GaYnEyTkUAKKGkPfuQ@mail.gmail.com>
In-Reply-To: <CAMKF1srO2W8yWC5v_jOnk6VM37WJ3ct-GaYnEyTkUAKKGkPfuQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 10:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133374

On Fri Nov 27, 2026 at 11:12 AM CET, Khem Raj wrote:
> On Thu, Nov 26, 2026 at 11:45=E2=80=AFPM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>
>> On Fri Nov 27, 2026 at 1:33 AM CET, Khem Raj via openembedded-devel wrot=
e:
>> > Fix or add UPSTREAM_CHECK_* settings so devtool check-upgrade-status
>> > reports real versions: anchor tag regexes to release tags, restrict
>> > series where newer major versions are separate products or rewrites,
>> > point checks at the current hosting after moves, and mark the few
>> > recipes whose upstream can no longer be checked as unknown.
>>
>> Hello Khem,
>>
>> Once these series merge, do you want to run the auh-meta-oe build?
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/47
>>
>> With all those fixed, output should be interesting.
>>
>>
> Launched one on my yoe/mut branch
> https://autobuilder.yoctoproject.org/valkyrie/?#/buildrequests/407006

FYI, it has a surprizingly small set of allowed workers:
alma8-vk-1
alma8-vk-2
rocky8-vk-1

That should be fine for a one-shot test but something to look at if you
want to make this a more frequent build.
--=20
Yoann Congal
Smile ECS

