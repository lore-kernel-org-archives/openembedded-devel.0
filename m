Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 92D7D7449A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 07:23:48 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id u189so9258779wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2018 00:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5UbRhHcobRIy+NIlUSCYppmqzflIgcVLyYcUatVizhE=;
	b=uCs/dgO1q8oM9L8MCiZMvRDPFso0CdLQzBtdWwN74vT5vYQ1GHgJq/Z/uB2AIEYSlF
	ziHeECFK++TSVuk2p8XniFyoWeF952nWEQlNnK0G5wDnWdlupCVlCgS4PZIY3wV+XGBd
	4FLNhhEbYnrkiYVJiwXHMbin7o+0XYO1sFe1n/Qm75b/DtvrKf32yUv7A2PUKunk2Cii
	rOhasYzAPkdBuEkH/kYmgBjoDdRB7zyYETCespaEFTGFAw4YmiFZhEUIszCii7S8apXf
	Xzl5TZkwrtZXWa95HpUsV/pw8t/sJ2lPM+1yz+iUfCDUxfb3vZQ9JM2UFtDC7z9FHhvh
	8q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5UbRhHcobRIy+NIlUSCYppmqzflIgcVLyYcUatVizhE=;
	b=BZUdZPH92vywhCW1vIerAUxjP5aCLk7Gd0xzO0eROE7sP/NN2nx2KbNULb1V61f1rB
	wxL6ZhjKJK2Az7LPxqWdeC1aT/75xEL4AvLoVqmJtCz/XkVTVxpLKKLDiqQZlHdLVLMK
	Vc0a+5EwZDOIRAX99D5ggW5dIEHUUhsm5Hvskw0zKmNMsB0i7/XVQdRh6h7cKZgzT6RE
	Lkj+JuPW+XWXafAH7I+jN0Laa9hXb+CWIO2Ep7ghQsVB6m2reZb0uMB9+Ok6fhxTzlT8
	/KmEC6cyI/hDBPP3b9CRvhChwr7GCcm/IJYS0wdPEr8bQJ0QZjahD5i8cQmmc7YIw19q
	g3iQ==
X-Gm-Message-State: ALQs6tDTuptXKIG0qbiNkM/uDpKTF+/fOdFu7yYb/+jhIr0Ukd/BknXi
	AvN5qNB38m+G0k3xuH/6G7Hoknz1tlr3u/g+atM=
X-Google-Smtp-Source: AIpwx488zdELcDKgMeHNazGe+wd/kSgXEENjrF9yUN3u3KWeqQekW7Bgq6ltbvrijp1Dihyqy3rZZ7M9zy9vZPgbkt0=
X-Received: by 10.80.195.6 with SMTP id a6mr13975613edb.178.1523517829111;
	Thu, 12 Apr 2018 00:23:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.157.197 with HTTP; Thu, 12 Apr 2018 00:23:48 -0700 (PDT)
In-Reply-To: <34fa43b4-67f5-5de1-effb-0caa473061d6@gmail.com>
References: <34fa43b4-67f5-5de1-effb-0caa473061d6@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 12 Apr 2018 09:23:48 +0200
Message-ID: <CAAQYJAsmkFk3n7R3=wfLXv7KjKXsbSVy8wqKJzMXN_wQMvazMA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of the world, 2018-03-19
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
X-List-Received-Date: Thu, 12 Apr 2018 07:23:48 -0000
Content-Type: text/plain; charset="UTF-8"

cut...

> === qemuarm64 (7) ===
>     * meta-openembedded/meta-filesystems/recipes-utils/aufs-util/aufs-util_git.bb:do_compile
>     * meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:do_configure

I have update the recipe to 2.0.16 as in oe-core to get aarch64 support

https://github.com/LinuxPDA/meta-openembedded/commit/33f38283b5f811df4fea0876e35d5ff08fa000a7

Almost done, now build fails because net headers...
    warning: implicit declaration of function 'if_nameindex'; did you
mean 'ifr_ifindex'?

Khem, should we add these missing bits to klibc?


>     * meta-openembedded/meta-oe/recipes-benchmark/libc-bench/libc-bench_20110206.bb:do_compile
>     * openembedded-core/meta/recipes-devtools/glide/glide_0.13.1.bb:do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go_1.10.bb:do_package_qa
>     * openembedded-core/meta/recipes-devtools/go/go-dep_0.4.1.bb:do_package_qa
>     * openembedded-core/meta/recipes-kernel/kexec/kexec-tools_2.0.16.bb:do_compile

About this, we have seen the issue are the security_flags in world build:

-fstack-protector-strong  -D_FORTIFY_SOURCE=2
-Wformat -Wformat-security -Werror=format-security

I'll work on this after having fixed the former...

Cheers
Andrea
>
...cut

