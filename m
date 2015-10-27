Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 76EED75CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 20:15:21 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so87908789igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems_com_br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=pOiZCmcZH6QWMMXbQ4jUFgt3xOm1e2Jmxmt0Z+xLe8Q=;
	b=neygl89HcDuK4HucnmpLWoU3FQH5raugcTSAB9OBy0ro5iq4WaGxAvZPOVaHVIjaEf
	AFmiDQLfjvVVEPI7sNiAIDZJWTucYu2LMCV7yIyw5tEGonbFS0kumbD7lJ+4LME4jlIr
	ezLgrrVIRWi2bpGE6Ex6k21CGA9SGWDJ6EwHOLKl6FMIvqGbyYnULraEGkIsg6uv2Rc7
	0oqq6YkWsmK/AzfnpsRZglhZvNoGR6ypkJMF3TdA0biLot96Ryw9767i3RMKLJ+Yp8Gt
	EBu2blMNRrwW1penyZsQE/lsLrmGhiiWnCbBuQzfUWL1HyTGGOzGP9Dg2Jg/9ENQLsHD
	1wWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=pOiZCmcZH6QWMMXbQ4jUFgt3xOm1e2Jmxmt0Z+xLe8Q=;
	b=CYSv9CZZVMezkH9rkwoNqe8ddO3gUDU2ATfLFEz3XVB8MlZqiNRvShwTFFQB+uagZb
	DQ4sIn+QhCt30HRpHq09y8UG7G5H3QkAgHBwMRKoxHLQFyy9+8sJlYzdvK12ozxZuuum
	aTQcc1GTji3//3rtCQuYY4dzLkVdC8vAKxEEaEWpWTD7nxIGCR03PDVb6MJe9z9xfJDr
	ms2mzyMRijmRXgpp0UiPco/LDL7RRPNzoRx5kID5Rq/NqO96LbnAahpcEYCIQWthBmU8
	m66BYEU+DE60+42frOjg0/yy8Hc5Pts86Fvl19Od4ajQUhfPorUBkgNS3VRV8phsX4mN
	oWMw==
X-Gm-Message-State: ALoCoQk1qRgyFG80231R3yGwDfeviczcGFiyKExjYZFf8cP3oLXbM6GJaQlM84LfHSo0hm+zNCui
X-Received: by 10.50.142.8 with SMTP id rs8mr28289022igb.87.1445976921578;
	Tue, 27 Oct 2015 13:15:21 -0700 (PDT)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com.
	[209.85.223.173]) by smtp.gmail.com with ESMTPSA id
	cj4sm8762443igc.16.2015.10.27.13.15.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 13:15:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodd200 with SMTP id d200so71378819iod.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:15:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.17.18 with SMTP id z18mr39570542ioi.28.1445976919928;
	Tue, 27 Oct 2015 13:15:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 27 Oct 2015 13:15:19 -0700 (PDT)
In-Reply-To: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
Date: Tue, 27 Oct 2015 18:15:19 -0200
Message-ID: <CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Tue, 27 Oct 2015 20:15:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>
> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in 3.5
> (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-backend).
>
> Ensure JIT is built with llvm
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

There is a patch to add LLVM 3.7[1]; I think this one can be dropped.

1. http://patchwork.openembedded.org/patch/106281/

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

