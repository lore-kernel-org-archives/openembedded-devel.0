Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id D80CC785DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:11:03 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 123so3913480pga.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 14:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fl0mPj2jQGu99Z123Dize3QJOJ9xxBm4BQpa9uYqQKo=;
	b=juGjGROMTvjiXC1cUUUHXizbiiXVT8aE5Ji5VGbEJAduk6ihWAf2TaJed6rWHuPuRb
	A49KtOLrQQ3nDC2PJjLr1KvXOPOKK0hmehMpjV1oID+ajs+nTYazokqKlQmUJ4p2EsXh
	NNCsf4MDZVVsFS8hLnMvkRHVlB66R3qz12IxzrbxV7tU4akAyPPbvik4fndA18QrwM4f
	eilCRAPCahM+VyYfheM+jvoXZ0zjk+TD+7Sgfqehk6X6TqOeuqTS6xxaT4wuAeEJHpyq
	1BG/w4erruNv9Sr13bZ7GmdCs//nUdRE6aNBqqNyibQ3jD09NRRMp3gpi3sYvCsDPbb6
	vsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fl0mPj2jQGu99Z123Dize3QJOJ9xxBm4BQpa9uYqQKo=;
	b=GYht7BFPfRBLTOXntF6BoxAkxsCHuWT4iuFx5dVsaDRuCw5aSj5pst2IGpuidCfZ2A
	R6utr4TJbJDxErh7PwViVfoJx2dBbDEYGLhU/lJtmbPFtT/Z39Sv7xrMt9lsAlUqG0gH
	W6MNkOT28GwX8fEmttwDdLW9kQUwSUR91q5ea65L2eM214tDnUcbS83L8kLJxFOY/7OG
	dpcKs4ElYrSAhD14/ZUpRXxoUN8ix8kgC63Ww7NRiaQ5mM1CsTpZV+0qWM5h9PCwiaQW
	+Wyl1cv7D6Inxi4EboX6Hh46X8znpSnUmwACflZL/YH61y9ZaV/YuubhS8+F2ZB4blBC
	klbQ==
X-Gm-Message-State: AHYfb5i+LtdCtmFz0EJcLhpO7hUVYfg+I0pB3v8SKLizdbiGF7heBudC
	bIk0an7rJOsd32/WZduJPf+fFrDmoA==
X-Received: by 10.99.3.197 with SMTP id 188mr17240967pgd.288.1502485864998;
	Fri, 11 Aug 2017 14:11:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Fri, 11 Aug 2017 14:10:34 -0700 (PDT)
In-Reply-To: <CA++8a_C-ysEbJ2dd0NZr8dvW8hyED0tthR3E36jhMmcNnw96Tg@mail.gmail.com>
References: <CA++8a_B59JkA14c9aN531E_HZN64ig_kDY_m_oNzcbEt39-hBw@mail.gmail.com>
	<CAMKF1sqx0z62dbQtQQZHhiDU1_0gjrzSfhOacsmBVkP5ehariQ@mail.gmail.com>
	<CA++8a_BLciSLffmy_MyxyeSEWCX+07BkiQ4u80Rz+upJ1rzBdw@mail.gmail.com>
	<CAMKF1spBau=OW8iA2K=ULnkZ_fFvdiRupDsPeiL8bPhPfms2cg@mail.gmail.com>
	<CA++8a_CQEZBUGm_u04cA1EddT=QnMxgWqEY8ZJGiVrTnbaKmoA@mail.gmail.com>
	<CAMKF1soVgTtENN2DG_ESg02coXAtjzuWn=jMt3ydhz_HdLfXbA@mail.gmail.com>
	<CA++8a_DgbopF2ssWZpNN9kgRiJyYS1gEtf4FuggBevsp=rL1tQ@mail.gmail.com>
	<CALbNGRT1bnpRLb0L4hok3UV8Qci9MxVTByWL5T-WGiP8D1gFow@mail.gmail.com>
	<CA++8a_C-ysEbJ2dd0NZr8dvW8hyED0tthR3E36jhMmcNnw96Tg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Aug 2017 14:10:34 -0700
Message-ID: <CAMKF1sqD03a6WjPYf1kxc1EtRjMQuTSkuswyNW5kn2KGE-irBw@mail.gmail.com>
To: Diana Thayer <garbados@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openwrt] Issues adding layer using readme instructions
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
X-List-Received-Date: Fri, 11 Aug 2017 21:11:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 11, 2017 at 1:13 PM, Diana Thayer <garbados@gmail.com> wrote:
>> 600-shared-libext.patch does not apply any more. It is part of
> meta-openwrt [1]. Have no idea what this patch is trying to
> fix/enhance - Khem?
>
> This is still blocking efforts to build with meta-openwrt. Any ideas?
>

you can disable it for now. It will need forward porting to current
version of iptables
which is preferred solution

> On Fri, Aug 4, 2017 at 5:04 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>>
>> On Sat, Aug 5, 2017 at 1:12 AM, Diana Thayer <garbados@gmail.com> wrote:
>> > Great! Here's the PR <https://github.com/kraj/meta-openwrt/pull/22>.
>> >
>> > Attempting to run `TCLIBC=3Dmusl MACHINE=3Dqemux86 bitbake core-image-=
sato`
>> > still fails with this error:
>> >
>> > ```
>> > ERROR: iptables-1.6.1-r0 do_patch: Command Error: 'quilt --quiltrc
>> >
>> > /home/garbados/openembedded-core/build/tmp-musl/work/i586-oe-linux-mus=
l/iptables/1.6.1-r0/recipe-sysroot-native/etc/quiltrc
>> > push' exited with 0  Output:
>> > Applying patch 600-shared-libext.patch
>> > patching file extensions/GNUmakefile.in
>> > Hunk #1 succeeded at 50 (offset 1 line).
>> > Hunk #2 succeeded at 87 (offset 1 line).
>> > Hunk #3 succeeded at 114 (offset 1 line).
>> > Hunk #4 succeeded at 123 (offset 1 line).
>> > Hunk #5 succeeded at 146 (offset 1 line).
>> > patching file iptables/Makefile.am
>> > Hunk #1 succeeded at 8 (offset 2 lines).
>> > Hunk #2 FAILED at 15.
>> > Hunk #3 FAILED at 42.
>> > 2 out of 3 hunks FAILED -- rejects in file iptables/Makefile.am
>> > Patch 600-shared-libext.patch does not apply (enforce with -f)
>> 600-shared-libext.patch does not apply any more. It is part of
>> meta-openwrt [1]. Have no idea what this patch is trying to
>> fix/enhance - Khem?
>>
>> [1]
>> https://github.com/kraj/meta-openwrt/blob/master/recipes-tweaks/iptables=
/iptables/600-shared-libext.patch
>>
>> Andreas
>
>

