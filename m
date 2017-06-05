Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0EB0A7757F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jun 2017 11:01:05 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id c10so25598445qtd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Jun 2017 04:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FB4omTyDiaenraBASOSGOOhn7ZhEZDckR6uENkmgg6c=;
	b=VWMYMm0X9BdEhKW2smaCuxJRvJfw9BhYsQaAIbWa2uk7bCgKCqXmD9I7Urfgojk44t
	xF0i8C2YPxoupcgK4ttFjnEcai6epRsC2wmefekeL3zhB3ZsvPV4/4gsFtEOfEkacs+c
	cQ1Bnh7m5Rh0noNTwXw8BVH4qtSKkMhgDVcHDyGPJQSwTvLFCVmS7/if1bm2g+c+SeHk
	jNyQ4GOxmJxDLHlhsfkKwGxKPw1Fai0MiW2Pdx1nP/W4yaocZwYDfhCOW1INjpKADum+
	3LJyMnYSXGjFBb9CFNgGpq+ACeQaD6GoqTsCM073IgK0lalZzkMIpOhb/KOm75UHJkJc
	eFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FB4omTyDiaenraBASOSGOOhn7ZhEZDckR6uENkmgg6c=;
	b=WJoMfdHTdLXu8zJXDS/HtL2sROmNRiS+2EjYFVYJNhzGi1d//EDbSDRpwNbjA91j9b
	E62kif3h4YWfXfvIT5F/5pNl4LkB0SYsVGoEdTCfybtOwME13fy76VY65zFAyfce/Fht
	0AaL8Xot6JJ7duz7SUfpXQeQ/N+pOFs9B0XMajkfXbbjTwtgfr/Ggz4zqqk6O0TVwLNk
	AZf/N53FS6j/y855feLgDYI33EO9tUbgZGC6/vSChoHf+d85LgSO9h12RZKYurQxuF+j
	sjxjaIMuW81zVmj+abLjw15/2SSIfqspSg88J8nyZXgvWq4Yp4B/BkMrA8ONg9rK/bwK
	64YQ==
X-Gm-Message-State: AKS2vOw0FmlR0Cf39WtDiTmADvGDIvNbZCsRze3ReXngp3FzPo/1gX7R
	PIy4leH0xxoWAHyaAqtt+95S6x6mXv4j
X-Received: by 10.55.102.214 with SMTP id a205mr17674944qkc.154.1496660466191; 
	Mon, 05 Jun 2017 04:01:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Mon, 5 Jun 2017 04:00:45 -0700 (PDT)
In-Reply-To: <CADnrctF66h_p+DnajWstF=Du-uXwNP_Rpe40ZpzR8RUMN_=Cxw@mail.gmail.com>
References: <CADnrctF66h_p+DnajWstF=Du-uXwNP_Rpe40ZpzR8RUMN_=Cxw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Jun 2017 12:00:45 +0100
Message-ID: <CAJTo0LbpoJCQiSQ4LPm46gkBGT0Ca-ZkuGHa+XRo0PtVq7c8rQ@mail.gmail.com>
To: Adam Foltzer <acfoltzer@galois.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Meson update and fix
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
X-List-Received-Date: Mon, 05 Jun 2017 11:01:09 -0000
Content-Type: text/plain; charset="UTF-8"

On 2 June 2017 at 21:34, Adam Foltzer <acfoltzer@galois.com> wrote:

> These patches respectively fix some issues with the Meson bitbake class,
> and update the devtool recipe to the latest version. These issues arose
> when creating a new recipe for a C++ project that uses Meson, but the
> additional linker flags should help with C recipes as well.
>
> The diffs are available here:
> https://github.com/openembedded/meta-openembedded/compare/master...
> acfoltzer:meson-updates
>
> Regards,
> Adam
>

The patches need to be submitted to the list, using git-send-email ideally.

Please split them up more, for example fixing the HOST/BUILD confusion is
one commit, and the C++ flags another.

Ross

