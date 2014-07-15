Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id C754C6FE5C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 21:52:02 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id e89so26555qgf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AwyF1jEIzFvz/55sQxVPZ6+vjfW0WyIILZ756ZmNtro=;
	b=kHStY1lCmQvS7tG1V83ez/44SxwwAMLItU85MhOdUnBOc3un+I6rR6TukKfy9TNeXd
	Vo5sCPs22BaeI9vHYXgFZ43Gl/xiaPt/iT0pYazgqg/fU1VAtdXLhuCCEWfVC5DSB9ZP
	P5ImBepotlUu9gcOOPdRF7UUxgoA0UMW+nlA9Mkj8odyA5i3/gyIWAxJ8BuIYrNDz9b2
	B81URRarX+mVG2IiML7lvwM9kHXQBtQ4Euz4i1rwrg9xFKRUnGyEfy50CkeAcmp1ZOPT
	nU1VgO6vw0jQX1orneZOnzxUJJQIJfZiG1NPkIVMgwYWZ2m23yhilX0PkOxkA44inINx
	fb8Q==
X-Gm-Message-State: ALoCoQlfmmSR4f9dU+m12IoQyfmZmuU8QRjJj9wKAlb1mwY4jyoTep+QMyZ6Aa9NOr0caKefSYGV
X-Received: by 10.140.100.233 with SMTP id s96mr14987594qge.92.1405461123388; 
	Tue, 15 Jul 2014 14:52:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 14:51:43 -0700 (PDT)
In-Reply-To: <CAMKF1sptj_ctzUmMSxm+6VW5LYG8xCm26b3_j4=8GMMS1HPr8w@mail.gmail.com>
References: <cover.1405440532.git.ross.burton@intel.com>
	<406153008dc78f4e3198c012f2db98fcac09b5c1.1405440532.git.ross.burton@intel.com>
	<CAMKF1sptj_ctzUmMSxm+6VW5LYG8xCm26b3_j4=8GMMS1HPr8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 22:51:43 +0100
Message-ID: <CAJTo0LajRNrS1nWfnE1n=ar6tO3A6US4too4sf8GwxZU1KyDwQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] autoconf: remove automake patch enforcing --foreign
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
X-List-Received-Date: Tue, 15 Jul 2014 21:52:11 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 21:14, Khem Raj <raj.khem@gmail.com> wrote:
> can it be somehow made such that it can be passed via option flags so we
> dont have to patch the packages not using above automake macro

Packages that don't use the right automake macro are generally very
old and we're already carrying patches to fix the autoconf/automake
files, so I'm not sure this is actually worth it.  I'm trying to drop
the patches we're carrying against core build tools, not increase it.
:)

Ross

