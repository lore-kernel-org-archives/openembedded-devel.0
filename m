Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KeDz3-0007us-8k
	for openembedded-devel@openembedded.org; Fri, 12 Sep 2008 21:07:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KeDwJ-0001uh-VY
	for openembedded-devel@openembedded.org; Fri, 12 Sep 2008 19:04:19 +0000
Received: from ipgw-nl.telfort.nl ([212.41.157.237])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 12 Sep 2008 19:04:19 +0000
Received: from k.kooi by ipgw-nl.telfort.nl with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 12 Sep 2008 19:04:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 12 Sep 2008 21:04:07 +0200
Message-ID: <gaeef7$cvi$1@ger.gmane.org>
References: <20080912160657.GE29676@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ipgw-nl.telfort.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080901030016 Shredder/3.0b1pre
In-Reply-To: <20080912160657.GE29676@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Sep 2008 19:07:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> [ This is all also available at
> http://bugs.openembedded.net/show_bug.cgi?id=4549 ]
>
> A number of xorg dev packages (both literally -dev and util-macros) are
> uninstallable on the target.  The problem is that by default (with ipk)
> any given -dev package will depend on the main package, for example
> xproto-dev depends on xproto.  But in these packages case, there is no
> main package (no xproto).  The following patch fixes the issue.

No, it doesn't, your patch actually *breaks* the depends chaining, the 
real fix would be to do ALLOW_EMPTY_${PN} = "1" in the recipes.

regards,

Koen

>
> This is important in the case of SDK users.
>
> #
> # old_revision [e5b917e5de77a3e1e649867986fdd33f141c7bd3]
> #
> # patch "packages/xorg-lib/xtrans_1.0.3.bb"
> #  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
> #    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
> #
> # patch "packages/xorg-lib/xtrans_1.0.4.bb"
> #  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
> #    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
> #
> # patch "packages/xorg-lib/xtrans_1.1.bb"
> #  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
> #    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
> #
> # patch "packages/xorg-lib/xtrans_1.2.bb"
> #  from [5adfa3a5c753b71a9a61e266569ccbd26e940b09]
> #    to [6d46e0050d376534a486d2d6bbf3316fc0eea221]
> #
> # patch "packages/xorg-proto/xorg-proto-common.inc"
> #  from [2f88e96e17c9a539cf5bf9383cad1500375eae86]
> #    to [5c6754f960805e8352b7d28a498e98a4fb1a46be]
> #
> # patch "packages/xorg-util/util-macros_1.1.5.bb"
> #  from [e4dba9f37b257cea60724c9fd34b82e27e27e349]
> #    to [f33bcbd1e083dce6f243c7a9ca7b908c33868ad8]
> #
> # patch "packages/xorg-util/util-macros_1.1.6.bb"
> #  from [9dd3c08d7715e6e845ab141fd67cbb4e3a962977]
> #    to [0d3b638b2967a60b38c2603dad643c7325d70ae2]
> #
> ============================================================
> --- packages/xorg-lib/xtrans_1.0.3.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
> +++ packages/xorg-lib/xtrans_1.0.3.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
> @@ -1,5 +1,7 @@ require xorg-lib-common.inc
>   require xorg-lib-common.inc
>
> +RDEPENDS_${PN}-dev = ""
> +
>   DESCRIPTION = "network API translation layer to insulate X applications and \
>   libraries from OS network vageries."
>   PE = "1"
> ============================================================
> --- packages/xorg-lib/xtrans_1.0.4.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
> +++ packages/xorg-lib/xtrans_1.0.4.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
> @@ -1,5 +1,7 @@ require xorg-lib-common.inc
>   require xorg-lib-common.inc
>
> +RDEPENDS_${PN}-dev = ""
> +
>   DESCRIPTION = "network API translation layer to insulate X applications and \
>   libraries from OS network vageries."
>   PE = "1"
> ============================================================
> --- packages/xorg-lib/xtrans_1.1.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
> +++ packages/xorg-lib/xtrans_1.1.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
> @@ -1,5 +1,7 @@ require xorg-lib-common.inc
>   require xorg-lib-common.inc
>
> +RDEPENDS_${PN}-dev = ""
> +
>   DESCRIPTION = "network API translation layer to insulate X applications and \
>   libraries from OS network vageries."
>   PE = "1"
> ============================================================
> --- packages/xorg-lib/xtrans_1.2.bb	5adfa3a5c753b71a9a61e266569ccbd26e940b09
> +++ packages/xorg-lib/xtrans_1.2.bb	6d46e0050d376534a486d2d6bbf3316fc0eea221
> @@ -1,5 +1,7 @@ require xorg-lib-common.inc
>   require xorg-lib-common.inc
>
> +RDEPENDS_${PN}-dev = ""
> +
>   DESCRIPTION = "network API translation layer to insulate X applications and \
>   libraries from OS network vageries."
>   PE = "1"
> ============================================================
> --- packages/xorg-proto/xorg-proto-common.inc	2f88e96e17c9a539cf5bf9383cad1500375eae86
> +++ packages/xorg-proto/xorg-proto-common.inc	5c6754f960805e8352b7d28a498e98a4fb1a46be
> @@ -1,9 +1,10 @@ XORG_PN = "${PN}"
>   DESCRIPTION = "X protocol headers: ${XORG_PN}"
>   HOMEPAGE = "http://www.x.org"
>   SECTION = "x11/libs"
>   LICENSE = "MIT-X"
>
>   XORG_PN = "${PN}"
> +RDEPENDS_${PN}-dev = ""
>
>   SRC_URI = "${XORG_MIRROR}/individual/proto/${XORG_PN}-${PV}.tar.bz2"
>
> ============================================================
> --- packages/xorg-util/util-macros_1.1.5.bb	e4dba9f37b257cea60724c9fd34b82e27e27e349
> +++ packages/xorg-util/util-macros_1.1.5.bb	f33bcbd1e083dce6f243c7a9ca7b908c33868ad8
> @@ -1,5 +1,7 @@ require xorg-util-common.inc
>   require xorg-util-common.inc
>
> +RDEPENDS_${PN}-dev = ""
> +
>   DESCRIPTION = "X autotools macros"
>   PR = "r1"
>   PE = "1"
> ============================================================
> --- packages/xorg-util/util-macros_1.1.6.bb	9dd3c08d7715e6e845ab141fd67cbb4e3a962977
> +++ packages/xorg-util/util-macros_1.1.6.bb	0d3b638b2967a60b38c2603dad643c7325d70ae2
> @@ -1,4 +1,6 @@ require xorg-util-common.inc
>   require xorg-util-common.inc
>
> +RDEPENDS_${PN}-dev = ""
> +
>   DESCRIPTION = "X autotools macros"
>   PE = "1"
>




