Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F146D75062
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 01:36:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2018 18:36:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,413,1517904000"; d="scan'208";a="31432760"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.16.247])
	([10.221.16.247])
	by orsmga008.jf.intel.com with ESMTP; 05 Apr 2018 18:36:20 -0700
To: openembedded-devel@lists.openembedded.org,
	Armin Kuster <akuster@mvista.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <152293667517.10188.4769698444249527950@git.openembedded.org>
	<20180405135757.2660A2329BA@git.openembedded.org>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <d593d269-9e5f-d913-4611-e404017f868e@intel.com>
Date: Fri, 6 Apr 2018 09:36:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180405135757.2660A2329BA@git.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 55/78: libshmfence: update to 1.3
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
X-List-Received-Date: Fri, 06 Apr 2018 01:36:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/05/2018 09:58 PM, git@git.openembedded.org wrote:
> This is an automated email from the git hooks/post-receive script.
> 
> rpurdie pushed a commit to branch master-next
> in repository openembedded-core.
> 
> commit 941284f23e4cc0b57b59b46c113a27517124bed9
> Author: Armin Kuster <akuster@mvista.com>
> AuthorDate: Tue Apr 3 18:49:08 2018 -0700
> 
>     libshmfence: update to 1.3
>     
>     refreshed patch
>     
>     Signed-off-by: Armin Kuster <akuster@mvista.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../xorg-lib/libxshmfence/extensions.patch                 | 14 ++++++++------
>  .../xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb}  |  4 ++--
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> index 4cc9e05..461fe83 100644
> --- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> +++ b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
> @@ -4,14 +4,16 @@ AC_USE_SYSTEM_EXTENSIONS to get that defined.
>  Upstream-Status: Submitted
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>  
> -diff --git a/configure.ac b/configure.ac
> -index 0c98875..ebf4dee 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
> - AC_CONFIG_HEADERS([config.h])
> +Index: libxshmfence-1.3/configure.ac
> +===================================================================
> +--- libxshmfence-1.3.orig/configure.ac
> ++++ libxshmfence-1.3/configure.ac
> +@@ -30,6 +30,8 @@ AC_CONFIG_HEADERS([config.h])
> + 
> + AC_USE_SYSTEM_EXTENSIONS
>   
>  +AC_USE_SYSTEM_EXTENSIONS
>  +
>   # Initialize Automake
>   AM_INIT_AUTOMAKE([foreign dist-bzip2])
> + 

I noticed that this was merged to master-next. This patch adds a change
on top of the same change upstream which was pointed out by Alex.

There was another version of this commit which removed this patch
altogether.

http://lists.openembedded.org/pipermail/openembedded-core/2018-March/149303.html

Perhaps that one should be merged instead?

Thanks,

Anuj

