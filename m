Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3C62760B92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 17:32:20 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d9so2996273plo.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2020 09:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=3+Y0JeAU3vumPXgCh/1NVQl+BwI6RXnS1wPCH9opV7M=;
	b=k3UucUjWuba0wvKAS07X19OdINAseHvEgYN4T7g8zaPx2q5RgWfA99OnPReChvveRO
	JakUMDIh1BBDC7VZQWABxMuqw12ihe22p+Gt3lGtHvRmjDxkPHUz1wvseMQQasYcyXMK
	vUudcL/qJxdt3c77NXzQ1pA8PhP0mv6AX+1EAnC9EHYCFFEciVQdSzPyN/zWbNiiQJfA
	Lo3K51orOlqnLkktbNirgsuzpgecDltzg5GpIW1Z+qH/I04P8NPDGvMT62qlPtUKZstv
	VXzah/3sGiu6un894tUitO5E+gvJaJ5+Wjgh11+GygsYuGji2figIRnMctYWulipAP/v
	xYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3+Y0JeAU3vumPXgCh/1NVQl+BwI6RXnS1wPCH9opV7M=;
	b=PAuS3oBiasvwFLc8FICCltwxfBz92xjFzsbfkVDbmKXoMN77bIIBwmykeedmLfSD27
	53sOXqOW1EjPlf1QzlXHyrNtlKE/fygQbT0LsJKIYqe0Tm+6OWuMNGkd+zToEcMSMMim
	zEN+IUko/E/fZhFD31ErfIjt21FiF6wPmI2O3xntlFRBXxeqHIggMHrQK5ofnKo4ruvK
	pMg1CT8ygFPG6n59FTsJB5XCCtrxm6qOBA5xQON4aHY4mvr3lH6OdsImqcoIXc0Gnf39
	lTerL18dE+3VdRhBCZb5pFXlSXMg+m5/r9X9fNGCFRf7HFD03g9J0uh0jBzYHqJFDFBi
	M4hQ==
X-Gm-Message-State: APjAAAXAx2pJzUoj/2XCm2FrkZRBxm95MBMnl5yCbXgYaE00SN5BEwR+
	IIwALoTVVex9dLv7SN/4gvWxUHsU
X-Google-Smtp-Source: APXvYqyYDVxA1drnY/+D8LRsxOA569IeYP51AjM5X1A3H486lsZUIB/0+oxfqrwnjxglQvzMpfwQ4g==
X-Received: by 2002:a17:902:bc88:: with SMTP id
	bb8mr7332917plb.274.1580491940942; 
	Fri, 31 Jan 2020 09:32:20 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:9979:cdb6:7624:d076?
	([2601:202:4180:a5c0:9979:cdb6:7624:d076])
	by smtp.gmail.com with ESMTPSA id
	z26sm10673091pgu.80.2020.01.31.09.32.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 09:32:20 -0800 (PST)
To: Peter Kjellerstedt <pkj@axis.com>,
	openembedded-devel@lists.openembedded.org
References: <20200130210409.29802-1-pkj@axis.com>
	<20200130210409.29802-2-pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <892a1dad-0f9e-53f3-2997-e4458d212025@gmail.com>
Date: Fri, 31 Jan 2020 09:32:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130210409.29802-2-pkj@axis.com>
Subject: Re: [meta-oe][zeus][PATCH 2/2] gitpkgv.bbclass: Add support for extending the supported tag formats
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
X-List-Received-Date: Fri, 31 Jan 2020 17:32:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 1/30/20 1:04 PM, Peter Kjellerstedt wrote:
> Introduce GITPKGV_TAG_REGEXP (which defaults to "v(\d.*)") to support
> dropping other unwanted parts of the found tags than just a leading
> "v". Any matching groups in the regexp will be concatenated to yield
> the final version.

I believe I got this one already staged.

https://git.openembedded.org/meta-openembedded-contrib/commit/?h=stable/zeus-nut&id=b95100003df03c22eebe6ae5e4342b5281a2ef64
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/classes/gitpkgv.bbclass | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
> index ab591bd45..180421ed3 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -40,10 +40,16 @@
>  GITPKGV = "${@get_git_pkgv(d, False)}"
>  GITPKGVTAG = "${@get_git_pkgv(d, True)}"
>  
> -def gitpkgv_drop_tag_prefix(version):
> +# This regexp is used to drop unwanted parts of the found tags. Any matching
> +# groups will be concatenated to yield the final version.
> +GITPKGV_TAG_REGEXP ??= "v(\d.*)"
> +
> +def gitpkgv_drop_tag_prefix(d, version):
>      import re
> -    if re.match("v\d", version):
> -        return version[1:]
> +
> +    m = re.match(d.getVar('GITPKGV_TAG_REGEXP'), version)
> +    if m:
> +        return ''.join(group for group in m.groups() if group)
>      else:
>          return version
>  
> @@ -105,7 +111,7 @@ def get_git_pkgv(d, use_tags):
>                          output = bb.fetch2.runfetchcmd(
>                              "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
>                              % vars, d, quiet=True).strip()
> -                        ver = gitpkgv_drop_tag_prefix(output)
> +                        ver = gitpkgv_drop_tag_prefix(d, output)
>                      except Exception:
>                          ver = "0.0-%s-g%s" % (commits, vars['rev'][:7])
>                  else:


