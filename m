Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5376EB28CD
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 06:00:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5498.1770357656774315103
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 22:00:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EU/CeVip;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-436263e31abso1065521f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 22:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770357655; x=1770962455; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J23wY2hLrW1/k77nqH8hOy2k0w6Q3HYguDRJLJV4uVs=;
        b=EU/CeVipkQ6enkJhTRu3TD2wg9OwGpipFDLO2QtzfXpeoDJ32lijduVkZa6z+bqppA
         7NqfDQgMhmVy+9PDUqrzN403UGHpOqZni3kHSBQ30xVTllB6phQYKFFCkgxQ22tZkp/h
         BJWo2qetnpcz5Nl5oswKWMuWZt6JW6MknHrI6eTCI+JeAKIajHQ1PaV5cBzrKkYjkW2h
         GsxwCr+15B4ywBJDAD9H4iVx1sJV/Xbd7MwRue2xTg8OWK6L5+4KNBMACllQViJ/LcpN
         qYzZi96kisauuVpw3+gF4yCswglXhSPmmMsvlAlyDd8TvY1k6xdz7Y/FWzmYYslEM8fm
         aJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770357655; x=1770962455;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J23wY2hLrW1/k77nqH8hOy2k0w6Q3HYguDRJLJV4uVs=;
        b=CfrkOMKCqhyNsh9Mt5mDkqxTAt8x8vgmZ3ifTUFzEgEWj9ROdE5auOMe58DxJEZ7UC
         NHcJuOUMWMt5B+tr6pFpQiJRO20aPquzuh0R52pr9cSk8W+NDjg/mkV4qrBg+8inQtBh
         5CsOiUepvd8kenGlAGRlAmwVP7seQywX7ZN7bxMU9V2vsA81NwZz5oIarvtqH/XE+PH4
         VhPM8V0YTQkIl4MOmz1b/1B29NIRqwLdaf8/kgkdyStWU9ZYUlQdYiFmqIxYVU5TjCu9
         o4Qr3jrVMo9rxvhD8A4G7NmiQ7UkiAxYZ/N5l4a1IzkEyFBLyMa1OhR2RrCQo0I65MgT
         9UHA==
X-Forwarded-Encrypted: i=1; AJvYcCXepcuCC1mbK9hcDGDDKJLkaNpPBeLs8wwH4Qao1I5/mXExwViyNG0JnQxMy9dllPye5+j24ZfbhVyyZzO8rAERCYc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlTRtDrQydoP4667mA+wWxHenH0JNQXYzUJRvpo/nqLGRbXmh7
	ONUU/gc1zps1f+rta3Z/ztT7CK0rw6Xt14NQxn81El6ELrzJhN1cLEa4
X-Gm-Gg: AZuq6aKkw7v+bA19KAZ0LsVg1a4zPoTqWVTWZIRp2Hmwx81vjNK48EZ0AWIUZj4Hatq
	y+mvM3kglltek/n0hEmm2tDInfWnQR31bLvrTf6K168D2gi25TNZ5RRYOR9C/FAjQQ6KSNvNEhR
	yfEfs/yRMrUMY3tc+qsyrevktEMRQoZIdlDo0HDxZ2w7UEPuR3bpwjAKB5LYe4g+/RcsZF5aWrC
	HG2uqQ+lJeKWoK68rcosThMy6flc7dsexcJdZXxlb72sicKl6MvoqVjb5jgplNLkUY+q6YV4A+s
	RbyUXue8Qn5JkFfkFD2lzt1NAap74tu+mzNbqZTSqb0iafHMEfkyMbobvsXb3Yn81eD3h+jbzvs
	c0xFmUx+5hqlQZkoCgUouGyfxAIBfqPBksgv+0X6amR6QsNLQumWpqNN/oIvRzQcNLLKpAbgvm5
	AoflOWeGUXAnh2sgA1wdU=
X-Received: by 2002:a05:6000:200d:b0:435:8aa0:a30c with SMTP id ffacd0b85a97d-4362938ff04mr2209345f8f.48.1770357654691;
        Thu, 05 Feb 2026 22:00:54 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436297460a5sm3111006f8f.32.2026.02.05.22.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 22:00:53 -0800 (PST)
Message-ID: <893d8c83-6ae4-43b4-881f-a87b1d024007@gmail.com>
Date: Fri, 6 Feb 2026 07:00:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-networking][PATCH] wireshark: Fix do_package_qa Issue
To: liuyd.fnst@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260206032752.4974-1-liuyd.fnst@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260206032752.4974-1-liuyd.fnst@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 06:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124226

On 2/6/26 04:27, Yiding Liu (Fujitsu) via lists.openembedded.org wrote:
> There is no mate_grammar.c in new version of wireshark, so remove related sed.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
> index 2cf9693f5c..d06310e41e 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
> @@ -71,8 +71,6 @@ do_compile:append:class-target() {
>      sed -i -e "s:** source file.*::g"  ${B}/wiretap/busmaster_parser.c
>      sed -i -e "s:** source file.*::g"  ${B}/epan/protobuf_lang_parser.c
>      sed -i -e "s:** source file.*::g"  ${B}/epan/dfilter/grammar.c
> -    test -e ${B}/plugins/epan/mate/mate_grammar.c && \
> -        sed -i -e "s:** source file.*::g"  ${B}/plugins/epan/mate/mate_grammar.c

Instead of deleting it, could you please convert the test to an "if"?
The file exist when the plugins packageconfig is enabled.


>  }
>  
>  do_install:append:class-native() {
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124224): https://lists.openembedded.org/g/openembedded-devel/message/124224
> Mute This Topic: https://lists.openembedded.org/mt/117666448/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


