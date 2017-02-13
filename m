Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id A243C71DBE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 12:36:45 +0000 (UTC)
Received: by mail-qt0-f182.google.com with SMTP id k15so82001662qtg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FCGcfvkUp9+jbNe7tUBH5aAv2tWVwmzinItMVITt7z0=;
	b=oZMUxH+bJ/gESf3EvGwUkCVYT+Xcbe2MLYgM293v0x5nMgQE/8bxg89K++8HmavqSU
	5jt+hrA4jAphC3Cq0GqvkIrqPql6YoAWHa8iQIJ2HrK3EOaJgxfPbvLSJj/jGmZNRjL6
	G912BqKEComzL19shRTBswLHVnLxvDssWjTRsmFyya0FEj8A3EXcyEudWpBPOEujQ/jm
	HeHwRZul/37HlsFmOR+qtmAoU/4y+gdumreRjyuFnnvHq0DFhyXkcbvpmZ4Pz6pxoaJk
	AG6iebO9Raf7xjdjbuRW+iJKf3WQRAi4mgp0RSJ4swHyxCZE/JKN8wB45S2ZWVHnitB/
	95iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FCGcfvkUp9+jbNe7tUBH5aAv2tWVwmzinItMVITt7z0=;
	b=P5pxOjsIQXDN0wVzWBpoVFPf+kxcsRs1GZGtfODEnyIpmWh0yZQuV6pWmuCPwdwAvU
	TndbLVdb4TIt5FcFUooT4/JzM7SK7lllVHqVRYcvtH43RY/pJ6IOMP1Veujdd6cLlH+a
	ZCqsuCiZU4Rv9sI/K1t8fJPF2ttI7RJhxQx3SN9iBhprQcMMzmK3zPebDH/2Dg0YpDu4
	Ebd4OUxDbZ9rVCEU2OHrl0L8IoOVLeNqsdZa7wMv3fe0G3MCjDqaBlkByKpWWX+WyFmk
	zkwEoo3n7Sr+e19iZxdKtcqYXREgDin7RafHDXpwmlPqYOFj4ejT3wW+FljzbxfXEnp2
	xvrg==
X-Gm-Message-State: AMke39kawAETlx2JCDW525eNGabd03V2FjJ/4R4Rcdeeu+so1da/OVFIa1tzrDaFo1C17Ujy/qqkJdqp0+2ZJ0NE
X-Received: by 10.200.45.247 with SMTP id q52mr22485867qta.197.1486989405759; 
	Mon, 13 Feb 2017 04:36:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 04:36:25 -0800 (PST)
In-Reply-To: <20170210082811.GA3021@jama>
References: <20170210082811.GA3021@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 12:36:25 +0000
Message-ID: <CAJTo0LYpGLN9M3CkUKcaySEkinDSqw2=aCuJcA5+-gonqgTNHA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-08
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
X-List-Received-Date: Mon, 13 Feb 2017 12:36:46 -0000
Content-Type: text/plain; charset=UTF-8

On 10 February 2017 at 08:28, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * openembedded-core/meta/recipes-support/libxslt/libxslt_1.1.29.bb:
> do_compile
>

This is due to ld-is-gold, there's a patch from Jussi on the list (and in
mut).

Ross

