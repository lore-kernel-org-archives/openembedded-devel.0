Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0541771F23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2015 09:35:53 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1YCmGq-0005fK-PT for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2015 10:35:48 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2015 10:35:48 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jan 2015 10:35:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 18 Jan 2015 10:35:43 +0100
Message-ID: <m9fupf$ln2$1@ger.gmane.org>
References: <1421446794-11403-1-git-send-email-ben.shelton@ni.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
In-Reply-To: <1421446794-11403-1-git-send-email-ben.shelton@ni.com>
Subject: Re: [meta-oe][PATCH] msr-tools: add recipe
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
X-List-Received-Date: Sun, 18 Jan 2015 09:35:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ben Shelton schreef op 16-01-15 om 23:19:
> msr-tools provides the rdmsr and wrmsr tools to read and write Intel 
> model-specific registers on the x86 and x64 architectures.
> 
> Signed-off-by: Ben Shelton <ben.shelton@ni.com> --- 
> meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb | 21
> +++++++++++++++++++++ 1 file changed, 21 insertions(+) create mode 100644
> meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
> 
> diff --git a/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb
> b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb new file mode
> 100644 index 0000000..5544920 --- /dev/null +++
> b/meta-oe/recipes-devtools/msr-tools/msr-tools_1.3.bb @@ -0,0 +1,21 @@ 
> +SUMMARY = "utilies to read and write Intel model-specific registers" 
> +HOMEPAGE = "https://01.org/msr-tools" +LICENSE = "GPLv2" 
> +LIC_FILES_CHKSUM =
> "file://Makefile;beginline=1;endline=11;md5=678a3928c856042424c734f4a7586e65"
>
> 
+SECTION = "devel"
> + +SRC_URI =
> "https://01.org/sites/default/files/downloads/msr-tools/msr-tools-${PV}.zip"
>
> 
+SRC_URI[md5sum] = "67d18527f64fd707c9b7a79f13d19fd5"
> +SRC_URI[sha256sum] =
> "f9457b5340f5f274da4239a461f0db6b514142b40461559d9c6150f05aab1d1e" + +S =
> "${WORKDIR}/msr-tools-master" + +COMPATIBLE_HOST =
> '(i.86|x86_64).*-linux' + +do_install() { +    install -d ${D}/${bindir} 
> +    install rdmsr ${D}/${bindir}/ +    install wrmsr ${D}/${bindir}/

${bindir} already includes the slash, please change the above to
${D}${bindir} and use -m0755 to get the proper permissions. And since this
writes to registers ${sbindir} might be a better place for it.

> +} + +FILES_${PN} += "${bindir}/*"

${bindir} is in FILES by default, please drop this assignment.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUu35vMkyGM64RGpERAtLCAJ94f2vQN8QJHU0V6bhn4+LaIZLR4ACbBLxv
j0iHOMvXRl6w5z1AjSVg3L0=
=V22G
-----END PGP SIGNATURE-----


