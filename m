Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 168A4600B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:43:28 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m9so14786712qkl.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=+U0nzooghlzGLegKCu3P1Ljj25sNaxnkAPEpbnnxCOg=;
	b=BDen/gMzWyVvkOTWtOYa30zWL2ElcTb/FWLWrtuHjJTIJZaaiknQ55xoE2jf+vZIQj
	rQd+CflbD2oDv3erdOmAXeHie7D1eoGusxMlTi08+0Ml8OZbTjFxb123pAr/J2McBvQf
	3//GIWSKPvghfHHbliwNb+tLGFJRXxoxHEAzfVr5ZkGjkXAK6Lr+WbC5mvuc8c7Bap0+
	nlZze4wbwPxr04+PRxLfAQEQF+lBV790JgvpsMebbzTLif50POE/qPr/EqphLNTq45a8
	7tTe70BwbQQw65hft+PfO1h5nojgB9HbzCBwxLd8nee/oNe2b+mwelDqlXouH0fDe8yJ
	4GUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=+U0nzooghlzGLegKCu3P1Ljj25sNaxnkAPEpbnnxCOg=;
	b=nmWFQfeESWUMgGXYI845KYw1+EBUJoY+iZyE+Vf34vqculreXgUeW57w8FQ3Ky1ZmO
	anacq68Q5Es/g4rCaeVkGgiiA9Uy7jCTyyL3U26xifvT0ilwJsEAaLuHP0YNiooaU0xw
	6SpDZlzUJ8m+1ilUALxE4GYl9cXlkuFs8JC35zeWbOYNBs1zCKbq0+7ml67jzVM5DvlN
	iyXw9GEKyV/8A61CIsT7EChQMc7n148Qp7HUs1djge8sBe8YPv+fqJkdp9CoHMm2yIIK
	DvEM31ZmxgQUafr3PUsNOjFpupEJYzAZGdEtDH7YFW9jg+Qrr72uvQlX6NS5ujc19ei5
	LCjQ==
X-Gm-Message-State: APjAAAXiaDL5VUUyEzmsmGRWuoG5QfgdNfuJWVyc9fS7dhSmWIRXhGrw
	OnwLL5Q9jg+0qBKHyxEeGA00ZYciwIyZ5LkxsCg=
X-Google-Smtp-Source: APXvYqzSKdtE016O9Mz30svwtrXSHHlaOzmwOGCCtcmGuy6fjan16kbTPp0s/RDNGD/sFjBEvqK6SG6rZLOipqXD+GA=
X-Received: by 2002:a37:e10c:: with SMTP id c12mr4702865qkm.315.1551462209806; 
	Fri, 01 Mar 2019 09:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
	<CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
	<CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
	<CAMKF1sp61cfBXHTuPzMeQGfuK3SXv2h8kdDq5z1nAhC9_hUTLw@mail.gmail.com>
	<CAP9ODKoj1oH2CaE8jzd5kKz7mv_6sdD-R2YZC_uAK_ezyfHs4w@mail.gmail.com>
	<CANx9H-AzAqd2-3smeFkZuxViG9yvZ_5beDFqfvomNabuDJ7w1Q@mail.gmail.com>
In-Reply-To: <CANx9H-AzAqd2-3smeFkZuxViG9yvZ_5beDFqfvomNabuDJ7w1Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2019 09:43:03 -0800
Message-ID: <CAMKF1sp9r80X6ca2iN8ZxymDZ+1sDrAar9vZBA+JoqX8NToYVg@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Maxime Borges <maxime.borges@strataggem.com>
Subject: Re: [meta-oe PATCH 1/2] python-idna: Avoid removing '+x' from `.egg-info/` directory
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
X-List-Received-Date: Fri, 01 Mar 2019 17:43:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2019 at 9:03 AM Tim Orling <ticotimo@gmail.com> wrote:
>
>
>
> On Fri, Mar 1, 2019 at 8:55 AM Otavio Salvador <otavio.salvador@ossystems=
.com.br> wrote:
>>
>> On Fri, Mar 1, 2019 at 12:56 PM Khem Raj <raj.khem@gmail.com> wrote:
>> > Can you resend this patch series, its missing in patchwork, so
>> > hopefully, it will catch it this time.
>
>
>>
>
> It might be the =E2=80=98+x=E2=80=99 in the subject line. I=E2=80=99ve se=
en other patches with =E2=80=9Cnon-standard=E2=80=9D characters be missed..=
.
>

it still is missing. Maybe just send a github pull.

>>
>> Resent.
>>
>> --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br        http://code.ossystems.com.br
>> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

