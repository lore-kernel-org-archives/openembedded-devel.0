Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 53E82607E1;
	Mon,  9 Apr 2018 22:40:20 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id d19so7179637wre.1;
	Mon, 09 Apr 2018 15:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fUHmp/pd7c57JF4Cr4G19b6PBoqjb8hoXr1jtwLEp+0=;
	b=vVsvUoqdfu4F/D9lGg11l5k15WQhvKCXbCSlfprGE8BUQGeUzNwsh5digcwwvHlEed
	Vt4KjL5SJ4OdoUnWHqWFTgxxQoY6ZgtpFugrRS3w7Rnby37YRAOxGtz/1wtDo0WxOPpm
	u0CLJGOWLouuoUm0sZUzWbxURat9mG4n3F28XtnQLtTU9RpQ0ZQCCRy0O0NiNNCCjOhX
	rzjrNum/e5Vqj7gQJ2pzBmF61anaoXUARVlx8c6tP0hZMZZ+gMmMGikefsAS90yqKOfR
	7d1dCEbJf/vOb4hYDPB+/y/1Hzt1UvN1xFJNLIg6hRsA+2Z03WTonPvtERJ30m60Kf+X
	sIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fUHmp/pd7c57JF4Cr4G19b6PBoqjb8hoXr1jtwLEp+0=;
	b=ul/mGHba3eDgOGR6mLHXcGnplek8HeCIiGkH6WpvGIDqwULOXkrRCmh9zl7lFS/yaf
	NJdFYfdOQMNTR4e6YZ99+J/8FVuCcOnHuBPebhI1vfa2bbmx+PxKDfHCq14u24suul1J
	w3f4EqZiJQfp6ToFxL6lTmoLnlQFJYME1DrhGWOJzwXiJ4EtjIuxXA4wp1MMr11o3usI
	HEKcmX8mlXK7n3H0vI068NhPBpt3MLEzm4tFK+TiQ5a9lZsTnVLk7nNaRiELx0YfT3v6
	tYvJcJUZip0Ro6pZ5/l7t2lxaZutmSUyHt2j9x2IR4mA5ILfWdNYOmm14DWoy8keW6WB
	9lQQ==
X-Gm-Message-State: AElRT7GCUVNQXkUS4L0Gprg27fX/NGMmQ9quIHopynrU8cTtBoIE+hWz
	AhOCb6W+Ja/OA97ZjREwjFL8lWqJPtCc83VuPB4=
X-Google-Smtp-Source: AIpwx4/q3Emir6nayfUBIxK8s8oi6f88nCDeM5ukn2XBHe4tmvayiNbsFEGQN/ldqjStR2bMUOswRK36Ek3yGafPjeE=
X-Received: by 10.223.142.13 with SMTP id n13mr24723549wrb.133.1523313621718; 
	Mon, 09 Apr 2018 15:40:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Mon, 9 Apr 2018 15:40:21 -0700 (PDT)
In-Reply-To: <CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
References: <152313690992.11940.6799878390820377002@git.openembedded.org>
	<20180407213510.474412329D5@git.openembedded.org>
	<CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<CAMKF1sqJx2er+dqsuESsw_ooxh59pvx5547JyFseBdK0Fjycvw@mail.gmail.com>
	<CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Apr 2018 00:40:21 +0200
Message-ID: <CA+chaQdDqmiSOxzx-XJrxfSvSDKx0r59NJgWU6_KiKzWfXiecg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/02: nativesdk-glibc: Split glibc and libcrypt to use libxcrypt instead
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
X-List-Received-Date: Mon, 09 Apr 2018 22:40:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ac_prog_cc_stdc on Ubuntu 14.04 where it was failing for me evaluates to c1=
1

On Tue, Apr 10, 2018 at 12:23 AM, Andre McCurdy <armccurdy@gmail.com> wrote=
:

> On Sun, Apr 8, 2018 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Sun, Apr 8, 2018 at 10:00 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> >> On Ubuntu 14.04 this fails with:
> >>
> >> ../git/gen-des-tables.c: In function =E2=80=98write_table_u8=E2=80=99:
> >> ../git/gen-des-tables.c:307:3: error: =E2=80=98for=E2=80=99 loop initi=
al declarations
> are
> >> only allowed in C99 mode
> >>    for (size_t i =3D 0; i < m; i++)
> >>    ^
> >
> > You can patch this to move declaration just above loop if that helps we
> > should apply such a patch for compatibility sake but I wonder if there
> are
> > more c99 assumptions at work here
>
> It looks like the upstream intention is to be buildable with c99 + GNU
> extensions, so explicitly setting -std=3Dgnu99 seems reasonable.
>
>   https://github.com/besser82/libxcrypt#portability-notes
>
> There even seems to be a configure check for it, so not sure why
> Centos6 etc get through to a build failure?
>
>   https://github.com/besser82/libxcrypt/blob/develop/configure.ac#L33
>

