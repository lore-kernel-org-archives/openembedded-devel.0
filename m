Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B848771BE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jun 2017 02:16:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5T2GhZl007721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Jun 2017 19:16:43 -0700
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 28 Jun 2017 19:16:43 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170622064655.16412-1-Qi.Chen@windriver.com>
	<CA+chaQfTi=1m7dc9roW3LyHwNMy1RULDa7SOfyqBv+mFm+uWmQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <cf0efec4-d5d6-835f-4c0a-8c49c52439fa@windriver.com>
Date: Thu, 29 Jun 2017 10:20:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfTi=1m7dc9roW3LyHwNMy1RULDa7SOfyqBv+mFm+uWmQ@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hwloc: add several PACKAGECONFIG items
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
X-List-Received-Date: Thu, 29 Jun 2017 02:16:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2017 06:14 PM, Martin Jansa wrote:
> Should numactl be enabled by default?
>
> numactl.bb <http://numactl.bb> currently marks it ARM incompatible:
> # ARM does not currently support NUMA
> COMPATIBLE_HOST = "^((?!arm).*)$"
>
> and enabling the PACKAGECONFIG here by default would extend the same 
> restriction to hwloc as well.
>
>

Thanks for pointing out the problem.
I'll send out V2.

Best Regards,
Chen Qi

> On Thu, Jun 22, 2017 at 8:46 AM, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Add PACKAGECONFIG items to allow for more flexiblity.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb> | 10 ++++++++--
>      1 file changed, 8 insertions(+), 2 deletions(-)
>
>     diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     index e067f2799..16cd507e6 100644
>     --- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>     <http://hwloc_1.11.5.bb>
>     @@ -13,10 +13,16 @@ SRC_URI[sha256sum] =
>     "95d80286dfe658a3f79e2ac90698782bb36e5504f4bac1bba2394ba14d
>
>      inherit autotools
>
>     -DEPENDS += "cairo ncurses udev libxml2 zlib libpciaccess"
>     -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>     'virtual/libx11', '', d)}"
>     +DEPENDS += "ncurses udev zlib"
>      DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
>     'libselinux', '', d)}"
>
>     +PACKAGECONFIG ?= "numactl pci libxml2
>     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>     +
>     +PACKAGECONFIG[numactl] =
>     "--enable-libnuma,--disable-libnuma,numactl,numactl"
>     +PACKAGECONFIG[libxml2] =
>     "--enable-libxml2,--disable-libxml2,libxml2,libxml2"
>     +PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11
>     cairo,cairo"
>     +PACKAGECONFIG[pci] =
>     "--enable-pci,--disable-pci,libpciaccess,libpciaccess"
>     +
>      # Split hwloc library into separate subpackage
>      PACKAGES_prepend = " lib${PN} "
>      FILES_lib${PN} += "${libdir}/lib${PN}.so*"
>     --
>     2.11.0
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


