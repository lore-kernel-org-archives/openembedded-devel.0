Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 04A3D7144F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Sep 2014 15:04:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Sep 2014 08:04:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,506,1406617200"; d="scan'208";a="598105968"
Received: from sdoherty-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.136])
	by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2014 08:03:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 11 Sep 2014 16:03:26 +0100
Message-ID: <2640190.uKkUWoK2di@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <1410274929-16519-1-git-send-email-liezhi.yang@windriver.com>
References: <1410274929-16519-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl] [PATCH] meta-perl: fix for eglibc-gconvs
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
X-List-Received-Date: Thu, 11 Sep 2014 15:04:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Tuesday 09 September 2014 08:02:09 Robert Yang wrote:
> There is no eglibc-gconvs now, but glibc-gconvs.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../recipes-perl/libnet/libnet-libidn-perl_0.12.bb |    4 ++--
>  .../recipes-perl/libtext/libtext-iconv-perl_1.7.bb |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb index
> 42b213d..f896d11 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-libidn-perl_0.12.bb
> @@ -8,9 +8,9 @@ SECTION = "libs"
>  LICENSE = "Artistic-1.0 | GPLv1+"
>  HOMEPAGE = "http://search.cpan.org/dist/Net-LibIDN/"
>  DEPENDS += "libidn"
> -# We must need eglibc-gconvs to enable charset related functions,
> +# We must need glibc-gconv to enable charset related functions,
>  # such as Net::LibIDN::idn_to_ascii().
> -RDEPENDS_${PN} += "eglibc-gconvs"
> +RDEPENDS_${PN} += "glibc-gconv"

Ah, should that be glibc-gconvs?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

