Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id A80267CBD5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577447305; x=1608983305;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=f5rZetjpWam1x6aJikBiOLNJJCkIdXFIyz/Dy4Ta1OI=;
	b=LHobYSvAQVaG7QH0jzX5Qa42meM4LTZiCv8FFHPLleIfl1azg8B72ehL
	mXAF8B09zwAOaydD+QjTCC+EAA28jRDFjCDhPZvdfy4Z9EhwcI6crwgcM
	MRfHxBl+uj+gdzuRpJ1AeSzCXk4jmhJp3R2x5D1X99WVKZ8TTsFA9zy69
	aal1zkCnztUgO2oBgVWa4D5UzBYN+d9QWQvPK8N6Gz5AvcR/LflXVoA/w
	HV+JFzbIt5ZaAHyeDXqUcaXDuaJm7Km3Fnmbue28FaL1X0+J0gGiEHWvh
	7SfehHwF+Gm+MU5r6huc52Sc+HcQzexkYDiuHHt3WCJb93ez8erUsytzS A==;
IronPort-SDR: ddFg4VSxywXxsUYvunbQpEwE/SksSPNW2SOT+6EBQUUUn4mWIHiPuHp+CVzCsno6UV6xMoLuIZ
	TKgCbnppemDtGgjdpqbFrKsoCW8waLMmaEpllbBMiTsKNYPW6FT3olEIjprYn7mQnrimOphQTN
	+sTZE2cARDT5WyQgrLu65DCXPo06QsLTpa5EIM6oMWlNXVUKoXpBN+X4SiSbNzxC4SQFh6ypel
	w8Vr1O48jfIrEo6kI6EwvopKUUzxyNVz7sND/fM8Pdu0CzRvsvm/iFVicYK/Vf89J3ZiWBGqeK
	idQ=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; 
   d="scan'208";a="2472810"
To: Wenlin Kang <wenlin.kang@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
References: <20190219023057.42559-1-wenlin.kang@windriver.com>
	<20190219023057.42559-2-wenlin.kang@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <54a7f303-662f-bf5d-a8a5-50b0e172d5dd@skidata.com>
Date: Fri, 27 Dec 2019 12:48:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20190219023057.42559-2-wenlin.kang@windriver.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH 1/1] openjdk: fix a random crash on JNI_CreateJavaVM
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
X-List-Received-Date: Fri, 27 Dec 2019 11:48:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
       git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 19/02/2019 03:30, Wenlin Kang wrote:
> When call JNI_CreateJavaVM API, sometimes it will crash(we have
> reproduced it on quemuppc), this patch fixes it.
> 
> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> ---
>   .../openjdk-8-release-172b11-common.inc       |  1 +
>   ...otspot-fix-crash-on-JNI_CreateJavaVM.patch | 36 +++++++++++++++++++
>   2 files changed, 37 insertions(+)
>   create mode 100644 recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> 
> diff --git a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> index ad20585..b37608c 100644
> --- a/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-release-172b11-common.inc
> @@ -21,6 +21,7 @@ PATCHES_URI = "\
>       ${LIBPNG_NEON_PATCH} \
>       file://handle_extra_output.patch \
>       file://hotspot-handle-gcc7-format-overflow.patch \
> +    file://0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch \
>   "
>   HOTSPOT_UB_PATCH = "\
>       file://0014-hotspot-zero-fix-undefined-behaviour-gcc-v8-fix.patch \
> diff --git a/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch b/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> new file mode 100644
> index 0000000..4618b6b
> --- /dev/null
> +++ b/recipes-core/openjdk/patches-openjdk-8/0001-hotspot-fix-crash-on-JNI_CreateJavaVM.patch
> @@ -0,0 +1,36 @@
> +From d0ebd6f108df9b0f9533de6f16280ceec136d8e6 Mon Sep 17 00:00:00 2001
> +From: Wenlin Kang <wenlin.kang@windriver.com>
> +Date: Sun, 17 Feb 2019 22:38:33 -0800
> +Subject: [PATCH] hotspot: fix crash on JNI_CreateJavaVM
> +
> +In function os::pd_create_stack_guard_pages(char* addr, size_t size),
> +when addr < os::Linux::initial_thread_stack_bottom(), usually munmap()
> +will not be called, but when mincore()==-1, get_stack_commited_bottom()
> +will make stack_extent < os::Linux::initial_thread_stack_bottom() and
> +stack_extent < addr too, then munmap() is called, in such case, it may
> +cause segment(we have reproduced it on linux_PPC).
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> +---
> + hotspot/src/os/linux/vm/os_linux.cpp | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/hotspot/src/os/linux/vm/os_linux.cpp b/hotspot/src/os/linux/vm/os_linux.cpp
> +index 044a70a6..b8246ce4 100644
> +--- a/hotspot/src/os/linux/vm/os_linux.cpp
> ++++ b/hotspot/src/os/linux/vm/os_linux.cpp
> +@@ -3078,7 +3078,8 @@ bool os::pd_create_stack_guard_pages(char* addr, size_t size) {
> +     uintptr_t stack_extent = (uintptr_t) os::Linux::initial_thread_stack_bottom();
> +     unsigned char vec[1];
> +
> +-    if (mincore((address)stack_extent, os::vm_page_size(), vec) == -1) {
> ++    if ((mincore((address)stack_extent, os::vm_page_size(), vec) == -1)
> ++        && ((size_t)addr > (size_t)stack_extent)) {
> +       // Fallback to slow path on all errors, including EAGAIN
> +       stack_extent = (uintptr_t) get_stack_commited_bottom(
> +                                     os::Linux::initial_thread_stack_bottom(),
> +--
> +2.17.1
> +
> 

