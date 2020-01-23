Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 734A07FCB1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:27:48 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id z124so1925919pgb.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ujBlf3F10djbRnZlgQujnERBc4jc4jEUmQ6BUfnWlK8=;
	b=KWYiebkPl9gMrGSYrP6Eg60+g/c0WFiYR//Guw3+0Yn7y3TCBN7WVqzcJQpa6Cd2T5
	jSYuwLYe5zF/DdPLJtFvRFYl6Dk3spkGR5bCm+2zEZ94CyBtcCgbKxz5GfMk43kDWyAA
	twZWaMna4KRmNGOwfOGU6yHQtetfhWQ1DAEm7sEaPAKGcVDteE3lnHRZI3ng3/5Rr2fk
	bhsegRSHeLi5sPSkj+hhiKm9WadgIZIe2zc+2/DSLH/ARnNRfkXeOOA9ye3wM96zeOcC
	19ce8BgnAVHCOefc7eddOQ51SRTZ5K2RLUiTy/4fAHXL5xeqNlCffEnr3go59dYcqwrj
	C7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ujBlf3F10djbRnZlgQujnERBc4jc4jEUmQ6BUfnWlK8=;
	b=Ig+yMli0LV5Xm+Fqsi55bV76cu1HIY+oP9zpzNLQyuLmgARfHG+QJ9OxK1dmHA5mIk
	uafD/+iWxH0R9PgWSd5AVwfWUvVuyfNgKi6Xnfs1MtQHcTIrNPe5/FgdbwCHgo/rpiFc
	n68TXAmWK1GWn60X/kJ4Oksf8QchukIxVrpykbJaKtAKAq0xhRqHBgO1FrnVGts1luhH
	ti5CUGF2+Qxy7xUOs3AvqH9gb26jXbou4d5nviYA7rqm703hghy4vbmLrr+vBLJtyt2x
	gglnVBi5qMkANfRB8Pxf3lLVMnIzOd+nX2y1Or8v1ezZ1gKEprPigkTSkZJ72ZZ80xCc
	IBQQ==
X-Gm-Message-State: APjAAAVBR6D5AU82s8pAtyezlzpnI7ysLBfN7asUtSgCVIHSVLMXeD7+
	jum6B3930dDIEuhhjiWTVi/5ZMHA
X-Google-Smtp-Source: APXvYqwAbUFtTyRH+EJ1kUTRrAZtk/WF7hJx9sBTY1FmFjiZGSBOokLk5iQgF50CCK6JaoEWpaxugQ==
X-Received: by 2002:a63:d94b:: with SMTP id e11mr152491pgj.79.1579811269214;
	Thu, 23 Jan 2020 12:27:49 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:682c:76b9:6d8a:bbd2?
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id 2sm3853052pgo.79.2020.01.23.12.27.48
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jan 2020 12:27:48 -0800 (PST)
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200123183531.2066136-1-raj.khem@gmail.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <e0c9b955-ce1d-0ef1-667c-914aa13db544@gmail.com>
Date: Thu, 23 Jan 2020 12:27:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200123183531.2066136-1-raj.khem@gmail.com>
Subject: Re: [PATCH] ruby: Remove __has_include and __has_include_next from preprocessed header file
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
X-List-Received-Date: Thu, 23 Jan 2020 20:27:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/23/20 10:35 AM, Khem Raj wrote:
> one of the build steps ruby has is that it generated rb_mjit_header.h
> during configure using gcc preprocessor using -dD which emits built-in
> defines as well, problem happens when this header is later included in
> subsequent compiles, where compiler errors out stating that an existing
> internal define is redefined
>
> | /tmp/20200123-2021083-2c601q.h:13849:9: error: "__has_include" cannot be used as a macro name
> | 13849 | #define __has_include __has_include
> |       |         ^~~~~~~~~~~~~
> | compilation terminated due to -Wfatal-errors.
>
> Since compiler already will take care of it internally we can edit it
> out from this header file

Any idea what introduced this ? Hard to tell if this is backport worthy.

-armin
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/ruby/ruby.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
> index ce1b02f012..d5cd329e65 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -38,3 +38,10 @@ do_configure_prepend() {
>      sed -i "s#%%TARGET_CFLAGS%%#$CFLAGS#; s#%%TARGET_LDFLAGS%%#$LDFLAGS#" ${S}/common.mk
>      rm -rf ${S}/ruby/
>  }
> +
> +do_compile_prepend() {
> +    if [ -e ${B}/rb_mjit_header.h ]; then
> +        sed -i -e "/#define __has_include __has_include/d" ${B}/rb_mjit_header.h
> +        sed -i -e "/#define __has_include_next __has_include_next/d" ${B}/rb_mjit_header.h
> +    fi
> +}


