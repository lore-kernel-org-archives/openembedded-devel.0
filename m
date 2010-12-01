Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PNpp7-0005iI-9f for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 17:46:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PNpnl-0001cw-Hh for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 17:45:05 +0100
Received: from adsl-76-205-222-173.dsl.snlo01.sbcglobal.net ([76.205.222.173])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 17:45:05 +0100
Received: from harvey.tim by adsl-76-205-222-173.dsl.snlo01.sbcglobal.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 17:45:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Tim Harvey <harvey.tim@gmail.com>
Date: Wed, 01 Dec 2010 08:43:22 -0800
Message-ID: <id5tvi$2qn$2@dough.gmane.org>
References: <4CF498B4.4070206@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-76-205-222-173.dsl.snlo01.sbcglobal.net
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
In-Reply-To: <4CF498B4.4070206@gmail.com>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: 0@lo.gmane.org
Subject: Re: [PATCH] openjade_1.3.2.bb: Install catalog with the correct path.
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
X-List-Received-Date: Wed, 01 Dec 2010 16:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2010 10:24 PM, Graham Gower wrote:
> Openjade was doing the following:
> install-catalog: addition of /mnt/oe/tmp/work/x86_64-linux/openjade-native-1.3.2-r4/image/mnt/oe/tmp/sysroots/x86_64-linux/share/sgml/openjade-1.3.2/catalog in /mnt/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat
>
> Which was causing lengthy errors like this one:
> http://tinderbox.openembedded.org/packages/1149296/
>
> Now I get:
> install-catalog: addition of /mnt/oe/tmp/sysroots/x86_64-linux/share/sgml/openjade-1.3.2/catalog in /mnt/oe/tmp/sysroots/x86_64-linux/etc/sgml/openjade-1.3.2.cat
>
> Signed-off-by: Graham Gower<graham.gower@gmail.com>
> ---
>   recipes/openjade/openjade_1.3.2.bb |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/openjade/openjade_1.3.2.bb b/recipes/openjade/openjade_1.3.2.bb
> index a84e899..6c69173 100644
> --- a/recipes/openjade/openjade_1.3.2.bb
> +++ b/recipes/openjade/openjade_1.3.2.bb
> @@ -5,7 +5,7 @@ DESCRIPTION = "OpenJade is a suite of tools for validating, \
>   processing, and applying DSSSL (Document Style Semantics and \
>   Specification Language) stylesheets to SGML and XML documents."
>   LICENSE = "BSD"
> -PR = "r4"
> +PR = "r5"
>   SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
>   	   file://configure.patch \
>   	   file://autoconf.patch \
> @@ -42,8 +42,11 @@ do_install_append () {
>          install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
>          install -m 644 dsssl/*.{dtd,dsl,sgm} ${D}${datadir}/sgml/openjade-${PV}
>
> +       # The catalog must live in the sysroot and it must be there for
> +       # install-catalog to do its thing.
> +       install -m 644 dsssl/catalog ${datadir}/sgml/openjade-${PV}
>          install-catalog --add ${sysconfdir}/sgml/openjade-${PV}.cat \
> -           ${D}${datadir}/sgml/openjade-${PV}/catalog
> +           ${datadir}/sgml/openjade-${PV}/catalog
>
>          install-catalog --add ${sysconfdir}/sgml/sgml-docbook.cat \
>              ${sysconfdir}/sgml/openjade-${PV}.cat

Acked-by: Tim Harvey <harvey.tim@gmail.com>

Thanks - I've been running into this for quite some time now with 
parallel builds and haven't been able to figure out what wasn't being 
staged properly.

This needs to get into release-2010.12 if someone can cherry-pick it.

Tim



