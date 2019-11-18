Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C68217F523
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:27:46 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 193so10602659pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+j5cyYqhuDIcbFDCoy+OX/GQ6/B+vO03tOSCaP1aGA0=;
	b=ofpVGy1DXOMqgcdxu28OSiLTphoPQ/i0br+DUEwQixzJ04lscjXRsjJHzLXnLChCFz
	G3JXQwGn1icqTYEwQMbWi0s3rkDDjcwxx0wuiQ2Geb9252Hjbm8e76dFBCjW7hMz+OLU
	qmlohbWut2D8051GikohkmfViJ+q6BXnlYUWGv/gMEo1gLN7Bcn1SP0/kZ3WjTWrWF6b
	VaV0bAKav4C0Aw8tZMkNcK28KCy5R5ACRS0UUXJEdpbIPa1qyRQybv+cBk467zfVQj9H
	MHgOX/ohcRQoNnzDCzz8xcMlijrqvzMQNHyE+9tXc7epcMSjIraWfYaq6kpAGzlSt8NF
	Pkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=+j5cyYqhuDIcbFDCoy+OX/GQ6/B+vO03tOSCaP1aGA0=;
	b=uSeNMJ7cOhf8UvuiJOEd5pvR23msOm1RHPClUE7tgm8ZYLcIEE6QkNuqAZTHx1Xdm2
	Nw6xVKLVSRgQpuwaavDqJwJRYM+ykRyASqCvO2yWFcI3fWGW2sHVhzzF+wIk3zdewv0f
	xQCguVxKljCe5pzz8/orWaLPgF3gqpXrk1EiOhjrStfHp69zohaOuP6F6Y1IcDg/cYni
	uAPpTFI7l6o7HxWlQHdJ+VakmaiLtDVVQgtYJnybcAdGI/c5ok6ou3D7ihP6UiC4oeH4
	N9MnOAvIvM38ZWo3QkxbgyYbBj0dvEba+Fr2q2u3ol4b1fV3PzI8cSJqaLOcFKvKLN1C
	XBsA==
X-Gm-Message-State: APjAAAUcHZI7LJok8KIvulwILp/VLgiBAVZNQSbsSI772p4yBIqysZRn
	oH4Da9xixBvxyPNcXQUzeUZMCaIZ
X-Google-Smtp-Source: APXvYqzQ+QHNnNZ+Q/givtQo+/EemRvapwVouv3dl789p+tnsdolHzaFDYtGd5uHGqRv8qnrsEHUJg==
X-Received: by 2002:a63:c406:: with SMTP id h6mr122389pgd.213.1574094467449;
	Mon, 18 Nov 2019 08:27:47 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:e882:2a90:3db0:e053?
	([2601:202:4180:a5c0:e882:2a90:3db0:e053])
	by smtp.gmail.com with ESMTPSA id
	e5sm17782924pjv.29.2019.11.18.08.27.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Nov 2019 08:27:46 -0800 (PST)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-devel@lists.openembedded.org
References: <20191118133139.21612-1-pkj@axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <f82e6bd5-2cf0-98c8-6ec5-7a0e9afc872b@gmail.com>
Date: Mon, 18 Nov 2019 08:27:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191118133139.21612-1-pkj@axis.com>
Subject: Re: [meta-oe][master][zeus][PATCH] libldb: Do not require the "pam" distro feature to be enabled
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
X-List-Received-Date: Mon, 18 Nov 2019 16:27:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/18/19 5:31 AM, Peter Kjellerstedt wrote:
> It was only added because samba was a dependency, but was not removed
> again when the dependency on samba was removed in commit 6207331f.
once it lands in master.

thanks
>
> This effectively reverts commit a190c2e3.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta-networking/recipes-support/libldb/libldb_1.5.6.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> index 99eb6f9ce..cc24863c6 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> @@ -36,8 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>  SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
>  SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
>  
> -inherit waf-samba distro_features_check
> -REQUIRED_DISTRO_FEATURES = "pam"
> +inherit waf-samba
>  
>  S = "${WORKDIR}/ldb-${PV}"
>  


