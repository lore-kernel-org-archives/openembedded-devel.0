Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9BA5D65CA8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 14:00:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2014 07:00:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,849,1400050800"; d="scan'208";a="557426701"
Received: from glucy-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.202])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2014 07:00:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sujith H <sujith.h@gmail.com>
Date: Tue, 12 Aug 2014 14:59:34 +0100
Message-ID: <1607625.zbYtdvxeAh@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.8-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <1407849496-25893-1-git-send-email-sujith.h@gmail.com>
References: <1407849496-25893-1-git-send-email-sujith.h@gmail.com>
MIME-Version: 1.0
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] pyparted: Add recipe
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
X-List-Received-Date: Tue, 12 Aug 2014 14:00:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Sujith,

Just some minor corrections:

On Tuesday 12 August 2014 18:48:16 Sujith H wrote:
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
>  .../recipes-extended/pyparted/pyparted_3.9.bb       | 21
> +++++++++++++++++++++ 1 file changed, 21 insertions(+)
>  create mode 100644 meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> 
> diff --git a/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb new file mode
> 100644
> index 0000000..7b284cc
> --- /dev/null
> +++ b/meta-python/recipes-extended/pyparted/pyparted_3.9.bb
> @@ -0,0 +1,21 @@
> +DESCRIPTION = "pyparted is a set of Python modules that provide Python programmers \ 
> +an interface to libparted, the GNU parted library for disk partitioning and \ 
> +filesystem manipulation."
> +SUMMARY = "Python bindings for libparted"
> +HOMEPAGE = "https://fedorahosted.org/pyparted/"
> +SCM_URI = "git://git.fedorahosted.org/pyparted.git"

SCM_URI isn't a standard variable and doesn't seem to be used anywhere else in
the recipe - is this expected to be used somewhere?

> +LICENSE = "GPL-2.0+"
> +LIC_FILES_CHKSUM = "\
> +    file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
> +    file://src/_pedmodule.c;startline=10;endline=22;md5=70c62bd73782a03f56a0571a9f08ea46 \ 
> +"
> +DEPENDS += "parted"
> +PR = "r0"

Please drop this PR value, it's redundant.

> +SRC_URI =
> "https://fedorahosted.org/releases/p/y/pyparted/pyparted-${PV}.tar.gz"
> +SRC_URI[md5sum] = "f16c7ef7f5fa4a43fcb2a4654b487e39"
> +SRC_URI[sha256sum] =
> "a56712e3d058ce3d859c158236dbbf45224018919efd3d880ea80f9e0d0bebbb" +
> +inherit distutils
> +
> +BBCLASSEXTEND += "native"

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

