Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 91D5178787
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:05:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y5so646591pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=45hqV5gYTTWGlIqzADGR1EEBFGp3FX0/jyLd7wTyhZ8=;
	b=F0wDNMs20prLJv/Wgjs9tEbL/aecxqiqFMqchWu/9Ai7rWq5+dWX9t9t5ofIcb0LNf
	unV7P9AlwAZb8Hf/dIM2B1eX8tXGIcN8dbMzoSlBPSmM8CfXR6TBlBBhTOIGgM6F92t8
	3D+i23y4HHEToYU5CK35fyodBztEmDgnC8+YE2p7uEALoN23ED9w51GtjYTMPziiDeFn
	6KM3eLnnsE4d0nnt1+Yz4mt2B5W5luuHWF5VxLzALOz6YhRkDuRHHMhi66au/tW1xn1I
	RZ9yw1JjJQ1DywCZgBtEk2jr6NMD9AfrLUYjk008tmSMDVSL3chaXveaDv6FLt2PUgbU
	mkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=45hqV5gYTTWGlIqzADGR1EEBFGp3FX0/jyLd7wTyhZ8=;
	b=OtO2S/HAxCDLaWn+Q4Mp5Q6JhLyYSoCgQ/716Y1BXZLdWJID58Rtsg6N9zTnblT0NS
	F7oYREkh2IqiwcZ7Ck/0FZHruqcWGnGjmLd30s0T4Q7pLsbb/8FBiPtDYhhUusYUW6s9
	Tkad5wgHD5T3Z8GLacWKdHCchbt9BUD1lAXFanqXMuibMHd8TUZF/0+C1xLaV76XHt6G
	CWbLM2kem4+FwPiY3tZaew4NCiuLaZwiNZDbKrIP2gnGIHv/UCApb8iTFcX0/jC1yDRQ
	tUK3sV8NuZFfB0/EmbCxJontGVjVsaMj0Wm02jIkJoyPjbK3WhvVVwGmaVevEMK3yRMS
	jkfQ==
X-Gm-Message-State: AKwxytd4dmHClWo9hMsWBbIsRC438Zb+y2hTd+wkJX+wUk9WMo3/noqg
	QQyczz0fyl87rJudo7ZQuS1YBV7nvXVbwTnrTTM=
X-Google-Smtp-Source: AH8x224xbRjoXpib36n0ZrhbOiJ9andDcFuWcwWmfxnOUugc2/pnDawtFRMPwF300IhkbRs9lAOoxPoS6Da+gpbC1HE=
X-Received: by 2002:a17:902:5682:: with SMTP id
	j2-v6mr6053281pli.339.1516723546703; 
	Tue, 23 Jan 2018 08:05:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Tue, 23 Jan 2018 08:05:16 -0800 (PST)
In-Reply-To: <20180122155228.27517-1-twoerner@gmail.com>
References: <20180122155228.27517-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 Jan 2018 10:05:16 -0600
Message-ID: <CAMKF1sqy7i4TR9m5DNow0FeMyPAXMG+wRyQ5eA2txcEcCNZ5HA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] uriparser: add
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
X-List-Received-Date: Tue, 23 Jan 2018 16:05:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 22, 2018 at 9:52 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> Currently the following layers/recipes DEPEND on uriparser:
>         - meta-measured/recipes-tpm/tpm2-tss
>         - meta-webos-ports/meta-luneos/recipes-webos/luna-sysservice
>         - meta-webos-ports/meta-luneos/recipes-webos/libpbnjson
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
>
> diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
> new file mode 100644
> index 0000000000..825c868ad4
> --- /dev/null
> +++ b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "RFC 3986 compliant URI parsing library"
> +HOMEPAGE = "https://uriparser.github.io"
> +
> +LICENSE = "BSD"

it seems to be BSD-3-Clause to be specific

> +LIC_FILES_CHKSUM = "file://COPYING;md5=72b0f9c74ae96eeab8cf1bf3efe08da2"
> +
> +SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "--disable-test --disable-doc"
> +
> +SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
> +SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
> --
> 2.14.1.459.g238e487ea
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

