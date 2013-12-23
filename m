Return-Path: <ross.burton@intel.com>
Received: from mail-qe0-f49.google.com (mail-qe0-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 422D760D9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2013 18:01:57 +0000 (UTC)
Received: by mail-qe0-f49.google.com with SMTP id w7so5409627qeb.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Dec 2013 10:01:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=eehMjiC6boR0r0blfVVtigNVI2A+e+1w8r35Huzix5g=;
	b=NNartItmuHlY0aMFEJFMljwUJXX24SzYLG8NIvq4yHaREZfIR9rUZDhz2PC7abX1z5
	axiksW3xcVfIGG2EENHx/o7XNuSI3aQ8wlbjnwKTYS7YrQzrTCkMGbsrYxQDBfdLF1jp
	W9NGvnDjW65/BLGsJLgbpJt5j4kEhsKE7OVZXuaXvFOusUhEQkDRsbjl7d3XlnA29CF2
	yUGpPT2piwvO+5jYsc9fuTxsuddb7X7bGNWHa2dozSHKoIziM5GNn/qQqdnfW3uf7ScZ
	JbfkG+5dLyD+mWJSwLF/7zPgKBKugWWJp77oxGWKW29mOaEQKkaVr+9vXwDlKPFNFR33
	uEhw==
X-Gm-Message-State: ALoCoQkg3vrnjxg5hvtYKiagqns/kf8bsqA3/+OGcfZDns/4WiptdmcdADu74B+5hG9b1n8qGxtZ
X-Received: by 10.49.51.66 with SMTP id i2mr44646732qeo.26.1387821717834; Mon,
	23 Dec 2013 10:01:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.96.179.105 with HTTP; Mon, 23 Dec 2013 10:01:37 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Dec 2013 18:01:37 +0000
Message-ID: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	Poky Project <poky@yoctoproject.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Piglit in Poky
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
X-List-Received-Date: Mon, 23 Dec 2013 18:01:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

We'd like to integrate Piglit (an OpenGL test suite) into Poky so that
we can run automated QA on the GL stack.  Piglit is currently residing
in meta-oe, but as Poky is a self-contained project we can't just add
meta-oe to it:  apart from the size of meta-oe, we can't ensure
stability if meta-oe makes incompatible changes that affect Poky.

Piglit isn't a stand-alone package, there are the dependencies of
waffle, python-mako and python-numpy to consider too.  There are two
possibilities I can see:

1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
and pushes the boundaries of "core platform".  In a sense this is a
repeat of the discussion we had with Midori...  does oe-core contain
everything needed to sufficiently exercise the core components it
ships or not?

2) Add piglit and deps to meta-yocto.  Probably a new layer called
meta-yocto-qa (or similar) because the Yocto Compatible guidelines
forbid mixing distribution policy and recipes.  We'd need to sync
meta-yocto-qa with the pieces of meta-oe that we want somehow, but
that's our problem.

Thoughts and opinions welcome over Christmas, otherwise I'll toss a coin. :)

Ross

