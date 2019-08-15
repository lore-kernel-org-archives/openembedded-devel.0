Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB8B6D4C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 18:15:14 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id d85so1734752pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2019 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=3Sm7TN2UQUXjBIOtQ+IuiYed0dtXcZhnIj8JQW0xLUE=;
	b=JQ8PygCvWqOpw857tzxnWWaMunJWECxmYb40vSrqoXxn7vPH86Qxxwb6mLKD5YZHFU
	m5ekStjBJ2tQdPbgA9vUfwAxIDsxi0hAi54XDUYU/7WeUzFjEgEcgSadKxNJpp3kDsD8
	7yGNtz2QkohyYXdM64mSJAy+qZseeJeNWYfuc4fum4uJTS5/8cuBhyCnniwHq5ZgZnfB
	eBhugb5yuJbpiucxG6/ursmGEFTHGIz7iP0ShVSYhjoVjOgk1IpbRN2KUcpZXZRzVOsd
	uNNkIEbi7SoDM+So+6620RynheJ9hAUE9FexDU6KSMHX9fxpsd86MkSsGCsaGupTJXb2
	HimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=3Sm7TN2UQUXjBIOtQ+IuiYed0dtXcZhnIj8JQW0xLUE=;
	b=gNz9fjzcHEXBUcBKJMyrs8MWxK2GEHB6jGl8h86ApZeexEpkwxhlnSGEEgzqR/2X41
	BoXPDIlwCGamgrskrhWbIDOJuj1my3hUNpREe54LXxGh7qKWqnbPDLAInflD511bXUXQ
	N4d6b+EVX4nNQ7aO3j8et76AiyyQ1qIFW1oOVF7GTFpcLv+XiP4RbKsrOtBHQCNr+d0N
	ifnO/0BvvpL2Sm3GpGbnpDALQK1F3Z7TBj0RD/b4n954O0REhEm1is9FtENxBBVCnAVa
	EcTV2z2Vzz8bo3gXfYs11OPwDf1JkbEPlp5ZzTA7N2TUA55qmY90rVqmMl3AAqpMPh30
	BkWg==
X-Gm-Message-State: APjAAAXkekLweO8XyILLN9u4izNdfQXsVOJW/1rW7C26z8GLSdK46Dmr
	QVgGjX4LYI+Qec/IIX1Kul0ZxhuV
X-Google-Smtp-Source: APXvYqyHhmsyJzCeg0t7xjpl/wh2ZLEcD/u23Aq+DWkpmDkUk4+SmC1lEs715+Zk7kqHn4gU0xGckg==
X-Received: by 2002:aa7:85cd:: with SMTP id z13mr6885862pfn.214.1565892915511; 
	Thu, 15 Aug 2019 11:15:15 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7c98:5faa:262d:a3af?
	([2601:202:4180:c33:7c98:5faa:262d:a3af])
	by smtp.gmail.com with ESMTPSA id
	w207sm3569532pff.93.2019.08.15.11.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Aug 2019 11:15:15 -0700 (PDT)
To: Jun Zhu <junzhu@nxp.com>, openembedded-devel@lists.openembedded.org
References: <20190815065430.32384-1-junzhu@nxp.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5e8f30d2-d0b1-d259-a14b-b789febc6882@gmail.com>
Date: Thu, 15 Aug 2019 11:15:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190815065430.32384-1-junzhu@nxp.com>
Subject: Re: [meta-oe][warrior][PATCH] packagegroup-tools-bluetooth: Fix blank RDEPENDS list
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
X-List-Received-Date: Thu, 15 Aug 2019 18:15:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/14/19 11:54 PM, Jun Zhu wrote:
> This reverts commit 521a3b0326c56b212ddbb5bf68998e57b498de14, which causes
> the blank RDEPENDS-${PN} for this packagegroup.
> ---
>  .../packagegroups/packagegroup-tools-bluetooth.bb                     | 4 ++++
>  1 file changed, 4 insertions(+)

Has this been submitted for master?
> diff --git a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
> index 913e311..f2a16dc 100644
> --- a/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
> +++ b/meta-oe/recipes-connectivity/packagegroups/packagegroup-tools-bluetooth.bb
> @@ -31,3 +31,7 @@ RDEPENDS_bluez5 = " \
>           pulseaudio-module-loopback', \
>          '', d)} \
>  "
> +
> +# Install bluez4 tools or bluez5 tools depending on what is specified in the distro.
> +# Otherwise install nothing.
> +RDEPENDS_${PN} = "${RDEPENDS_${BLUEZ}}"


