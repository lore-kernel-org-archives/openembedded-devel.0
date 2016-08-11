Return-Path: <ml@embed.me.uk>
Received: from bmx2.eumx.net (bmx2.eumx.net [37.48.73.248])
	by mail.openembedded.org (Postfix) with ESMTP id 1D97B771F9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:33:20 +0000 (UTC)
Received: from owm.eumx.net (unknown [10.1.1.70])
	by bmx2.eumx.net (Postfix) with ESMTPS id 90476DC8DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 13:33:20 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <38abad72-d252-100b-ece6-8b7774841b9d@embed.me.uk>
Date: Thu, 11 Aug 2016 14:33:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470920876-22501-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: Re: [meta-oe][PATCH v3 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 13:33:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/16 14:07, Ricardo Ribalda Delgado wrote:
> C++ library that implements commandline flags processing. It includes
> built-in support for standard types such as string and the ability to
> define flags in the source file in which they are used.
>
> Used optionally by glog
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>   meta-oe/recipes-support/gflags/gflags_2.1.2.bb | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 meta-oe/recipes-support/gflags/gflags_2.1.2.bb
>
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.1.2.bb b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> new file mode 100644
> index 000000000000..30fd5f85e253
> --- /dev/null
> +++ b/meta-oe/recipes-support/gflags/gflags_2.1.2.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "The gflags package contains a C++ library that implements commandline flags processing. It includes built-in support for standard types such as string and the ability to define flags in the source file in which they are used"
> +HOMEPAGE = "https://github.com/gflags/gflags"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
> +
> +SRCREV = "1a02f2851ee3d48d32d2c8f4d8f390a0bc25565c"
> +SRC_URI = "git://github.com/gflags/gflags.git;branch=release"
> +
> +S = "${WORKDIR}/git/"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON"
> +
> +FILES_${PN}-dev += "${libdir}/cmake"
> +
> +PACKAGES =+ "${PN}-bash-completion"
> +FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
> +RDEPENDS_${PN}-bash-completion = "bash-completion"

Looks good to me.

Acked-by: Jack Mitchell <jack@embed.me.uk>



