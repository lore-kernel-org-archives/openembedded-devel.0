Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6CCB7780FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:44:09 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id x67so7503893ioi.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 05:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k4adPwaR8pJ4pcLx3PRQm7cqtsZZMut1kLHzJDsbg7s=;
	b=aChQv7AyWMoED4yIyTPROZZWvU6dlRemN4ZJsh+OxIMyYGka1qFznDwspUVDa3SrPR
	2cdmZc/N3rcVsOROlO0aFK0U8YdT84oFOcHS/z0epKy+vXSqS4EaHWkPx9VpCFv8o+zh
	lT0qGCrskM9kEsPsjdeTYHxtYzRlgM9JnaEh8WVVkiBKFYJ1ya+eNGTwEpY0y4JApyGR
	z6SMQxiWePDK83XYF4brhxmk6VyTZ/T/6fGSQdWUFs7Hc24JTptLh7NbE6Z8iWgdUhb5
	lqd8CyuqEqQEdT0SdoIoR/KTbfKb5FOohfGIIePYNnHKGcpOPjK7+xmHQFHjVbqpSdGx
	YLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k4adPwaR8pJ4pcLx3PRQm7cqtsZZMut1kLHzJDsbg7s=;
	b=D2u2CzAqWagAschvALgw8gZOf7yhk3scE5GGyWoyygT01nmgZcGpvAOT7SOzCR3Aei
	JrsMe+5JkCCKLweEyeemcXC4au1x8O70t4suxqVGlcdAxG51RShtL/tQ5PDAjphoSOvo
	M3kZULA+bHYlG9d56qsBZZ0OeiSECuDHYxCl0QhysnBXzqB/dBg+f1M4X//JDQzK1AbL
	5ujbx7nP1NSPQ6+mkINiV5b1YlG8Lid4VqOswlRHBj/wjm2oHyTzYoafQM2JsRVbMVYN
	uR+QilxkYMNbgX7x8ULBcSCq2h0qP+61wAwLOUSNqumKYE5JqSkk6mH7BXt4c8YHEE94
	lgcQ==
X-Gm-Message-State: AKGB3mL8sbcSXWqlZoU0CNoZEv6BOuhfOXFOvEosVsGYL/oMYG0Dp1ty
	KXbfkdHyY/HS3erHJL/R0WG3iWHury4ZwAXz1GLx1w==
X-Google-Smtp-Source: ACJfBouGm0kbKweoDSXumd+w51B+xFAJbxN/HA/hJbks1evUb1Fh2QEqmuma7X1cOu/Edwa2G7atmUr7cQRdRoUIG7U=
X-Received: by 10.107.137.15 with SMTP id l15mr3898684iod.52.1513691051209;
	Tue, 19 Dec 2017 05:44:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.141.20 with HTTP; Tue, 19 Dec 2017 05:43:50 -0800 (PST)
In-Reply-To: <CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
	<2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
	<CADNbA1oCH=x1SoZn-pb50bZabf+rurd1w_o7D9P9FM4u=FXXsQ@mail.gmail.com>
	<32cbea3c-5275-cd8e-e7ef-7654e1e94bfa@linux.intel.com>
	<CADNbA1rNAafn+pUCuWJQ0AgrtwJpB4EUNfF7M1czOqVag7TL8Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Dec 2017 13:43:50 +0000
Message-ID: <CAJTo0LZ0e2iX84X_cOKxi9ziu9EgapG9_4MOKkPBEhKE=teCzg@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 13:44:10 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 December 2017 at 13:23, Derek Straka <derek@asterius.io> wrote:

> Cool.  Works for me.  Thanks.
>

There's an epic patch on the list which I'm reviewing right now that
drastically changes how the core Python library is packaged.  If you'd like
to have a look, the almost-final (my bandaid fixes need to be squashed) is
at poky-contrib:ross/py.

Ross

