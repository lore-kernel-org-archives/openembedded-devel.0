Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (unknown [209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0AFDA60196
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 May 2014 15:55:17 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id dc16so2745492qab.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 May 2014 08:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=XKvzXWadHq0n4/Ahidxcd3aTzNyY5GnDYWUAicC9g8I=;
	b=iqemZp6s6bHhf1KPCioYhv0nsuMbt48TfP5wqy4saXfQr7/YuF2eqdFUHNLIMH+LWB
	Br9z0Bi1CjD0P14yANsnMN2BeGCOs6Oap1jJYDq+Hw72cjuP3TxirDfQ71uoTUOEDBKc
	DDJdZ2vN4t1eobZC6wnWh3aGAL0qHNsNGqCpOglt1x0LuqmgSCAMPGzGuneLV6rFiWhu
	GVY1zUs0k4BC3qCw4Nf+zPNZZJrnWGflSiIrLB/yc+y5WTE2FXOweUXgpI/JIB0eAosk
	eun8icUYz8BvlwRNcGnLQrYHbejeJcThun45qcyMdvheQoaw9EJE2FaEZi2ZlUbp+m4h
	hTVA==
X-Gm-Message-State: ALoCoQkyIZ/PAcUqyO1Fyy5vV36NF9s8g1Ttyfn3qeEzfDxIO2bdCPiqIgsLtKeg57dYNXUYFBMI
X-Received: by 10.140.104.78 with SMTP id z72mr5988944qge.60.1399564518767;
	Thu, 08 May 2014 08:55:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 08:54:57 -0700 (PDT)
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 16:54:57 +0100
Message-ID: <CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: GStreamer 0.10's future
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 May 2014 15:55:20 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2014 15:48, Burton, Ross <ross.burton@intel.com> wrote:
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.

So the catch here is that Qt4 currently depends on GStreamer 0.10.

Can someone who doesn't come out in a rash when looking at C++ code
spend two minutes to tell if me Qt4 supports GStreamer 1.0 (unlikely)
and whether we can make GStreamer 0.10 support a build-time
configuration and simply disable it in oe-core.

Ross

