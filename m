Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6B96F6158A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2013 18:26:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Dec 2013 10:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,575,1384329600"; d="scan'208";a="459525224"
Received: from acdivito-mobl.gar.corp.intel.com (HELO helios.localnet)
	([10.252.122.91])
	by orsmga002.jf.intel.com with ESMTP; 30 Dec 2013 10:26:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 30 Dec 2013 18:26:20 +0000
Message-ID: <1402408.P9TClDLlYA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1388415259-6360-1-git-send-email-Martin.Jansa@gmail.com>
References: <1388415259-6360-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mariadb-native: fix dependencies
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
X-List-Received-Date: Mon, 30 Dec 2013 18:26:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Monday 30 December 2013 15:54:19 Martin Jansa wrote:
> * unlike BBCLASSEXTENDed native support, dependencies in mariadb-native
> don't get automatic -native suffix, so mariadb-native was depending on
> target ncurses and zlib. * move the dependency from .inc and apply it with
> right suffix
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb | 1 +
>  meta-oe/recipes-support/mysql/mariadb_5.1.67.bb        | 2 +-
>  meta-oe/recipes-support/mysql/mariadb_5.1.67.inc       | 2 --
>  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb index
> e8382e2..15605d0 100644
> --- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> +++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
> @@ -2,6 +2,7 @@ require mariadb_${PV}.inc
>  inherit native
> 
>  PROVIDES += "mysql5-native"
> +DEPENDS = "ncurses-native zlib-native"
> 
>  RDEPENDS_${PN} = ""
>  PACKAGES = ""
> diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
> b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb index fc499d4..3b15c00
> 100644
> --- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
> +++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
> @@ -1,6 +1,6 @@
>  require ${PN}_${PV}.inc
> 
> -DEPENDS += "mariadb-native"
> +DEPENDS += "mariadb-native ncurses-native zlib-native"

I'm not following this - does the target version really need ncurses-native 
and zlib-native?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

