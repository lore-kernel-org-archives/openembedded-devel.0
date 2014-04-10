Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 45F1165E76
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 10:23:03 +0000 (UTC)
Message-ID: <534670FC.5000901@communistcode.co.uk>
Date: Thu, 10 Apr 2014 11:22:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1397124314-37150-1-git-send-email-krzysztof.m.sywula@intel.com>
In-Reply-To: <1397124314-37150-1-git-send-email-krzysztof.m.sywula@intel.com>
Subject: Re: [meta-oe][PATCH] dejagnu: recipe taken from openembedded
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
X-List-Received-Date: Thu, 10 Apr 2014 10:23:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/04/14 11:05, krzysztof.m.sywula@intel.com wrote:
> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> 
> Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> ---
>  meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb |  3 +++
>  meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb        | 12 ++++++++++++
>  2 files changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
>  create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> 
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> new file mode 100644
> index 0000000..23cc10e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu-native_1.4.4.bb
> @@ -0,0 +1,3 @@
> +require dejagnu_${PV}.bb
> +S = "${WORKDIR}/dejagnu-${PV}"
> +inherit native
> diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> new file mode 100644
> index 0000000..b202ae4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "GNU unit testing framework, written in Expect and Tcl"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
> +SECTION = "devel"
> +PR = "r1"

You don't need the PR any more.

> +
> +inherit autotools
> +
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"

${BP} can be used instead of ${BPN}-${PV}

> +
> +SRC_URI[md5sum] = "053f18fd5d00873de365413cab17a666"
> +SRC_URI[sha256sum] = "d0fbedef20fb0843318d60551023631176b27ceb1e11de7468a971770d0e048d"
> 


-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

