Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 428E67E53A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 17:49:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id s12so2305120pfe.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2019 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=C0nDdTEXZkRJP3YbIdTjxljK2JEoaQTctdpKPj64Vhk=;
	b=b/x6I9xzDib81F/qNLDwQWxM8vjLu0O5NFLh9GBtKV2HeNYJbetXL8G9z0JWNx8Knn
	7lUpFfD7pQES0w2aqscjkPZ5a6mlJxSyDCiiFYGt1HeNDWX1t1kVsFWsGgwsVoFk+BcC
	aZz6+V1zlKPcxZfsn3CuxPWv3JMjBzkjmjezDWmZWhooOZnKkZWR2xDzcA8M0oahAQOo
	w7DdCF25Nlj78yWgw1B6PtNs2qGKzU9wDcKk+Av/o1TdS2lvmbNi0OkTAhDgRGCbO3AR
	EqNygSNkQjoUtIwwh5jSz2iq5JYVNjoYXRzZUN7DkXcRXVkhee+ZyklH5AhGrjIP20IF
	LMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=C0nDdTEXZkRJP3YbIdTjxljK2JEoaQTctdpKPj64Vhk=;
	b=SwLpo7rCdXW0ai27/TrQrKyg+geXojWcmB4ta5eG8RUIr7481ex4fk/2a244RbQyyY
	Ew7FGjytrWnWtbOpqMpPt/lD8LRQEtE2jpeXNKWzOD6YbNk7ReG2GUpEgrpbXESYlgIm
	zpefNrfI+Vc6FMAj4LEaOlQzxEKmTkwhrJgoJ1ZP9OkBCAC/urBcxN0pXX5UoVaDT9df
	pDrzqLNu2xQQRMgLLb5IcvdYEwsR2sBJ87sHrs2mAzbEy3klzFXg1Ne2n56c+mtUet4P
	SOTZwXNwgya/5UthZfeNwYBn7/DEn0NbJ0Vzl41YSCmuwJT+uN4kq/JzRtDqQB6UZRa4
	9xJQ==
X-Gm-Message-State: APjAAAVo4/dB4MLolXb6llhn1C9WogVju3oEB7o5Ov8eaF/MI8ImfR5p
	G7jOdvYeZeHCMVzsnU1UCYSttjuf
X-Google-Smtp-Source: APXvYqwxMM0tfD/VW/ZHc7n9pJeyYy9CyXqxMsxpGcmSOhCZfNfniDAf5Eh066RvLdZe1VUqVeZ3bA==
X-Received: by 2002:a63:7c0d:: with SMTP id x13mr25960705pgc.360.1567446581942;
	Mon, 02 Sep 2019 10:49:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:8d1e:9a6d:fc3a:2e51?
	([2601:202:4180:c33:8d1e:9a6d:fc3a:2e51])
	by smtp.gmail.com with ESMTPSA id
	d16sm18615507pfd.81.2019.09.02.10.49.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Sep 2019 10:49:40 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
	<CAMKF1sqTednsK5Rvw+F-_wE_1x7GL=jP483T7HRsLNrwP6G-pQ@mail.gmail.com>
	<CA+chaQfCXcEy+Fy_KGLDMiyW-u6wAGcpZzA9MQS2t6uQ1M-cFw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <4f40b2c0-94e9-759a-7942-870567a7ffed@gmail.com>
Date: Mon, 2 Sep 2019 10:49:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfCXcEy+Fy_KGLDMiyW-u6wAGcpZzA9MQS2t6uQ1M-cFw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [warrior] 0/8] patch review
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
X-List-Received-Date: Mon, 02 Sep 2019 17:49:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 9/2/19 4:47 AM, Martin Jansa wrote:
> This PR is still only in warrior-next, can this be merged to warrior
> before the current PR gets merged to warrior-next (or warrior)?
correct. I have not sent a merge request. khem did say to me to push it
but I was not sure if he meant to mainline or *-next. I was on a two
week holiday during that period and forgot to follow up on that request
when I returned.

i will send one today.

- armin
>
> On Sun, Jul 21, 2019 at 4:48 PM Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Sun, Jul 21, 2019 at 7:41 AM Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>> wrote:
>     >
>     > Patch comments window closes on Wednesday.
>     >
>
>     series looks fine to me
>
>     > The following changes since commit
>     8d5dcd6522e9d15e68637b6d7dda0401f9bb91d0:
>     >
>     >   turbostat: copy bits.h from kernel to turbostat (2019-06-16
>     08:15:44 -0700)
>     >
>     > are available in the git repository at:
>     >
>     >   https://git.openembedded.org/meta-openembedded-contrib
>     stable/warrior-nmut
>     >   http://cgit.openembedded.org//log/?h=stable/warrior-nmut
>     >
>     > Adrian Bunk (2):
>     >   ndctl: Remove the unnecessary dependency on virtual/kernel
>     >   wireless-regdb: Upgrade 2019.03.01 -> 2019.06.03
>     >
>     > Andreas Müller (2):
>     >   gnome-desktop3: set correct meson gtk doc option
>     >   evince: add patch to fix build with recent gobject-introspection
>     >
>     > Martin Jansa (4):
>     >   ndctl: make MACHINE_ARCH and ignore from libblockdev
>     >   oprofile: make MACHINE_ARCH
>     >   oprofile: drop virtual/kernel dependency and switch back to
>     >     TUNE_PKGARCH
>     >   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS add lsb, busybox and
>     util-linux for
>     >     phoronix-test-suite
>     >
>     >  ...ove-EvDocumentModel-get-type-function-dec.patch | 33
>     ++++++++++++++++++++++
>     >  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
>     <http://evince_3.28.2.bb>   | 12 ++++----
>     >  .../gnome-desktop/gnome-desktop3_3.32.0.bb
>     <http://gnome-desktop3_3.32.0.bb>         |  1 +
>     >  ..._2019.03.01.bb <http://2019.03.01.bb> =>
>     wireless-regdb_2019.06.03.bb
>     <http://wireless-regdb_2019.06.03.bb>} |  4 +--
>     >  meta-oe/conf/layer.conf                            |  3 ++
>     >  meta-oe/recipes-core/ndctl/ndctl_v63.bb <http://ndctl_v63.bb> 
>               |  2 +-
>     >  meta-oe/recipes-kernel/oprofile/oprofile_1.3.0.bb
>     <http://oprofile_1.3.0.bb>  |  1 -
>     >  7 files changed, 47 insertions(+), 9 deletions(-)
>     >  create mode 100644
>     meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
>     >  rename
>     meta-networking/recipes-connectivity/wireless-regdb/{wireless-regdb_2019.03.01.bb
>     <http://wireless-regdb_2019.03.01.bb> =>
>     wireless-regdb_2019.06.03.bb
>     <http://wireless-regdb_2019.06.03.bb>} (91%)
>     >
>     > --
>     > 2.7.4
>     >
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


