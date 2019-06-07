Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id DE1CD7E4EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 21:51:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s27so1827649pgl.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jun 2019 14:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=WplVVgncJP1uOqh2TnVIxeqgpRva8+wxB0DwhRLMdzM=;
	b=hGLDMI5VroV7OURbjX2PLFNJRkh/F8zUyHO1HY1OkFSPuKmBRrv3ZWGjRQZDjcJYsk
	6PmRbagvClX+Gay/4yBo4tpZOk0R9AMA0+8097dbzRbfwi7U1hCCC7HoIsWiPit/O6vx
	/Xg6hCKvQ7+f+hpigPXU+POdGtI92VEsUGF9wbfEnMAswkGFabFnqp83VOJK/dfwpkHz
	Gx+XaMtq52SjLKVjcQn93QO6yLsdc0Hgr1P2sp3+KkpmMRXs4AJjSbpDg8GcFUzAz35Y
	hd4X5zM1e3r8Gmut4Mt42mPOaqkoWGKSTwvQuoLzA20mULAIvwzh5Y0omkjdzoqcUKDf
	kuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=WplVVgncJP1uOqh2TnVIxeqgpRva8+wxB0DwhRLMdzM=;
	b=lvy+kHECnG1/DcpfiiqseC4aqIs2cPwfJAsVsPhalz91tB5TcUY6Ly/6V6q4ydGueK
	/vF9ZjTzc7eRlLhGP70/kFARhL2t4nznXvecGn7JxApkYrPNqZ+mL6XAsdUJ8WOu5h8d
	DxuYRpjMKEDGdBYYlmPueVwZURhW/LTeywHsUfZYR8ghdtNC/kslArnQQ5n01f/KI61V
	+CNZQjsXoefMUtkUaeOFUorf+//n2L1+oORkn4UCbHPL3HyfIYfsP4aNMWT5DsKVW37A
	fQwUaglFbsUDAvk68ELt97EzFyvsIZl9rLO1BQM/bS7q3K23SjtpM2o78mdwIpxcJ03d
	9YAg==
X-Gm-Message-State: APjAAAUZzBKV/id21uZKkzDjh/hAXXikroIdES26/MSPRFwrjzBfHssx
	QYuIQvwupPgCna1lJGM1sdAhxTPb
X-Google-Smtp-Source: APXvYqxfpo0hYvJ/eAfU0WaAeuOReFcGrqMtncoCHWp5dc8L0oHw1mC1B81NZEiJu3sKLmxIoDScEw==
X-Received: by 2002:a17:90a:37e9:: with SMTP id
	v96mr7939320pjb.10.1559944267698; 
	Fri, 07 Jun 2019 14:51:07 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:9501:8703:ab4:a59e?
	([2601:202:4180:c33:9501:8703:ab4:a59e])
	by smtp.gmail.com with ESMTPSA id
	o13sm1948867pgr.86.2019.06.07.14.51.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 14:51:07 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, openembedded-devel@lists.openembedded.org
References: <20190607201822.28898-1-bunk@stusta.de>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <02e81d03-9a69-1650-1847-8a40983c595f@gmail.com>
Date: Fri, 7 Jun 2019 14:51:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607201822.28898-1-bunk@stusta.de>
Subject: Re: [meta-perl][PATCH] recipes-devtools: Move back from meta-networking to meta-perl
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
X-List-Received-Date: Fri, 07 Jun 2019 21:51:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/7/19 1:18 PM, Adrian Bunk wrote:
> It needs both freeradius and perl-module-data-dumper,
> so neither place would fulfill all dependencies.
>
> In general meta-perl looks like the more appropriate place.
>
> The location in meta-networking also had the problem that
> it was one directory too deep and therefore not included
> in BBFILES.
can this be run w/o meta-networking?

- armin
>
> Signed-off-by: Adrian Bunk <bunk@stusta.de>
> ---
>  .../recipes-perl}/libauthen/libauthen-radius-perl/run-ptest       | 0
>  .../libauthen-radius-perl/test.pl-adjust-for-ptest.patch          | 0
>  .../recipes-perl}/libauthen/libauthen-radius-perl_0.22.bb         | 0
>  3 files changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-networking/recipes-devtools/perl => meta-perl/recipes-perl}/libauthen/libauthen-radius-perl/run-ptest (100%)
>  rename {meta-networking/recipes-devtools/perl => meta-perl/recipes-perl}/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch (100%)
>  rename {meta-networking/recipes-devtools/perl => meta-perl/recipes-perl}/libauthen/libauthen-radius-perl_0.22.bb (100%)
>
> diff --git a/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/run-ptest b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
> similarity index 100%
> rename from meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/run-ptest
> rename to meta-perl/recipes-perl/libauthen/libauthen-radius-perl/run-ptest
> diff --git a/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
> similarity index 100%
> rename from meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
> rename to meta-perl/recipes-perl/libauthen/libauthen-radius-perl/test.pl-adjust-for-ptest.patch
> diff --git a/meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl_0.22.bb b/meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb
> similarity index 100%
> rename from meta-networking/recipes-devtools/perl/libauthen/libauthen-radius-perl_0.22.bb
> rename to meta-perl/recipes-perl/libauthen/libauthen-radius-perl_0.22.bb


