Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 731E0608B7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 14:00:15 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id t16so1548748ybk.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2018 06:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3JXPtJ26wV5RMPhrhGd+NY7av5M4NNJWU2O0nsCoe9w=;
	b=ud7i+cE9CiOERybl6EkYKimXANoa5I6b3Dv83WTdl9BxO+EUAu+7v7mc1ScT25g3lY
	ZHFbe1ZbE0i4pWRqjLfjIGiwhM2IEQxgv4fmHDqDWtNa9nViaN7D5jeMS+l8z8OSUdM0
	xntZALS9N7amF8mySQf2hfv13fXB5UBuORjlKHUaOXqMelUAkjJgCHbiHSyHm8SqJBYA
	ZEFPLIA12B5B6Gsp/95fO6AHD6m3Zoc45xQ2vaNuBSdy5twKtR+2a1EqmH/p1UbgmJvJ
	IXEQeHo6zJYQn72C1LKbfXtAh7rciaIkMTO/tKgW+gUb51iA9HaaUGn51ctORK2xERw4
	WMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3JXPtJ26wV5RMPhrhGd+NY7av5M4NNJWU2O0nsCoe9w=;
	b=YdRILtWCNldUb2lKqaRnWRJukhRi+/YJx8CBqJTXvT5J/QDWJkDeUA9tXlk/hJnAuG
	+Kserf/RPqURDjaS2PSNrYgekpf0I2M17Zy6oX5LjuavCe2YzOp6earOmJs3t6mfPTPz
	mmHBeiQl/Pqzrr9ZPxUj9PIFT0m9Xfe2WiMN7LEFlvcahtpSHDZNNrPAWzXWandy9z40
	JGMmqgcUYhJYkJuNNHmbU9XXzYTqtR8ZRWTGJxt6PMb9qLVdfeinzKkvpZKAKpmjZAsH
	/LDFrHiHG5YQCOIRT6ohDRAuJczjbTQJbSwSyBQB3nuMYxWZN1xAzickXQgHJo4WC0nn
	toEQ==
X-Gm-Message-State: AA+aEWaqj+tvWRTcMcLIetDDqBDZmAWJQsIrdkRgQiAca8CVGz2910kW
	UX5+jbCdQT3pq/2zFwDFKcEXY0BgUQkAx/rSn1Y=
X-Google-Smtp-Source: AFSGD/WZ3rp1DNR4wJzg7lUsc33MkEj/AFj0lLYwy/y/nHGi/uAfZenCrTgv9oaKx2Dd1swAE4OfqxpfKgaMniQpY5w=
X-Received: by 2002:a25:6e06:: with SMTP id j6mr6873600ybc.38.1545487216299;
	Sat, 22 Dec 2018 06:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20181003192455.24921-1-schnitzeltony@gmail.com>
	<20181003192455.24921-2-schnitzeltony@gmail.com>
	<CAMKF1spmLtb3TZn8UD8B=KDW6Y5mfnuMAc6tMbZado_XidGauw@mail.gmail.com>
In-Reply-To: <CAMKF1spmLtb3TZn8UD8B=KDW6Y5mfnuMAc6tMbZado_XidGauw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 22 Dec 2018 15:00:04 +0100
Message-ID: <CALbNGRTmsNYq1oQ0=bh+-FfoRDbk8AxibO+z9r2zmuN9qG_peg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 2/8] openjpeg: cmake fixes to prepare update of poppler
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
X-List-Received-Date: Sat, 22 Dec 2018 14:00:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 22, 2018 at 1:16 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andreas
>
> We applied this patch but its causing regression for mutlilib builds
> as reported here
>
> https://github.com/openembedded/meta-openembedded/issues/103
>
> Can you take a look
>
Will do

Andreas

