Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E83877D81
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 20:57:27 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id y7so7778087pgb.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 13:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=j9ydz0kb0wcwicNCTILCx/Et0xr37+zWyv3/MWYTc/8=;
	b=RmkHIGJ5jWOcTPOE0ZsEmtGp53KokQKUSu60Z0JJVJigbk0ztClzattnAS3vgiLe80
	X2Athdv2HxSYIkprU9fTAIu1vcFXORwB1UcEyeg76JyghN1n88uFbP2HEeyBb7OumH9v
	QpQ4uv6eKRM11DX5Eo6Jhr97Ljszy8waVCJHIEp364SQK5p2+oPR2gzUgRc5M86LGVtz
	uYzq1UUaiZMSdlUAiPHgqNT4gjIxCEkVRVmu0ud4w/UyrR/WEU/ZEHhORbaUfpgdA8Nc
	hL54i0z6FsYINqDlQH3dpgZUuqpoHMiS6SJfvWoYVpsaKZ3daYzPOffF6hPEoSmYEqrC
	l2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=j9ydz0kb0wcwicNCTILCx/Et0xr37+zWyv3/MWYTc/8=;
	b=I9vlFYLkjT2TW+pi7HYRrdwdx2gnuRLmqVEAVd6uUX+W9o7T9FKAesXkMO29pgwNmK
	VGK9xPmemkZ9ir5MgP9TGfp6c1YY+06ztsoh6WQTo1/cEMk/OYQeNzPV2JWL658Rel/O
	r2hqnZ+WJi4P6J1G8K8WhC7LWOI2LTLOdrGOnrCMvFqu6quuuFQZmXmoT8oJJXC/hHKo
	fRDzmlPbdw5kR8Mp4EGUekwSWfn7air6Zh1H1Z6wcgHZQH1PUGSY1jKURvfLFWdc1vqh
	ul1Fm9R2qFZBvHuo/6Fb+8YVPVgoEFgaB+4fegI3iFZzzpsHwClxl6p6SrLuKuUuYvYA
	FsNg==
X-Gm-Message-State: AMCzsaWi1c3uYp4mtmgwVrDagchdyflMHhc9Wd184BzD23bX82s5jDGI
	CKM07ZymQ9xb3zL9069dg5cV3A==
X-Google-Smtp-Source: AOwi7QBY6RZ553otrksxKjiNcEsR53TrCKnFSrkoG98hcoWqRv2uee+qx0e5//57q66eL5j+o9Rarg==
X-Received: by 10.101.67.73 with SMTP id k9mr9064352pgq.188.1508187448894;
	Mon, 16 Oct 2017 13:57:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:8194:6b43:14e2:94fc?
	([2601:202:4001:9ea0:8194:6b43:14e2:94fc])
	by smtp.gmail.com with ESMTPSA id
	x4sm14768559pfx.124.2017.10.16.13.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 13:57:28 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>, Mark Hatle <mark.hatle@windriver.com>
References: <20171016164336.150658-1-mark.hatle@windriver.com>
	<20171016181421.GW9221@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <795c3189-db80-f81d-ce03-48bf93bed653@gmail.com>
Date: Mon, 16 Oct 2017 13:57:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171016181421.GW9221@denix.org>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hostapd: fix WPA2 key replay security bug
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
X-List-Received-Date: Mon, 16 Oct 2017 20:57:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 10/16/2017 11:14 AM, Denys Dmytriyenko wrote:
> Can we also prioritize backporting this to older releases as well - pyr=
o,=20
This should apply directly to pyro as its the same version.
I will wait for this to land in master.

> morty?
They may apply to morty=C2=A0 as it is version 2.5 and this against 2.6.
>
> Armin, Martin,
>
> Do you need separate patches submitted? Please let me know if you need =
help.
pyro no, don't know about morty.

- armin
>
> Thanks!
>



