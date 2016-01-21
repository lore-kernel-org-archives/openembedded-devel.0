Return-Path: <koen.kooi@linaro.org>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 051E1731F7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2016 07:26:05 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id bc4so18229514lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jan 2016 23:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=Y3zdfHmTaM7VnA61Po9PgplEpAYzf2uhfU9w+pgpYCA=;
	b=ZldfGPeMAU0PjcJxIM7ZsZBLQrHeFkcWbfufYoRNT3lp8KlTClTapp9tpEczZcVV0A
	mrdZbBZru0BPQ7PDeeX0b+ngPjK6fG/dVtpHFz9TZ6q8nUEXk1XXBKIboTcK2BKmrCH9
	Eeh69U21H7UbNk1t1CN10+Z2feSqUvMsYQunM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Y3zdfHmTaM7VnA61Po9PgplEpAYzf2uhfU9w+pgpYCA=;
	b=A26oeLSPLuApIr1wFNWe6/o4ilRsW7P3fp9Vcz0a79nXWzubpSKdbq/+JAWNJETfK5
	Dpf9TyZTdVaEic8IZKlarkLOS3xzPYMING29WeWlVwvGmell4huvlBHPRBKoSao9ryLg
	kzyDlpxNkGVpq+4R/sLAyKqGgvL48dMJfOGuNt00Ny2yrRDDCpzYWnN8UH4PdkKPQyec
	U9ap0cA2mRAh/ZUY8xhiku1y8AWhg0IhFkXLLuyIqQbHKS/0t5k8BYGmLei71qhdrNHf
	7n2yMwdcOmMA4UfxHyVYvt0eaiYUxoyz2qefL4Uit2cTYqOMABqarpQiMaMmcEw18uXT
	pYdg==
X-Gm-Message-State: ALoCoQm6Ob3oTeM8fBcKlz47C6X/wewr7gCZof/A/+VMMA62GdwILMHWR/9VUSrkQj2LhE+Vi+HGvWAEaiDIaAOrFLYONxE1K66VLjz/CwJ4cFnI/E86EJI=
MIME-Version: 1.0
X-Received: by 10.112.198.72 with SMTP id ja8mr14850327lbc.142.1453361164964; 
	Wed, 20 Jan 2016 23:26:04 -0800 (PST)
Received: by 10.112.204.200 with HTTP; Wed, 20 Jan 2016 23:26:04 -0800 (PST)
In-Reply-To: <CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
	<CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
	<CAP0W-R=5hbP28cT+phygoRcQ9qr5NUYdX=fRZBVaDPf0b-Hsxw@mail.gmail.com>
Date: Thu, 21 Jan 2016 08:26:04 +0100
Message-ID: <CAP0W-R=4t0Ah2ucP5gShOD8SRaO2Jk9tdJ6N7yF+8rv4K34p0g@mail.gmail.com>
From: Koen Kooi <koen.kooi@linaro.org>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	Martin Jansa <Martin.Jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] various: delete qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Thu, 21 Jan 2016 07:26:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping! Can one of the two patches to unbreak parsing go in before the weeken=
d?

On 11 January 2016 at 09:51, Koen Kooi <koen.kooi@linaro.org> wrote:
> On 11 January 2016 at 09:08, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
>>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>>> ---
>> double efforts? [1]
>
> Looks like it, but [1] doesn't show up in
> http://patchwork.openembedded.org/project/oe/list/ :(
>
>>
>> [1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-Janu=
ary/105406.html
>>
>> Andreas
>
>
>
> --
> Koen Kooi
>
> Builds and Baselines | Release Manager
> Linaro.org | Open source software for ARM SoCs



--=20
Koen Kooi

Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

