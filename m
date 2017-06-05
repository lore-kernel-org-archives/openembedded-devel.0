Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5B18C77BE9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:01:27 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id u12so56893312qth.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=CRkrHcp4g31UtBjW4nydiZlBVP0UiVazLnFnzK99VYE=;
	b=XpgxvEBbDbwLFnWLMIgoGP8h/a/r+vVdGcZBmV4xozKw+Tga9JrCLepJKxFQAJ2HbF
	JvFaRPuCul3JjUUOpOHei69f0UEKBPCsTgP3c615nNkY9X9ySNm9uOI+dovuk9MucEr2
	YPk3IpqZ0ua9ZHdz7Yz949afq00j+vsl3oWMPgePHmhHWRRmTpNXXd5jZuBHyamO2vpp
	2unh1NoaGQkBYPUTpGmyIclyEl74UJsLIdqNSBHLRTg6JNnEkR1Cb+80XT9zFp8UWv1A
	ISFfKf3G0rw3RFDna20MYxRQto5u5tDKyOr6Lxd/qwdYwClhNLrhmYtd6IoUuR8DXRTX
	EtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=CRkrHcp4g31UtBjW4nydiZlBVP0UiVazLnFnzK99VYE=;
	b=jdhIzW36BVR5VPhYg0S5z2XVfNcjlWzh0KqAiKHF8EvDeJi9BUxLXu/jLTNLRA7SGe
	m5EY5zju6C3oNT95vmAV1Z57ZCjsiAzY2m/BgPrW1BeVuLzrypwSGj5ZIICyp4VGLfdP
	aMKLbu0tP/62mowseE1QfCPdlpPR/Zg6qfGz/FaOkomA7j1ItiesB579Z/+3R/lVVhEP
	aIPZvHfHxHRDtgiAJaK/RJbX0rKVB+X5QqomSqgFdDwnRCfcSMKiYeEcCMlisMXHNDsL
	f67bSfrRD5EecXv3VC1r6cWBB/ZXLUoVp670zqjdP+8LRAbrcI7SvCJg+vcHyhSKwGDP
	g43A==
X-Gm-Message-State: AODbwcD41SWWS0LdsCbvhYrXKleaWlzKtE7NututqSXgES0oD5DbR/Hc
	BmP/D5lzcLKW6OcSaDULsHyQ0sk64cDF
X-Received: by 10.55.24.201 with SMTP id 70mr21474188qky.171.1496660488936;
	Mon, 05 Jun 2017 04:01:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 04:01:08 -0700 (PDT)
In-Reply-To: <1496418916-17305-1-git-send-email-ross.burton@intel.com>
References: <1496418916-17305-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 12:01:08 +0100
Message-ID: <CAJTo0Lbq0K1oH0fudVGq6LFa8j5nsHFsbGApJcRrRVD-QtAyMA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] meson: enable process reporting for do_compile
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
X-List-Received-Date: Mon, 05 Jun 2017 11:01:28 -0000
Content-Type: text/plain; charset="UTF-8"

Just realised that my local master was out of date and these don't apply
anymore, I'll rebase and resend.

Ross

On 2 June 2017 at 16:55, Ross Burton <ross.burton@intel.com> wrote:

> Ninja outputs progress information during a build (for example [12/34]) so
> we
> can tell bitbake how to parse this.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta-oe/classes/meson.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
> index 5a04134..42f4005 100644
> --- a/meta-oe/classes/meson.bbclass
> +++ b/meta-oe/classes/meson.bbclass
> @@ -75,6 +75,7 @@ meson_do_configure() {
>      fi
>  }
>
> +do_compile[progress] = "outof:^\[(\d+)/(\d+)\]"
>  meson_do_compile() {
>      ninja ${PARALLEL_MAKE}
>  }
> --
> 2.8.1
>
>

