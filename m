Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 08C166011A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 12:28:09 +0000 (UTC)
Received: from [172.21.2.124] (unknown [87.54.42.112])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 88ED71C0960
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 14:28:10 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <471e7a0975e7869080f37ffc4cbc51de58fb74fa.1531397025.git-series.martin@geanix.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <0564376b-e08b-6503-5c47-009e1cd7d6f8@geanix.com>
Date: Thu, 12 Jul 2018 14:28:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <471e7a0975e7869080f37ffc4cbc51de58fb74fa.1531397025.git-series.martin@geanix.com>
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
X-List-Received-Date: Thu, 12 Jul 2018 12:28:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 2018-07-12 14:05, Martin Hundebøll wrote:
> Remove upstreamed patch to fix musl build, and replace with another
> (submitted) patch to fix a new musl issue.
> 
> Signed-off-by: Martin Hundebøll <martin@geanix.com>
> 
> ---
> 

[snip]

> diff --git a/meta-oe/recipes-core/ell/ell_0.4.bb b/meta-oe/recipes-core/ell/ell_0.4.bb
> deleted file mode 100644
> index 1524bd6..0000000
> --- a/meta-oe/recipes-core/ell/ell_0.4.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -SUMMARY  = "Embedded Linux Library"
> -DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
> -LICENSE  = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> -SECTION = "libs"
> -
> -inherit autotools pkgconfig
> -
> -S = "${WORKDIR}/git"
> -SRCREV = "b4aea06fabb2af1af01f861f8f394c75950b6d47"
> -SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git \
> -           file://0001-ell-fix-build-with-musl-libc.patch \
> -          "
> -
> -do_configure_prepend () {
> -    mkdir ${S}/build-aux
> -}
> -
> -DEPENDS = "dbus"
> diff --git a/meta-oe/recipes-core/ell/ell_0.6.bb b/meta-oe/recipes-core/ell/ell_0.6.bb
> new file mode 100644
> index 0000000..399eddb
> --- /dev/null
> +++ b/meta-oe/recipes-core/ell/ell_0.6.bb
> @@ -0,0 +1,20 @@
> +SUMMARY  = "Embedded Linux Library"
> +DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
> +LICENSE  = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> +SECTION = "libs"
> +
> +inherit autotools pkgconfig
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "59ff3160fe55a841e662f8776f0520f2038235f4"
> +SRC_URI = " \
> +    git://git.kernel.org/pub/scm/libs/ell/ell.git \
> +    file://0001-dhcp-include-if_arp.h-from-libc-instead-of-linux-hea.patch \
> +"
> +
> +do_configure_prepend () {
> +    mkdir ${S}/build-aux
> +}
> +
> +DEPENDS = "dbus"
> 
> base-commit: b56fc26fefff498b10236ea6486a5d5624f726cc
> 

Sorry for the bad "git-move-detection". Apparently, this is not detected 
properly when using 'git-series'.

// Martin

