Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2059260169
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 13:47:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 21 Aug 2014 06:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="375280070"
Received: from mvnawara-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.246])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2014 06:44:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sujith H <sujith.h@gmail.com>
Date: Thu, 21 Aug 2014 14:47:55 +0100
Message-ID: <2646587.gJzHJE2pH7@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <1408603607-32536-1-git-send-email-sujith.h@gmail.com>
References: <1408603607-32536-1-git-send-email-sujith.h@gmail.com>
MIME-Version: 1.0
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-pyparted: Add recipe
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
X-List-Received-Date: Thu, 21 Aug 2014 13:48:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sujith,

I think this recipe is almost there, just some minor tweaks:

On Thursday 21 August 2014 12:16:47 Sujith H wrote:
> From: Sujith H <Sujith_Haridasan@mentor.com>
> 
> This recipe will provide a set of Python modules that
> provide Python programmers an interface to libparted,
> the GNU parted library for disk partitioning and filesystem
> manipulation.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
> ---
>  .../python-pyparted/python-pyparted_3.9.bb          | 21
> +++++++++++++++++++++ 1 file changed, 21 insertions(+)
>  create mode 100644
> meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> 
> diff --git
> a/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb new
> file mode 100644
> index 0000000..db1b936
> --- /dev/null
> +++ b/meta-python/recipes-extended/python-pyparted/python-pyparted_3.9.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "pyparted is a set of Python modules that provide Python
> programmers \ +an interface to libparted, the GNU parted library for disk
> partitioning and \ +filesystem manipulation."
> +SUMMARY = "Python bindings for libparted"
> +HOMEPAGE = "https://fedorahosted.org/pyparted/"
> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> +   
> file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571
> a9f08ea46 \ +"
> +DEPENDS += "parted"
> +RDEPENDS_${PN} += "python-stringold python-codecs python-math"

Could you please move the RDEPENDS line down to just before the BBCLASSEXTEND 
line? (i.e. where any other definitions that concern packaging would appear).

> +
> +S="${WORKDIR}/pyparted-${PV}"

Please move this after the SRC_URI / checksums and add spaces around the = .

if you could also please ensure that your next version is marked [PATCH v3] 
(if it will be the third version of this patch) rather than just [PATCH] so 
that it's clear that it supersedes an earlier version.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

