Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 258BB77834
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 05:11:37 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id w189so49321539pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Mar 2017 21:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=CzIFYuvvDnhRlmLZS2SeZJfo4H5lLR1viMvF2rJpVws=;
	b=gwY7cSDb0IQuogJ2JLoqcVWv4QXzXpv1mCm26JIkD8CUR1gCH1fkhAHYcR19ZOSfvw
	iL+9ysGqeeSyTBd8O/Tmt7dVbS6XukEp9uIHH4f27LOdooRSicqyMBcOZ7AYpLFQFkSc
	087GwmHPk+SbsPUE2RiuBGT3kSrkqESllzDYOEA/ARU3RHjkgkcbqwLgrh5cAORxiEsD
	VGAKUrbFWpAPbJLMMW0Ew+4k7wZtP0U8uzrZIHPuASor/J4n7cxF56GKk7N2CngrSxR2
	5YMYF8nVbOuYzPlU0wagcXnSJF/ELZA4IG7hT01clN7cES6XRwhjfvudofJa2Q/z8Yps
	MVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CzIFYuvvDnhRlmLZS2SeZJfo4H5lLR1viMvF2rJpVws=;
	b=SXvN9lzZXV8bQ/i1Tmd72X+Ft4NqLlRXyCIm1P9W2R2q5LCInHo4c00rCf4VfGeSNb
	tQGS7qywCYF8xHQOhltSMOWSyXQvyQflmB7vtZ93/OTGrlCg2rxpRusY5erwg1GpbVYa
	XaUQWpp13+3aGLFgRy6crRh9QqspQ+k2C2LR8Z/HPe09sDtoLe8jmaGIJ4mclqnV4Elu
	8FUOmqVa0O5nuH+5Gro81iQPgwXR90dNji4/0ZQxktWPK4BmDNfjlkMnVJbiNS8ngz0d
	HVpj/LYZwKsoOo5c1h92YY0h8r5mTTGJl2p5BQsTtPoTkynwFB8cBqaUshycf8CbcQe7
	cm8A==
X-Gm-Message-State: AMke39m4I956vUO1Ct1JI0Xp35d/jIgLlFimv8KbESUHHZWiBFTIuoxhj3uD86Oy2xAPow==
X-Received: by 10.84.217.206 with SMTP id d14mr31300226plj.141.1489209099136; 
	Fri, 10 Mar 2017 21:11:39 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:79cf:179b:158f:ebb2])
	by smtp.gmail.com with ESMTPSA id
	z27sm21531578pfg.38.2017.03.10.21.11.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Mar 2017 21:11:38 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <20170311045855.3665-1-pkj@axis.com>
	<20170311045855.3665-5-pkj@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <b2dff51f-a954-d214-f612-e53f506f9233@gmail.com>
Date: Fri, 10 Mar 2017 21:11:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170311045855.3665-5-pkj@axis.com>
Subject: Re: [PATCH 5/5] meson.bbclass: Use the correct C++ compiler when cross compiling
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
X-List-Received-Date: Sat, 11 Mar 2017 05:11:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/10/17 8:58 PM, Peter Kjellerstedt wrote:
> ---
>  meta-oe/classes/meson.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
> index e3489dd12..e27ed3906 100644
> --- a/meta-oe/classes/meson.bbclass
> +++ b/meta-oe/classes/meson.bbclass
> @@ -52,7 +52,7 @@ do_write_config() {
>      cat >${WORKDIR}/meson.cross <<EOF
>  [binaries]
>  c = '${HOST_PREFIX}gcc'
> -cpp = '${HOST_PREFIX}gcc'
> +cpp = '${HOST_PREFIX}g++'

is cpp c preprocssor or c++ compiler ? generally cxx is used for c++
compiler

>  ar = '${HOST_PREFIX}ar'
>  ld = '${HOST_PREFIX}ld'
>  strip = '${HOST_PREFIX}strip'
> 

