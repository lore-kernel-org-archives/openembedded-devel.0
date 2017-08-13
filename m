Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A1E5C6E672
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Aug 2017 05:41:27 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id t86so7099471pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Aug 2017 22:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=eA6WL0eeYSFL6HrkDnUhs9GRI7vSMWuhVQY6dHk/5eQ=;
	b=LkgGCDz491E6+cM6uBEDNduVjuASyfdbAuKBvLRdsXRBVFLdwLLSS/Mns3GIWAQE9r
	qaNadIOQ5ed/QYO5oiVNVE1pf+hX/UsYwCoe05YB7cy2Y76nIm2siDhn6XcPWa7jIudV
	SqS1tJw8Zz4G5sBREhZpOmru1xNgeIDHW2od1j9jUF7SDr1e5+GKVppDAQ1rfRYQpX61
	qZLuGt5AJFeLmrHrRadkr5BNqZjQkHa+9kFbJY39EAM8dRN2zxuNMSpe0yWIntAgAe/k
	mvBBsJi6y1rjwSnXrDDa+6mY9uqHmM43vQsdE219BQeS7ZH9eAqbcYXxcuykP44KWesk
	tSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=eA6WL0eeYSFL6HrkDnUhs9GRI7vSMWuhVQY6dHk/5eQ=;
	b=VD6aDWp3h3F4pSoGA9RbqSO/Jm3FUXgLuvzBjtwA7gjmln5jW+rMiy2Cx8zQaEzHtJ
	Z9hadabl64egL31gFyusMw62cXql9lVf3DZAzWWehevQXnapHX426GYT2NF+x1tI82Lg
	yiw1/X3Hj3p64T0m9klyStG9YKZgiRTpgH+mmMJRz81S3Tu8c7+nxPEgOGESs70IUwTU
	EZ8kq7Dc4NmAnafYWyZylL9VXSQ+WIUUoYy1dkhuQwvbmr9pPW03ARFxKFaeDURtQ/RK
	sOqeSiZqF2UnU9m/SBGOxlYnPcsnqbPkEyyDH9R5KL8GmqzCn/W83xBvSGO1ILkIZsrV
	kL4w==
X-Gm-Message-State: AHYfb5gY7SiwXKIXoZjY9PT7tdS3917sMbT2LJvWygYtKW6NuE4w+zGa
	L5WmFacRAu/jnAY6
X-Received: by 10.84.194.195 with SMTP id h61mr24018453pld.140.1502602888421; 
	Sat, 12 Aug 2017 22:41:28 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:fca8:b769:ced4:ff45?
	([2601:202:4001:9ea0:fca8:b769:ced4:ff45])
	by smtp.gmail.com with ESMTPSA id
	g22sm9227252pgn.65.2017.08.12.22.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 12 Aug 2017 22:41:27 -0700 (PDT)
To: Jeremy Puhlman <jpuhlman@mvista.com>,
	openembedded-devel@lists.openembedded.org
References: <1502575439-5591-1-git-send-email-jpuhlman@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <b8c1e39c-066e-e22d-b694-1006d99cd12a@gmail.com>
Date: Sat, 12 Aug 2017 22:41:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502575439-5591-1-git-send-email-jpuhlman@mvista.com>
Subject: Re: [meta-networking][PATCH] Strongswan: Add stdint.h to resolve build failure
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
X-List-Received-Date: Sun, 13 Aug 2017 05:41:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/12/2017 03:03 PM, Jeremy Puhlman wrote:
> From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
>
> In file included from
> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils.h:55:0,
>                   from
> ../../../strongswan-5.5.3/src/libstrongswan/library.h:101,
>                   from
> ../../../strongswan-5.5.3/src/libstrongswan/library.c:17:
> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In
> function 'memwipe_inline':
> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
> error: 'uintptr_t' undeclared (first use in this function); did you mean
> '__intptr_t'?
>    for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
>                 ^~~~~~~~~
>                 __intptr_t
> ../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15:
> note: each undeclared identifier is reported only once for each function
> it appears in
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>   .../strongswan/files/strongswan-gcc-7.patch        | 25 ++++++++++++++++++++++
>   .../recipes-support/strongswan/strongswan_5.5.3.bb |  1 +
>   2 files changed, 26 insertions(+)
>   create mode 100644 meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
>
> diff --git a/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch b/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
> new file mode 100644
> index 0000000..388261b
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/files/strongswan-gcc-7.patch
> @@ -0,0 +1,25 @@
> +Fix missing definition of uintptr_t after the switch to gcc 7
> +
> +In file included from ../../../strongswan-5.5.3/src/libstrongswan/utils/utils.h:55:0,
> +                 from ../../../strongswan-5.5.3/src/libstrongswan/library.h:101,
> +                 from ../../../strongswan-5.5.3/src/libstrongswan/library.c:17:
> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h: In function 'memwipe_inline':
> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
> +  for (i = 0; (uintptr_t)&c[i] % sizeof(long) && i < n; i++)
> +               ^~~~~~~~~
> +               __intptr_t
> +../../../strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h:99:15: note: each undeclared identifier is reported only once for each function it appears in
> +
> +Upstream-Status: pending

Missing "Signed-off-by:"  in the patch itself.

- armin
> +
> +--- strongswan-5.5.3-orig/src/libstrongswan/utils/utils/memory.h	2016-04-22 13:01:35.000000000 -0700
> ++++ strongswan-5.5.3/src/libstrongswan/utils/utils/memory.h	2017-08-12 14:41:04.757398239 -0700
> +@@ -22,6 +22,8 @@
> + #ifndef MEMORY_H_
> + #define MEMORY_H_
> +
> ++#include <stdint.h>
> ++
> + /**
> +  * Helper function that compares two binary blobs for equality
> +  */
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
> index 9215233..680d338 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.5.3.bb
> @@ -9,6 +9,7 @@ DEPENDS = "gmp openssl flex-native flex bison-native"
>   
>   SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>           file://fix-funtion-parameter.patch \
> +        file://strongswan-gcc-7.patch \
>   "
>   
>   SRC_URI[md5sum] = "4afffe3c219bb2e04f09510905af836b"


