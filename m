Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PI5h5-000795-9k for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 21:30:44 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PI5g4-00052E-NL for openembedded-devel@lists.openembedded.org;
	Mon, 15 Nov 2010 21:29:24 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 21:29:24 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Nov 2010 21:29:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Nov 2010 21:29:11 +0100
Message-ID: <ibs56n$omv$1@dough.gmane.org>
References: <1289845240-30057-1-git-send-email-dvorkin@tibbo.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1289845240-30057-1-git-send-email-dvorkin@tibbo.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] shorewall: updated to 4.2-shell and 4.4-perl versions
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
X-List-Received-Date: Mon, 15 Nov 2010 20:31:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

It seems this needs shorewall on your buildhost:

NOTE: Task failed: ('function do_compile failed',
'/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/shorewall-4.4.14-r0.0/temp/log.do_compile.5682')
ERROR: Logfile of failure stored in:
/OE/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/shorewall-4.4.14-r0.0/temp/log.do_compile.5682
Log data follows:
| NOTE: make -j4 -e MAKEFLAGS=
| make: /sbin/shorewall: Command not found
| make: /sbin/shorewall: Command not found
| make: *** No rule to make target `/etc/shorewall/*', needed by
`/firewall'.  Stop.


On 15-11-10 19:20, Dvorkin Dmitry wrote:
> 
> Signed-off-by: Dvorkin Dmitry <dvorkin@tibbo.com>
> ---
>  recipes/shorewall/shorewall-deps.inc        |   20 ++++++++++++++++++++
>  recipes/shorewall/shorewall-shell_4.2.11.bb |   12 ++++++++++++
>  recipes/shorewall/shorewall.inc             |   19 +++++++++++++++++++
>  recipes/shorewall/shorewall_4.4.14.bb       |   12 ++++++++++++
>  4 files changed, 63 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/shorewall/shorewall-deps.inc
>  create mode 100644 recipes/shorewall/shorewall-shell_4.2.11.bb
>  create mode 100644 recipes/shorewall/shorewall.inc
>  create mode 100644 recipes/shorewall/shorewall_4.4.14.bb
> 
> diff --git a/recipes/shorewall/shorewall-deps.inc b/recipes/shorewall/shorewall-deps.inc
> new file mode 100644
> index 0000000..5ad98f0
> --- /dev/null
> +++ b/recipes/shorewall/shorewall-deps.inc
> @@ -0,0 +1,20 @@
> +
> +# version 4.4.x requires perl + some perl modules
> +RDEPENDS_${PN} += "\
> +    perl \
> +    perl-module-lib \
> +    perl-module-autouse \
> +    perl-module-cwd \
> +    perl-module-file-basename \
> +    perl-module-file-temp \
> +    perl-module-getopt-long \
> +    perl-module-carp \
> +    perl-module-findbin \
> +    perl-module-file-spec-unix \
> +    perl-module-scalar-util \
> +    perl-module-io \
> +    perl-module-io-handle \
> +    perl-module-exporter-heavy \
> +    perl-module-list-util \
> +    perl-module-socket \
> +"
> diff --git a/recipes/shorewall/shorewall-shell_4.2.11.bb b/recipes/shorewall/shorewall-shell_4.2.11.bb
> new file mode 100644
> index 0000000..d451bcb
> --- /dev/null
> +++ b/recipes/shorewall/shorewall-shell_4.2.11.bb
> @@ -0,0 +1,12 @@
> +require shorewall.inc
> +
> +PR = "${INC_PR}.0"
> +
> +# this version (4.2, legacy!) require only shell as parser
> +
> +SRC_URI = " \
> +    http://www.shorewall.net/pub/shorewall/4.2/shorewall-${PV}/${PN}-${PV}.tar.bz2 \
> +    "
> +
> +SRC_URI[md5sum] = "518a7f389a6f606c109acb7dfbe18372"
> +SRC_URI[sha256sum] = "c85c8400015794b8fb191e519a0b8711028c865ca2b7e85099c7be26fe479e02"
> diff --git a/recipes/shorewall/shorewall.inc b/recipes/shorewall/shorewall.inc
> new file mode 100644
> index 0000000..4eab2e5
> --- /dev/null
> +++ b/recipes/shorewall/shorewall.inc
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "Shorewall is a high-level tool for configuring Netfilter."
> +HOMEPAGE = "http://www.shorewall.net/"
> +LICENSE = "GPLv2"
> +SECTION = "network"
> +PRIORITY = "optional"
> +
> +INC_PR = "r0"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +RDEPENDS_${PN} += "iptables"
> +RRECOMMENDS_${PN} = "kernel-module-ip-tables kernel-module-ip-conntrack kernel-module-ipt-conntrack kernel-module-ipt-multiport kernel-module-ipt-log kernel-module-ipt-mac kernel-module-ipt-mark kernel-module-ipt-masquerade kernel-module-ipt-pkttype kernel-module-ipt-reject kernel-module-ipt-state kernel-module-ipt-tos kernel-module-iptable-filter kernel-module-iptable-mangle kernel-module-iptable-nat"
> +
> +do_install() {
> +	export PREFIX=${D}
> +	${WORKDIR}/${PN}-${PV}/install.sh
> +}
> +
> +FILES_${PN} += "${datadir}/shorewall/*"
> diff --git a/recipes/shorewall/shorewall_4.4.14.bb b/recipes/shorewall/shorewall_4.4.14.bb
> new file mode 100644
> index 0000000..6e3e418
> --- /dev/null
> +++ b/recipes/shorewall/shorewall_4.4.14.bb
> @@ -0,0 +1,12 @@
> +require shorewall.inc
> +# this version (4.4) requires some deps (perl)
> +require shorewall-deps.inc
> +
> +PR = "${INC_PR}.0"
> +
> +SRC_URI = " \
> +    http://www.shorewall.net/pub/shorewall/4.4/shorewall-${PV}/${PN}-${PV}.tar.bz2 \
> +    "
> +
> +SRC_URI[md5sum] = "9f8705d69d42eb949e352af72c3af8bb"
> +SRC_URI[sha256sum] = "af097fc18c0d5a3b562812814107b627bfd3d802e3b5fe45fec4e53a4e84f17c"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM4ZgXMkyGM64RGpERAkV2AKCvJvLjUMIC2ZQtziJqO4aY3SSQ1QCfQYqC
tclhKTAWokATwSWCgnCmX70=
=tEvl
-----END PGP SIGNATURE-----



