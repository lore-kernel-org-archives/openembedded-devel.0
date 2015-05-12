Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 8542173FF2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 21:44:52 +0000 (UTC)
Received: by iepk2 with SMTP id k2so13412195iep.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 14:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Q7wUhZe4Coc+3toAovqLNjSfq5riKpj72RtDvJRUEns=;
	b=xx+k+FD3PO+U6Voajz9ovYi8z0YHqqr1wgKfolidY1+ycOYY+NiIOojlD/kdzgiNm/
	jsCVayjhAc5mo8MwwvtCeUXR5cgnIj96b8FrnjRlnmivZccmIFhiYBGB+rPhC1+1oZlk
	4OzZG8M9KFsu2d0PUzaV/Q59xH9HWSh4RaNrc866w4xo2WCYMBBw1ZosW1LKzBi6But9
	pgaADfYe6JLX1bwYwvkQRbAytTIalA6cLucDmdJvLKR/5gFQgi26N190iQj6gLUo3sfI
	5yIVCyJZsRQSGXfFQRpzeDhOZSgxyoiOSFbBCwzdsGGfB2WENcoOVCFS/NaYzI3/HV38
	QScg==
X-Received: by 10.50.23.105 with SMTP id l9mr24334288igf.13.1431467093994;
	Tue, 12 May 2015 14:44:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Tue, 12 May 2015 14:44:23 -0700 (PDT)
In-Reply-To: <20150512211822.GE2714@jama>
References: <1430194195-1325-1-git-send-email-raj.khem@gmail.com>
	<1430194195-1325-3-git-send-email-raj.khem@gmail.com>
	<20150512211822.GE2714@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2015 14:44:23 -0700
Message-ID: <CAMKF1sqkaDNwVLe1TjZp1vs2jer7hZRjy3Bx+GKSgYcC2yCKLw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH 3/3] chromium, cef: Package codecs separately
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
X-List-Received-Date: Tue, 12 May 2015 21:44:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 2:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> There is still some overlap between chromium and cef recipes:
>
> ERROR: The recipe cef3 is trying to install files into a shared area
> when those files already exist. Those files and their manifest location
> are:
>    /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib/chrome/libpdf.so
>  Matched in manifest-qemux86-chromium.populate_sysroot
>  /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/lib/chrome/libffmpegsumo.so
>  Matched in manifest-qemux86-chromium.populate_sysroot
> Please verify which recipe should provide the above files.
>
> Can we please disable staging these 2 libraries in one of them?

actually cef should put it under /usr/lib/cef/ then they can live happily

