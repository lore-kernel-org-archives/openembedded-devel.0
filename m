Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8E09260BAD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2020 00:43:28 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id k29so291925pfp.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2020 16:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=G2gDjdpjVE8ugsJPYQmMlqOoGS5QMoIwkhZo9fg6QJk=;
	b=Dpq8b0IBs2l/Iwxcaj8jos080fpAQHZEwl7zvMF9uw8tsSbXz3GfEXvT29l8NwR0ba
	6olokv24puNMcQjSlJyCCv4CriZXF2HhxRulY/yUJ9lNEcCBzRuAosHtY365i1PguG4f
	JiMKnYYWco3FjfHqthPP5vjufyuYGSP/hyJR90JMAaTrskXw0UKb0oRrlXuNjkzaUn6n
	GXHXt0BDMz8DMSa4KfFYTb7HKiFqqOrwgfkoIWqEJCXvKFaDsootLeJp/90ttD0IkxfF
	+vP7KQy3YRutuyythFco7hR5vWlR9OmOl3n+7adFKyG6qN7fb5+dU2PlC65FcaGixLue
	hDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=G2gDjdpjVE8ugsJPYQmMlqOoGS5QMoIwkhZo9fg6QJk=;
	b=TtzTZPoZNzUu6FeRZKk0+avT9oOxCOEaLInULg/ex3j2kYUvsA/t2rzuJUAuwsnH5y
	bzCPptT0I2lJF2KefPw1kGL/dpSxcwwNZbbq/qFCmzbgotzHNfw7ShJvrpkEqDNMnLwI
	GVmK6EKAsAXVZPMfmyXQKsXlsdJOwOUnQEpC6DPK2xn8rC1Y7qkMn9pPtdvZpXmfaEMo
	qjOw1mQ8U5DgpdGIUyKbNgObaE9QXZguMybbmV80QmsvuhntrK0P7nGn9rDO2SSmw3Yu
	tTgjGD/cbG+4HQBy3V10ExyfhN+utM+ufaGwwsi4k85MNy3f5F3ytPPgc5w11o0NRAmq
	Q5/A==
X-Gm-Message-State: APjAAAVzKb5eFzUqvEgOS5D/UqBfYxOC5RBDTGWHfekegtr7H8qbIXzI
	HzS3kdGYRp7Jf0lRe94LZFIIWUiP+Tk=
X-Google-Smtp-Source: APXvYqxaVS8sbUa3ERvblj+mxnOt2TNpdgrQx10Gmd9WUKxbAqO3Aw7206JjvZfyQjzmFC39OtTdwg==
X-Received: by 2002:a63:cd04:: with SMTP id i4mr6003186pgg.281.1581468209054; 
	Tue, 11 Feb 2020 16:43:29 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:81b3:3ac9:364:a87?
	([2601:646:9200:4e0:81b3:3ac9:364:a87])
	by smtp.gmail.com with ESMTPSA id h3sm6001929pfr.15.2020.02.11.16.43.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 11 Feb 2020 16:43:28 -0800 (PST)
To: Wang Mingyu <wangmy@cn.fujitsu.com>,
	openembedded-devel@lists.openembedded.org
References: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <fea6ba62-0f04-456f-2b83-16ff6dede3f5@gmail.com>
Date: Tue, 11 Feb 2020 16:43:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1581441693-85373-1-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [meta-filesystems][PATCH] xfsprogs: 5.2.1 -> 5.4.0
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
X-List-Received-Date: Wed, 12 Feb 2020 00:43:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Fails build

http://errors.yoctoproject.org/Errors/Details/390596/

On 2/11/20 9:21 AM, Wang Mingyu wrote:
> Update license checksum : GPL-2.0-only and GPL-2.0-or-later are added to Valid-License-Identifier
> 
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>   .../xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.4.0.bb}       | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-filesystems/recipes-utils/xfsprogs/{xfsprogs_5.2.1.bb => xfsprogs_5.4.0.bb} (91%)
> 
> diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.4.0.bb
> similarity index 91%
> rename from meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
> rename to meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.4.0.bb
> index 34b338640..288ec72f9 100644
> --- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.2.1.bb
> +++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_5.4.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://oss.sgi.com/projects/xfs"
>   SECTION = "base"
>   LICENSE = "GPLv2 & LGPLv2.1"
>   LICENSE_libhandle = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038 \
> +LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
>                       file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
>   DEPENDS = "util-linux util-linux-native"
>   SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
> @@ -12,8 +12,8 @@ SRC_URI = "https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/${BP}.tar.xz \
>              file://0002-include-include-xfs-linux.h-after-sys-mman.h.patch \
>              file://0001-support-usrmerge.patch \
>              "
> -SRC_URI[md5sum] = "5ca3f79e76e3fb984a03d1b42a2e60ba"
> -SRC_URI[sha256sum] = "7b500e148cebd08f99e37cf744c7843817b37e7be2a32c4dc57d6ea16e3019ae"
> +SRC_URI[md5sum] = "61232b1cc453780517d9b0c12ff1699b"
> +SRC_URI[sha256sum] = "fa9c3a50bbd9f1619bb42249106f83a22883b79a02de6606ce14afb2f807213f"
>   
>   inherit autotools-brokensep
>   
> 


