Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 46C166D87A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Dec 2013 15:23:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 07:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,811,1378882800"; d="scan'208";a="417990963"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.184])
	by orsmga001.jf.intel.com with ESMTP; 02 Dec 2013 07:23:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Samuelsson <ulf@emagii.com>
Date: Mon, 02 Dec 2013 15:23:35 +0000
Message-ID: <3167183.WWpGOO4rZZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1385984797-6864-1-git-send-email-ulf@emagii.com>
References: <1385984797-6864-1-git-send-email-ulf@emagii.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] curlpp: add curl c++ bindings
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
X-List-Received-Date: Mon, 02 Dec 2013 15:23:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Ulf,

On Monday 02 December 2013 12:46:37 Ulf Samuelsson wrote:
> +DESCRIPTION = "C++ library for client-side URL transfers."

Please set SUMMARY instead for a short one-line description, this will set 
DESCRIPTION as well.

> +HOMEPAGE = "http://code.google.com/p/curlpp/"
> +SECTION = "console/network"
> +LICENSE = "freely distributable"

The correct LICENSE value is "MIT" according to the website above.

> +LIC_FILES_CHKSUM = "file://COPYING;md5=fd0c9adf285a69aa3b4faf34384e1029"
> +
> +DEPENDS = "curl boost"
> +DEPENDS_class-native = "curl-native"
> +PR = "r1"

Drop PR here please

> +
> +SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
> +	"
> +
> +SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
> +SRC_URI[sha256sum] =
> "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5" 
> +
> +inherit autotools pkgconfig binconfig
> +
> +EXTRA_OECONF = "--prefix=${STAGING_DIR} \
> +		--with-boost=${STAGING_DIR} \
> +		"
> +#		--host=arm-angstrom-linux-gnueabi \

Drop this (and any other commented out lines)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

