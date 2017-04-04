Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF5F772F9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 19:54:05 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x124so7665640wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Apr 2017 12:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=QgCTPuv2gzUUKky9nuM9prukqXJoJtC8c6Ox9OYvhJ8=;
	b=WEl1Zis5M3k2J+W/c3G5XPvuIfv8plgTmH3zheYJoHMy8c7Iy2EEPZ7XfX1bx0AKfV
	E3rb5pZazW0mWnRQiRP81/tEnPr++hgJLDXkPWYZluRwl34jGCqUSZhFc0jh1h5mVN6E
	tU8D376aL0aI0OgO5/AP3zH4BcbMMi4GZN4b9pKHUCFa5Zw04VhFqviW0M0MfWX5cT55
	3ls0edLkGrk6tG29gB2dGnzJ/qnyP6DTmXeo/3bGI1REtA2yihLqtm5ZkdYe5SAcjtd1
	/t5HUAoITDLzVkOBqZnB1ZzXob9ztZwk6kmTiKa6mjjrJ/OnQk2MBm5jj4hN3k/QaDU3
	O+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=QgCTPuv2gzUUKky9nuM9prukqXJoJtC8c6Ox9OYvhJ8=;
	b=tJUkH2eBt3pYt8KRb+YZb2k4xCz9zmcLliuhb8T6+ryv+XgjW5InbW8D8KiiCweP85
	cdvcoYyAHYGMtbZHH41d+cxk5tOqqKHpWfsCrZ0gGGilHbfsod05xAbr3gIBwR+CNvcS
	zErmMEI7O5W6dSR4X/9fc1qBGiw8N5huP012ZuXsh22oxOWySWRAPOVvPyFmUkUsner4
	FYzKkE3EHXfi10MG3FUIFOhBJfZz5KoZov5no5LouyqgNog64+1TYOzMZS8zEHsW2cgN
	HhNWG+ekq0hasj0Cd51TV9ZcNkXUlZKj+ASkJXfPZF39zVV3bOzoEzCYuZewXZojqmPz
	UlXg==
X-Gm-Message-State: AFeK/H3vVkejFH6LiqrARDpxEYD3U082LKQhdoyGJ1IG5HAQsASrNHHY
	lBf7Wnxclf7ktJvZV7kPZmpA8h8+bw==
X-Received: by 10.28.71.87 with SMTP id u84mr16220688wma.101.1491335646089;
	Tue, 04 Apr 2017 12:54:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Tue, 4 Apr 2017 12:53:35 -0700 (PDT)
In-Reply-To: <20170404153524.GA23716@graute-opti>
References: <20170404153524.GA23716@graute-opti>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Apr 2017 12:53:35 -0700
Message-ID: <CAMKF1sr5rR2kkqoT-o=5ZaivGAKpanX10KSYdHtcwQqT7+e7jg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] problem with unbound dependency to libreswan
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
X-List-Received-Date: Tue, 04 Apr 2017 19:54:07 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 4, 2017 at 8:35 AM, Oliver Graute <oliver.graute@gmail.com> wrote:
> Hello list,
>
> i'am working on a libreswan and a unbound recipe but im somewhere lost
> in the include and dependency hell between unbound and libreswan.
>
> perhaps somebody can point me into the right direction by reviewing my
> provisional recipes.
>
> this is the error I got on compiling libreswan:
>
> DPOLICYGROUPSDIR=\"/etc/ipsec/ipsec.d/policies\" -DIPSEC_SECRETS_FILE=\"/etc/ipsec/ip
> sec.secrets\" -DFORCE_PR_ASSERT -DRETRANSMIT_INTERVAL_DEFAULT="500" -DUSE_FORK=1 -DUSE_VFORK=0 -DUSE_DAEMON=0 -DUSE_PTHREAD_SETSCHEDPRIO=1 -DGCC_LINT -DALLOW_MICROSOFT_BAD_PROPOSAL -Werror -Wall -Wextra -Wform
> at -Wformat-nonliteral -Wformat-security -Wundef -Wmissing-declarations -Wredundant-decls -Wnested-externs  -DNSS_REQ_AVA_COPY -I/home/graute/libreswan/ports/linux/include  \
> |               -MMD -MF ./unbound.d \
> |               -o ./unbound.o \
> |               -c /home/graute/libreswan/lib/libswan/unbound.c
> | /home/graute/libreswan/lib/libswan/unbound.c:30:46: fatal error: unbound.h: No such file or directory
> | compilation terminated.
> |
> | /home/graute/libreswan/lib/libswan/unbound.c:30:46: fatal error: unbound.h: No such file or directory
> | compilation terminated.
> | make[3]: *** [unbound.o] Error 1
>

it seems its detecting unbound on your system, it could be that its
wrongly poking at the build host. You can fix that and send a patch
if you need unbound support in libreswan then you have to add recipe
for unbound and then add that to libreswan deps

> Best regards,
>
> Oliver
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

