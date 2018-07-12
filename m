Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id C9ED57604C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 18:09:18 +0000 (UTC)
Received: from [10.0.0.10] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id EB2261C0974;
	Thu, 12 Jul 2018 20:09:18 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <471e7a0975e7869080f37ffc4cbc51de58fb74fa.1531397025.git-series.martin@geanix.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <e7a2ce58-4bbe-f44f-2349-2bbed2920241@geanix.com>
Date: Thu, 12 Jul 2018 20:09:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <471e7a0975e7869080f37ffc4cbc51de58fb74fa.1531397025.git-series.martin@geanix.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2] ell: update to 0.6
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
X-List-Received-Date: Thu, 12 Jul 2018 18:09:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-IE
Content-Transfer-Encoding: 8bit

Hi Khem,

On 2018-07-12 14:05, Martin Hundebøll wrote:
> Remove upstreamed patch to fix musl build, and replace with another
> (submitted) patch to fix a new musl issue.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> 
> ---
> 
> Changes in v2:
> - Added patch to fix musl build
> ---
>   meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch | 39 +++++++++++++++++++++++++++++++++++++++
>   meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch                         | 39 ---------------------------------------
>   meta-oe/recipes-core/ell/ell_0.4.bb                                                          | 19 -------------------
>   meta-oe/recipes-core/ell/ell_0.6.bb                                                          | 20 ++++++++++++++++++++
>   4 files changed, 59 insertions(+), 58 deletions(-)
>   create mode 100644 meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
>   delete mode 100644 meta-oe/recipes-core/ell/ell/0001-ell-fix-build-with-musl-libc.patch
>   delete mode 100644 meta-oe/recipes-core/ell/ell_0.4.bb
>   create mode 100644 meta-oe/recipes-core/ell/ell_0.6.bb
> 
> diff --git a/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
> new file mode 100644
> index 0000000..df3c055
> --- /dev/null
> +++ b/meta-oe/recipes-core/ell/ell/0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch
> @@ -0,0 +1,39 @@
> +From d8236d1d789f496a193dae5d2a15d706b81f6482 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
> +Date: Thu, 12 Jul 2018 10:19:50 +0200
> +Subject: [PATCH] dhcp: include if_arp.h from libc instead of linux headers
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +To: ell@lists.01.org
> +
> +Compilation with musl libc fails due to redefinition of 'struct
> +arp{req,req_old,hdr}' in linux/if_arp.h, since it is already defined and
> +included in net/if_arp.h (through net/ethernet.h -> net/if_ether.h).
> +
> +The only symbols used from if_arp.h is ARPHRD_ETHER, so it should be
> +safe to avoid the compile error by including the if_arp.h header from
> +the c-library instead.
> +
> +Upstream-Status: Submitted [https://lists.01.org/pipermail/ell/2018-July/001242.html]

The upstream status is now:
Upstream-Status: Backport 
[https://lists.01.org/pipermail/ell/2018-July/001244.html]

Change it locally if you like. Otherwise I'll send a quick patch when 
this one hits master.

// Martin

