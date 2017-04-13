Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF07277D0A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:31:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D2VdjW026176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:31:39 -0700 (PDT)
Received: from [128.224.162.239] (128.224.162.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 19:31:38 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1491994320-28617-1-git-send-email-zhixiong.chi@windriver.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <58EEE309.9000501@windriver.com>
Date: Thu, 13 Apr 2017 10:31:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1491994320-28617-1-git-send-email-zhixiong.chi@windriver.com>
Subject: Re: [meta-oe][PATCH] autoconf-archive: Upgrade to 2016.09.16
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
X-List-Received-Date: Thu, 13 Apr 2017 02:31:40 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Please suspend to check in this patch.
Because if we upgrade it, there will be something macros(ax_*.m4) 
conflictions between autoconf-archive
and gnome-common. even if we can use the option 
'--with-autoconf-archive' for gnome-common then set
it depend on autoconf-archive, unfortunately the gnome-common is from 
oe-core and autoconf-archive is
from meta-oe.
As the same time, the lvm2 depends on autoconf-archive in meta-oe, so we 
can't only move autoconf-archive
into oe-core.

Any thoughts on that?

Thanks.

On 2017年04月12日 18:52, Zhixiong Chi wrote:
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>   .../recipes-devtools/autoconf-archive/autoconf-archive.inc  |  2 +-
>   .../autoconf-archive/autoconf-archive_2012.04.07.bb         | 13 -------------
>   .../autoconf-archive/autoconf-archive_2016.09.16.bb         | 13 +++++++++++++
>   3 files changed, 14 insertions(+), 14 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
>   create mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
>
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> index 9399363..779115a 100644
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
> @@ -10,6 +10,6 @@ RDEPENDS_${PN} = "m4 gnu-config"
>   RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
>   RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
>   
> -SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2"
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
>   
>   inherit autotools
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
> deleted file mode 100644
> index 5baaecc..0000000
> --- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2012.04.07.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require autoconf-archive.inc
> -
> -
> -PARALLEL_MAKE = ""
> -
> -LICENSE = "GPLv2 & GPLv3"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -
> -SRC_URI[md5sum] = "e842c5b9fae021007bd70550362e5e80"
> -SRC_URI[sha256sum] = "040b443bf68efd52fbfcb294b556bfbbbfe432db78445ca25e0cfe2e88f96a14"
> -
> -EXTRA_OECONF += "ac_cv_path_M4=m4"
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> new file mode 100644
> index 0000000..0a1a771
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
> @@ -0,0 +1,13 @@
> +require autoconf-archive.inc
> +
> +
> +PARALLEL_MAKE = ""
> +
> +LICENSE = "GPLv2 & GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
> +SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
> +
> +EXTRA_OECONF += "ac_cv_path_M4=m4"
> +BBCLASSEXTEND = "native nativesdk"

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


