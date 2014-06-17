Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 988AE6FEB0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jun 2014 01:41:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5H1fM1S025774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jun 2014 18:41:23 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 18:41:22 -0700
Message-ID: <539F9CB4.4030304@windriver.com>
Date: Tue, 17 Jun 2014 09:41:08 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1402919980-2506-1-git-send-email-tom.rini@gmail.com>
In-Reply-To: <1402919980-2506-1-git-send-email-tom.rini@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-filesystems][PATCH] unionfs-fuse: A FUSE based implementation of UnionFS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jun 2014 01:41:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed by Hongxu

//Hongxu

On 06/16/2014 07:59 PM, Tom Rini wrote:
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Philip Balister <philip@balister.org>
> Cc: hongxu jia <hongxu.jia@windriver.com>
> Signed-off-by: Tom Rini <tom.rini@gmail.com>
> ---
>   .../recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>   create mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
>
> diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
> new file mode 100644
> index 0000000..1d50364
> --- /dev/null
> +++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "A FUSE based implemention of unionfs"
> +HOMEPAGE = "http://podgorny.cz/moin/UnionFsFuse"
> +SECTION = "console/network"
> +LICENSE = "BSD-3-Clause"
> +DEPENDS = "fuse"
> +LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32"
> +
> +SRC_URI = "http://podgorny.cz/unionfs-fuse/releases/${PN}-${PV}.tar.xz"
> +
> +SRC_URI[md5sum] = "689c636484756f6f7a728ef354cbeac2"
> +SRC_URI[sha256sum] = "8d5c9dcb51ecb9a9b03890e16d17e37d602b0c1f23ed6a9ddec2b0f719c9f662"
> +
> +do_install() {
> +	oe_runmake install DESTDIR=${D} PREFIX=${exec_prefix}
> +}


