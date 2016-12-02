Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 72946719CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 09:46:08 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id p16so246079109qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 01:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sNgpp13GsvLxxsNJRI8LGzd+2RvIMqnXDK9hpTvxiAs=;
	b=h4/0NwxkyRx0N9kp3nNE/2Lmioqrh2ZMN2WmBunUhczcHM8ffXpJPXAPX3j3sAdIEX
	iJrTdBUoRdu4OrocGaZJmme4UwVakMsmBSLd1cjGhiRQzvsYyr1o/X6fv+8PTI7pJ+wl
	srX+ylCNTD3MLBm7OHDvR7sSDm3O/OxSR8Kbshoj4jDEc6SJKuGmfkabQCnX6KEY0lGr
	tEF/rsaHnpwpkDOgcmcNew8VVwXqrrtJFZpdjH88xVLWFB7BlNIDzrxUEkCHZDmklqk7
	bkFBKi2+QTv8d/6b6dOLP/ZVVvLC6TstVYOFM6/Tl4bIHv1+TYWCaf4D5KsPF928m2ol
	82Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sNgpp13GsvLxxsNJRI8LGzd+2RvIMqnXDK9hpTvxiAs=;
	b=kLLXp+g+2DCftvdxgSEu7kv2+h4kRSB9sPI2ErZgQi/vAwg+I19mzNFrjeO3bzQyJW
	HrdWALevgc8JMFsgv0vzZ6isRqF3aiI5TIDef+DERpsrT50jsoX1Ko4/rC2X0qZn2Vi+
	o1rBHzYrCWa4ClCpYPPLngG0EaQcuBlewvNa9kccf9SoylhbhqV9Z5LhWvI5gU24pTHf
	fveuyvFtNKYXQve3/3gg+FuBozsVyv4x6hFPvQ1QyPo0MoxYZIGxD8gw80CisoUuPZP3
	T5Mxarhn98OOTuVmwdYkewyY2qWX7zMTZblKWnUk8SSBYGqjOQy98CO5+3rIe95uczdg
	jrqw==
X-Gm-Message-State: AKaTC02mDvK30YaPXXwrMbSbxUFz7uBXX6BBoN3VpS//j5taeYf+qD9yc13PfLZYYQ/9ko7dzwMg8NIpVYhMfC/f
X-Received: by 10.237.44.161 with SMTP id g30mr38168048qtd.144.1480671969741; 
	Fri, 02 Dec 2016 01:46:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 2 Dec 2016 01:45:49 -0800 (PST)
In-Reply-To: <20161202092012.12438-1-gordan.markus@pelagicore.com>
References: <20161202092012.12438-1-gordan.markus@pelagicore.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Dec 2016 09:45:49 +0000
Message-ID: <CAJTo0LZcPAvuMPjgochJxJeamar43NqG9pyWJnHQiV_cFsh0pQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Gordan_Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: Re: [meta-qt5][PATCH] gdb: Fix QA Warning
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
X-List-Received-Date: Fri, 02 Dec 2016 09:46:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2 December 2016 at 09:20, Gordan Marku=C5=A1 <gordan.markus@pelagicore.c=
om>
wrote:

> diff --git a/recipes-devtools/gdb/gdb_%.bbappend
> b/recipes-devtools/gdb/gdb_%.bbappend
> index 3e663e7..41592c4 100644
> --- a/recipes-devtools/gdb/gdb_%.bbappend
> +++ b/recipes-devtools/gdb/gdb_%.bbappend
> @@ -1 +1 @@
> -PACKAGECONFIG ??=3D "readline python"
> +PACKAGECONFIG ??=3D "python"
>

This should be PACKAGECONFIG_append =3D " python", surely.

Ross

