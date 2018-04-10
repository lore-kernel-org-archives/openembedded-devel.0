Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id EBF4474861
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 15:02:33 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id f63-v6so11448541oic.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Apr 2018 08:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=T89npmFMTaTYdH3XB/cKx0042gc8NUW0drE/Rdsm57g=;
	b=bnSsVONgAD4yzYyp7Ks38UXFDbA11NnpidV1szkQk2dN2ZDTkmN5T8ot9W768UX7te
	ODUmp4xi6auQddmnXl7YVg6n0q6zkcuuCCtC/s1Ae29QHzmeVGoDAYcMTVFTBi+RLfsZ
	F/z9xCsGS4Vo3cqL6OtbYN8B2R2a7pwES+38oAwB3SvCBNRmt3Nnq+dqhz8Z8vnMv7o9
	iFfMLsW3CPWNog2D1FfIyVgLzK+0OG1lGHtZG3Ph+KEKxvS2ZPvXFO/T9hJibD1CzY0P
	RGhu5uaJavp2IjeDezsXsfptEniAHeRUztFDxi/gPuFskJFcPRLYQM0vUc4dvLQ8XMbc
	T+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=T89npmFMTaTYdH3XB/cKx0042gc8NUW0drE/Rdsm57g=;
	b=WJSdBhByY7ILAET8I5HrxL2gcR3X+Ej7gNLmfzyGDhaqC3LLtza1qj+M28cYM/aniH
	1Zaup908bs2k2k6fFk04JuA6vcPZ4/xrrF5Y+/JShaTrs5ugoHZethSoAVmrXvfWKmuY
	SyrpMVy5zEkgE9H3r/7mxyl8KM40r4AgROmRUfEThfwAY/1D8ellZv9S84yOBrj+eviw
	8ye/Qz/19OkpwMJWFcfTl3W3IsR6+DtCnY778UEOhmlIX4sHPNc6XVzXfPQ6fiHV79GF
	/tXnnQKQV9TyMyW2q8VEQNWi09iAXlvAM+AWTpcZiSBxJBUSUfd4TMp8XB2dLwUrLIoH
	uRXQ==
X-Gm-Message-State: ALQs6tCloNRRyMJdNqQD4peAXAAkN2Dqaep3GNXFZagMcgzYtuEHC9Z2
	NbPk1VAWd/Ut/wVmi45TdlTPgAoDuNWaF0iYKC0=
X-Google-Smtp-Source: AIpwx4+qfbM/MduP4ncYUOSNzEfrBNAtUcn0ubIWneZQUDqKdPuLzUznpgH3UBGCGaOgv1AaizEKEqtfKvrscJOISOQ=
X-Received: by 2002:aca:af0e:: with SMTP id
	y14-v6mr535769oie.224.1523372553311; 
	Tue, 10 Apr 2018 08:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Tue, 10 Apr 2018 08:02:32 -0700 (PDT)
In-Reply-To: <4bc04e65-e5c8-7a7a-5731-72afd624b0c3@gmail.com>
References: <20180409220249.11796-1-schnitzeltony@gmail.com>
	<20180409220249.11796-2-schnitzeltony@gmail.com>
	<4bc04e65-e5c8-7a7a-5731-72afd624b0c3@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 10 Apr 2018 17:02:32 +0200
Message-ID: <CALbNGRTJF5vpgvoY71ag7kcF-+-qSvsgw8JaRU-GnOMokpUHsg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/9] networkmanager: fix gobject-introspection/musl and cleanup
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
X-List-Received-Date: Tue, 10 Apr 2018 15:02:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2018 at 4:53 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 04/09/2018 03:02 PM, Andreas M=C3=BCller wrote:
>> This adresses the comments for recent patch which updated nm to 1.10.6 a=
nd is a
>> follow-up for [1].
>
> There is a form of this  already in my stagging/master-next. Should it
> be removed and replaced by this one?
Please replace - with the first version I introduced a parse error!

Andreas

