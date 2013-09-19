Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 998426156C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Sep 2013 08:39:49 +0000 (UTC)
Message-ID: <523AB853.80707@communistcode.co.uk>
Date: Thu, 19 Sep 2013 09:39:47 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
In-Reply-To: <1379110532-29457-1-git-send-email-ml@communistcode.co.uk>
Subject: Re: [meta-oe][PATCHv5] libsoc: new recipe
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
X-List-Received-Date: Thu, 19 Sep 2013 08:39:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/13 23:15, Jack Mitchell wrote:
> From: Jack Mitchell <jack@embed.me.uk>
>
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
> ---
>   v4 -> v5
>   - Moved RDEPENDS to below do_install
>
>   v3 -> v4
>   - Added libgcc in RDEPENDS
>
>   v2 -> v3
>   - Removed DEPENDS on libgcc
>   - Removed autogen.sh pre-configure as was unneeded
>
>   v1 -> v2
>   -added signed-off-by
>
>   meta-oe/recipes-support/libsoc/libsoc_0.3.bb | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta-oe/recipes-support/libsoc/libsoc_0.3.bb
>
> diff --git a/meta-oe/recipes-support/libsoc/libsoc_0.3.bb b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> new file mode 100644
> index 0000000..1bf2782
> --- /dev/null
> +++ b/meta-oe/recipes-support/libsoc/libsoc_0.3.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "libsoc is a C library for interfacing with common SoC peripherals through generic kernel interfaces"
> +HOMEPAGE = "https://github.com/jackmitch/libsoc"
> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e0bfebea12a718922225ba987b2126a5"
> +
> +inherit autotools
> +
> +SRCREV = "0764ee52b590d5ccb4bd4698f0011496b536ed70"
> +SRC_URI = "git://github.com/jackmitch/libsoc.git"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} = "libgcc"

While Koen is away would someone mind pulling this in if there are no 
more comments?

Cheers,
Jack

