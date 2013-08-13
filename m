Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 068526A994
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 07:52:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Aug 2013 00:52:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,867,1367996400"; d="scan'208";a="386202203"
Received: from unknown (HELO helios.localnet) ([10.252.122.219])
	by orsmga002.jf.intel.com with ESMTP; 13 Aug 2013 00:52:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe Slater <jslater@windriver.com>
Date: Tue, 13 Aug 2013 08:52:13 +0100
Message-ID: <3732752.OjNRY3qOuQ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1376069480-19679-2-git-send-email-jslater@windriver.com>
References: <1376069480-19679-1-git-send-email-jslater@windriver.com>
	<1376069480-19679-2-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 1/1] nostromo: make sure usr/group www-data exist
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
X-List-Received-Date: Tue, 13 Aug 2013 07:52:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Joe,

On Friday 09 August 2013 10:31:20 Joe Slater wrote:
> CQID: 422203
> 
> nostromo runs as user/group www-data and needs these
> to exist when we install it.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-httpd/nostromo/nostromo_1.9.5.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes-httpd/nostromo/nostromo_1.9.5.bb
> b/recipes-httpd/nostromo/nostromo_1.9.5.bb index 94c32d8..98195b1 100644
> --- a/recipes-httpd/nostromo/nostromo_1.9.5.bb
> +++ b/recipes-httpd/nostromo/nostromo_1.9.5.bb
> @@ -17,7 +17,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
> 
>  DEPENDS = "openssl"
> 
> -inherit update-rc.d
> +inherit update-rc.d useradd
> 
>  INITSCRIPT_NAME = "nostromo"
>  INITSCRIPT_PARAMS = "defaults 70"
> @@ -26,6 +26,11 @@ do_compile() {
>      oe_runmake
>  }
> 
> +# we need user/group www-data to exist when we install
> +#
> +USERADD_PACKAGES = "${PN}"
> +USERADD_PARAM_${PN} = "--system -g www-data www-data"
> +
>  do_install() {
>      install -d ${D}/${sbindir}
>      install -m 0755 src/nhttpd/nhttpd ${D}/${sbindir}/nhttpd

I've applied this, but it was actually against the wrong directory path. In 
future could you please send patches generated against meta-oe?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

