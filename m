Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 410086093A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 15:41:30 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 23so608615pfp.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 07:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9z4UdcyTn6YVO4lmRm8JE65UUhb4VRF352P1BiEOzY8=;
	b=fLnuCPFmphE3qpQkkEVqNRe5lUnscvEy+7V81BgDYndxFzJ1fkzfQRFMinw/0f91KQ
	xunC9nLTtej8VaqCWKxX+rteVAUJ+x8H3YNjZDA4wi4NcLNKAWUOIiT8oLPrlspkBjRo
	2UhPv593LVssqOjIv5FxQOvlPrvFVK+q1gKIsJI5zuWDx+N/RrczlKBvCcT4DAwIVExx
	q8AQoy4qkXut7zTxuOKojOPE2TSTIm66MKo5zUCPjGKQKKK/wDS1BOPVnn1kih6w987+
	iGTj4DXv7y8IbAHIAcL8s7JIEOdS3c+MuMymbKpzruoYsH2G6JEotpYSq+0Kyn/Z4sAD
	ckeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9z4UdcyTn6YVO4lmRm8JE65UUhb4VRF352P1BiEOzY8=;
	b=ts4R7wwnYrSzxmLZUvLSL7fY2moEFcKftgYa8f95jF5/AHr57LejOgSo3Zww24ktwe
	j0ALKhrBIvhb+cm0o648skdrp9z7WkdvTuo7Mf3MgH+mb7G6nhb+gJ/n6lvF7cRl70ag
	R5UXfcrGWOhWzMJsMy8YkMxmFwMxdWm0Ry9+b7CadfOwAUSCI1hVDEy3zn+TS73Zehr+
	dCJoe+snDNjA8mM2+x6sLzqfNN89FNwB5I8t4jIEmjNI0jWVXJV2hJv6dXEB+M+ZIli9
	Sd+UEpubwZy+2Fc/rloAJmmkxKlhxz687qHMhvO+n4cWsKIzV97q5shFvyd8kdyPvCPC
	7Kug==
X-Gm-Message-State: AKwxytd0gpbQtlb7OzSE8JGZaHO9rWaudmkbJBsZT9nkq0Viavbk8/1m
	SPdGA1AHJ2y9uQJRG+ozxuUsK2A3neckDvjm4LU=
X-Google-Smtp-Source: AH8x227Ww2gBt5sNYq+teB3f/zKLx32tU9n+mZkXGhLQWLh8bpZElbHCOrGW4G6jZSoyZQndNAdO2MdbvM+jqzNYVgM=
X-Received: by 2002:a17:902:5682:: with SMTP id
	j2-v6mr6022677pli.339.1516722092164; 
	Tue, 23 Jan 2018 07:41:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 07:41:01 -0800 (PST)
In-Reply-To: <63d85ca3-162a-84de-65af-dde8e02403ab@linaro.org>
References: <63d85ca3-162a-84de-65af-dde8e02403ab@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 09:41:01 -0600
Message-ID: <CAMKF1sp_Mp-3L8XSeEnVR_+n_w2E+QT8wF4JaH-_vqQpw1kn+w@mail.gmail.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: msisov@igalia.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] RFC: updating chromium-ozone-wayland to 65.0.xxxx.0.rxxxxxx.igalia.1
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
X-List-Received-Date: Tue, 23 Jan 2018 15:41:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 22, 2018 at 1:54 PM, Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
> Hello,
>
> chromium-ozone-wayland_64.0.3274.0.r517731.igalia.1.bb from current
> meta-browser [1] didn't
> quite worked for me: e.g. I was getting the "Aw Snap" after filling in the
> search text box and pressing <Enter>
> at youtube.com; sometimes when moving the mouse pointer over the screen the
> mouse cursor became the arrow
> and was not changing for quite a while when moving over the chromium window
> (looks similar to the issue [2]
> though it should have been fixed in r517731 if I got it correct).
>
> But when I tried updating chromium-ozone-wayland to version 65 using [3] as
> the basis,
> those two issues were gone, and chromium became much more usable for me.
> Then I did the following:
>   * from [3] took only the changes relevant to the version update,
>   * rebased on the current OSSystems/meta-browser,
>   * replaced the patches added to SRC_URI with the upstream versions where
> applicable,
>   * updated to the latest tarball at [4] (though I don't see a difference in
> how 65.0.3298.0.r524623
>     and 65.0.3315.0.r527534 behave, any of these are OK for me)
> - thus ending up with [5] (the 3 topmost commits).
> (If we go with r524623, the topmost commit is to be dropped. Or if we go
> with r527534, the two topmost commits
> are to be squashed into one.)
> Basically this is still the subset of Maxim's work [3] with minor changes.
>
> Does it make sense to update chromium-ozone-wayland to version 65 now?
> One of my concerns is that it was only tested on an aarch64 target
> (dragonboard-410c) in rocko, and build-only-tested
> for an armv7 machine (am57xx-evm, rocko as well).

65 is dev channel, so I think if you keep updating it until 65 hits
release it should be ok
Can you check it on x86 arch too ? may be qemux86-64

>
>
> Thanks,
> Andrey
>
>
> [1]
> https://github.com/OSSystems/meta-browser/tree/master/recipes-browser/chromium
> [2] https://github.com/Igalia/chromium/issues/317
> [3]
> https://github.com/Igalia/meta-browser/commits/ozone/wayland/65.0.3298.0.r524623
> [4] https://tmp.igalia.com/chromium-tarballs/
> [5] https://github.com/andrey-konovalov/meta-browser/commits/my.master
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

