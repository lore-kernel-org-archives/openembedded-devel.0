Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 786CD731B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2016 19:35:41 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id s8so57557531ign.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2016 12:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=VwQrCSZhhVs0XTZAKVvYLZpUmgyqQ5oN3lrsPO8SL5c=;
	b=E7GdQcYN5x4chIHV3588MjbZ3NENR3oEBrjrQGarey7NsGpJtsdjcO1yTUrpCJ5LFj
	N9fscBXX37y/QqUkAsuIWz8rQKEzxDgoB1nXP3dT9Zh1zqM/mdNt589+1R+7glOvtvQE
	LkXJpUwoE3MfnpPZ+T06XL8mCaqD+/J2+/s5VKQbIutMH0VWY2JvNBuHBYLKhvA3gZs1
	zdBcRNfd2IxNX+HN/+6iz4w6DFi4oJnfUt9G/7SGpRGn2v4yZEP2B2xd24TcNMg+bv6d
	6JIYaCynJ3ZQsUH7qBHB9NbWc2OvNJt2LnThwQC4brmdzqPYBzZiVFdCHesOoTb9bgUc
	1csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=VwQrCSZhhVs0XTZAKVvYLZpUmgyqQ5oN3lrsPO8SL5c=;
	b=iODc0gwMnfQv463eVNuQD/D33HgFdWSYFeBee3N8CvlfdDrfYg9ryHTT2x4pquZPpq
	+m2R5PoMDG1tD+oHej7AKOuG1T7Ja2BuJH+8WqEQMWMvIS2Npjiyczraold3ax/KaJ0e
	7c/XyiKLA/+1EVszNYLVBCohL9/tacGFn0zSCLpx0kQb0d8L+LeuNX2zmwCxoJa/EHvG
	MwPQpLr86G+WRGHLp3AIUeiz1S/cmQSHYCrLprZKQDTu3gr/kmHn1WlBITvgTjuHWXal
	UrSKcj5ElPJewCVavgdFmvRwjFSgJtp6qZNofkCgnbLTwBUmSJ9rrMWqUAMvxTO0/Nai
	8d/A==
X-Gm-Message-State: AOPr4FU1P6TXiMwX8KPZFSc/ROvRoHJYOmSqrMStYpwqgQwoSvMScbaphFsezChtQp/LZzNUYDZIED5OsxPG4oi9
X-Received: by 10.50.18.111 with SMTP id v15mr35116844igd.64.1462390542677;
	Wed, 04 May 2016 12:35:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.34.142 with HTTP; Wed, 4 May 2016 12:35:23 -0700 (PDT)
In-Reply-To: <1462374941-8473-1-git-send-email-j-stiffler@ti.com>
References: <1462374941-8473-1-git-send-email-j-stiffler@ti.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 May 2016 20:35:23 +0100
Message-ID: <CAJTo0LaDTuXZu9r7py2ZaKOYF2oMa1GUmKSRBWP61J1k_EDwew@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] opencv: Fix broken deps for opencv meta package
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
X-List-Received-Date: Wed, 04 May 2016 19:35:46 -0000
Content-Type: text/plain; charset=UTF-8

On 4 May 2016 at 16:15, Jacob Stiffler <j-stiffler@ti.com> wrote:

> * The opencv meta package's RDEPENDS list is blindly populated with
>   all non *-dev, *-dbg, and *-doc packages
>
> * This includes the non-existent opencv-locale package which is added
>   to the list by default in oe-core/meta/conf/bitbake.conf
> * This issue was hidden as late as jethro as the distutils class was
>   overwriting the PACKAGES list
> * Therefore add opencv-locale to the opencv meta package blacklist,
>   and filter out all packages which contain "locale" in the package
>   name to be safe.
>
> * Another issue with the meta package dependency generation logic is
>   that it may add other empty, non-existent packages.
> * The existence of the opencv-java package depends on the
>   PACKAGECONFIG, though it is added as a meta package dependency in
>   all cases.
> * Therefore check the contents of PKGDEST to only add non-empty
>   packages as RDEPENDS for the opencv meta package.
>

do_split_packages() returns the list of packages that it created, so the
output from the final call to do_split_packages (that creates lib%s) should
be exactly what you need to create a metapackage.

(it currently returns duplicates if multiple files are packages, but this
doesn't cause a problem for metapackage dependencies)

Ross

