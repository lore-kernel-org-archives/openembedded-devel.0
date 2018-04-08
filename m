Return-Path: <anuj.mittal@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id C02957553C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 08:03:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 01:03:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,422,1517904000"; d="scan'208";a="189648747"
Received: from anmitta2-mobl1.gar.corp.intel.com (HELO [10.249.73.218])
	([10.249.73.218])
	by orsmga004.jf.intel.com with ESMTP; 08 Apr 2018 01:03:32 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
	<1523170729-26321-25-git-send-email-akuster808@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <b6171aed-e4eb-a7e5-a370-913f38217f19@intel.com>
Date: Sun, 8 Apr 2018 16:03:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523170729-26321-25-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][PATCH 25/37] mongodb: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 08:03:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 02:58 PM, Armin Kuster wrote:

> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
> index e517d53..ad9ff5a 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
> @@ -18,22 +18,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   src/mongo/util/net/miniwebserver.cpp     | 1 +
>   4 files changed, 5 insertions(+)
>  
> -diff --git a/src/mongo/db/dbwebserver.cpp b/src/mongo/db/dbwebserver.cpp
> -index b202e0500b..0255613524 100644
> ---- a/src/mongo/db/dbwebserver.cpp
> -+++ b/src/mongo/db/dbwebserver.cpp
> -@@ -67,6 +67,7 @@ namespace mongo {
> - using std::map;
> +Index: git/src/mongo/db/dbwebserver.cpp
> +===================================================================
> +--- git.orig/src/mongo/db/dbwebserver.cpp
> ++++ git/src/mongo/db/dbwebserver.cpp
> +@@ -68,6 +68,7 @@ using std::map;
> + using std::string;
>   using std::stringstream;
>   using std::vector;
>  +using std::string;
>   
>   using namespace html;
>   
> -diff --git a/src/mongo/db/matcher/expression_leaf.cpp b/src/mongo/db/matcher/expression_leaf.cpp
> -index d562bff141..4d931985e2 100644
> ---- a/src/mongo/db/matcher/expression_leaf.cpp
> -+++ b/src/mongo/db/matcher/expression_leaf.cpp
> +Index: git/src/mongo/db/matcher/expression_leaf.cpp
> +===================================================================
> +--- git.orig/src/mongo/db/matcher/expression_leaf.cpp
> ++++ git/src/mongo/db/matcher/expression_leaf.cpp
>  @@ -44,6 +44,8 @@
>   #include "mongo/stdx/memory.h"
>   #include "mongo/util/mongoutils/str.h"
> @@ -43,10 +43,10 @@ index d562bff141..4d931985e2 100644
>   namespace mongo {
>   
>   Status LeafMatchExpression::setPath(StringData path) {
> -diff --git a/src/mongo/db/repl/master_slave.cpp b/src/mongo/db/repl/master_slave.cpp
> -index 05faad1259..ea25d7151b 100644
> ---- a/src/mongo/db/repl/master_slave.cpp
> -+++ b/src/mongo/db/repl/master_slave.cpp
> +Index: git/src/mongo/db/repl/master_slave.cpp
> +===================================================================
> +--- git.orig/src/mongo/db/repl/master_slave.cpp
> ++++ git/src/mongo/db/repl/master_slave.cpp
>  @@ -78,6 +78,7 @@ using std::endl;
>   using std::max;
>   using std::min;
> @@ -55,18 +55,15 @@ index 05faad1259..ea25d7151b 100644
>   using std::stringstream;
>   using std::unique_ptr;
>   using std::vector;
> -diff --git a/src/mongo/util/net/miniwebserver.cpp b/src/mongo/util/net/miniwebserver.cpp
> -index 5f4165d42f..239720c349 100644
> ---- a/src/mongo/util/net/miniwebserver.cpp
> -+++ b/src/mongo/util/net/miniwebserver.cpp
> -@@ -46,6 +46,7 @@ namespace mongo {
> - 
> +Index: git/src/mongo/util/net/miniwebserver.cpp
> +===================================================================
> +--- git.orig/src/mongo/util/net/miniwebserver.cpp
> ++++ git/src/mongo/util/net/miniwebserver.cpp
> +@@ -47,6 +47,7 @@ namespace mongo {
>   using std::shared_ptr;
> + using std::string;
>   using std::stringstream;
>  +using std::string;
>   using std::vector;

Looks like this has been fixed upstream and this patch should be removed
instead.

Thanks,
Anuj

>   
>   MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
> --- 
> -2.13.3
> -
> 


