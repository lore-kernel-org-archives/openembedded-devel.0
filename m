Return-Path: <jack.mitchell@eumx.net>
X-Greylist: delayed 509 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Aug 2016 12:31:02 UTC
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 5D65A77224
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:31:02 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 6D26DDC8DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 12:22:33 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
From: ml@embed.me.uk
Message-ID: <e653ed48-a9d7-9bd7-1d12-0cf5b85e82b3@eumx.net>
Date: Thu, 11 Aug 2016 13:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 12:31:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/16 11:10, Ricardo Ribalda Delgado wrote:
> C++ library that implements commandline flags processing. It includes
> built-in support for standard types such as string and the ability to
> define flags in the source file in which they are used.
>
> Used optionally by glog
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>   meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-oe/recipes-support/gflags/gflags_2.1.2.bb
>
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> new file mode 100644
> index 000000000000..ac8d2ceeaa8a
> --- /dev/null
> +++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "The gflags package contains a C++ library that implements commandline flags processing. It includes built-in support for standard types such as string and the ability to define flags in the source file in which they are used"
> +
> +HOMEPAGE = "https://github.com/gflags/gflags"
> +
> +RDEPENDS_${PN} += "bash"

Where does this dependency come from, seems odd that a compiled library 
should depend on bash?

> +
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
> +
> +SRC_URI = "git://github.com/gflags/gflags.git;;nobranch=1"
> +SRCREV = "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
> +S = "${WORKDIR}/git/"
> +
> +FILES_${PN}-dev += "${libdir}/cmake"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON"


