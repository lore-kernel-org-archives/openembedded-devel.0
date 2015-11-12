Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE5B7720F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 12:12:28 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so39647991igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 04:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=a5FV4QDX0EZazV20zsbrQh6tfiU1VGjWYccEoBC0DQ8=;
	b=gWDa4qeHGumDeUEuCMxgkev3HjKE8bbDYVGhyBFaL8qTDCeA22+0lDN1UMAov6yDnK
	auo8FlToEgNeHBrfpbCL62qoRktnBLazj7cQXZoObtjXHhIBUQoDMIAZzdQ/zU974kRT
	xBTmr+T9YOeHpEYAQIb0ZvqpCde6LLmsz7K6uRPNB0ttxye8jHTpmVd9ue+Vl4YZiWoo
	qYFlJ1A2d9NP7rjiXDD81/KgMXVgz1zn/UYXz8BCSaQ01Tn8CyXFZgJ07UgYyOfPqQoS
	uGkUv1eweTKD1XTK3CYgd7n0enCFW8oLAHMVgfaGgGM7Ux2iyXsPXU50bvM4UvJpTSt9
	RDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=a5FV4QDX0EZazV20zsbrQh6tfiU1VGjWYccEoBC0DQ8=;
	b=UJhDtO4prR67RUxt4qYqCe71xBY2fnPb+3bRT//J9YcLUu8FdPyP/iyi0l15ZCf2Al
	tR6ycwyiMOqMVvEiL7ORVqP0b8Cj6VBwmuYymLd+ai+/lpnPpnKYoY/G8MbE1W1GODUo
	CPrjrEYa7U4t0Jap4dI2YFiYEPP4OHsdaUcda6jhFhov3dbPAmcY5fkOlrVvD7Nsm36P
	Op+d72NJHeFXIUqYjqUJztNkDaVnkn45aW0NyDT6MyMeEfcSap2oMSHEx+BSso1oXsL5
	Ns3BpN1TfXsEqTfI5Mucx1uqfUng8/WhMzInNTDbHgP0NBJsGQGbFCRbnM2RVGOZiEOw
	MiFA==
X-Gm-Message-State: ALoCoQnYpTQEW/ipCsbak0VFFl2WGLKKn+jtBDattslze4MwnW6dkNyTYw8qP+YorGdrcplN6CZs
X-Received: by 10.50.112.100 with SMTP id ip4mr15317677igb.78.1447330348496;
	Thu, 12 Nov 2015 04:12:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 12 Nov 2015 04:12:09 -0800 (PST)
In-Reply-To: <20151112114311.GD2574@jama>
References: <20151112114311.GD2574@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Nov 2015 12:12:09 +0000
Message-ID: <CAJTo0LaeSCxpDbt2QmKXyE+hdYJs5Sb7NuVPZ3=1ZzyfrVfd7A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, test-dependencies 2015-11-12
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
X-List-Received-Date: Thu, 12 Nov 2015 12:12:30 -0000
Content-Type: text/plain; charset=UTF-8

On 12 November 2015 at 11:43, Martin Jansa <martin.jansa@gmail.com> wrote:

> WARN: clutter-gst-3.0: clutter-gst-3.0 rdepends on libgudev, but it isn't
> a build dependency?
> WARN: gammu: gammu rdepends on libgudev, but it isn't a build dependency?
> WARN: gstreamer1.0-plugins-good: gstreamer1.0-plugins-good-video4linux2
> rdepends on libgudev, but it isn't a build dependency?
>

Looks like oe-core should take gudev for consistency between init systems.

Ross

