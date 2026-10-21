Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1020.1792595399528096022
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 08:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V0BDh6Nd;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso1227836a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792595398; x=1793200198; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulCcnDRD6SPKjDan+th99Vq+qFFkmvhQKd5eiCe73eA=;
        b=V0BDh6NdUVS/MPiSNdYz0GwR1EodzhOHOYSgXg8IbMBZ39aoKbFYGWU4XH/hXQLwHw
         IbcWxW9zMWycJlKsfp1ThtBnko9JL8fgv8NDhi6YKhu8nJUIl8+wsgEtqO3knF6SM0Yh
         og6lNJxHWdGxyAJeew4K2igRFRoGhGw0Sw7Yrd9FZwPtgniki4j+IExPtNZIARMS/Hxt
         HbgX13kN0D26XKxIlHuDvZe6R4BoqtngnRR/wQLMErMucnO62qrCKTiV7A6POzuc9tGu
         8UiBvxHAT/1SK5fxghZT0txQL7A/pZgflvjlMRX3lVZJRlulTbcS6WBsx9QP+gz1dc9S
         DW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595398; x=1793200198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulCcnDRD6SPKjDan+th99Vq+qFFkmvhQKd5eiCe73eA=;
        b=yYpCLa3oLjhmj6kc4KIS3HmenxRc6bVv6ppo/QytrvuBnAFKeFncXZRK6Ez+MDk2SK
         aLEw/Y5/4wjia6u74HTnA0dXTvOqyaO+Uy0/U1CXbqYM/+hy8P8NrlixFsRq61OGYM+U
         OGcXdqgsqH1NPRESzWhxmcKX6Y5X1oWEt18DF+3ESXksDNMFivvpeKRBjpEMLLVBipFf
         pGsNt1iu8fM+Ko1X8XaQX4Cvh0LrLkIpY1grCEoVDqXFZCv57iFRXmOzDPhbINteqxDO
         18kF1qTtZWehIO7c3WYTGOr5m5OYlmMH7/s/pPuhQEeb5UJtGFDSi4FKtCMCyG4lJ85I
         zDJw==
X-Forwarded-Encrypted: i=1; AKwUvBzSkUa0Xdus4zDXrZiWqd0zHsCLErUGiBdaOQvH9jc8uZfZF5R56IPBlDp8CUTqylRrfIEb5EfZqkXvkrCjOwzfCSM=@lists.openembedded.org
X-Gm-Message-State: AFq9FYIM/tmrVAKJfAi39y8UCzKCz1s7lkpiSm4bGo/O2SiaCEGbU445
	NXnqfEBN0tdQz+AH97HVl1Y60isUzKXipZafS6lcyrz42u854ubYzq9B
X-Gm-Gg: AYBFou3e/6K4a2wo0rv9Xv2+nhcvkhXejEmYxKNX7j8hib1G9sQx0teLYY3JqwtjOMy
	nEatL23xbix2io+HHbTPYhmU1ETlgyd81dSZYlzR7x3puXlRhiBLtqqlwrinOF2FpL5/kfY+H9e
	GuoZ5f6XaTdD3Hq9OG9XrQfU708SraHGpzzYlq1IcEe/NPHicKbiqJJ44x8N3k7sQCifb6nNiOw
	K6uaB88L2u3z0mefNqgXot2oXnkm5kI3UP5ogy/vRDmd4wQSthyGWngTaWOMX3G5YJYd7gX6Bmp
	JK26fCHTlyTFn/EAlPq8a6LgFKd5IoCRTa6MbRdbUKVJSilmLYSEQ1uTVgnkoj63jp/Hr5YSZaP
	anLO6hzgpYb/ST+FivFqJhQAVJyhYq4b6zBNAC7F6opTv6/iyqN4T37QdrC+FJdTDE/n/14VBV/
	1nSpRLq6O19HOnaksvfHYTaQ9WLJoz32D7/xoStxXBu9BWwqFcqGzAmUuGYCltp6tZReBxZTKlI
	lOSkrykH0wc/mGH22skvdjqmsWLp8MkdQiSKhKd3Vp6UxG2Cl0KFyg61q58wZzad0gRcpQ=
X-Received: by 2002:a05:6402:4497:b0:6ac:813a:a1ef with SMTP id 4fb4d7f45d1cf-6b408ec79cbmr1519231a12.26.1792595397411;
        Wed, 21 Oct 2026 08:09:57 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from [10.54.10.247] ([154.47.27.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403167e3fsm954145a12.34.2026.10.21.08.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 08:09:56 -0700 (PDT)
Message-ID: <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
Date: Wed, 21 Oct 2026 17:09:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on
 configure
To: Marek Vasut <marek.vasut@mailbox.org>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Ankur Tyagi <ankur.tyagi85@gmail.com>, Khem Raj <khem.raj@oss.qualcomm.com>
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <20261021135357.14928-1-marek.vasut@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 15:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131302

Thanks for the patch Marek.

Could you please explain how you hit the issue? I can't reproduce it.
The sudo is required only for tests, which is a custom meson target. 
It's not supposed to be called during configure.

Slava

On 21.10.2026 15:53, Marek Vasut wrote:
> In case the overlayfs-tools are built using meson, a test triggers
> during meson setup phase during do_configure task. The test invokes
> "sudo", which may not be present on the build machine. Skip the test
> at meson setup phase. Tests should be executed separately on demand
> using "meson test" command instead, and invoking "sudo" and expecting
> it to work during do_configure is unusual.
>
> "
> ERROR: overlayfs-tools-v2025.01-r0 do_configure: meson setup failed
> ...
> | Run-time dependency musl-fts found: NO (tried pkgconfig)
> | Library m found: YES
> | Program test_cases/run_tests.py found: YES (/home/oe/build-some-target/tmp/work/arm64-distro-linux/overlayfs-tools/v2025.01/sources/overlayfs-tools-v2025.01/test_cases/run_tests.py)
> |
> | ../sources/overlayfs-tools-v2025.01/meson.build:94:0: ERROR: Program 'sudo' not found or not executable
> |
> | A full log can be found at /home/oe/build-some-target/tmp/work/arm64-distro-linux/overlayfs-tools/v2025.01/build/meson-logs/meson-log.txt
> |
> | Last 10 lines of meson-log.txt:
> | Code:
> | int main(void) { return 0; }
> "
>
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Alexander Kanavin <alex@linutronix.de>
> Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
> Cc: Khem Raj <khem.raj@oss.qualcomm.com>
> Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>   .../recipes-utils/overlayfs/overlayfs-tools_2025.01.bb        | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
> index 8583a0e2cb..3b5963bb26 100644
> --- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
> +++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
> @@ -14,3 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>   inherit meson pkgconfig
>   
>   DEPENDS:append:libc-musl = " fts"
> +
> +do_configure:prepend() {
> +	sed -i '/Custom targets for testing overlay function/,/command : .*permanent...changes/ d' ${S}/meson.build
> +}

