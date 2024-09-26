Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE91C369CD
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 12:12:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.40908.1727352721734547474
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Sep 2024 05:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JEcbnD1q;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53654dbde59so1923085e87.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 05:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727352720; x=1727957520; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YWFgMnpF1mpdxEKB9JEdCjQox18lblmMCMHYRwv3mk=;
        b=JEcbnD1qrYnK71nTSwWsE5qHB4zFmGmo+ba/X6W/DEzMVEm83Zq+63urozMAFTyncA
         m+PRiJXpXVTiwtAMG6EaFcm2mqa7FWJ/J+z5f2ICSVybZ9FiA1zLfYEGmGkdZJMiuzSP
         C4zD/9oMA9xDDnIk8fMRFsbuftP2RXj+lUoEdV+Gmuyj62zG8zwB77ejCjWWE3m7lrAE
         3GiObwxHEQJ1X2/W8q+8LXrn73juhUgbowdDLr9BVFBob/QNcNXprBOzu6GdpoZv8qq+
         4cnfkqtpHzEwF27c8kGcTu+VuHxYZEVwO5g9VGR0dJba7mKna2fV15hI5JYOxQtS6ENX
         pAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727352720; x=1727957520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YWFgMnpF1mpdxEKB9JEdCjQox18lblmMCMHYRwv3mk=;
        b=PE3PzDyzc//24Y9TvYji0Anu8rIQRQj9Y0pFyjl5qEdh17ZcWB0LISdVadrKODV8Wx
         zgN1UPynHg0fq2KZaDfmGdIJNcV8+vI1HW0HG2TphqFVo4k5GvUVAnHZ568gFSRm1tEs
         3OHjUTGnfdaiOPZQTETYnhBzsrvX00jU7iyQvmZEQLFYeKtsNu9EpcrOR3YJkxyGgWpF
         FhLjtawzVQSUhIkytRTFam4Pm6DsJDugyDBMUpFWVzw2AzZjYwm+tQa9HYC0Fz3ErXPT
         oJkossTOyPzeGIW1OUS0y6jgAnr/QABMo7ZCoTGE9FuCLco8huU8KK+A18+jwbjqVJKh
         6C/w==
X-Gm-Message-State: AOJu0YwiTJWOaBkSXSKZ4AbccLR7eVsEhZKW+4sR2N7leYCd8EYVFzxA
	SimwU4HEk5U49oBe+6pneHddBrlA5VIOWpOrzy4A6hoxO3/EfVbOphz6zt/s2Wc=
X-Google-Smtp-Source: AGHT+IEEVkwbIOr8JqG/0McDKrtar6WtRvzIR+wvtBmR/Q95bCgYerI3Hrd8SA4b4TSdRpd5Gx0g5w==
X-Received: by 2002:a05:6512:2393:b0:537:a6ff:521e with SMTP id 2adb3069b0e04-53896c05f6fmr1021314e87.24.1727352719551;
        Thu, 26 Sep 2024 05:11:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864da14sm784177e87.258.2024.09.26.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:11:59 -0700 (PDT)
Date: Thu, 26 Sep 2024 15:11:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: ptak <quic_ptak@quicinc.com>
Cc: openembedded-devel@lists.openembedded.org, quic_sssanjee@quicinc.com,
	quic_vkaruchu@quicinc.com
Subject: Re: [meta-oe][PATCH] opencv: upgrade 4.9.0 -> 4.10.0
Message-ID: <ZvVPjImfIJN5OuH1@eriador.lumag.spb.ru>
References: <20240920040041.1153435-1-quic_ptak@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920040041.1153435-1-quic_ptak@quicinc.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Sep 2024 12:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112519

On Fri, Sep 20, 2024 at 09:30:41AM +0530, ptak wrote:
> ---
>  .../opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb} (98%)


- From: headers contains login name instead of your full name
- Most likely your git configuration also doesn't have your full name
- Missing commit message
- Missing DCO signature

> 
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> similarity index 98%
> rename from meta-oe/recipes-support/opencv/opencv_4.9.0.bb
> rename to meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> index 1a873ddef..07bdb37b7 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
> @@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
>  
>  DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
>  
> -SRCREV_opencv = "dad8af6b17f8e60d7b95a1203a1b4d22f56574cf"
> -SRCREV_contrib = "c7602a8f74205e44389bd6a4e8d727d32e7e27b4"
> +SRCREV_opencv = "a7d942b681c5edd0cc27407d8e4d3dbf36c7a40e"
> +SRCREV_contrib = "1aab1f34815a58a5a63aee6d510fe234129754a2"
>  SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

