Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9D51A601B5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 22:09:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48MZl82tBfz3R;
	Tue, 18 Feb 2020 23:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582063764;
	bh=Rzczh6tIONPpEKEwLUuf9WDg+tpYJxYU5yOyJg4HP+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEFmc7BtR5Jb+w9dugVoPpyPkNdJ3IxjJg7jpdrDfUg9aaor8N9t7yHki0qbk5L8g
	GAFSbAp8ssqQRDj7xMDhR5BFFUyHgVeZwdyWhbicTlyrzZZmam7l2uhZ2i65Qe0H+w
	9rdmUoUDpn2U/17zZKHNnEw+mP4xjBulgM5AsUoNRd8O+d+chqj1JbyLefNpcoxEwo
	wH79VHUe9vPGKL3MnHorVhtyfWr26Bs2eVkxtVVSt+QGjEIKUiExcuUbyMRAy9jLaX
	1jsdyw08Xi1Sf/HwTYgdWpUpDZiIzaHucP3P2f3UR23M1W2qALiY+HQRgTOk+oKiib
	g98aN5x2fr6Su5GxBap6HbTk9w/i9GktCbq+OfwciM02kx/U/yeCTLEOI9p/lfwbWV
	mjYVoGLEQw27D25jaduzs2Y5caKqrPoyScjHqX4wTqRROglZv1ogPm5jjFYUSnosud
	cO62r+CCpXeY0iwQO6g6Bx03sK8ExWDNhGxHSqFSsIbOYceSIr2fnKVMZxv6bVhMx8
	YtxOiYopiJotnGQGldjgKAMHckGo2RIVNTFOfnD4tLkB7hUcVPJQSBfShCryC54QIU
	q6EDgMD+0Y+MY5qlnJABv59GotNUAWBK0An3qDRifG8zlSGYJXaZspJYXZnuxSc/26
	wdtfQD3j4xqpjS0fp2GSrRmI=
Date: Wed, 19 Feb 2020 00:09:22 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Jonathan Richardson <jonathan.richardson@broadcom.com>
Message-ID: <20200218220922.GA24326@localhost>
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-2-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1srVisq=yo-3dJ50T8xnBimO=gDkumZLw=yEaugxGbz7Lw@mail.gmail.com>
	<CAHrpVsXMkZydpmbXPdQJo5qW1=DpJTqSUghNjTnZahqCg7hj9Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHrpVsXMkZydpmbXPdQJo5qW1=DpJTqSUghNjTnZahqCg7hj9Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fio: upgrade 3.17 -> 3.18
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
X-List-Received-Date: Tue, 18 Feb 2020 22:09:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 18, 2020 at 11:37:33AM -0800, Jonathan Richardson via Openembedded-devel wrote:
> I was just about to submit a patch to remove the disabling of compiler
> optimizations to fio. On our cortex A72 this kills the performance of fio
> by 25%. That would solve this build issue also.
>...
> > https://errors.yoctoproject.org/Errors/Details/391129/
>...

t/io_uring.c:103:17: error: '__NR_sys_io_uring_register' undeclared (first use in this function); did you mean 'SYS_io_uring_register'?

This error does not look related to optimization.

This looks like https://github.com/axboe/fio/issues/923

cu
Adrian

