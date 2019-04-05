Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD5537D5C0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 16:29:15 +0000 (UTC)
Received: by mail-it1-f178.google.com with SMTP id q14so10415554itk.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Tp0rMkkbcnGq0ELEkUsNtJOrl1/7gYT+OYJwoMs3RWY=;
	b=V1Fq/MxTG3lS64Llk3I3TWlWU9/nBZmQi3Exs7MBteE+M63Col59piQIHFiSIeg5gf
	deilmzEq62Tm9Yi4EpZyDX1bX48BbLYLP4NszVXOaVkW62XefKnMKqUodLEgRfDZXZWb
	z3Z7qJoXX0TJrVXchU8b6+PvLe7l3Sr2ez94aZXhF3S3BVlrq86OmrdRbrC02sDVfZaE
	PS2vq0Mu+0IB541Kme4gXhOQWdIJMcZAyIi5B12EQqnoJyuBmDLkIOvB2U/P+kXKVWpx
	fYa9WhcKo7bfnFYeJ1IIj7JwpvK713dgbsYaglovTHwmnMKvg+uB5UIbDQIQxREim+vE
	43Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Tp0rMkkbcnGq0ELEkUsNtJOrl1/7gYT+OYJwoMs3RWY=;
	b=L2uVPXz/GleGEnzzxYZcU1Aux1Gak0cdf/G3eHXZTc2ZoNByMZGMdsiEjlKMrx5a0g
	gNlr4rZXiAhHgVVyu2/uwRGSTpKVkH3JEJEWVX2oSa360wdEatYUQe3E775ZpgaguBEY
	ClUQbNSZOI0gBtDC/ZSmb9Frrj8AcRPfTj7dKTxILDOsUWy8BUrWxpIp2xWBBVfy52LO
	cb89a7TYw3hX5MG7gACb4hx19pUE0oWfdYoyB+ZNrOegTNj4F4kqiS94214/Uv2f2kyE
	SCCzkVC24+/5B8FNUFdwhWxInE2E5RIIaYE2jlOosqDYkDFY04/DCgNqu2a012/iVbCo
	6i4Q==
X-Gm-Message-State: APjAAAXfhzNSrt1mfZaE3RugFPCGVeZjltoNswZdXFgUfmC/+I6QXu2f
	uUY0plmicc//T96GTiqoanaWpisMHIV+KcgSl/U0WA==
X-Google-Smtp-Source: APXvYqyEFKtY05mps0iaWvoRTRje9vyOTuhujUOKp9eVbCMEFQYdEBgjY5OrqonFJ5AVfAVuRMqp0rE1wEEkCRb8wHA=
X-Received: by 2002:a24:1749:: with SMTP id 70mr10254615ith.50.1554481756874; 
	Fri, 05 Apr 2019 09:29:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190405144039.9121-1-alistair.francis@wdc.com>
	<20190405144039.9121-2-alistair.francis@wdc.com>
In-Reply-To: <20190405144039.9121-2-alistair.francis@wdc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Apr 2019 17:29:05 +0100
Message-ID: <CAJTo0LbFowNQXRLCmF+CfazbyfeweJqWu5rkAP3_e3WyQEDpLw@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 16:29:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Apr 2019 at 15:49, Alistair Francis <Alistair.Francis@wdc.com> wrote:
> +SRCREV = "${AUTOREV}"

Pick a SHA, don't use autorev.

Ross

