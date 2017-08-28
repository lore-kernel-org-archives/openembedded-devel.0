Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21D0B71A15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 04:47:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7S4lcbw005538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 27 Aug 2017 21:47:38 -0700
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 27 Aug 2017 21:47:37 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20170825071422.3969-1-raj.khem@gmail.com>
	<20170825071422.3969-3-raj.khem@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <4ce1f243-0fb2-666f-f6b5-3f0ac7eb8c07@windriver.com>
Date: Mon, 28 Aug 2017 12:48:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170825071422.3969-3-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [meta-networking][PATCH 3/4] squid: Disable format-truncation warning only with gcc
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
X-List-Received-Date: Mon, 28 Aug 2017 04:47:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

I got an error after applied this patch with latest oe-core:

| ../../../squid-3.5.26/src/format/Format.cc: In member function 'void 
Format::Format::assemble(MemBuf&, const Pointer&, int) const':
| ../../../squid-3.5.26/src/format/Format.cc:345:1: error: '%0*lld' 
directive output may be truncated writing between 1 and 2147483646 bytes 
into a region of size 1024 [-Werror=format-truncation=]
|  Format::Format::assemble(MemBuf &mb, const AccessLogEntry::Pointer 
&al, int logSequenceNumber) const
|  ^~~~~~
| ../../../squid-3.5.26/src/format/Format.cc:345:1: note: directive 
argument in the range [-2147483648, 2147483647]
| ../../../squid-3.5.26/src/format/Format.cc:542:21: note: 'snprintf' 
output between 4 and 4294967295 bytes into a destination of size 1024
|              snprintf(tmp, sizeof(tmp), "%0*" PRId64 ".%0*d", 
fmt->zero && (fmt->widthMin - precision - 1 >= 0) ? fmt->widthMin - 
precision - 1 : 0, static_cast<int64_t>(al->cache.start_time.tv_sec), 
precision, (int)(al->cache.start_time.tv_usec / fmt->divisor));
| 
~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Thanks,
Yi

在 2017年08月25日 15:14, Khem Raj 写道:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-networking/recipes-daemons/squid/squid_3.5.26.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> index 24cd15669..0260497e7 100644
> --- a/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> +++ b/meta-networking/recipes-daemons/squid/squid_3.5.26.bb
> @@ -22,10 +22,11 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
>              file://set_sysroot_patch.patch \
>              file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
>              file://0001-SquidNew-use-noexcept-instead-of-throw-for-C-11-comp.patch \
> -           file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
>              file://gcc7-fixes.patch \
>              file://0001-tools.cc-fixed-unused-result-warning.patch \
>              "
> +SRC_URI_append_toolchain-gcc = " file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
> +
>   SRC_URI[md5sum] = "dc1830cd361e077814aa39bcc3691d8b"
>   SRC_URI[sha256sum] = "41d8845863dcd026c856508cd1599d417c8947ffd96e86e24085f9893cb8b8c2"
>   


