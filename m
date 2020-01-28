Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A70471BEE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jan 2020 21:34:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 00SLY48e007674
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 28 Jan 2020 13:34:04 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 28 Jan 2020 13:34:04 -0800
To: Joe Slater <joe.slater@windriver.com>,
	<openembedded-devel@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <20191107181307.3722-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <7ebd9a64-acd1-6e14-5f4e-c6328d0888aa@windriver.com>
Date: Tue, 28 Jan 2020 16:34:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191107181307.3722-1-joe.slater@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [oe-core][zeus][PATCH 1/1] webkitgtk: fix occasional link error
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
X-List-Received-Date: Tue, 28 Jan 2020 21:34:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-CA

Armin,

ping? It's not urgent but it would be nice to fix this build failure.

../Randy


On 11/7/19 1:13 PM, Joe Slater wrote:
> Partial backport from WebKit.git.  See patch for details.
>
> Fixed in webkitgtk 2.26.1.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../webkit/webkitgtk/fix-link-error.patch          | 45 ++++++++++++++++++++++
>   meta/recipes-sato/webkit/webkitgtk_2.24.4.bb       |  1 +
>   2 files changed, 46 insertions(+)
>   create mode 100755 meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
> new file mode 100755
> index 0000000..9696ddd
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
> @@ -0,0 +1,45 @@
> +webkitgtk: fix an occasional link error
> +
> +Part of ae465a4e...  Changelog is not included in the source tarball.
> +
> +Upstream-Status:  backport [git://git.webkit.org/WebKit.git]
> +
> +commit ae465a4e3b1498b6c4038fc7e596e0e3662d116f
> +Author: Hironori.Fujii@sony.com <Hironori.Fujii@sony.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
> +Date:   Fri Jun 28 07:38:09 2019 +0000
> +
> +    [Win] unresolved external symbol "JSC::JSObject::didBecomePrototype(void)" referenced in function "JSC::Structure::create(...)"
> +    https://bugs.webkit.org/show_bug.cgi?id=199312
> +
> +    Reviewed by Keith Miller.
> +
> +    WinCairo port, clang-cl Release builds reported a following linkage error:
> +
> +    > WebCore.lib(UnifiedSource-4babe430-10.cpp.obj) : error LNK2019: unresolved external symbol "public: void __cdecl JSC::JSObject::didBecomePrototype(void)" (?didBecomePrototype@JSObject@JSC@@QEAAXXZ) referenced in function "public: static class JSC::Structure * __cdecl JSC::Structure::create(class JSC::VM &,class JSC::JSGlobalObject *,class JSC::JSValue,class JSC::TypeInfo const &,struct JSC::ClassInfo const *,unsigned char,unsigned int)" (?create@Structure@JSC@@SAPEAV12@AEAVVM@2@PEAVJSGlobalObject@2@VJSValue@2@AEBVTypeInfo@2@PEBUClassInfo@2@EI@Z)
> +
> +    No new tests because there is no behavior change.
> +
> +    * Modules/indexeddb/server/SQLiteIDBBackingStore.cpp: Include <JavaScriptCore/JSCInlines.h>,
> +    and do not include headers which is included by it.
> +
> +    git-svn-id: http://svn.webkit.org/repository/webkit/trunk@246922 268f45cc-cd09-0410-ab3c-d52691b4dbfc
> +
> +[ modification of Changelog deleted ]
> +
> +diff --git a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
> +index d1b047c..0899a9a 100644
> +--- a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
> ++++ b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
> +@@ -49,11 +49,8 @@
> + #include "SQLiteTransaction.h"
> + #include "ThreadSafeDataBuffer.h"
> + #include <JavaScriptCore/AuxiliaryBarrierInlines.h>
> +-#include <JavaScriptCore/HeapInlines.h>
> +-#include <JavaScriptCore/JSCJSValueInlines.h>
> +-#include <JavaScriptCore/JSGlobalObject.h>
> ++#include <JavaScriptCore/JSCInlines.h>
> + #include <JavaScriptCore/StrongInlines.h>
> +-#include <JavaScriptCore/StructureInlines.h>
> + #include <wtf/FileSystem.h>
> + #include <wtf/NeverDestroyed.h>
> + #include <wtf/text/StringConcatenateNumbers.h>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
> index 8c695ce..b04ec82 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
> @@ -23,6 +23,7 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>              file://include_array.patch \
>              file://narrowing.patch \
>              file://0001-gstreamer-add-a-missing-format-string.patch \
> +           file://fix-link-error.patch \
>              "
>   
>   SRC_URI[md5sum] = "c214963d8c0e7d83460da04a0d8dda87"


-- 
# Randy MacLeod
# Wind River Linux


