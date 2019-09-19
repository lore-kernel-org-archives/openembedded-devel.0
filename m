Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 095237FFF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2019 01:55:24 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id q203so1700280qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 18:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aXKcCfQtAEcVeTc645kmm3c5mdfHK47ki2+1+mD8vrI=;
	b=LyKpPBLPVdEpAr65K9runas8mFjNTV6HgX8lMVnzL4k3AOLZijU1KCih4u95FOMtbB
	lETUYwkkCVzYKqWEaVUrQpoVsKbSbKrPt3UlFVzzEX7LbS22e0W8x2Ns8od/z4UzMtwx
	FPYKBiOgIxx1zBtgzHaSRTFgkznNfYG811FR6d2aLmAEC9RD89aYZi6DXQpb2ZAO7kvD
	/+qMbeJ/WAR519dvwVqTjkV8Uv6fT5U/MP6aBw/vydd5EGPH7MUfTUJD7t8oxd6/N4pm
	E8CzwUnKj2Mxs4lt9x04w4apq264Oq1ZL12i1HVV7GvYOK1YZrdOil/i3gioFr8otRlQ
	dELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aXKcCfQtAEcVeTc645kmm3c5mdfHK47ki2+1+mD8vrI=;
	b=gLVLIV0qgJmslX1YatUiXv/jU6J8SY2pf4rzOqJno3+rNr2lu8+DxKjGk2UcPkpsvq
	PAdFcZteoCCiXx0dVojLQi/rqdo6cvUHdnx6l/l0lLucHWBtWVX2YzRYQrsdXNWyE++N
	uadEI2qvxBUdbuG5fggn/YR5NIa6Boua/jhj/A9geYXelNFW90pn3s1j3NBe3Ien/E76
	5hcGrI8P8qXMqzZtt4el3tyCZ02tjVUia2F1Boim5zN2kD7M7xcZ3bHrXLliqbHhvPVZ
	cDmb22+KH0KfOfCvIis3dYEBia7S3MlUmXLLEz66iEAV7dFf4VhVZQ4rxtVWlS6+kIth
	OPtg==
X-Gm-Message-State: APjAAAUJhuC4lB6YvYszFzCEa2cRHLh4OvxCt/ZT6DZX/HTQm3bxRA9B
	quUh5FTMzn3gSdv5Ev0HpMuW3K2fb5WBkMhVesk+uCt95FU=
X-Google-Smtp-Source: APXvYqwmEu/h/eDOpfuk6qQ8Ht+mGBo6THWXb+paZbVUWDWRKXJ41tQXq6bGA8HsbfS1Uqz+YBm4SyK9SUpe9NJfN2M=
X-Received: by 2002:a37:84c3:: with SMTP id g186mr502034qkd.71.1568858125525; 
	Wed, 18 Sep 2019 18:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190919014547.7nchdno3cq3o2fs7@vctlabs.com>
In-Reply-To: <20190919014547.7nchdno3cq3o2fs7@vctlabs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Sep 2019 18:54:59 -0700
Message-ID: <CAMKF1sqts_odBkYixxMCHfgAr+-NxcfVYozGRPXX+j47gu4MKg@mail.gmail.com>
To: "S. Lockwood-Childs" <sjl@vctlabs.com>
Cc: Armin Kuster <akuster@mvista.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: remove restriction to ARM ISA
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
X-List-Received-Date: Thu, 19 Sep 2019 01:55:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 18, 2019 at 6:51 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> The restriction to ARM instruction set came in the original
> wireshark recipe, which was 2 major versions ago (and also
> a few toolchains ago). Wireshark 3.x seems to be building
> fine allowing thumb instructions, at least on cortexa9t2hf.
> ---
>  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> index efcd5e4..6de188d 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> @@ -19,8 +19,6 @@ PE = "1"
>
>  inherit cmake pkgconfig python3native perlnative upstream-version-is-even
>
> -ARM_INSTRUCTION_SET = "arm"

it will be interesting to see if it is still the case with thumb1 on <= armv5t
earlier we use to test qrmarm with thumb, maybe build with

MACHINE=qemuarmv5 and in recipe set

ARM_INSTRUCTION_SET = "thumb"

and see if it still builds.

If not them limit this setting to arch <= v6
> -
>  PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"
>
>  PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"
> --
> 1.9.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

