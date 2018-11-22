Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 4A45E6C5AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Nov 2018 14:02:07 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 0C1A01C1B09;
	Thu, 22 Nov 2018 15:02:08 +0100 (CET)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20181112143259.11488-1-schnitzeltony@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <8a63135c-70eb-6744-fa5c-88092b63bfaf@geanix.com>
Date: Thu, 22 Nov 2018 15:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181112143259.11488-1-schnitzeltony@gmail.com>
Subject: Re: [thud][PATCH 1/2] lvm2: update SRC_URI
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
X-List-Received-Date: Thu, 22 Nov 2018 14:02:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 8bit

Hi Andreas,

On 12/11/2018 15.32, Andreas Müller wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> Update SRC_URI for lvm2 as the previous
> one is invalid.
> 
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> Tested-by: Stefan Agner <stefan.agner@toradex.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 75f4d89a0..5728d83ea 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
>   
>   DEPENDS += "util-linux libaio"
>   
> -SRC_URI = "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
> +SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \

Why not use
   ftp://sources.redhat.com/pub/lvm2/releases/
or
   https://www.sourceware.org/pub/lvm2/releases/

?

>              file://lvm.conf \
>              file://0001-implement-libc-specific-reopen_stream.patch \
>              file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
> 

-- 
Kind regards,
Martin Hundebøll
Embedded Linux Consultant

+45 61 65 54 61
martin@geanix.com

Geanix IVS
https://geanix.com
DK39600706

