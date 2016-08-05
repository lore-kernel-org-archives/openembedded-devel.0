Return-Path: <richard.pannek@pelagicore.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 76EBF770A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Aug 2016 14:14:13 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id m101so300616423ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2016 07:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=COxFJOiK4uM8Mtf5jnxMVdjMDoAVMAwpsAlB3cMgngA=;
	b=X1QaxhgfDypf+7WXWI1lkBn5K3kyRB5FJGqnq5P0yqHE5mUn+dap2IdX+Ax9bAd8Xw
	aiIwKW3+eoscJoZ0oNkuPF/RgwIzC+hy1VwGIrICQYxLV0oUEBA7oqgIwgNfLdJDbDJm
	IChLdYyo/AQ38hTs/d+kNQ/xBJ4/AKpuNC3/XBQuiY8/eSN4imvq8IJEd7ivm4RmbjU3
	P3KcSDjb444DTZEw0Iadpv2d2Mg2QFuynCxcNmw1RnVcaeL/3vgg7svmKAxpslrGt9cJ
	Gv2YJ7JJWiIbZQ2p2/K2DdSD+pK4qYN47fO0db9cVUmIHDcgh44A4Ofw8bgmHFTS+57z
	Zimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=COxFJOiK4uM8Mtf5jnxMVdjMDoAVMAwpsAlB3cMgngA=;
	b=Vgo75xA32sOFP19jNiZcY7IiGITt6TpoVMr+Nz/hz5q8RhBDC4UJHhG2VGso66HHnx
	iM61Kapmksu7qY9248jTV/VdxgAUaiaKF6WhcHBvz6Vw+JkRoHIx9oHy5cS4QhPOT0sz
	QjU7WKOlfgIiQqH/DiK9wovItIZZydJOGwLtZiVDDdtS2XDLqfk2IElGN20R06RZNKUQ
	7aOkpFe6+hu6PWa4MeEbeQzYb4BM9/EEdQg1OSa0ohYw+Ng5368XHpAZb14qMSMxvTeC
	bjtvqU58xYsuGKhf5XRGHLOe7iZWdRmOaTHv9rjb3UQJwDDuPLS50I17GTEJxxr/NxAc
	1A8A==
X-Gm-Message-State: AEkooutHP3nU4fBBVsXSJhf0lGL30ZX3YQ16dBWKjxUZDuB06yCp5QeXBYudu3wgT00M2wn5JQpfGCPdUNL8pkTC
X-Received: by 10.107.143.205 with SMTP id r196mr40286904iod.54.1470406453738; 
	Fri, 05 Aug 2016 07:14:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.17.213 with HTTP; Fri, 5 Aug 2016 07:14:13 -0700 (PDT)
In-Reply-To: <CA+chaQeO1Y2mcFEDwKB5jiuOdvezw8VSCFmRhzzJwhy1B1nxfg@mail.gmail.com>
References: <CAN5TPoWbt-zACtcw244xLrfpv_xqPSxpsC5bi66LzuZL9sStKw@mail.gmail.com>
	<CA+chaQeO1Y2mcFEDwKB5jiuOdvezw8VSCFmRhzzJwhy1B1nxfg@mail.gmail.com>
From: Richard Pannek <richard.pannek@pelagicore.com>
Date: Fri, 5 Aug 2016 16:14:13 +0200
Message-ID: <CAN5TPoUAG3k_He2+aujrfTJbdNRGGtX=YP=B1_pReSqEe5Ni2g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] commit breaks all other qtbase branches but dev
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
X-List-Received-Date: Fri, 05 Aug 2016 14:14:14 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

> Are you setting qtbase SRCREV somewhere? The LIC_FILES_CHKSUM should be
> matching with SRCREVs set in meta-qt5 recipes (e.g.
> 7bf002c3b3f8009138fca217c7fa0c234aed21bd
> for qtbase).
I see, yeah appearantly we use SRCREV = "v5.6.1-1" and it "just
worked" befor because those license files haven't been changed for
some time.

> If you're using different SRCREVs set in your DISTRO config or bbappend,
> then you'll need to adjust LIC_FILES_CHKSUMs to match with them.
Ok I understand now what is happening, thanks a lot, wi will be able
to fix our issues on our own site here with that information.

/Richard

