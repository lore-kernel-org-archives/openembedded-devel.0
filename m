Return-Path: <sjl@vctlabs.com>
Received: from dent.vctlabs.com (net-cf9a4187.iis.impulse.net [207.154.65.135])
	by mail.openembedded.org (Postfix) with ESMTP id DB74E7808D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 21:00:22 +0000 (UTC)
Received: by dent.vctlabs.com (Postfix, from userid 1000)
	id 6A17728020A; Mon, 18 Dec 2017 13:02:56 -0800 (PST)
Date: Mon, 18 Dec 2017 13:02:56 -0800
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: Derek Straka <derek@asterius.io>
Message-ID: <20171218210256.GQ27580@vctlabs.com>
Mail-Followup-To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	Derek Straka <derek@asterius.io>,
	Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 21:00:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
> I have several customers who have optimized for space and would like to see
> the capability maintained unless core removes the ability to split python
> packages out.  They also remove the *.py files in favor of *.pyo files (via
> a custom packaging mechanism).  I have automated tests that go through the
> module importing on each of the meta-python packages to ensure it works on
> minimal python installations.  When other contributors don't do provide
> that functionality, I either catch it when I do package update or when it
> breaks for one of my customers.  I'm fine if you don't want to perform the
> checks yourself and it breaks my use case with missing dependencies, but I
> would prefer that you don't remove the dependencies that are currently in
> place.  Thanks.

Me too -- some of my projects still use NAND for rootfs, where space is tight and
ability to split out python modules is very useful. Thus it is not an unused
feature, though many projects have SD/eMMC for rootfs and those ones generally
will not care about it.

