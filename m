Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id F37EE60D49
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 19:00:14 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t6so1696281plj.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 11:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=4XEgj+Z8IT04gPK73wlLATH/L48Jip/dBb/2mpgWn3w=;
	b=sjUPx3TAzx0ik7e6Dv7Tz8TwO/qDUW6qsJT6BgECrEK30/I9+8lC3igZqXcaeNQX4B
	r1GpIsuN/04vcKTFaRLG0hVI3CzJw5wl3mYMh75vGXOmx8s6skL7ITOtu0WRi0LSAtLX
	44PcSzQ9bCAIHvALLX2wtgCvKYZhjltF8IjvNeP6NZFcgl9wHxBP6vucpIk7vR0iSLGd
	Pvx8v+ARKDpqUk7z3+jO5YR08J46giRBBzDZTXtwggILJAxJ18xqfx9lYVP0T04Tx0In
	JTGe6WHdQ+y+zWtFW23Z2rKAua7670UHaaEBtj0Up/5JsPUV0F+yEMyyp7CeyXz/K8OQ
	QKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4XEgj+Z8IT04gPK73wlLATH/L48Jip/dBb/2mpgWn3w=;
	b=LQxgR55r7QsNgN1/xWl7klll/CUjKSguM2ioEXnlE8m0YlOwr5rCBpI4huADEodeWX
	g8fPjlen0/gAdEkSqPoyU20BzXL7zG3SI/6BV7EO0LKxPs04/r8ZLkOajxHJ4Ecs0RYU
	h08NZcRUEi756K8VWR30TZctS3cjcobiC1eimrBmPgsFV8W3/qzyk+MPNnIyGrbrqZ2b
	dqCeZAnPiJkMbHmkaXkqXgw8tgwXz2cXxs1sh5P/QDkrcGjnjtVGQl4ksNfyKiSNDOkq
	7Qm5fU5e4RHDQZvCVaiK61TORYTUm+ojnOE5EwM4HTWR8SkYde5wKMfSX0opoAaegbxW
	Bniw==
X-Gm-Message-State: APjAAAV2HHOvXR7xs3t/Q8wQSMVifQC9CFjkPWcMIOFjoUiEYtjOBSXY
	hcmRHhQdbqKyTGQ3lSBU6vbUovma
X-Google-Smtp-Source: APXvYqwmaK6TBRr4ltRIAa8XWzv210Y8Hn1d6yYHluR6RmqNObfGUO/ZsoYCYe6ClpqoH/D5+SJ74g==
X-Received: by 2002:a17:902:9890:: with SMTP id
	s16mr5928199plp.71.1580410815221; 
	Thu, 30 Jan 2020 11:00:15 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:9979:cdb6:7624:d076?
	([2601:202:4180:a5c0:9979:cdb6:7624:d076])
	by smtp.gmail.com with ESMTPSA id
	a22sm8152752pfk.108.2020.01.30.11.00.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 30 Jan 2020 11:00:14 -0800 (PST)
To: Trevor Gamblin <Trevor.Gamblin@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20200130153405.26756-1-Trevor.Gamblin@windriver.com>
	<20200130153405.26756-2-Trevor.Gamblin@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <d9645f32-3c76-5fe6-2fe6-8cc49ef81a51@gmail.com>
Date: Thu, 30 Jan 2020 11:00:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130153405.26756-2-Trevor.Gamblin@windriver.com>
Subject: Re: [meta-python][zeus][PATCH v2 2/2] pyhamcrest: add python3 version of recipe
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

What is the diff in v2 ?

On 1/30/20 7:34 AM, Trevor Gamblin wrote:
> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> Twisted requires pyhamcrest for /usr/bin/twistd to work, but in zeus
> there is only a python2 recipe for this package, thus the twistd daemon
> won't be able to run properly for python3.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>  .../python/python3-pyhamcrest_1.9.0.bb                 | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
> new file mode 100644
> index 000000000..04aa9b47f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-pyhamcrest_1.9.0.bb
> @@ -0,0 +1,10 @@
> +SUMMARY = "Hamcrest framework for matcher objects"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6df1318c6071dd1707f5e3b6c11f24f"
> +
> +PYPI_PACKAGE = "PyHamcrest"
> +
> +SRC_URI[md5sum] = "8b833a3fa30197455df79424f30c8c3f"
> +SRC_URI[sha256sum] = "8ffaa0a53da57e89de14ced7185ac746227a8894dbd5a3c718bf05ddbd1d56cd"
> +
> +inherit pypi setuptools3


