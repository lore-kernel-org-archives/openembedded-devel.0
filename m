Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6E02A7457D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 22:42:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Apr 2018 15:42:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,425,1517904000"; d="scan'208";a="49091657"
Received: from aziannim-mobl.gar.corp.intel.com (HELO [10.249.71.124])
	([10.249.71.124])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2018 15:42:18 -0700
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <1523203076-7314-1-git-send-email-akuster808@gmail.com>
	<1523203076-7314-2-git-send-email-akuster808@gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <1b9edb05-821b-9dd2-751f-084ff5ae9aab@intel.com>
Date: Mon, 9 Apr 2018 06:42:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523203076-7314-2-git-send-email-akuster808@gmail.com>
Subject: Re: [meta-oe][v2][PATCH 2/2] mongodb: refresh patches and remove un-needed patch
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
X-List-Received-Date: Sun, 08 Apr 2018 22:42:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/08/2018 11:57 PM, Armin Kuster wrote:
> [V2]
> remove patch, changes upstream
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  ...to-use-build-settings-from-environment-va.patch | 37 +++++++++----------
>  .../0001-Use-long-long-instead-of-int64_t.patch    | 21 +++++------
>  .../mongodb/0001-mongo-Add-using-std-string.patch  | 43 ++++++++++------------

You forgot to remove the actual patch?

Thanks,
Anuj

>  ...-Add-missing-dependenncy-on-local_shardin.patch | 11 ++----
>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb         |  1 -
>  5 files changed, 50 insertions(+), 63 deletions(-)
> 
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
> index 09d49d2..aa01e95 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
> @@ -9,11 +9,11 @@ Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
>   src/mongo/util/SConscript | 2 ++
>   2 files changed, 8 insertions(+), 2 deletions(-)
>  
> -diff --git a/SConstruct b/SConstruct
> -index 5082a4b..3370f70 100644
> ---- a/SConstruct
> -+++ b/SConstruct
> -@@ -507,6 +507,7 @@ def variable_arch_converter(val):
> +Index: git/SConstruct
> +===================================================================
> +--- git.orig/SConstruct
> ++++ git/SConstruct
> +@@ -548,6 +548,7 @@ def variable_arch_converter(val):
>           'amd64':  'x86_64',
>           'emt64':   'x86_64',
>           'x86':    'i386',
> @@ -21,8 +21,8 @@ index 5082a4b..3370f70 100644
>       }
>       val = val.lower()
>   
> -@@ -568,7 +569,8 @@ env_vars.Add('ARFLAGS',
> -     converter=variable_shlex_converter)
> +@@ -627,7 +628,8 @@ env_vars.Add(
> + )
>   
>   env_vars.Add('CC',
>  -    help='Select the C compiler to use')
> @@ -31,7 +31,7 @@ index 5082a4b..3370f70 100644
>   
>   env_vars.Add('CCFLAGS',
>       help='Sets flags for the C and C++ compiler',
> -@@ -588,7 +590,8 @@ env_vars.Add('CPPPATH',
> +@@ -647,7 +649,8 @@ env_vars.Add('CPPPATH',
>       converter=variable_shlex_converter)
>   
>   env_vars.Add('CXX',
> @@ -41,7 +41,7 @@ index 5082a4b..3370f70 100644
>   
>   env_vars.Add('CXXFLAGS',
>       help='Sets flags for the C++ compiler',
> -@@ -818,6 +821,7 @@ envDict = dict(BUILD_ROOT=buildDir,
> +@@ -895,6 +898,7 @@ envDict = dict(BUILD_ROOT=buildDir,
>                  )
>   
>   env = Environment(variables=env_vars, **envDict)
> @@ -49,19 +49,16 @@ index 5082a4b..3370f70 100644
>   del envDict
>   
>   env.AddMethod(env_os_is_wrapper, 'TargetOSIs')
> -diff --git a/src/mongo/util/SConscript b/src/mongo/util/SConscript
> -index 6add602..8d05a62 100644
> ---- a/src/mongo/util/SConscript
> -+++ b/src/mongo/util/SConscript
> -@@ -251,6 +251,8 @@ if get_option('allocator') == 'tcmalloc':
> -                 'MONGO_HAVE_GPERFTOOLS_GET_THREAD_CACHE_SIZE'
> +Index: git/src/mongo/util/SConscript
> +===================================================================
> +--- git.orig/src/mongo/util/SConscript
> ++++ git/src/mongo/util/SConscript
> +@@ -274,6 +274,8 @@ if env['MONGO_ALLOCATOR'] == 'tcmalloc':
> +                 'MONGO_HAVE_GPERFTOOLS_SIZE_CLASS_STATS'
>               ]
>           )
>  +    if not use_system_version_of_library('valgrind'):
>  +        tcmspEnv.InjectThirdPartyIncludePaths('valgrind')
>   
> -     tcmspEnv.Library(
> -         target='tcmalloc_set_parameter',
> --- 
> -1.9.1
> -
> +     if not use_system_version_of_library('valgrind'):
> +         # Include valgrind since tcmalloc disables itself while running under valgrind
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
> index c43beb4..389b302 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
> @@ -13,11 +13,11 @@ Upstream-Status: Pending
>   src/mongo/util/procparser.cpp | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>  
> -diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparser.cpp
> -index 36f2ae0254..2c164bcbf3 100644
> ---- a/src/mongo/util/procparser.cpp
> -+++ b/src/mongo/util/procparser.cpp
> -@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
> +Index: git/src/mongo/util/procparser.cpp
> +===================================================================
> +--- git.orig/src/mongo/util/procparser.cpp
> ++++ git/src/mongo/util/procparser.cpp
> +@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<S
>   
>                       StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
>   
> @@ -26,7 +26,7 @@ index 36f2ae0254..2c164bcbf3 100644
>   
>                       if (!parseNumberFromString(stringValue, &value).isOK()) {
>                           value = 0;
> -@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
> +@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<S
>               } else {
>                   StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
>   
> @@ -35,7 +35,7 @@ index 36f2ae0254..2c164bcbf3 100644
>   
>                   if (!parseNumberFromString(stringValue, &value).isOK()) {
>                       value = 0;
> -@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vector<StringData>& keys,
> +@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vecto
>   
>               StringData stringValue((*partIt).begin(), (*partIt).end());
>   
> @@ -44,7 +44,7 @@ index 36f2ae0254..2c164bcbf3 100644
>   
>               if (!parseNumberFromString(stringValue, &value).isOK()) {
>                   value = 0;
> -@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
> +@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vec
>                             StringData data,
>                             BSONObjBuilder* builder) {
>       bool foundKeys = false;
> @@ -53,7 +53,7 @@ index 36f2ae0254..2c164bcbf3 100644
>       stats.reserve(kDiskFieldCount);
>   
>       using string_split_iterator = boost::split_iterator<StringData::const_iterator>;
> -@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
> +@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vec
>   
>                   StringData stringValue((*partIt).begin(), (*partIt).end());
>   
> @@ -62,6 +62,3 @@ index 36f2ae0254..2c164bcbf3 100644
>   
>                   if (!parseNumberFromString(stringValue, &value).isOK()) {
>                       value = 0;
> --- 
> -2.14.1
> -
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
>   
>   MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
> --- 
> -2.13.3
> -
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
> index 95f9c1c..dc488ad 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
> @@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>   src/mongo/s/SConscript | 1 +
>   1 file changed, 1 insertion(+)
>  
> -diff --git a/src/mongo/s/SConscript b/src/mongo/s/SConscript
> -index 71720be517..51bd199127 100644
> ---- a/src/mongo/s/SConscript
> -+++ b/src/mongo/s/SConscript
> +Index: git/src/mongo/s/SConscript
> +===================================================================
> +--- git.orig/src/mongo/s/SConscript
> ++++ git/src/mongo/s/SConscript
>  @@ -317,5 +317,6 @@ env.Library(
>           "$BUILD_DIR/mongo/db/s/sharding",
>           "$BUILD_DIR/mongo/executor/network_interface_factory",
> @@ -23,6 +23,3 @@ index 71720be517..51bd199127 100644
>  +        "$BUILD_DIR/mongo/s/local_sharding_info",
>       ],
>   )
> --- 
> -2.13.3
> -
> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> index 723663f..bb3ff3b 100644
> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
> @@ -11,7 +11,6 @@ PV = "3.4.13+git${SRCPV}"
>  SRCREV = "fbdef2ccc53e0fcc9afb570063633d992b2aae42"
>  SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
>             file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
> -           file://0001-mongo-Add-using-std-string.patch \
>             file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
>             file://0001-Use-long-long-instead-of-int64_t.patch \
>             file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
> 


