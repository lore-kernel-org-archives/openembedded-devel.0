Return-Path: <ticotimo@gmail.com>
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
	[209.85.221.174])
	by mail.openembedded.org (Postfix) with ESMTP id 786837CD88
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 17:03:49 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id k64so5801393vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Mar 2019 09:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lnkLWeyRX5WIlgL/W4XCKQg9uu/iqGr9AuiwOuiwBUI=;
	b=CGSNhvwCcfXczKYKljhljT9gQzoxbvyl87HRvOJq1u2Q1tsr+NG7kuZgJ5klzjRoxK
	Yau/Ry1OrFw0Y4a1NGZwww6IwFRQoj6xFCDKI7xKhTELCH7i5R6r3L1Z6Ps7ZhYMW8JP
	xatLs2Bl4zL4235hng0b5x2NlcrIcIOSAqQBGpXdSz4iZOqHEDKYrDEgB2hysbjv9i4O
	cff4JRfvtuGeJCCJvrQcEmeC817v4x2ySgHfseJnCjs8ETEW7pi1LmCI6dufsMdBPAFw
	oWRARd7wC5MQROr8xq8o1ELjPaOy4vDIPhtHZM6U9E71Yzx0k3tdN9HejPWz3NgK8Ikr
	NVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lnkLWeyRX5WIlgL/W4XCKQg9uu/iqGr9AuiwOuiwBUI=;
	b=pvhDq77n00TjjI0ln4gT4UseEfXkvh65bHb7zYSSqpvtYJVcHb73wppa861ZIHMxEt
	JjYu12giQA+f7GJJO6jKfjbJPIWhNjlJkunz07pv3aAjxmfd4yj0dF95z5il07N7pOd0
	yLjysY9jffIIcQkLJD4RJ9XlDAXb/Wrp+qNdSbS0Nom68T9ach3tF1B9k9420svEdrh+
	YCgGOivzDGupowtH1VexfNuqUW8sGwltsemchUHmOsoCsa2IslJ7aU8j0TRMlyg/QiNr
	bdbrvaLGcelw/gOy1AohLs4tyfOAIs3a2sSBCK9TDBMO7KQVZ2hjUqWG5KSsig9VAMmp
	r3wA==
X-Gm-Message-State: APjAAAUpDS0XPmGm0Y9g0+t646LN1NOrg80c3fuDV+9J2OVnP6Ph7BPO
	/G4dWT4pbabKjN/P9keZRwj5SowSm1dCX+xy7SU=
X-Google-Smtp-Source: APXvYqzOo1yoIrlHZeQxj9oTZgenZBJ+UvVLgzqItaRuVNril3wT010IS7bwPWmHx8Gzx8Ece4Q8TCcNXqO1OqBRapY=
X-Received: by 2002:a1f:cf47:: with SMTP id f68mr3299225vkg.70.1551459830153; 
	Fri, 01 Mar 2019 09:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20190225140010.19025-1-otavio@ossystems.com.br>
	<CAMKF1sr88He+DDgyaRWdabY8d0xuV5jM8faQgBSeYOCY0zpaYg@mail.gmail.com>
	<CAJTo0LZFz3mLSROPrV3y09L4ZTSZ5T+uO=8MRKmrReDoLLDf7w@mail.gmail.com>
	<CAP9ODKroyRVLaK640+UZv2idv3FnZ2NC8hgMqQDQU63f9-QQiA@mail.gmail.com>
	<CAMKF1sqbAFbXdeJTL=gtJU4QzdPwdwEW5R01gpnUx4OhB_YtjQ@mail.gmail.com>
	<CAMKF1sp61cfBXHTuPzMeQGfuK3SXv2h8kdDq5z1nAhC9_hUTLw@mail.gmail.com>
	<CAP9ODKoj1oH2CaE8jzd5kKz7mv_6sdD-R2YZC_uAK_ezyfHs4w@mail.gmail.com>
In-Reply-To: <CAP9ODKoj1oH2CaE8jzd5kKz7mv_6sdD-R2YZC_uAK_ezyfHs4w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 1 Mar 2019 09:03:39 -0800
Message-ID: <CANx9H-AzAqd2-3smeFkZuxViG9yvZ_5beDFqfvomNabuDJ7w1Q@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>,
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
X-List-Received-Date: Fri, 01 Mar 2019 17:03:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2019 at 8:55 AM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Fri, Mar 1, 2019 at 12:56 PM Khem Raj <raj.khem@gmail.com> wrote:
> > Can you resend this patch series, its missing in patchwork, so
> > hopefully, it will catch it this time.



>
It might be the =E2=80=98+x=E2=80=99 in the subject line. I=E2=80=99ve seen=
 other patches with
=E2=80=9Cnon-standard=E2=80=9D characters be missed...


> Resent.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

