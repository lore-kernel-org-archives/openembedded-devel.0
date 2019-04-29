Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id 548087DC12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 15:54:27 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id r85so8396609itc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2019 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dqT6Svari9eR7GsSNlRTdVBPBup5DiqgO9hw9niG+/U=;
	b=DXHGqyTy0NGm5LhlRJBqLFrb/3KeIxqNIeojtRy8YhnZqIa+0ejmttc9vFO3qGZAK9
	5dT1DJMsABw0GAXGyYLnqalXZL+scYYU/Grf2sNK3c3drG423Qh/6A6wvf5r+ay/xQDK
	q0l4Mr4r99XB4ub9SfCr3Y9VCo9SDPgcTxjw4gL27upbZwnVBWnySAnGHMOmw6YwTalM
	13GK0VNdzhyJo1hpKe7u2GpYYMws9LBZXsbgmYnAY/781gdvc8CUc6Ok8BrlMLfXI+OB
	8XvQKuEtKH0Db+tczMDvCnO9icP6K+vYWLxZIy89gIvx0Yevgl582/PYyinfGmAAJj8N
	Oq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dqT6Svari9eR7GsSNlRTdVBPBup5DiqgO9hw9niG+/U=;
	b=azFzm5hHy0ImgnURIxxwg17SmIMfnmjnR36TSmUtW0wdrc4y3Br5aBbGK2mMWOaKG1
	Jo4m9QIT0oBLBlzr9TUfbkC1Kumuumtr/1HTV79xPsm1vSAq++6quUwtSJ1x/Re1Q0E+
	XYCL/E9ylwjKMvV2AJKz0YOnJKfb4D0cacpFKL0Q7ARhnIuFeG777waKtsQFTzpkEPYx
	v2FszutA0tu6aF2LatgPm6UG+k2d7CIKze2YeHG4RnJItt2uA9zf3RHZfXlB+Dfw+RFU
	B2VJ6U0qEc/3bLJ6SSgsnDJdY1Kgjs026gFRkIJf3ruSyDo8KN1qsUYFREiOoHdtN6fR
	8pFQ==
X-Gm-Message-State: APjAAAVyJkN2le3zEh9svleVyuYPliByhjb0mf1gli/YkpjWmmYs1g2t
	z/kV0aqvFrbMuxo/8K3NfVz1I7ER25Eh9SbVjogrbA==
X-Google-Smtp-Source: APXvYqyHEu2qWQ2yRAcIkaVy2HGlVJDRizXa+ODBoFNnXTYEKWzkx0bmrOGtQSuoOdoWBaSAjKn39e1ReYh2O19j+QQ=
X-Received: by 2002:a24:5ccf:: with SMTP id
	q198mr20439137itb.130.1556553268469; 
	Mon, 29 Apr 2019 08:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190429131914.123617-1-sean@geanix.com>
	<32ba7bfc-2556-0707-fd27-51d44338aa52@gmail.com>
	<a10c0685-3602-efd2-fbec-4de81e5980ee@geanix.com>
In-Reply-To: <a10c0685-3602-efd2-fbec-4de81e5980ee@geanix.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2019 16:54:17 +0100
Message-ID: <CAJTo0LaPvenK8_QYicbihHT68gFg+2HbF-410MsXpe37Hepf5Q@mail.gmail.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] cannelloni: new package, CAN to ethernet proxy
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
X-List-Received-Date: Mon, 29 Apr 2019 15:54:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Apr 2019 at 16:04, Sean Nyekjaer via Openembedded-devel
<openembedded-devel@lists.openembedded.org> wrote:
> > Version by hash is not optimal. Can you add PV or change the recipe name
> > to include the version?
> >
> > - armin
> Hi Armin
>
> Upstream have not released in 3 years. But new commits are quite useful...
> So do you have an idea to what I can add as a PV?

https://github.com/mguentner/cannelloni/releases says the last release
was either 20160414 or 0.5.  The idiom is "<last release>+git<sha>.

Ross

