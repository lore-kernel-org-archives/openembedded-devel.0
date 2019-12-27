Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5A37C7C410
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 23:48:35 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id v69so23468513ili.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 15:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H2J0v5vgf+ebGNReJKodx2xnaKbMIdUM2+66tnbRoLU=;
	b=rT5kpg1CgWNQr2r6DAlNnmNMNOY+trkQdtsVLHuHnFoBtt46sGKIS3i+rG28hRQqdT
	krGK58M3ecRPsZ+6zc0sdgLR234vCXmK5k23nVsVR24Il2dc4qFm107/hNyEDyXZnKSe
	IO+LjgcnputPDuyQ00GkA+9QDUgoqKoMuM9PyfaQkr6bNpibDzxHn+qgtXgR9Bp8FpZp
	7baK3SV1Rqi5/ADoWI9MlpiPdnmohrHVigAtSCFIMZsiKfPyWQgw6Ntsl6F/6Hbb4DXr
	xWvrn1hqWgl/pVFjpKIaCL6mFDXh3gsGjrtgCQeZdOBXZFntjT8l9Cndp5KZGyjvPR5p
	1B8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H2J0v5vgf+ebGNReJKodx2xnaKbMIdUM2+66tnbRoLU=;
	b=iu2yKU4pbCZARMZFJ6+HRisG6ozExiw4uv6XMWnegxVU2pFt7bWnHy2cRz8UTAnPP+
	XtgZMIZslxG7LjvdVKUGvi8m7orhjooC1z2V34iDKi5uqfZuJEpAZjVEI/MupLWZDxuR
	9JFC2zirK8R7S/giNWjz+hiscoLMtRQ11yOzE6sabaf8B++1oKVCYgu+0dLhTUNGadWF
	Z4WAVKueDWbnrOcKP64Qc01tk/iwKnG5RAxZC7xlcevmoZO0yzAFK87KOPKGjlmaLBvU
	6eUaBeaq9I9gwwOeS9F3BXN/jQ+/6ptHbq+BI3A2m6yU4+oxRU6LIxLAe9IsQxMqzrmm
	v6qg==
X-Gm-Message-State: APjAAAUUZ/+ALvRyFpj/mBpvSFwakva6ug76cWphYFbGvVIsj3zzRxNc
	11qq/PXnLDU8ET4kzDnBbLpMNkn0m2/1mq7NfUQ=
X-Google-Smtp-Source: APXvYqx11s33hdJ+I9OG3aL7ycEoImn/UE0Qf4MZx/wGgelgnbq57lCO6eu/BNHaOmx5r4kNaG1XVa1SA7X3354bxhU=
X-Received: by 2002:a92:cb09:: with SMTP id s9mr49592697ilo.224.1577490516211; 
	Fri, 27 Dec 2019 15:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
	<20191227213120.3930-9-schnitzeltony@gmail.com>
	<CAMKF1srAOXoEzu=0i0yyM8dZn3rLt4B1d-_9FRPTTEfexDZDqw@mail.gmail.com>
In-Reply-To: <CAMKF1srAOXoEzu=0i0yyM8dZn3rLt4B1d-_9FRPTTEfexDZDqw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 28 Dec 2019 00:48:25 +0100
Message-ID: <CALbNGRTeSi6X-osFwzjm1y8fj46Bmsmayemdscn8-f=+=-srqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 09/23] evolution-data-server: upgrade 3.34.1 -> 3.34.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 23:48:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 28, 2019 at 12:19 AM Khem Raj <raj.khem@gmail.com> wrote:
> I think version specific information should be in bb file not inc
we have a native build and it just builds some tools required. Both
native/target share same version which is set in
evolution-data-server.inc. So maybe I missed something but what kind
of change do you suggest?

Andreas

