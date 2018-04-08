Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 39A2575590
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 08:11:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 01:11:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,422,1517904000"; d="scan'208";a="189651416"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.249.73.218])
	([10.249.73.218])
	by orsmga004.jf.intel.com with ESMTP; 08 Apr 2018 01:11:50 -0700
To: jackie.huang@windriver.com, openembedded-devel@lists.openembedded.org
References: <20180408080030.11697-1-jackie.huang@windriver.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <80ef175c-f32f-5ba4-064e-a556df13bdab@intel.com>
Date: Sun, 8 Apr 2018 16:11:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180408080030.11697-1-jackie.huang@windriver.com>
Subject: Re: [meta-oe][PATCH] postgresql: update to 9.4.17
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
X-List-Received-Date: Sun, 08 Apr 2018 08:11:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 04:00 PM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> * Release notes:
>   https://www.postgresql.org/docs/9.4/static/release-9-4-17.html
> 
> * Drop the patch emove.autoconf.version.check.patch since the
>   required autoconf version is used in oe-core.
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../postgresql/files/remove.autoconf.version.check.patch | 16 ----------------
>  .../{postgresql_9.4.15.bb => postgresql_9.4.17.bb}       |  7 +++----
>  2 files changed, 3 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
>  rename meta-oe/recipes-dbs/postgresql/{postgresql_9.4.15.bb => postgresql_9.4.17.bb} (38%)
> 
> diff --git a/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch b/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
> deleted file mode 100644
> index be23fd419..000000000
> --- a/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Index: postgresql-9.2.4/configure.in
> -===================================================================
> ---- postgresql-9.2.4.orig/configure.in
> -+++ postgresql-9.2.4/configure.in
> -@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
> - 
> - AC_INIT([PostgreSQL], [9.4.2], [pgsql-bugs@postgresql.org])
> - 
> --m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
> --Untested combinations of 'autoconf' and PostgreSQL versions are not
> --recommended.  You can remove the check from 'configure.in' but it is then
> --your responsibility whether the result works or not.])])
> - AC_COPYRIGHT([Copyright (c) 1996-2014, PostgreSQL Global Development Group])
> - AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
> - AC_CONFIG_AUX_DIR(config)
> -
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
> similarity index 38%
> rename from meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb
> rename to meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
> index eec099a12..061184a6f 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
> @@ -1,9 +1,8 @@
>  require postgresql.inc
>  
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=81b69ddb31a8be66baafd14a90146ee2"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"

You forgot to mention what has changed in the license?

Thanks,

Anuj

