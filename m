Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id EFB4F7C75A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 03:49:48 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id h8so7211223pgp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 19:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=SXbOJRlpIF02ry1V8PEgMBCg9Ajn6p7ZUcUgV9TjL+M=;
	b=pY+96EJWLba+lqMX56kLjMV7qx6Ec4r3avkfaFTrW4gihM4VnLodJzfB350WnLiEF+
	Y/kYxrlcUvt/mIPa9/2poBuIpo8lGwABEcrMYubxCtD5tm/+ixOZ1DeZ/eGFeADgbwY4
	s0sLOipg+ZDufX1cEdXYngCxOqcp+1JkLX7hHCkGdpdbe5krmeMGT9BBYs0jEgUYZjBl
	IIl1m6bCZ+SkrIvPcT1TiL+PYvE2SnDQ6zRVeSxZHYhu5EDC6/KmTxLx1087PoENs2PV
	uEby/t5m9sglX14qglD3gKugpLlpgmIDtDdSCbH9Z/Bf2HEzMyB43AKutpoCMUsZMXit
	JmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=SXbOJRlpIF02ry1V8PEgMBCg9Ajn6p7ZUcUgV9TjL+M=;
	b=qoc8g5eVpXUDMNneXFmY0vRG2PoJBfOGm5/iKDMcFVmBz10Beq+L/KAB/nlisD4e3d
	3waikLyPuCuSqeKe3tWsJ6q6clSkEQ91U9beon4opOndq393q3JjCGOwu0ctX3n+pb+f
	ziiYoAk8e4ME5d9L3O/sjCsuZ47RUr3RrBJbavBoa2obLkgSEMAi2jGnUYrYlR0LLfDF
	9enlFyeXYUBoiZ36vkH+pSDWIMwpssrsCPeFppXKHxdnXDEm22YnuA4VOcf4Im4GXMUA
	VhBN04u0krYj7x2xvcohPo1/dL5qx6OFbCqZo6tFAC2SV/jcAFp+Wnfc0xaX/jD8bS+7
	/RUw==
X-Gm-Message-State: APjAAAWTY3uyr1BVGrpq6LO15MTkKyH+mRVzYBagaYM7xHu6T16I5xKc
	poZhRL2c+5D3iY1nFncVcGVY/IAs
X-Google-Smtp-Source: APXvYqxmuJKnd/nkOKLWjE/l31Nc7qkFMLlN9HH+AC8dXscuUchB8SJafC5wu+krCgeIhrVE0lV+Sg==
X-Received: by 2002:a63:c34a:: with SMTP id e10mr4411928pgd.194.1551844189316; 
	Tue, 05 Mar 2019 19:49:49 -0800 (PST)
Received: from hermes.local ([2601:646:8500:6bc6:e91a:c092:698a:a99])
	by smtp.gmail.com with ESMTPSA id q7sm809742pfa.119.2019.03.05.19.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 19:49:48 -0800 (PST)
To: kai.kang@windriver.com
References: <20190306033908.173027-1-kai.kang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
Date: Tue, 5 Mar 2019 19:49:47 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:65.0)
	Gecko/20100101 Thunderbird/65.0
MIME-Version: 1.0
In-Reply-To: <20190306033908.173027-1-kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] leveldb: fix compile errors for mips with DEFAULTTUNE mips
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
X-List-Received-Date: Wed, 06 Mar 2019 03:49:49 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/5/19 7:39 PM, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':
> 
> | {standard input}: Assembler messages:
> | {standard input}:8004: Error: opcode not supported on this processor:
>    mips1 (mips1) `sync'
> | {standard input}:10296: Error: opcode not supported on this processor:
>    mips1 (mips1) `sync'
> | make: *** [out-shared/db/db_bench.o] Error 1
> 
> Asm instruction 'sync' is called in platform-specific function
> MemoryBarrier() which is used by AtomicPointer(). Comment out the
> definition of MemoryBarrier() for mips to avoid the errors. And turn to
> use AtomicPointer() based on C++11 <atomc>.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   ...fine-function-MemoryBarrier-for-mips.patch | 43 +++++++++++++++++++
>   meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +
>   2 files changed, 44 insertions(+)
>   create mode 100644 meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
> 
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
> new file mode 100644
> index 000000000..fc7743030
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarrier-for-mips.patch
> @@ -0,0 +1,43 @@
> +It fails to compile leveldb for qemumips with default tune 'mips':
> +
> +| {standard input}: Assembler messages:
> +| {standard input}:8004: Error: opcode not supported on this processor:
> +  mips1 (mips1) `sync'
> +| {standard input}:10296: Error: opcode not supported on this processor:
> +  mips1 (mips1) `sync'
> +| make: *** [out-shared/db/db_bench.o] Error 1
> +
> +Asm instruction 'sync' is called in platform-specific function
> +MemoryBarrier() which is used by AtomicPointer(). Comment out the
> +definition of MemoryBarrier() for mips to avoid the errors. And turn to
> +use AtomicPointer() based on C++11 <atomic>.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +---
> + port/atomic_pointer.h | 10 +++++-----
> + 1 file changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h
> +index 1c4c7aa..7025ac3 100644
> +--- a/port/atomic_pointer.h
> ++++ b/port/atomic_pointer.h
> +@@ -113,11 +113,11 @@ inline void MemoryBarrier() {
> + #define LEVELDB_HAVE_MEMORY_BARRIER
> +
> + // MIPS
> +-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> +-inline void MemoryBarrier() {
> +-  __asm__ __volatile__("sync" : : : "memory");
> +-}
> +-#define LEVELDB_HAVE_MEMORY_BARRIER
> ++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> ++//inline void MemoryBarrier() {
> ++//  __asm__ __volatile__("sync" : : : "memory");
> ++//}
> ++//#define LEVELDB_HAVE_MEMORY_BARRIER
> +

this is punishing all mips o32 variants.

> + #endif
> +
> diff --git a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> index 8fec89c6f..10988726a 100644
> --- a/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> +++ b/meta-oe/recipes-dbs/leveldb/leveldb_git.bb
> @@ -11,6 +11,7 @@ SRC_URI = "git://github.com/google/${BPN}.git \
>              file://0001-build_detect_platform-Check-for-__SSE4_2__.patch \
>              file://0002-makefile-build-SHARED_MEMENVLIB.patch \
>              file://0001-Makefile-Fix-parallel-build.patch \
> +           file://do-not-define-function-MemoryBarrier-for-mips.patch \
>              "
>   
>   S = "${WORKDIR}/git"
> 

