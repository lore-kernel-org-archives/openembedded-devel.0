Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id B595574731
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 16:02:53 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id u86so7257214pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 09:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=kgIelVbhSpQrdwMWwkf8Nqa+KcmtJhhrbWQlVc3yEk8=;
	b=BMe8ZcaG+6J1Qidw/Pkdqb9Ncz8lqDhJRmOKTUy2WyMhlLW33Caa4mp+VR3YIELbUo
	zhxXXAalYkQfyoD93E3TSup3nKSoDhowJkkHhzMy72IuURGdtF3ZaftQIlxctaZA1IBc
	sEiyej7LUlolZMpPAbbFv3hp8GZJLRlqCgTrpX0WX69PODUq0b/XhAblPld03U0S9Mv7
	/do4VQIoNfjBA4JV73ExDLo98Ybg+vbteTFuBFbCIg9c4NolRmWW/63a6koGdqWSsHHc
	C5qWTa4MaMiqp9gWKsQGyDH7SvSqP3lCcBb9Y9gG1mU6oyDIx08PXOYzG7CrveStDpkD
	F8gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=kgIelVbhSpQrdwMWwkf8Nqa+KcmtJhhrbWQlVc3yEk8=;
	b=KSCggLh0R6RRPhJ8U9tU2oFJxjSj82Qe1oe2ylYMXsii0RntEzoHpLv5ydZkymlAbn
	a17NDCMNErWGcByW6dbW1+TWo2vWR/hC1V2BXhT5eCJ2YBkCZ+4yeMWHYqxc5D9SZWC2
	v2O2rlEkd7OAXKZYUeJOII/moFLOOPqZurnlYERSaUUy4DMyNPF0jf0v0eV7jSqnmgxi
	KgRRrZCep8Q3WI5A/rOS8Wmhuk7oeYJJz8QQk3GmjFPkQNK1IgnWrp4PhxiwirtI8c0q
	GuxSRvAw15PmQOXXZVAAdEzWK75KQCgW27Laj5osr812bgUkQgsP9+YKbpc0cCzfUX0z
	xskw==
X-Gm-Message-State: AElRT7EyQC5Vnu2wehmeRS6iypoO5TvhSuPFPoGy8JfFkQ2SE46tr3Ky
	v5BVeFbTLTHAYbsOPCZEwvYeVg==
X-Google-Smtp-Source: AIpwx48/S0QxYvlsMAbGBTH8Ktc+ICi7vjIzdF7XnUlygBArRiWvQ/0kzR+zJ/AT0UK7ZtV3PkMq7A==
X-Received: by 2002:a17:902:d882:: with SMTP id
	b2-v6mr2038694plz.306.1522512174284; 
	Sat, 31 Mar 2018 09:02:54 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:7cbf:a2a0:bed1:4628?
	([2601:202:4000:1184:7cbf:a2a0:bed1:4628])
	by smtp.gmail.com with ESMTPSA id
	q62sm23789960pfd.61.2018.03.31.09.02.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 31 Mar 2018 09:02:53 -0700 (PDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
	<20180330133151.25882-18-schnitzeltony@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; keydata=
	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
	8CS2NxU=
Message-ID: <91c71f28-b996-526e-2de1-fa7df027666c@gmail.com>
Date: Sat, 31 Mar 2018 09:02:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180330133151.25882-18-schnitzeltony@gmail.com>
Subject: Re: [PATCH 17/39] gtkmm3: add initial 3.22.2
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
X-List-Received-Date: Sat, 31 Mar 2018 16:02:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 03/30/2018 06:31 AM, Andreas Müller wrote:
> This is gtk3 version of gtkmm. There are no cnflicts with gtkmm for gtk2.

This fails with:

 | checking for epoxy >= 1.2... no
    | configure: error: Package requirements (epoxy >= 1.2) were not met:
    |
    | No package 'epoxy' found

Seen with world build on arm64

- armin

>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
>
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
> new file mode 100644
> index 000000000..e4bd27e58
> --- /dev/null
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "C++ bindings for the GTK+ toolkit V3"
> +HOMEPAGE = "http://www.gtkmm.org/"
> +SECTION = "libs"
> +
> +LICENSE = "LGPLv2.1 & GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> +                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
> +
> +DEPENDS = "atkmm pangomm glibmm gtk+3 cairomm"
> +
> +BPN = "gtkmm"
> +
> +inherit gnomebase distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI[archive.md5sum] = "883e9046768b3a5afc8e365988823e77"
> +SRC_URI[archive.sha256sum] = "91afd98a31519536f5f397c2d79696e3d53143b80b75778521ca7b48cb280090"
> +
> +EXTRA_OECONF = " --disable-documentation "
> +
> +FILES_${PN}-dev += "${libdir}/*/include ${libdir}/*/proc/m4"


