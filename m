Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1URgRN-00004q-A8
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 12:15:15 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 Apr 2013 02:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,474,1363158000"; d="scan'208";a="227249198"
Received: from unknown (HELO helios.localnet) ([10.255.13.245])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Apr 2013 02:57:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: jackie.huang@windriver.com
Date: Mon, 15 Apr 2013 10:57:41 +0100
Message-ID: <1669643.GkN2VCyQEV@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <cover.1365489405.git.jackie.huang@windriver.com>
References: <cover.1365489405.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 0/2] modphp: enable mysql option in PACKAGECONFIG
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 10:15:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 April 2013 15:11:03 jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> The patches are for the LAMP feature in our layer, to enable mysql option in
> PACKAGECONFIG works but the old libtool used by modphp doesn't support
> "--with-libtool-sysroot" which causes a host contamination issue. So this
> work also includes fixes to support autoconf 2.59+ to avoid the libtool
> issue.
> 
> I think not all people want to enale mysql as default, if so, I think we can
> only add the fixes, and I will only enable mysql option in our layer.
> 
> ---
> The following changes since commit b07f0a239e7ee2b81157399b6befa811a5009813:
> 
>   gd: Add mirror for when libgd.org is down (2013-04-08 14:12:24 +0200)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib jhuang0/d_modphp_lamp_0409_0
>  
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_modphp_lamp
> _0409_0
> 
> Jackie Huang (2):
>   modphp: revert pthread-check.patch and add one against threads.m4
>   modphp: enable mysql option in PACKAGECONFIG
> 
>  .../modphp/files/php-5.3.14-aconf259.patch         |  209
> ++++++++++++++++++++ .../modphp/files/pthread-check-threads-m4.patch    |  
> 30 +++
>  .../recipes-php/modphp/files/pthread-check.patch   |   64 ------
>  meta-webserver/recipes-php/modphp/modphp5.inc      |   26 ++--
>  4 files changed, 252 insertions(+), 77 deletions(-)
>  create mode 100644
> meta-webserver/recipes-php/modphp/files/php-5.3.14-aconf259.patch create
> mode 100644
> meta-webserver/recipes-php/modphp/files/pthread-check-threads-m4.patch
> delete mode 100644
> meta-webserver/recipes-php/modphp/files/pthread-check.patch

Merged, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


