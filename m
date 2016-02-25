Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f194.google.com (mail-ig0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6757D62136
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 22:11:12 +0000 (UTC)
Received: by mail-ig0-f194.google.com with SMTP id sv7so2239321igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 14:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-transfer-encoding;
	bh=neBihF3BXQjDy7f9yATSuyLLQ7PQ4GeAPUOwhTw7baQ=;
	b=wE6IV8iOvw5AZY/18ulJcU7jfcS+CqwtZG3Io+4SaVhLPEuEVIAVSLKvkA7qcN+xXx
	alXKQjPWTuWu3IJEFoVl6xQrGfHiZjqyR/1z58g7q1b+qekhqS/x1saQkpaTlTUfBlno
	mI1mMXNH28KrZm5/GkRYOQsezMrNnZYrMjLAIg4CbkcA/CZSjCvrmOjpz7kC8MF81An6
	f/5OSieXVH2KtbtjjS45TQSvYCNxPUwACOgEf+DW6SKB/7svZ0HM/LnFBHUYE8fWgQ14
	Rn68RYdoyl5Fddqr305wXriKg4HYimw/UtanAn9SZH6qfDY7aiwNEu9VwBUogeC4aKYM
	Q6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-transfer-encoding;
	bh=neBihF3BXQjDy7f9yATSuyLLQ7PQ4GeAPUOwhTw7baQ=;
	b=SHq4L/J7V9Mci3MwvNlj/hQjH/KjW2Y0RdgjPQ943kwhWKCR7DvS+kbcATjBoag/3t
	ezO3obMeczlbHULObPod//CfTU6lNJCT5CIV5j6IV7E82McMJT2x2lP6sqtEWY9Joqr5
	MCTXT6ueTkfrABqYqSimDskK45W4+XQmHfSVEP1K9BxLxA56K92AGRsnFfWzIsZf/oLg
	ztpM414nDn8yAG6ZoOA2HN9YU7HoCzKqZsW8u+MdlsEUfqp9oN0ICHdb6uwOz5suFCoF
	5lpiGCdLdsuz8AIpf5nScrYZLWKLXZA7Wt5DlScMHoo3E4YcUHJdn/9a2x2DT+3ndwxa
	N3gg==
X-Gm-Message-State: AG10YOQu6YYRn80nNC5ECD1eeJUzQC/Jy7eHkKtgiJ7nEfRMGzwFUg8uA4Bv6yI5ccXri8C7I2n+3hlViY2Ueg==
MIME-Version: 1.0
X-Received: by 10.50.160.7 with SMTP id xg7mr964790igb.64.1456438273460; Thu,
	25 Feb 2016 14:11:13 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Thu, 25 Feb 2016 14:11:13 -0800 (PST)
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B01CE5BEF23@COSNADEXC13.usr.ingenico.loc>
References: <1455099698-25946-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<1455112483-31048-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B01CE5BEF23@COSNADEXC13.usr.ingenico.loc>
Date: Thu, 25 Feb 2016 23:11:13 +0100
Message-ID: <CALbNGRQ=HqpiD5mDX4c5ArOixqLPaaeoGmeAD3Bax-E=GELMUg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] libopus: upgrade to version 1.1.2
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
X-List-Received-Date: Thu, 25 Feb 2016 22:11:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 10, 2016 at 3:31 PM, Matthieu CRAPET
<Matthieu.CRAPET@ingenico.com> wrote:
> Hi,
>
> I totally missed Carlos Rafael Giani's patch (2016.02.08). Please discard=
 this thread.
>
> Regards,
> Matthieu
> This email and its content belong to Ingenico Group. The enclosed informa=
tion is confidential and may not be disclosed to any unauthorized person. I=
f you have received it by mistake do not forward it and delete it from your=
 system. Cet email et son contenu sont la propri=C3=A9t=C3=A9 du Groupe Ing=
enico. L=E2=80=99information qu=E2=80=99il contient est confidentielle et n=
e peut =C3=AAtre communiqu=C3=A9e =C3=A0 des personnes non autoris=C3=A9es.=
 Si vous l=E2=80=99avez re=C3=A7u par erreur ne le transf=C3=A9rez pas et s=
upprimez-le.
> --
We are failing here currently as ne10 was not applied - so I get something =
like

| Missing or unbuildable dependency chain was: ['xfce4-games-image',
'packagegroup-image-full', 'mpd', 'libopus', 'ne10']

Andreas

