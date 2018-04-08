Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id C430974832
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 22:43:48 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id h4so7206211qtn.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Apr 2018 15:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Gxby9xZosq93jKOtUIYiwWcRYf3VpIBd1JMleo3sRQA=;
	b=LDQaBlIi0V1pJBauEA2tNgag/eGtBSR0e1LFKHunTlLXhAW4CRmCCN9R4/7q+1W3oT
	oIrpeWo2xFFFiZ+KMeISG8RTVocGAPjVcf9BZpjzdrk85pcGWX4DycxSiKtHJ+euLq13
	nZjdp4Ka4TutGECkO3YVjY8rr8s9AZ3OZCPTaLePVcdptJSTt4ySgJVtEYgn3Y5rVcpQ
	iSB9l9Q0Z40jUnsWwuKqvTZSMxq7Nc58I9fkwnTFgDCI1CccwKz/TydkWfNn1309+LLn
	Nc4bIt1eHdTf5xZDyq0+On76BF+tncI/Vyw43tzmt26n+BluxS6Tv98kjrX8tnsr6jjK
	DB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=Gxby9xZosq93jKOtUIYiwWcRYf3VpIBd1JMleo3sRQA=;
	b=ssUtvav6S3HcA4bXxXvSBc+65/UpUrYywxThZRnhUE4ntHxaesRYla9OxveRzsxSxM
	ODsyrQfNDs7tjw8n5H/PUxGQHwY/IrTwuQ3Iv+TAdZH7ex/aS85fSRy9M2eRLIjQ/Bko
	mFOO/pdpZ88s6YXqSMeBNiIcc1Sc/QYxXiI6MerCdPJHjaO1zPzyh+Ayylx9gab4uIu7
	vC/YSzNCH+ggKn3USyq0r531qSgqSRi9S2rF8m/6X5Iw7TUWRbL5JgKBIFWBceKuXIf8
	TFQVt04wWIaH2dSEPIsTXSRHxmIfB5e9CSdOPe4sqcoyLFZ5mMr55AjxbujhwsU942MN
	LR8g==
X-Gm-Message-State: ALQs6tApysKPxL0HeBb2n3M9HsRxwMUJ/XqZe0PbDH5UxKo+FL9A++p8
	4hNtRITiimNaFc+8aB7blxGDfw==
X-Google-Smtp-Source: AIpwx4/98l43U7A/UuFfoFncsz4HzAZmovklb1HztQQvI4aQJkj8AdBW7urzNhzaH4qBei4H/eMuGQ==
X-Received: by 10.200.57.132 with SMTP id v4mr48904517qte.204.1523227429309;
	Sun, 08 Apr 2018 15:43:49 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:6097:a43d:5d02:3a1c?
	([2601:202:4000:1184:6097:a43d:5d02:3a1c])
	by smtp.gmail.com with ESMTPSA id
	a84sm12138902qkj.28.2018.04.08.15.43.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Apr 2018 15:43:48 -0700 (PDT)
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-devel@lists.openembedded.org
References: <1523203076-7314-1-git-send-email-akuster808@gmail.com>
	<1523203076-7314-2-git-send-email-akuster808@gmail.com>
	<1b9edb05-821b-9dd2-751f-084ff5ae9aab@intel.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <5b8d4dd1-c1c3-cd84-4fff-e6f44b093568@gmail.com>
Date: Sun, 8 Apr 2018 15:43:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1b9edb05-821b-9dd2-751f-084ff5ae9aab@intel.com>
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
X-List-Received-Date: Sun, 08 Apr 2018 22:43:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/08/2018 03:42 PM, Anuj Mittal wrote:
> On 04/08/2018 11:57 PM, Armin Kuster wrote:
>> [V2]
>> remove patch, changes upstream
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  ...to-use-build-settings-from-environment-va.patch | 37 +++++++++----------
>>  .../0001-Use-long-long-instead-of-int64_t.patch    | 21 +++++------
>>  .../mongodb/0001-mongo-Add-using-std-string.patch  | 43 ++++++++++------------
> You forgot to remove the actual patch?
thanks.
- armin
>
> Thanks,
> Anuj
>
>>  ...-Add-missing-dependenncy-on-local_shardin.patch | 11 ++----
>>  meta-oe/recipes-dbs/mongodb/mongodb_git.bb         |  1 -
>>  5 files changed, 50 insertions(+), 63 deletions(-)
>>
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
>> index 09d49d2..aa01e95 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Tell-scons-to-use-build-settings-from-environment-va.patch
>> @@ -9,11 +9,11 @@ Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
>>   src/mongo/util/SConscript | 2 ++
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>  
>> -diff --git a/SConstruct b/SConstruct
>> -index 5082a4b..3370f70 100644
>> ---- a/SConstruct
>> -+++ b/SConstruct
>> -@@ -507,6 +507,7 @@ def variable_arch_converter(val):
>> +Index: git/SConstruct
>> +===================================================================
>> +--- git.orig/SConstruct
>> ++++ git/SConstruct
>> +@@ -548,6 +548,7 @@ def variable_arch_converter(val):
>>           'amd64':  'x86_64',
>>           'emt64':   'x86_64',
>>           'x86':    'i386',
>> @@ -21,8 +21,8 @@ index 5082a4b..3370f70 100644
>>       }
>>       val = val.lower()
>>   
>> -@@ -568,7 +569,8 @@ env_vars.Add('ARFLAGS',
>> -     converter=variable_shlex_converter)
>> +@@ -627,7 +628,8 @@ env_vars.Add(
>> + )
>>   
>>   env_vars.Add('CC',
>>  -    help='Select the C compiler to use')
>> @@ -31,7 +31,7 @@ index 5082a4b..3370f70 100644
>>   
>>   env_vars.Add('CCFLAGS',
>>       help='Sets flags for the C and C++ compiler',
>> -@@ -588,7 +590,8 @@ env_vars.Add('CPPPATH',
>> +@@ -647,7 +649,8 @@ env_vars.Add('CPPPATH',
>>       converter=variable_shlex_converter)
>>   
>>   env_vars.Add('CXX',
>> @@ -41,7 +41,7 @@ index 5082a4b..3370f70 100644
>>   
>>   env_vars.Add('CXXFLAGS',
>>       help='Sets flags for the C++ compiler',
>> -@@ -818,6 +821,7 @@ envDict = dict(BUILD_ROOT=buildDir,
>> +@@ -895,6 +898,7 @@ envDict = dict(BUILD_ROOT=buildDir,
>>                  )
>>   
>>   env = Environment(variables=env_vars, **envDict)
>> @@ -49,19 +49,16 @@ index 5082a4b..3370f70 100644
>>   del envDict
>>   
>>   env.AddMethod(env_os_is_wrapper, 'TargetOSIs')
>> -diff --git a/src/mongo/util/SConscript b/src/mongo/util/SConscript
>> -index 6add602..8d05a62 100644
>> ---- a/src/mongo/util/SConscript
>> -+++ b/src/mongo/util/SConscript
>> -@@ -251,6 +251,8 @@ if get_option('allocator') == 'tcmalloc':
>> -                 'MONGO_HAVE_GPERFTOOLS_GET_THREAD_CACHE_SIZE'
>> +Index: git/src/mongo/util/SConscript
>> +===================================================================
>> +--- git.orig/src/mongo/util/SConscript
>> ++++ git/src/mongo/util/SConscript
>> +@@ -274,6 +274,8 @@ if env['MONGO_ALLOCATOR'] == 'tcmalloc':
>> +                 'MONGO_HAVE_GPERFTOOLS_SIZE_CLASS_STATS'
>>               ]
>>           )
>>  +    if not use_system_version_of_library('valgrind'):
>>  +        tcmspEnv.InjectThirdPartyIncludePaths('valgrind')
>>   
>> -     tcmspEnv.Library(
>> -         target='tcmalloc_set_parameter',
>> --- 
>> -1.9.1
>> -
>> +     if not use_system_version_of_library('valgrind'):
>> +         # Include valgrind since tcmalloc disables itself while running under valgrind
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
>> index c43beb4..389b302 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-Use-long-long-instead-of-int64_t.patch
>> @@ -13,11 +13,11 @@ Upstream-Status: Pending
>>   src/mongo/util/procparser.cpp | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>  
>> -diff --git a/src/mongo/util/procparser.cpp b/src/mongo/util/procparser.cpp
>> -index 36f2ae0254..2c164bcbf3 100644
>> ---- a/src/mongo/util/procparser.cpp
>> -+++ b/src/mongo/util/procparser.cpp
>> -@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
>> +Index: git/src/mongo/util/procparser.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/util/procparser.cpp
>> ++++ git/src/mongo/util/procparser.cpp
>> +@@ -260,7 +260,7 @@ Status parseProcStat(const std::vector<S
>>   
>>                       StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
>>   
>> @@ -26,7 +26,7 @@ index 36f2ae0254..2c164bcbf3 100644
>>   
>>                       if (!parseNumberFromString(stringValue, &value).isOK()) {
>>                           value = 0;
>> -@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<StringData>& keys,
>> +@@ -272,7 +272,7 @@ Status parseProcStat(const std::vector<S
>>               } else {
>>                   StringData stringValue((*partIt).begin(), (*partIt).end() - (*partIt).begin());
>>   
>> @@ -35,7 +35,7 @@ index 36f2ae0254..2c164bcbf3 100644
>>   
>>                   if (!parseNumberFromString(stringValue, &value).isOK()) {
>>                       value = 0;
>> -@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vector<StringData>& keys,
>> +@@ -365,7 +365,7 @@ Status parseProcMemInfo(const std::vecto
>>   
>>               StringData stringValue((*partIt).begin(), (*partIt).end());
>>   
>> @@ -44,7 +44,7 @@ index 36f2ae0254..2c164bcbf3 100644
>>   
>>               if (!parseNumberFromString(stringValue, &value).isOK()) {
>>                   value = 0;
>> -@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
>> +@@ -426,7 +426,7 @@ Status parseProcDiskStats(const std::vec
>>                             StringData data,
>>                             BSONObjBuilder* builder) {
>>       bool foundKeys = false;
>> @@ -53,7 +53,7 @@ index 36f2ae0254..2c164bcbf3 100644
>>       stats.reserve(kDiskFieldCount);
>>   
>>       using string_split_iterator = boost::split_iterator<StringData::const_iterator>;
>> -@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vector<StringData>& disks,
>> +@@ -501,7 +501,7 @@ Status parseProcDiskStats(const std::vec
>>   
>>                   StringData stringValue((*partIt).begin(), (*partIt).end());
>>   
>> @@ -62,6 +62,3 @@ index 36f2ae0254..2c164bcbf3 100644
>>   
>>                   if (!parseNumberFromString(stringValue, &value).isOK()) {
>>                       value = 0;
>> --- 
>> -2.14.1
>> -
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
>> index e517d53..ad9ff5a 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0001-mongo-Add-using-std-string.patch
>> @@ -18,22 +18,22 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   src/mongo/util/net/miniwebserver.cpp     | 1 +
>>   4 files changed, 5 insertions(+)
>>  
>> -diff --git a/src/mongo/db/dbwebserver.cpp b/src/mongo/db/dbwebserver.cpp
>> -index b202e0500b..0255613524 100644
>> ---- a/src/mongo/db/dbwebserver.cpp
>> -+++ b/src/mongo/db/dbwebserver.cpp
>> -@@ -67,6 +67,7 @@ namespace mongo {
>> - using std::map;
>> +Index: git/src/mongo/db/dbwebserver.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/db/dbwebserver.cpp
>> ++++ git/src/mongo/db/dbwebserver.cpp
>> +@@ -68,6 +68,7 @@ using std::map;
>> + using std::string;
>>   using std::stringstream;
>>   using std::vector;
>>  +using std::string;
>>   
>>   using namespace html;
>>   
>> -diff --git a/src/mongo/db/matcher/expression_leaf.cpp b/src/mongo/db/matcher/expression_leaf.cpp
>> -index d562bff141..4d931985e2 100644
>> ---- a/src/mongo/db/matcher/expression_leaf.cpp
>> -+++ b/src/mongo/db/matcher/expression_leaf.cpp
>> +Index: git/src/mongo/db/matcher/expression_leaf.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/db/matcher/expression_leaf.cpp
>> ++++ git/src/mongo/db/matcher/expression_leaf.cpp
>>  @@ -44,6 +44,8 @@
>>   #include "mongo/stdx/memory.h"
>>   #include "mongo/util/mongoutils/str.h"
>> @@ -43,10 +43,10 @@ index d562bff141..4d931985e2 100644
>>   namespace mongo {
>>   
>>   Status LeafMatchExpression::setPath(StringData path) {
>> -diff --git a/src/mongo/db/repl/master_slave.cpp b/src/mongo/db/repl/master_slave.cpp
>> -index 05faad1259..ea25d7151b 100644
>> ---- a/src/mongo/db/repl/master_slave.cpp
>> -+++ b/src/mongo/db/repl/master_slave.cpp
>> +Index: git/src/mongo/db/repl/master_slave.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/db/repl/master_slave.cpp
>> ++++ git/src/mongo/db/repl/master_slave.cpp
>>  @@ -78,6 +78,7 @@ using std::endl;
>>   using std::max;
>>   using std::min;
>> @@ -55,18 +55,15 @@ index 05faad1259..ea25d7151b 100644
>>   using std::stringstream;
>>   using std::unique_ptr;
>>   using std::vector;
>> -diff --git a/src/mongo/util/net/miniwebserver.cpp b/src/mongo/util/net/miniwebserver.cpp
>> -index 5f4165d42f..239720c349 100644
>> ---- a/src/mongo/util/net/miniwebserver.cpp
>> -+++ b/src/mongo/util/net/miniwebserver.cpp
>> -@@ -46,6 +46,7 @@ namespace mongo {
>> - 
>> +Index: git/src/mongo/util/net/miniwebserver.cpp
>> +===================================================================
>> +--- git.orig/src/mongo/util/net/miniwebserver.cpp
>> ++++ git/src/mongo/util/net/miniwebserver.cpp
>> +@@ -47,6 +47,7 @@ namespace mongo {
>>   using std::shared_ptr;
>> + using std::string;
>>   using std::stringstream;
>>  +using std::string;
>>   using std::vector;
>>   
>>   MiniWebServer::MiniWebServer(const string& name, const string& ip, int port, ServiceContext* ctx)
>> --- 
>> -2.13.3
>> -
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
>> index 95f9c1c..dc488ad 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb/0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch
>> @@ -12,10 +12,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   src/mongo/s/SConscript | 1 +
>>   1 file changed, 1 insertion(+)
>>  
>> -diff --git a/src/mongo/s/SConscript b/src/mongo/s/SConscript
>> -index 71720be517..51bd199127 100644
>> ---- a/src/mongo/s/SConscript
>> -+++ b/src/mongo/s/SConscript
>> +Index: git/src/mongo/s/SConscript
>> +===================================================================
>> +--- git.orig/src/mongo/s/SConscript
>> ++++ git/src/mongo/s/SConscript
>>  @@ -317,5 +317,6 @@ env.Library(
>>           "$BUILD_DIR/mongo/db/s/sharding",
>>           "$BUILD_DIR/mongo/executor/network_interface_factory",
>> @@ -23,6 +23,3 @@ index 71720be517..51bd199127 100644
>>  +        "$BUILD_DIR/mongo/s/local_sharding_info",
>>       ],
>>   )
>> --- 
>> -2.13.3
>> -
>> diff --git a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> index 723663f..bb3ff3b 100644
>> --- a/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> +++ b/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
>> @@ -11,7 +11,6 @@ PV = "3.4.13+git${SRCPV}"
>>  SRCREV = "fbdef2ccc53e0fcc9afb570063633d992b2aae42"
>>  SRC_URI = "git://github.com/mongodb/mongo.git;branch=v3.4 \
>>             file://0001-Tell-scons-to-use-build-settings-from-environment-va.patch \
>> -           file://0001-mongo-Add-using-std-string.patch \
>>             file://0002-d_state.cpp-Add-missing-dependenncy-on-local_shardin.patch \
>>             file://0001-Use-long-long-instead-of-int64_t.patch \
>>             file://0001-Use-__GLIBC__-to-control-use-of-gnu_get_libc_version.patch \
>>


