Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C8DB46AC7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 06:33:19 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so20219583pab.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2014 23:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XOYhv66aYWnbqHF1W3MlPF72/p/Z23YbGztzNVLtllI=;
	b=zakGPjlN8Q2vLo9j+WgSsLw/OvFDZZLFMSQusiPn8/gZoYpWClJmPZZf0nG6Gyrc/I
	kQM45hGbGpSToO6uAHVQT56amRYKTYwhC2uI3xxEbgpUn17ikce/+MaA6r1g5D0Xge8C
	MrpmxYWrzud7z4ao4lZlUS5cXkBTTv5p64T454NqOgVLFbKoV5Zjm4XdyKrget+REeMK
	QnaETupj6HhRgT/NfkumJV5mHYaIwyWqnSThx4CGVYw7nHH/1paGmMt1+96hyz/McwQR
	BEp/cKSmOlOFs0D6Tlgd/Q3CB3OsI1Mvl3cdEzxfZGetvlM878q7ORTjdbHqCcvSNxlO
	1OPg==
X-Received: by 10.68.202.196 with SMTP id kk4mr25391251pbc.37.1408948401050;
	Sun, 24 Aug 2014 23:33:21 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id
	nn3sm54972067pdb.58.2014.08.24.23.33.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Aug 2014 23:33:20 -0700 (PDT)
Date: Sun, 24 Aug 2014 23:37:08 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140825063708.GE1014@haswell>
References: <1408612843-22017-1-git-send-email-jackie.huang@windriver.com>
	<20140821193142.GB3660@jama>
MIME-Version: 1.0
In-Reply-To: <20140821193142.GB3660@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] lmbench: remove debianutils from RDEPENDS and add perl
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
X-List-Received-Date: Mon, 25 Aug 2014 06:33:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-21 21:31:42, Martin Jansa wrote:
> On Thu, Aug 21, 2014 at 05:20:43AM -0400, jackie.huang@windriver.com wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> > 
> > - I don't see any evdidence that lmbench needs debianutils to run:
> >   debianutils provides:
> >     run-parts, tempfile, savelog, which, ischroot,
> >     add-shell, installkernel, remove-shell
> >   but none of them is used by lmbench scripts and I tested it work
> >   fine without debianutils, so remove debianutils from RDEPENDS
> 
> Lets see how far Tom's memory goes :)
> 
> commit 6dbe8d71c465fdf86310ca7f83332ff32baf12f5
> Author: Tom Rini <trini@embeddedalley.com>
> Date:   Fri Feb 13 01:14:22 2009 -0500
> 
>     lmbench: Fix config file location in lmbench-run add RDEP on debianutils, bump PR
> 

that was lmbench2 and probably some config script might have needed it
but clearly I dont see any need for it now with lmbench3

