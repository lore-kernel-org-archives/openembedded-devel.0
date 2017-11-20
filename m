Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1223560721
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 18:08:48 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id o23so8381165otd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RoNvHERC/6D6D5VTzfjFFeaLrxkwUVBmYdqpGJDZfsc=;
	b=PIlip7gq/5xARdWmRrfSuic++g9bzk+eDxyPnnN9K5Zrj/ig0YkyEAO5YZB0doq1xn
	B2mhUW02YS0Mzb7e18IcV3IcVPJ9IAkKmgpcznt0Oc0D6w9fseQUPiUEv56Nvgyyo53m
	mlrN/bSAhN1N0UhXgjHKYq72CgWQn/7sSswI5L/6IeChxHkSIUUTpBi97+6V/U28qXTT
	oQKf3rWAuzvrnUWZSs4g45aBtfOVk1wIG/QHNb7iZbnZunT4NzWCtOkAVrXJxX+PXT63
	B0+bIAv5umJi9Td45LEzmWgM5u8KTvhQnWAyGzIl9l0cQPoNWEZ15qgkmgDk4hKMDTjg
	Ixfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RoNvHERC/6D6D5VTzfjFFeaLrxkwUVBmYdqpGJDZfsc=;
	b=lWoxfcq3CulI84AiuowKEuvOgIj3p5onoOP3ES/KcY/2sXmILewW+8LkwJQSmQuWnX
	HBl//0mIwP8q5RActkzXuafrgRoeq5Nh2eLsB/Hm91ypLB9wbehiRY5WSz6KRNTmhljA
	QfvNRG5lJtXK1BqpQUa6WnyU8ECYh4o7NQnHcrsKrxnxnLN1HjUeepZY+Ukzha8mtSyI
	AKTp7ID34DYi0ry9oT12UJt7gkGiUWIGnLMeHxkB36ogxm0c3OGVUHNNvfDMnjtdoroS
	9Pv61uX04oYoj9TdIys1TGF+GD8Uw3vJHxT+1DAJtPNz6FajqvuQdKjdvMC5PLyr53FK
	YXHA==
X-Gm-Message-State: AJaThX4YhqPIl6SJRAKe8i+xBMiNpUTLz+IHh6VE/MT0UCvj1G0i1eH8
	iU17/+snVC+INbsTZ1wEnk3HVgRs
X-Google-Smtp-Source: AGs4zMawOhNdPZ1tgFVuPf+uulFF7sqLlvvExvWWHZ8ITfky/9MBHDzVrzR/i6BRfsy2+5KcVzLnuA==
X-Received: by 10.157.82.153 with SMTP id f25mr8234171oth.97.1511201329640;
	Mon, 20 Nov 2017 10:08:49 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169])
	by smtp.gmail.com with ESMTPSA id 14sm3553492oth.69.2017.11.20.10.08.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 10:08:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id s4so8374507ote.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 10:08:48 -0800 (PST)
X-Received: by 10.157.34.200 with SMTP id y66mr8171008ota.276.1511201327983;
	Mon, 20 Nov 2017 10:08:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Mon, 20 Nov 2017 10:08:47 -0800 (PST)
In-Reply-To: <DB6PR0802MB2229E38FAD3DA1099AC3EAEE93220@DB6PR0802MB2229.eurprd08.prod.outlook.com>
References: <DB6PR0802MB2229E38FAD3DA1099AC3EAEE93220@DB6PR0802MB2229.eurprd08.prod.outlook.com>
Date: Mon, 20 Nov 2017 16:08:47 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqN74bNH5OipCfA0kj4TESGudmgkeMn26pqT_PgLPgj8A@mail.gmail.com>
Message-ID: <CAP9ODKqN74bNH5OipCfA0kj4TESGudmgkeMn26pqT_PgLPgj8A@mail.gmail.com>
To: Jonathan Haigh <Jonathan.Haigh@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Simon Hughes <Simon.Hughes@arm.com>
Subject: Re: [meta-python] broken python-asn1crypto-native dependency
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
X-List-Received-Date: Mon, 20 Nov 2017 18:08:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Jonathan,

On Mon, Nov 20, 2017 at 9:33 AM, Jonathan Haigh <Jonathan.Haigh@arm.com> wr=
ote:
> I have a patch for this - adding BBCLASSEXTEND =3D "native" to python-asn=
1crypto's recipe - which I will send with git send-email, although most of =
the other python recipes also include nativesdk in BBCLASSEXTEND so maybe t=
hat should be added too (I don't know much about the SDK stuff).

I had it in my queue, so I sent it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

