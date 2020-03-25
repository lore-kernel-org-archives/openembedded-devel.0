Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.7109.1585123071961547971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 00:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=ZRxYKBUm;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=0toi=5k=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48nL7t5BMvz3D;
	Wed, 25 Mar 2020 08:57:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1585123067;
	bh=BVHKSHcJu2iR0EnFvKjfiI46n4D71yZUJ33UYuMh4SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZRxYKBUmmdm16eNh9iB05RzNicPpRXRsdzJmv5LnSJOihPibPbCpICS/LXTuRG4Io
	 1aGEYV5AkEG0K13VwRzuUC0+eDx4TlyWJeOEXYskBVkO7SlsQRg+RFqO30NeVy8xnL
	 3FiCP/wbT+Ep1B5Dn1q6+8nfvjv1cwNwL/oyzT0LEWx+d3qA/y6WVsHj6S3inoMU+p
	 1bA81VuHvxpnYautS0S+8KFnoibc9CUwk3t3iL+xIO2FHg3602thiOaSRJc/wdcxrb
	 FaRr17uZhU4Nls2IlNdp4tB60rBASncMcBiv3tEROXjxB3Muk7s5aBNzNvbIsrJdDR
	 KuhxChlA5s2JapWjA8KQlNqadPyNcz9IGknrd8zDjLa6Dalq67hZUJVQ6vYSBrF1Kt
	 k1T58t/0FAg8uGkdFynTyhmz/oGbs7OLWnnnyBf6YfcVq0FMTneSOnaRefltTN4Kx/
	 NLxkWaq+/kI8WN1Qk7hG64QQjJ6oOD06JXW9Lx21cngZshvvnaL9rZoNT0Dq1u/ukU
	 peguR9NQWcato1nZC5v/sea0gxrTKLnEjhfjGhdT3NYT0NlLqNC6pKF8z/8KF+uffr
	 1HkHWSPxAPYr5lmB6mz2FYFd2c+PAyxnohgo70HyFa+Az2EtXCjCNQaMIroJ7UhBsZ
	 C75GttJfPUB2izcl9MpM1p1g=
Date: Wed, 25 Mar 2020 09:57:44 +0200
From: "Adrian Bunk" <bunk@stusta.de>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-filesystems] [PATCH] fatresize: upgrade 1.0.2-11 -> 1.0.2
Message-ID: <20200325075744.GA10567@localhost>
References: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1585118838-33916-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 24, 2020 at 11:47:14PM -0700, Wang Mingyu wrote:
>...
> -PV = "1.0.2-11"
> +PV = "1.0.2"
>...

PV shouldn't be going backwards.

>...
> -SRCREV = "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
> +SRCREV = "eb87617875abe47fb307ac3c5a741afc4f88b855"
>...

This downgrades from 1.0.2-11 to 1.0.2-9.

cu
Adrian
