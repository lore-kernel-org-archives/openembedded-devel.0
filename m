Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 667177BE38
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Jan 2019 21:44:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x08Li6H6021271
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jan 2019 13:44:07 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 8 Jan 2019 13:44:06 -0800
To: Pierre-Jean Texier <pjtexier@koncepto.io>,
	<openembedded-devel@lists.openembedded.org>
References: <1546982720-31704-1-git-send-email-pjtexier@koncepto.io>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <6613407c-f7e7-38d3-c373-270ce55376bc@windriver.com>
Date: Tue, 8 Jan 2019 16:44:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1546982720-31704-1-git-send-email-pjtexier@koncepto.io>
X-Originating-IP: [172.25.44.4]
Subject: Re: [meta-oe][PATCH 1/2] minicoredumper: Update to 2.0.1
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
X-List-Received-Date: Tue, 08 Jan 2019 21:44:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/8/19 4:25 PM, Pierre-Jean Texier wrote:
> - Drop upstreamed patch
> - Update COPYING

Please add a few words to the long log to explain why
the COPYING chksum needed to be changed.
Was it just copyright date changes?

Thanks,
../Randy

> 
> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
> ---
>   .../{minicoredumper_2.0.0.bb => minicoredumper_2.0.1.bb}             | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>   rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_2.0.0.bb => minicoredumper_2.0.1.bb} (88%)
> 
> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> similarity index 88%
> rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
> rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> index bae5cf4..50dab8d 100644
> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
>   to allow minimal and customized crash dumps"
>   LICENSE = " LGPLv2.1 & BSD-2-Clause"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=aa846ae365f71b69e9fa0d21a56391ec \
> +LIC_FILES_CHKSUM = "file://COPYING;md5=71827c617ec7b45a0dd23658347cc1e9 \
>                       file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
>                       file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
>                      "
> @@ -9,14 +9,13 @@ DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
>   
>   inherit autotools pkgconfig systemd update-rc.d
>   
> -SRCREV = "1c0d5960b0bb4bac7566e6afe8bc9705399cc76b"
> +SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
>   
>   PR .= "+git${SRCPV}"
>   
>   SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
>              file://minicoredumper.service \
>              file://minicoredumper.init \
> -           file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
>              "
>   
>   S = "${WORKDIR}/git"
> 


-- 
# Randy MacLeod
# Wind River Linux

