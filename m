Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED78A60616
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 06:00:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6Q60ARM026765
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 23:00:10 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 25 Jul 2018 23:00:09 -0700
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
References: <20180726055756.32558-1-hongzhi.song@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <54b429d3-c0f8-2fe2-033b-53dabb985bf3@windriver.com>
Date: Thu, 26 Jul 2018 14:02:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180726055756.32558-1-hongzhi.song@windriver.com>
X-Originating-IP: [128.224.162.198]
Subject: Re: [meta-oe][PATCH] snappy: add a new recipe
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
X-List-Received-Date: Thu, 26 Jul 2018 06:00:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

please ignore it.

--Hongzhi


On 2018年07月26日 13:57, Hongzhi.Song wrote:
> Snappy is a compression/decompression library. It does not aim for
> maximum compression, or compatibility with any other compression
> library; instead, it aims for very high speeds and reasonable compression.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>   meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 46 +++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> new file mode 100644
> index 000000000..8b27d9f27
> --- /dev/null
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> @@ -0,0 +1,46 @@
> +#
> +# Copyright (C) 2014 Wind River Systems, Inc.
> +#
> +# Redistribution and use in source and binary forms, with or without
> +# modification, are permitted provided that the following conditions are met:
> +#
> +# 1. Redistributions of source code must retain the above copyright notice,
> +# this list of conditions and the following disclaimer.
> +#
> +# 2. Redistributions in binary form must reproduce the above copyright notice,
> +# this list of conditions and the following disclaimer in the documentation
> +# and/or other materials provided with the distribution.
> +
> +# 3. Neither the name of the copyright holder nor the names of its contributors
> +# may be used to endorse or promote products derived from this software without
> +# specific prior written permission.
> +#
> +# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
> +# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
> +# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> +# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
> +# COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
> +# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
> +# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
> +# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
> +# AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
> +# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> +# THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> +
> +SUMMARY = "A compression/decompression library"
> +DESCRIPTION = "Snappy is a fast data compression and decompression library \
> +It was designed to be very fast and stable, but not to achieve a high \
> +compression ratio."
> +
> +LICENSE = "NewBSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=f62f3080324a97b3159a7a7e61812d0c"
> +
> +SRC_URI = "https://src.fedoraproject.org/repo/pkgs/snappy/snappy-1.1.7.tar.gz/sha512/32046f532606ba545a4e4825c0c66a19be449f2ca2ff760a6fa170a3603731479a7deadb683546e5f8b5033414c50f4a9a29f6d23b7a41f047e566e69eca7caf/snappy-1.1.7.tar.gz"
> +
> +SRC_URI[md5sum] = "ee9086291c9ae8deb4dac5e0b85bf54a"
> +SRC_URI[sha256sum] = "3dfa02e873ff51a11ee02b9ca391807f0c8ea0529a4924afa645fbf97163f9d4"
> +
> +inherit cmake pkgconfig
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"


