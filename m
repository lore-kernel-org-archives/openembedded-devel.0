Return-Path: <akuster808@gmail.com>
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2A11860636
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:39:18 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id g6so1481726qvy.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=vheuHkjvgCLwBAqgilljyG2HD9dtvIq7KklpxuJYJWI=;
	b=iAPBmO3ypydgiHhiT8hhAlssZ4HM7VYwQow73oxMFdoZHdhom8SwXur3yEY6dkJrHf
	w2960ePSkDn7I6IJon9fFEWhlo6+zy1ajNKJsrSFRd0p0L5q73qtx5qH5/N7Hk+7n+z4
	uaJ2H3bgSsdyE8zPiOZp1xj/R6WtSi/H+kn4DQ1qwuIMXuXV5AdcQ88F8YHo4OJGrlal
	q5OBkWuegGMekEfunsa9aGX/vHVccXWRGIBftuetPkln+uNft37zuQ62eYKDH962/tmn
	qnUGxq84Hf4TkG70R11PC9Nx7U492NOE9QVjUZeZCiH2vDKLHUze64yD7FbhIcf7wf4H
	Bzog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=vheuHkjvgCLwBAqgilljyG2HD9dtvIq7KklpxuJYJWI=;
	b=Z1iEDs7bYMeYVs/YpJKSidG5sktZpLSa9dUeMbYd984SbMbBuggsFCv6GBuSid09Cw
	2OrGnjSaZ13GCjy+h/qbeTjZMKqA34fCQ22Aog7ncJRMJ6sJmu9BVJ0aLvHocHUZJZg6
	Rm2HSq67mQraIZm5SMVKM93esQcpBM7MDkQUrQRAqmnVPDTDvm+SAHEnqW1gLxpiYTD1
	pIrG5qI+Z2KDJZxoQ9/yNetbtlIjNVmlJeDFLDRIiUASAV1g6kKESomPcasSuXlU1as0
	IdPPR/3K+J23gCvpMp09q3L4f41HcifBpy6qi5CM54p8JdQ5lJF48Qr04ibnegAyK/Q8
	FY0Q==
X-Gm-Message-State: APjAAAX5lFGT2j4QKOlJagG7Ae42ECVSA42DH9FYQ/YTXxkZrnv5Y3BO
	lhTtIjv4arrweOJF0mB5DROLQmAs
X-Google-Smtp-Source: APXvYqzp72ZTdkVrymrTK/RCmd9qDimijpV2EdoQqmAfZOoN++/mI/r9UCZxCX8Q873gSDCdcEKfCQ==
X-Received: by 2002:a05:6a00:2b7:: with SMTP id
	q23mr3358102pfs.43.1580363921550; 
	Wed, 29 Jan 2020 21:58:41 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:25aa:a762:1b4:49d3?
	([2601:202:4180:a5c0:25aa:a762:1b4:49d3])
	by smtp.gmail.com with ESMTPSA id x7sm4799925pfp.93.2020.01.29.21.58.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Jan 2020 21:58:40 -0800 (PST)
To: Randy MacLeod <randy.macleod@windriver.com>,
	Joe Slater <joe.slater@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20191107181307.3722-1-joe.slater@windriver.com>
	<7ebd9a64-acd1-6e14-5f4e-c6328d0888aa@windriver.com>
	<b22524f9-ef4f-6b1e-dbb5-74191fb3c74f@windriver.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <6beca527-c6f1-c24d-7f71-5002c0d68efb@gmail.com>
Date: Wed, 29 Jan 2020 21:58:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <b22524f9-ef4f-6b1e-dbb5-74191fb3c74f@windriver.com>
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

got it.


On 1/28/20 2:10 PM, Randy MacLeod wrote:
> On 1/28/20 4:34 PM, Randy MacLeod wrote:
>> Armin,
>>
>> ping? It's not urgent but it would be nice to fix this build failure.
>
>
> Ah, it was sent to the wrong list.
>
> Joe,
>
> Could you send this patch to the oe-core list and CC Armin, please?
sorry , found original in my trash. its in zeus-nut now

thanks for bringing to my attention.

- armin
>
> ../Randy
>
>>
>> ../Randy
>>
>>
>> On 11/7/19 1:13 PM, Joe Slater wrote:
>>> Partial backport from WebKit.git.  See patch for details.
>>>
>>> Fixed in webkitgtk 2.26.1.
>>>
>>> Signed-off-by: Joe Slater <joe.slater@windriver.com>
>>> ---
>>>   .../webkit/webkitgtk/fix-link-error.patch          | 45
>>> ++++++++++++++++++++++
>>>   meta/recipes-sato/webkit/webkitgtk_2.24.4.bb       |  1 +
>>>   2 files changed, 46 insertions(+)
>>>   create mode 100755
>>> meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
>>>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
>>> b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
>>> new file mode 100755
>>> index 0000000..9696ddd
>>> --- /dev/null
>>> +++ b/meta/recipes-sato/webkit/webkitgtk/fix-link-error.patch
>>> @@ -0,0 +1,45 @@
>>> +webkitgtk: fix an occasional link error
>>> +
>>> +Part of ae465a4e...  Changelog is not included in the source tarball.
>>> +
>>> +Upstream-Status:  backport [git://git.webkit.org/WebKit.git]
>>> +
>>> +commit ae465a4e3b1498b6c4038fc7e596e0e3662d116f
>>> +Author: Hironori.Fujii@sony.com
>>> <Hironori.Fujii@sony.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
>>> +Date:   Fri Jun 28 07:38:09 2019 +0000
>>> +
>>> +    [Win] unresolved external symbol
>>> "JSC::JSObject::didBecomePrototype(void)" referenced in function
>>> "JSC::Structure::create(...)"
>>> +    https://bugs.webkit.org/show_bug.cgi?id=199312
>>> +
>>> +    Reviewed by Keith Miller.
>>> +
>>> +    WinCairo port, clang-cl Release builds reported a following
>>> linkage error:
>>> +
>>> +    > WebCore.lib(UnifiedSource-4babe430-10.cpp.obj) : error
>>> LNK2019: unresolved external symbol "public: void __cdecl
>>> JSC::JSObject::didBecomePrototype(void)"
>>> (?didBecomePrototype@JSObject@JSC@@QEAAXXZ) referenced in function
>>> "public: static class JSC::Structure * __cdecl
>>> JSC::Structure::create(class JSC::VM &,class JSC::JSGlobalObject
>>> *,class JSC::JSValue,class JSC::TypeInfo const &,struct
>>> JSC::ClassInfo const *,unsigned char,unsigned int)"
>>> (?create@Structure@JSC@@SAPEAV12@AEAVVM@2@PEAVJSGlobalObject@2@VJSValue@2@AEBVTypeInfo@2@PEBUClassInfo@2@EI@Z)
>>> +
>>> +    No new tests because there is no behavior change.
>>> +
>>> +    * Modules/indexeddb/server/SQLiteIDBBackingStore.cpp: Include
>>> <JavaScriptCore/JSCInlines.h>,
>>> +    and do not include headers which is included by it.
>>> +
>>> +    git-svn-id:
>>> http://svn.webkit.org/repository/webkit/trunk@246922
>>> 268f45cc-cd09-0410-ab3c-d52691b4dbfc
>>> +
>>> +[ modification of Changelog deleted ]
>>> +
>>> +diff --git
>>> a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
>>> b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
>>> +index d1b047c..0899a9a 100644
>>> +---
>>> a/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
>>> ++++
>>> b/Source/WebCore/Modules/indexeddb/server/SQLiteIDBBackingStore.cpp
>>> +@@ -49,11 +49,8 @@
>>> + #include "SQLiteTransaction.h"
>>> + #include "ThreadSafeDataBuffer.h"
>>> + #include <JavaScriptCore/AuxiliaryBarrierInlines.h>
>>> +-#include <JavaScriptCore/HeapInlines.h>
>>> +-#include <JavaScriptCore/JSCJSValueInlines.h>
>>> +-#include <JavaScriptCore/JSGlobalObject.h>
>>> ++#include <JavaScriptCore/JSCInlines.h>
>>> + #include <JavaScriptCore/StrongInlines.h>
>>> +-#include <JavaScriptCore/StructureInlines.h>
>>> + #include <wtf/FileSystem.h>
>>> + #include <wtf/NeverDestroyed.h>
>>> + #include <wtf/text/StringConcatenateNumbers.h>
>>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
>>> b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
>>> index 8c695ce..b04ec82 100644
>>> --- a/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
>>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.24.4.bb
>>> @@ -23,6 +23,7 @@ SRC_URI =
>>> "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>>              file://include_array.patch \
>>>              file://narrowing.patch \
>>> file://0001-gstreamer-add-a-missing-format-string.patch \
>>> +           file://fix-link-error.patch \
>>>              "
>>>     SRC_URI[md5sum] = "c214963d8c0e7d83460da04a0d8dda87"
>>
>>
>


