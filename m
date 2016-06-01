Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58B3177299
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jun 2016 09:32:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 01 Jun 2016 02:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,400,1459839600"; d="scan'208";a="988721409"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 01 Jun 2016 02:32:30 -0700
Date: Wed, 1 Jun 2016 12:32:57 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160601093257.GA15832@mbabyjoh-desk.ger.corp.intel.com>
References: <1464745422-12428-1-git-send-email-Feng.Mu@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1464745422-12428-1-git-send-email-Feng.Mu@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] javasqlite: add support
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
X-List-Received-Date: Wed, 01 Jun 2016 09:32:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Jun 01, 2016 at 09:43:42AM +0800, Feng Mu wrote:
> Javasqlite is a Java wrapper including a basic JDBC driver
> for SQLite 2/3.
> 
> Signed-off-by: Feng Mu <Feng.Mu@windriver.com>
> ---
>  .../0001-fix-errors-during-cross-compile.patch     | 533 +++++++++++++++++++++
>  recipes-core/javasqlite/javasqlite_20150419.bb     |  41 ++
>  2 files changed, 574 insertions(+)
>  create mode 100644 recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
>  create mode 100644 recipes-core/javasqlite/javasqlite_20150419.bb
> 
> diff --git a/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch b/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
> new file mode 100644
> index 0000000..d9f85e4
> --- /dev/null
> +++ b/recipes-core/javasqlite/files/0001-fix-errors-during-cross-compile.patch
> @@ -0,0 +1,533 @@
> +From 7714a4c0e589f8b654e1270575512555ea4ad6c7 Mon Sep 17 00:00:00 2001
> +From: Feng Mu <Feng.Mu@windriver.com>
> +Date: Fri, 27 May 2016 16:44:33 +0800
> +Subject: [PATCH] fix errors during cross compile

Missing upstream-status

> +Signed-off-by: Feng Mu <Feng.Mu@windriver.com>
> +---
> + Makefile.in  |  56 +++++++--
> + configure.in | 382 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
> + 2 files changed, 423 insertions(+), 14 deletions(-)
> +

<snip>

> +
> +SRC_URI[md5sum] = "242e384c1cd863d6996a35cf8c1c1e97"
> +SRC_URI[sha256sum] = "b6b26e2c1a2174f5525d904eb3ff698c3f7089f0d4b4c84cf6121da08c8d801f"
> +
> +EXTRA_OECONF = " \
> +    --with-sqlite3=${STAGING_DIR_NATIVE}/usr \
> +    --with-sqlite3-target=${STAGING_DIR_TARGET}/usr \
> +    --with-jdk=${STAGING_DIR_NATIVE}/usr/lib/jvm/icedtea7-native/ \
> +    "
> +
> +EXTRA_OEMAKE = "DESTDIR=${D}"
> +

It will be better if we have a comment explaining the reason for using INSANE_SKIP.

> +INSANE_SKIP_${PN}-dev = "dev-elf"
> +
> +do_configure_append (){
> +	cp ${S}/*-libtool ${S}/libtool
> +}

Best Regards,
Maxin

