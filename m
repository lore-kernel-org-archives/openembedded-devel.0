Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A08F171A00
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Nov 2016 12:59:25 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id q130so95778184qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2016 05:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=oU/bK7MMNvxI6N0wBMyxXRZatbWnZ7ucu7Ch8ZmYTPM=;
	b=lywiEwlPuZuGds+Tf95aIRh7rKMGW8h1ksgOUf+RCVG1I7CHu/GrkvRAZXh7R4K4bP
	9TqSzWvlvVt5AiwGjS6LM3aia1xPVYbkkSaTBILFlCugruhG9nj0ouFJD3z4LSdPJ9CT
	oQ1zcEjC/8Dd5lN6DZb3oehtR1XzK1biCv34zhyeX2dhhdknFzf1q+tDuuS1ttm2D4SB
	cVwDq4HllrkyF0HoCSV+yLNyB093uc8nwV1pf8lD5EsHsw+jlzCV7axAsw843+plyuLV
	w1iSNRSx520SLxX3TP07HyxpdfK4A1fX6OcHP7cixfUqcjuOp9iahbRvSeMlNyOuh/yP
	c84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=oU/bK7MMNvxI6N0wBMyxXRZatbWnZ7ucu7Ch8ZmYTPM=;
	b=iIsU8jc3hBP5IBfCI56MJzx1xku0qrimUqsu6C/EuHEdQu9ofQc2r2eDJZtbaod1xT
	2ycCgsqHpLTpkixfl2bl7MLaErIlwtQPIgldVmciEkQ4w7QPZ9fR8aCnCysbTO3mytrz
	9ab6M7I9qv85zoYVHedsY8uEzELsIQ8X1ctnQg81pO5geDtaTWgntNkuDCj2V2dlYSPo
	vT6s7xAbS7zBfv05GyXWwjh2ZBcipwAWAXlj41v8FJi8jSli6TSoyexkyr3qhbhngmNz
	3fFW7e6jx9KZcRm/eToJHmmhlaqfHQ5YXKLyFpreiBykcw2EFokZF49lybBJ1dAyvyu6
	J18A==
X-Gm-Message-State: ABUngvdoVpWQeuGHazFYkMw46zCFz7YfKw6RYU+qLqsPMsfm8GJcGMrsKAYF71Kc22nDJAHTNq6hgqTz2mJMD7eU
X-Received: by 10.55.75.17 with SMTP id y17mr12966569qka.26.1478264366314;
	Fri, 04 Nov 2016 05:59:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Fri, 4 Nov 2016 05:59:05 -0700 (PDT)
In-Reply-To: <7852C550-ECFB-4223-8F96-C3E342FF019F@gmail.com>
References: <1735731.JWP8iUgCxd@elrond>
	<CAJTo0LZQQD8NGVYuO10ceBfvTW4hTiBbtHLwVcZNGjqZ+QMi8A@mail.gmail.com>
	<7852C550-ECFB-4223-8F96-C3E342FF019F@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Nov 2016 12:59:05 +0000
Message-ID: <CAJTo0La2_nXe5kLiWpgpr5G8Xw_RdiOLsp0tV3owwZxpYaTCSQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] p7zip recipe broken with rm_work
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
X-List-Received-Date: Fri, 04 Nov 2016 12:59:25 -0000
Content-Type: text/plain; charset=UTF-8

On 3 November 2016 at 19:17, Khem Raj <raj.khem@gmail.com> wrote:

> While agreeing on converting the script into a patch, I fail to understand
> how it it different then some of other install calls in the same function
>

Because the wrapper script will contain ${D} which is inside the work
directory.

I just noticed this has already been fixed in master with this commit:

$ git show 67d6ed40bfeb219490e509f33c27ebd2a1149d30
commit 67d6ed40bfeb219490e509f33c27ebd2a1149d30
Author: Jonathan Liu <net147@gmail.com>
Date:   Fri Sep 23 12:39:24 2016 +1000

    p7zip: do not hardcode path in native wrapper script

    Signed-off-by: Jonathan Liu <net147@gmail.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

So if you're using a branch, submit a backport request.

Ross

