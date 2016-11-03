Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE9F719AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 11:13:28 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id w33so25593920qtc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 04:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6T8/2f77xV8ZxCEYUrCNnhSABACTeIRjQPDJ9VbKdoQ=;
	b=a41DZPnrVSTGf75G/6yUYQ9y+E8+PMONK9a0PuwMDdfWsmmUHruTroRYRXx3EYImXG
	VQVF9Xa59oVuIN22692yp42Fef+oDZdZhgzay1zWbFcKxWb/uthStX1NZliPU/uCyuos
	AW44RIWmYmvI9jx9dvGkAsLd1FG9R52ETubJz3UCjTKnIittingaoRoYIciTmMYQnOTd
	GiH1N/41k3HsdpMxIE3eONJA39wFUELu7s09jRHLx8D0IEjusMiMPpXdIKmN+3+WbIlA
	8+CXUksshSw4lHnkqNNsKWVwywc+pphi2FZ8tFIuttuXtW4Nvuv274TTMSdLEYbzO6aQ
	GWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6T8/2f77xV8ZxCEYUrCNnhSABACTeIRjQPDJ9VbKdoQ=;
	b=hr3xm0ak61cY84co+c2gy+v8vRh7jeJEhFVTCGYHjDHmXV1B3l8kacCCojYIz++T+s
	BRhRqfdlHkATqC6G8FMGW60YyNJYJVDZq3nXkqZBqViPMCE70m07fGvbcNGF3DK4OUbQ
	n74YiGzQvTJJUVObwNin4zYapPWRTytl4QWUQObnQyijsS+LySx3ynjOp5J+jzoNKzyf
	KQQ47cn1eRDfs3K5/PdA4z4xFpc493w6kE/EiFqsJA+v9YZQOTaVxwy5sLG3Zuv6Yugk
	uZSBFayvjxkfvv5zklv/BEswYO4YGM8j+2k0frenvbUtF86uOKzOJrZ12rAgExJx1vsA
	DSLA==
X-Gm-Message-State: ABUngvcIAgUYOqRR027h8x8PVR3ui6fmFj6EcZYzBPPVI2AU+gPSEl5CpFrCDVv7UhTCa6VEdnnkEE+EikSgotth
X-Received: by 10.237.61.210 with SMTP id j18mr6925391qtf.137.1478171609296;
	Thu, 03 Nov 2016 04:13:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 3 Nov 2016 04:13:08 -0700 (PDT)
In-Reply-To: <2334170.uKLsZrz9dF@peggleto-mobl.ger.corp.intel.com>
References: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
	<1852679.faEG3Nt9xx@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LY_nQfg5czXfOauC=eNG1fy0MDrreEvyuLx5NfyBny-Dw@mail.gmail.com>
	<2334170.uKLsZrz9dF@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Nov 2016 11:13:08 +0000
Message-ID: <CAJTo0LaWTuM_7su7DhH_wkRU8xphTPMEj6Ye-d1C2m5M2S+Pog@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Thu, 03 Nov 2016 11:13:28 -0000
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 22:10, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Only if they have "touchscreen" in IMAGE_FEATURES - do any of the machines
> we
> build for on the autobuilder do that?
>

I thought the qemu machines did, but I was wrong.

Thanks,
Ross

