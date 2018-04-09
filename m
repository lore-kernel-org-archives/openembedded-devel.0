Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0F47F74A37;
	Mon,  9 Apr 2018 22:23:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id w2so19380509wmw.1;
	Mon, 09 Apr 2018 15:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=584gcd1KgXWjHYtPA6kiM3z7s06tGCSEgUAmQm/pZtA=;
	b=r1Dqkm6jvJwKoM2lx4luVqgbkuI0WAmaJa5xXynD2PnndbLFt8q02hfmccyNT0U3YK
	x7aeEX0ISON7hbi05aMd5o8QNJFkJB/w9TdP2zOQIsn7JCgr3szi93+lfDt1AzgUDrDB
	3moQQwezqZFKVQzv4a5SJoM9ABGYoeEeqxKlo87C9ElF4edIexKF9myb+/0KJ4DCy1Ol
	buGCqr+L86nAI4mqu+M25P+3avmdas+V5oaed1Blx0rEapbJJl15u0+PFfVkrUxtCKfU
	W2EsDQWE3THRdHnreRxNWEuG4J+Tlr/nR7oKkjb/TEa4H3mwOd0l71uv5Yo8XPIG7H1g
	2tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=584gcd1KgXWjHYtPA6kiM3z7s06tGCSEgUAmQm/pZtA=;
	b=AuDJFUxEkEgaN/f0qYcqCCOPO42j7EYvKz0lqasNHNRrB/fZIMzbS1L4luzMtJS32K
	pwwUL9lmRz1S9SGz1ufAMs5/T/G0qaqW8s7lEJLugK2yeqgbbPXaYF5A4Bp1/du7W8d+
	q9/Q2+IaLCaOGQLHF/nTqFXN/QGIw1KOQtLyQEa68NeRcdcScOOsM73I+pPURQ6TAZ2B
	fVqyVdHRa2GulZzo/dZbTQTRzydpt5dciuJpuaCPErsNsVdiL5sMwR+1N7I7rWOAchEC
	VUlW23dKGf3bzYoLBa3/VjDuYtB3qPPWsCtQ9RiLkVVq6ZMkHGWE1EINmlVRTUSKBLhu
	AAeA==
X-Gm-Message-State: ALQs6tBxD5WpL0DozvjJSW8EXmEMapFvxYDw3zrmDtmlJfq/q4wqINso
	H168jvBrVFCVAUd4dfo8APZ38CCC1pYWvIxcQPU=
X-Google-Smtp-Source: AIpwx49PL2frr+cRf6Bm7k4vocJpLI2M46pOu6WTvzYEJ05jbLICikZT1uFZD4hyw74BHXYIt/FQNTJkKMvpSQm1tg4=
X-Received: by 10.28.170.205 with SMTP id t196mr29599wme.42.1523312625587;
	Mon, 09 Apr 2018 15:23:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 9 Apr 2018 15:23:45 -0700 (PDT)
In-Reply-To: <CAMKF1sqJx2er+dqsuESsw_ooxh59pvx5547JyFseBdK0Fjycvw@mail.gmail.com>
References: <152313690992.11940.6799878390820377002@git.openembedded.org>
	<20180407213510.474412329D5@git.openembedded.org>
	<CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<CAMKF1sqJx2er+dqsuESsw_ooxh59pvx5547JyFseBdK0Fjycvw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Apr 2018 15:23:45 -0700
Message-ID: <CAJ86T=U4f6OXG88uHqwg4URov+icap8B0ZFWOw_2uWoAx6oHqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 09 Apr 2018 22:23:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 8, 2018 at 5:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Apr 8, 2018 at 10:00 AM Martin Jansa <martin.jansa@gmail.com> wro=
te:
>
>> On Ubuntu 14.04 this fails with:
>>
>> ../git/gen-des-tables.c: In function =E2=80=98write_table_u8=E2=80=99:
>> ../git/gen-des-tables.c:307:3: error: =E2=80=98for=E2=80=99 loop initial=
 declarations are
>> only allowed in C99 mode
>>    for (size_t i =3D 0; i < m; i++)
>>    ^
>
> You can patch this to move declaration just above loop if that helps we
> should apply such a patch for compatibility sake but I wonder if there ar=
e
> more c99 assumptions at work here

It looks like the upstream intention is to be buildable with c99 + GNU
extensions, so explicitly setting -std=3Dgnu99 seems reasonable.

  https://github.com/besser82/libxcrypt#portability-notes

There even seems to be a configure check for it, so not sure why
Centos6 etc get through to a build failure?

  https://github.com/besser82/libxcrypt/blob/develop/configure.ac#L33

