Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0B92371B9E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 09:02:18 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id a72so16748974qkj.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 May 2017 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XhXUJPPB7Pdx23QTuNeicL4uQUsH/NNTOCDUyRl7IGA=;
	b=R7rwl/C+RkNr15tjSrLmJoQRidoZDPC2+NkBls/7AWypUMgcUC8dc450Bxf9/MQpic
	+ZPBqUMBrj4wYH/Cux6ibcx5akGYiWQL76F8WzC7aWBxmk0I4v+Ha0hlZMWJW8m6MOh+
	RPG5zaebR0nbFwPN/40oAdZ2YWRSqxsw9cHq/PgO6cNa9NCN/lnbAjL/Hh0cFaHD6aRU
	rYbXTheYJGHKRGX6BUWx1FszwSaoMzSr+k8vtNq/iPb0tsfVKZ/SbY/H7tplThPkFxPK
	Xa1coOkUMJkqLAhyA8RqNNJ0dQf9Xyjo0VXW61e7+BPjiv57K1zE95PmKPPeGRJGiUpD
	/lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XhXUJPPB7Pdx23QTuNeicL4uQUsH/NNTOCDUyRl7IGA=;
	b=KCwRt2mPLz08HL+uOuESyQyikGwMZL1+M89n4qBY/lSIL8IH2dUFJRtC/swMZ33DDs
	1KegqOo/TyI2sEkON3EI6zAm6dW9jejpDCCPSdhxMPqXi3T0Kyk5zsd+zfTPZLQFjqiB
	Nvp1+xCYEdt02POggUxpnDg1f+p7flH+l04trfhuBrjSHoHLMO72GVEgI9RRijyubJUX
	vKQC5PL5zTrxt/Tk8R7DoZOq8Yl+xGEjyvokiW078oRhgVFQV774hu9+s5XvpX0FrXzD
	M+gJ+U8vMsxgIdbqBm0G2sqgRx5VFosFZ9LCKX3Jr20r1gnOJezs2FyT5cy7l/rNYnIF
	i1ug==
X-Gm-Message-State: AODbwcC/UMmrosjil4ii6YTK53ZgLJthrFsY9r0j263tIDibyBADPeuQ
	/iCw/KTQzMSks1QN0FksabpAFf5GWLfW
X-Received: by 10.55.146.68 with SMTP id u65mr9525807qkd.77.1494493339584;
	Thu, 11 May 2017 02:02:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Thu, 11 May 2017 02:01:59 -0700 (PDT)
In-Reply-To: <2fe15965-3372-3e2e-1d77-3c46ea397527@pr.hu>
References: <2fe15965-3372-3e2e-1d77-3c46ea397527@pr.hu>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 May 2017 10:01:59 +0100
Message-ID: <CAJTo0Lb3pTp4Jjv=e2mE4CTaJdLsMMmFYxzE9861vJTgkkj7Pg@mail.gmail.com>
To: Boszormenyi Zoltan <zboszor@pr.hu>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Cairo egl / glesv2 PACKAGECONFIG dependency hell
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
X-List-Received-Date: Thu, 11 May 2017 09:02:19 -0000
Content-Type: text/plain; charset=UTF-8

On 11 May 2017 at 09:08, Boszormenyi Zoltan <zboszor@pr.hu> wrote:

> Please fix it either way: remove PACKAGECONFIG[egl] from cairo
> or add native build to mesa.
>

Or only enable egl in target builds (using a class override), which is the
easier, simpler, and correct fix.

Ross

