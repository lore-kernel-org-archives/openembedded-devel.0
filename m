Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3638478DC5;
	Mon, 30 Jul 2018 14:50:56 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id r3-v6so4840696ybo.4;
	Mon, 30 Jul 2018 07:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rEo/1mQVtafn3J8u96WFi/064evFoucdqnUAbyQLCZY=;
	b=ZhTn9vWKuIFArCXM8CD5Ujv6hHM34Q5tNOdeDpDxdJ2OUasvt3RH4Kq+6m7nerS7Bg
	txdTgOu0i0reDdJJyU+SgisyQHxrQ5MV3AJAenfda+zgDWH79LpjKJzNfuWTbxQYzcqa
	KBJCgsS2aE1Uo76nzezDPkRpExMM2KE5L0quHlXWgBNwFcv/le9Vju2isirzwvbvFMGZ
	AAlTphs/Xtq5hY8Rc++P2du0DpuOQoOFsdv11GPDiatMJQTE3bC+XqGfMM/aZ32YcOrE
	owaO3SJzAPRjH39AhEOGVdemKSj9KAaYLs/6GSfjrA43kHdoDIeNz0/vg37cLVxT9gkJ
	4iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rEo/1mQVtafn3J8u96WFi/064evFoucdqnUAbyQLCZY=;
	b=O2J/rzA4x//zKZr9rHmA3QIoaqyRCnXNFr8NqIqCIgTF+yi/jKWEX/jGnGOcYVpyiP
	mGOHcFR/rv/YfwrORghETcHYaZfNf9YiPNRMkgyT7G5CODhUCvwkw6Y0B7F0sBQrVSln
	Z6eQd2b4Sa9NkdI8uhg2HI8s2ruCNDRy+GRwpPh0ta8Qcmjsvy4JH9LN+oc80G2nv1gM
	ZwM4XiM3j07eWEuWZZOef2zSGtGMYMr1ZQ6EJ9jRNH6lkhbLhDMfk6yneChU4jn14H7+
	6mjpNrMxGdp9aoGSrXZOneA4wvzvSR+kpcJhlmIp96t5GaJ7mV/G8EsD1aQTw4ZgUlzD
	bfgQ==
X-Gm-Message-State: AOUpUlErZ81hwOSpeQh8x12yCDpy29anVBAVr+L5J5aUfoPv5Syqm+hz
	KcqFZ5DWrAseW5RiAFbSVAMFZ6cC8Vd7NNYJZoo=
X-Google-Smtp-Source: AAOMgpcRjMlDIDq6XoW1p+9AuQeSt7q7vhUVewfbL87IVXdP/87sbs7Tlp/uaVDoS53Mfxzp1XTIxAV0F4dyqhRxubI=
X-Received: by 2002:a25:b091:: with SMTP id
	f17-v6mr9289453ybj.167.1532962256928; 
	Mon, 30 Jul 2018 07:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL4qPSzB=o8BicxhpW-xwi4BQhBFQPuajx5A0GA=X=znYg@mail.gmail.com>
	<CAJTo0Lb+KsKi2fKwEJx-KbDmbTnCPVwwNaM0M0-mO3G2xOeDeg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb+KsKi2fKwEJx-KbDmbTnCPVwwNaM0M0-mO3G2xOeDeg@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
Date: Mon, 30 Jul 2018 10:50:45 -0400
Message-ID: <CAFeBWL6Mo3Cp8Ku+CfoyyGs_6PQ1Z+rSa4D9faCzwVAZ-PRHgA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] devtool add recipe with no srctree / fetchuri?
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
X-List-Received-Date: Mon, 30 Jul 2018 14:50:56 -0000
Content-Type: text/plain; charset="UTF-8"

Got it. Thank you for the prompt response.

On Mon, Jul 30, 2018 at 10:18 AM Burton, Ross <ross.burton@intel.com> wrote:

> devtool add's primary convenience is how it can examine the source and
> write the LICENSE correctly, the correct inherits, etc.  If you're
> just going to install a few files then just write a recipe from
> scratch.
>
> Ross
>
> On 30 July 2018 at 15:10, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Is it possible to run 'devtool add [recipe-name]' without 'srctree' or
> > 'fetchuri'?
> > I just want to add a simple recipe with a few files to be installed on
> the
> > target file system.
> > I can directly add a file in my meta-layer, but devtool is probably the
> more
> > correct approach.
> >
> > Adam
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

