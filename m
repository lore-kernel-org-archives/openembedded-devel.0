Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F58FCA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:08:06 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.71326.1756796878891740836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BBrGtveX;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3d17f24d42fso2060419f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 00:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756796877; x=1757401677; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h9A3WIolv70FX9XexMsIMdj1CwRh4U5nRXFPn9gX0v8=;
        b=BBrGtveXyK9hrMhbWrnobAtU3305hjrKYqX31vJ19UlnGCh7d4yPi5cj7EHyDu7neO
         /MxQ2yyl7n9L7afiJcdNzqXpXXS145xIkyWEEuDnI45WlGmZXePoh0cs/918zDUO7rB/
         eJrUBGxJT2BwOdzuj01cdlerTvcAvbliEijSm3YHeDaqapMnMSJkxVyJMGodWBfCLWaH
         B4353VZrh0eu7CYs3wFUoocTIIo3xu0wLdBHjJQHqI/G9RZNEaFMIFM5Hrq30KRCyH/q
         K6+D4MqP08XXl64uTCWdkI+qvV6vSVBoMH3UcX/U6khqMjQjer0NTNBceT4YImP8myVX
         vECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756796877; x=1757401677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9A3WIolv70FX9XexMsIMdj1CwRh4U5nRXFPn9gX0v8=;
        b=GNEH7mcKyF7Kekweb6WBh1rNxdYQjI4jVkGYRDSg67dZyZBaQeS8VaK51cgrO2Ko/J
         1Iz/sMDcPzgx6HRLKv2QA8gmYqV4GLRwBV3Y/yJI+67cPrMyVqWShjnHNx/5kxTRrUSK
         qiBinVpLt/na8ihsTgRxVxc1djZa51rwFjGSRMGfFEqnIuu4RMCMCOzYyyIBi+sDgcCi
         H8dCAWzEUY5YVNda084jLk0kH258joO7srbOjsPyqeUdbMgNO5RPSxMKnCr+HS8jzOz1
         zjWXm7uOO0RU6fqIrral9tWN7ZiM69ISJ2TaiAyanTPQF9kueSmLTK7H7ZcUm0oKQR54
         B6EA==
X-Forwarded-Encrypted: i=1; AJvYcCV38/LCcCUSZhIaqGmfwIKNHOI8ziN5QLe/+jyugspWb/n7eE1+DUZd8pSdludvSUG8xQ9PAHKo8p6PDqw9rBXk3GM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwB1oFr0nTDlayKAWVQYqaebeYSA0EsIDAf8rIcZA4Mc7tzXmrd
	nn61INThrJUtCkgsVjVMzztPXvT/byx2q8TW1oxDp6IGLfpJmOQwXADs
X-Gm-Gg: ASbGncvED8dDYa78wv9Yt0YF1nCwZiVOKvnAoS/N1SG5oP3mIhS1Z5U7vCTxTn3ZaoL
	fLgdfUYzF1lIz212TIaWL7TpfTcZOwF+ij9kh6vD6ORT997vzjN4foC+QZNComYqlb/udPkIaZp
	yxlkeF1CJlCaF3m0Y9Ea3Dm/07n056pVYiKaz3/cx4j1Itm0gHS1VaNn0RgROFkUISKTZq+bWtg
	5Zk7wlpFWzV0P+J3aBMs4ZijfkjamQTZjeLh0qZiEiMS4yHFJo/vT2Ppf8I/9csv1A0RVU6AuWu
	QDPKo7R78O/mvNA+x8D9ItmeTkiyBixPloEs7heWG3gnG4w6FmnoDDfToWC+g3siaTXRGASGN8E
	ApplZRHJOGQqHxvSqMHlEo+1aIky1NhR0jv4Ot8P80g==
X-Google-Smtp-Source: AGHT+IEOBZxgBoOYYsTLr9j3Ac1euXr1Rpi4crsGEb8FwCDrZ8ItK+CF5tSuU6gUaUGbLtqlb+0RKw==
X-Received: by 2002:a05:6000:2893:b0:3d3:8711:d951 with SMTP id ffacd0b85a97d-3d38711dd3emr7957126f8f.45.1756796877036;
        Tue, 02 Sep 2025 00:07:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61ded4749aesm4762781a12.32.2025.09.02.00.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 00:07:56 -0700 (PDT)
Message-ID: <b67a40d1-9e2e-46ea-8716-47c885bcf4d7@gmail.com>
Date: Tue, 2 Sep 2025 09:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [BUG] meta-perl: libcapture-tiny-perl-native installs into
 ${D}${STAGING_DIR_NATIVE} so Capture/Tiny.pm never reaches native sysroot
To: josephjamesmills@gmail.com, openembedded-devel@lists.openembedded.org
References: <CAKv13C+yecjvKL8OGsRqDas5J6kW--i+8vruei7aH9RwBPSb2A@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAKv13C+yecjvKL8OGsRqDas5J6kW--i+8vruei7aH9RwBPSb2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Sep 2025 07:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119168

On 8/30/25 22:14, Joseph Mills via lists.openembedded.org wrote:
> Hi all,
>
> I’m seeing a native-packaging/sysroot staging issue with
> libcapture-tiny-perl on current meta-perl.
>
> Environment
> Host: Debian sid (for reproducibility reports)
> Poky: perl-native 5.38.4 (meta/recipes-devtools/perl/perl_5.38.4.bb
> <http://perl_5.38.4.bb>)
> meta-perl: libcapture-tiny-perl 0.48 (BBCLASSEXTEND = "native")
> cpan.bbclass + perlnative.bbclass
>
> Symptom (consumer fails to find Capture::Tiny in native sysroot)
> A dependent native build (e.g. libunix-statgrab) dies with:
>
> Can't locate Capture/Tiny.pm in @INC ...
>
> In that consumer’s workdir:
>
> $ find recipe-sysroot-native/usr/lib/perl5 -name Tiny.pm
> # (empty)
> $ find recipe-sysroot/usr/lib/perl5 -name Tiny.pm
> .../vendor_perl/5.38.4/Capture/Tiny.pm   # target variant present
>
> Provider logs (native variant)
> libcapture-tiny-perl-native:do_install writes under an absolute path
> that includes the provider’s recipe-sysroot-native:
>
> NOTE: make -j 32 DESTDIR=.../libcapture-tiny-perl-native/0.48/image
> install_vendor
> Installing
> .../image/.../recipe-sysroot-native/usr/lib/perl5/vendor_perl/5.38.4/Capture/Tiny.pm
> Installing
> .../image/.../recipe-sysroot-native/usr/share/man/man3/Capture::Tiny.3
>
> So the file ends up at:
> ${D}${STAGING_DIR_NATIVE}/usr/lib/perl5/vendor_perl/5.38.4/Capture/Tiny.pm
>
> instead of the expected:
> ${D}/usr/lib/perl5/vendor_perl/5.38.4/Capture/Tiny.pm
>
> Because do_populate_sysroot stages from ${D}/usr/..., anything under
> ${D}${STAGING_DIR_NATIVE}/usr/... is skipped. The provider’s
> recipe-sysroot-native thus lacks Capture/Tiny.pm, and dependents can’t
> use Capture::Tiny.
>
> Configure context
> cpan.bbclass runs:
>
> perl ... Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 ...
>
> For class-native, perl-native’s Config.pm advertises
> installvendorlib/installvendorarch as absolute paths pointing into the
> provider’s .../recipe-sysroot-native/usr/.... ExtUtils::MakeMaker then
> combines those absolutes with DESTDIR=${D}, producing the
> ${D}${STAGING_DIR_NATIVE}/... install tree shown above.
>
> Minimal reproduction
> bitbake -c cleanall libcapture-tiny-perl-native
> bitbake -c install libcapture-tiny-perl-native
> # Observe absolute path under image/:
> find tmp/work/*-linux/libcapture-tiny-perl-native/*/image -name
> 'Tiny.pm' -print
> # Observe absence in staged sysroot:
> bitbake -c populate_sysroot libcapture-tiny-perl-native
> find
> tmp/work/*-linux/libcapture-tiny-perl-native/*/recipe-sysroot-native
> -name 'Tiny.pm' -print
>
> Impact
> Affects *-native CPAN modules that install into vendor_perl. Target
> builds are fine; only native staging is affected. In downstream
> recipes this presents as missing Capture/Tiny.pm (or similar CPAN
> modules) despite correct DEPENDS.
>
> Proposed direction
> For class-native in cpan.bbclass, pass relative vendor install dirs to
> Makefile.PL so DESTDIR=${D} lands under ${D}/usr/...
> (prefix-relative), which do_populate_sysroot will stage as usual. For
> example:
>
> #??? Conceptual sketch for class-native: ???
> Makefile.PL ... \
>   INSTALLVENDORLIB=${libdir}/perl5/vendor_perl/${perlver} \
>   INSTALLVENDORARCH=${libdir}/perl5/vendor_perl/${perlver}/${perlhostarch}

This sounds like an issue in oe-core, not in meta-oe. I'm not a perl
user, personally I can't really comment on the overall soundness of
this, but why not prepare a patch and send it to the oe-core mailing list?

>
> That would keeps target behavior unchanged, and fixes native staging
> without per-recipe hacks.
> Workaround (recipe-local, for those blocked now) In a
> libcapture-tiny-perl_%.bbappend limited to class-native, forcing
> relative vendor paths at configure time unblocks the build:
>
> EXTRA_CPANFLAGS:append:class-native = " \
>     INSTALLVENDORLIB=${libdir}/perl5/vendor_perl/${@get_perl_version(d)} \
>    
>  INSTALLVENDORARCH=${libdir}/perl5/vendor_perl/${@get_perl_version(d)}/${@get_perl_hostarch(d)}
> \
> "
> After that, do_install places Capture/Tiny.pm under
> ${D}/usr/lib/perl5/vendor_perl/..., and do_populate_sysroot stages it
> correctly.
>
> Happy to provide full logs/workdirs privately if needed. Thanks!
>
> — Joseph Mills (jmills)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119150): https://lists.openembedded.org/g/openembedded-devel/message/119150
> Mute This Topic: https://lists.openembedded.org/mt/114982249/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


