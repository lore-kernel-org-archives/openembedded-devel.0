Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6A8CCA471
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 15:00:38 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.11441.1759417237174567466
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 08:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=t8S9Pfnr;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592F0aWD2903600;
	Thu, 2 Oct 2025 10:00:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759417236;
	bh=kZTIbwp9AW9CQBL0BVwCYuJtDuIS+kxf6rlSDYMfCDs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=t8S9Pfnr6mP+NDyx54+2aD2IWTe1IR/5wE0S3lTxJDvhbeOrd5AnGCZ8QFFrxfITO
	 ZpbzyS+CNxv+ifEcnazMUXT7b4mXQQQDpz3eRx3njlatUA9W5Zgx/Y66nUF55ootVh
	 9Jxaj2TPSoDiGrZu618u+V1kfGGL/7EPIidMQbpI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592F0akh098955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 10:00:36 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 10:00:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 10:00:36 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592F0aGt1998151;
	Thu, 2 Oct 2025 10:00:36 -0500
Message-ID: <46701dc2-87fa-4587-8636-3d4f9bd1985a@ti.com>
Date: Thu, 2 Oct 2025 10:00:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 2/2] opencl-cts: build GL, GL ES and Vulkan
 interoperability tests
To: <dmitry.baryshkov@oss.qualcomm.com>,
        <openembedded-devel@lists.openembedded.org>
References: <20250929024025.3210337-1-dmitry.baryshkov@oss.qualcomm.com>
 <20250929024025.3210337-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250929024025.3210337-2-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 15:00:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120199


I'm seeing build errors with this patch.

ERROR: opencl-cts-2025.04.14-r0 do_package_qa: QA Issue: File 
/usr/bin/opencl_test_conformance/vulkan/test_vulkan in package 
opencl-cts contains reference to TMPDIR [buildpaths]
ERROR: opencl-cts-2025.04.14-r0 do_package_qa: QA Issue: File 
/usr/bin/opencl_test_conformance/extensions/cl_khr_external_semaphore/test_cl_khr_external_semaphore 
in package opencl-cts contains reference to TMPDIR [buildpaths]
ERROR: opencl-cts-2025.04.14-r0 do_package_qa: Fatal QA errors were 
found, failing task.




On 9/28/2025 9:40 PM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Follow DISTRO_FEATURES and build optional GL, GL ES and Vulkan
> interoperability tests.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
> index ebf83d1a1a2d..fe1d6075e27b 100644
> --- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
> +++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
> @@ -18,6 +18,14 @@ SRCREV = "e96edaef8b582c2412a2aab4b82f5c88af88617d"
>   
>   EXTRA_OECMAKE:append = " -DENABLE_WERROR=OFF -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
>   
> +PACKAGECONFIG = " \
> +	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles', '', d)} \
> +	${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \
> +"
> +PACKAGECONFIG[opengl] = "-DGL_IS_SUPPORTED=ON,-DGL_IS_SUPPORTED=OFF,virtual/libgl glew freeglut"
> +PACKAGECONFIG[gles] = "-DGLES_IS_SUPPORTED=ON,-DGLES_IS_SUPPORTED=OFF,virtual/egl virtual/libgles2"
> +PACKAGECONFIG[vulkan] = "-DVULKAN_IS_SUPPORTED=ON,-DVULKAN_IS_SUPPORTED=OFF,vulkan-headers glslang-native"
> +
>   SECURITY_STRINGFORMAT:remove = "-Werror=format-security"
>   
>   do_install() {
> @@ -25,6 +33,7 @@ do_install() {
>           cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
>           sed -i 's:/usr/bin/python:/usr/bin/python3:g' ${D}${bindir}/opencl_test_conformance/run_conformance.py
>   	 find "${D}${bindir}/opencl_test_conformance" -name cmake_install.cmake -type f -delete
> +        find "${D}${bindir}/opencl_test_conformance" -name libvulkan_wrapper.a -type f -delete
>           find "${D}${bindir}/opencl_test_conformance" -name CMakeFiles -type d -exec rm -rf "{}" \; -depth
>   }
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#120005): https://lists.openembedded.org/g/openembedded-devel/message/120005
> Mute This Topic: https://lists.openembedded.org/mt/115489531/6551054
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


