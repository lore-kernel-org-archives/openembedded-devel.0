Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 962D465CED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Nov 2014 13:15:58 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 11 Nov 2014 05:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,361,1413270000"; d="scan'208";a="620547025"
Received: from tmediriw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.110])
	by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2014 05:15:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Tue, 11 Nov 2014 13:15:28 +0000
Message-ID: <6978098.8Et6JqyzPH@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.2 (Linux/3.16.7-200.fc20.x86_64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <68ac9dc860f1f0a75c5c1dfcd8d199403c845b2f.1415708064.git.hongxu.jia@windriver.com>
References: <cover.1415708064.git.hongxu.jia@windriver.com>
	<68ac9dc860f1f0a75c5c1dfcd8d199403c845b2f.1415708064.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] libbonobo.inc: add libbonobo-bin package
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
X-List-Received-Date: Tue, 11 Nov 2014 13:16:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

On Tuesday 11 November 2014 20:16:10 Hongxu Jia wrote:
> The previous libbonobo package contains perl scripts, while installing
> libbonobo, package management detected perl required, but it actually
> not needed as lib. So add libbonobo-bin package to contain these scripts.
> It refers debian:
> https://packages.debian.org/sid/libbonobo2-bin
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index 8b6007e..57e6986
> 100644
> --- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> +++ b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> @@ -9,6 +9,9 @@ inherit gnomebase gtk-doc
> 
>  ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> 
> +PACKAGES =+ "${PN}-bin"
> +RDEPENDS_${PN}-bin = "${PN} perl"
> +FILES_${PN}-bin = "${bindir}/* ${sbindir}/*"

We do have a lib-package class to handle this, although it doesn't do much we 
should probably use it here for consistency - then you can drop the PACKAGES 
and FILES lines above.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

