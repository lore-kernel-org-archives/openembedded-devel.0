Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbT3N-0005bt-52 for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:22:05 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RbSwe-0006ir-CP for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 09:15:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:15:08 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:15:08 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Dec 2011 08:53:53 +0100
Message-ID: <jcetef$4n1$8@dough.gmane.org>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-8-git-send-email-b19537@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1324003173-13994-8-git-send-email-b19537@freescale.com>
X-Enigmail-Version: 1.3.4
Subject: Re: [PATCH meta-oe 8/9] rng-tools: add
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
X-List-Received-Date: Fri, 16 Dec 2011 08:22:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-12-11 03:39, b19537@freescale.com schreef:
> From: Zhenhua Luo <b19537@freescale.com>
> 
> Random number generator daemo.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com> --- 
> meta-oe/recipes-support/rng-tools/files/default  |    2 + 
> meta-oe/recipes-support/rng-tools/files/init     |   49
> ++++++++++++++++++++++ meta-oe/recipes-support/rng-tools/rng-tools_2.bb |
> 28 ++++++++++++ 3 files changed, 79 insertions(+), 0 deletions(-) create
> mode 100644 meta-oe/recipes-support/rng-tools/files/default create mode
> 100755 meta-oe/recipes-support/rng-tools/files/init create mode 100644
> meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> 
> diff --git a/meta-oe/recipes-support/rng-tools/files/default
> b/meta-oe/recipes-support/rng-tools/files/default new file mode 100644 
> index 0000000..ab7cd93 --- /dev/null +++
> b/meta-oe/recipes-support/rng-tools/files/default @@ -0,0 +1,2 @@ +#
> Specify rng device +RNG_DEVICE=/dev/hwrng diff --git
> a/meta-oe/recipes-support/rng-tools/files/init
> b/meta-oe/recipes-support/rng-tools/files/init new file mode 100755 index
> 0000000..5fa5959 --- /dev/null +++
> b/meta-oe/recipes-support/rng-tools/files/init @@ -0,0 +1,49 @@ +#!
> /bin/sh +# +# This is an init script for openembedded +# Copy it to
> /etc/init.d/rng-tools and type +# > update-rc.d rng-tools defaults 60 +# 
> + +rngd=/usr/sbin/rngd +test -x "$rngd" || exit 1 + +if [ -e
> /etc/default/rng-tools ]; then +    . /etc/default/rng-tools +fi + +if [
> -n "$RNG_DEVICE" ]; then +    EXTRA_ARGS="-- -r $RNG_DEVICE" +fi + + 
> +case "$1" in +  start) +    echo -n "Starting random number generator
> daemon" +    start-stop-daemon -S -q -x $rngd $EXTRA_ARGS +    echo "." +
> ;; +  stop) +    echo -n "Stopping random number generator daemon" +
> start-stop-daemon -K -q -n rngd +    echo "." +    ;; +
> reload|force-reload) +    echo -n "Signalling rng daemon restart" +
> start-stop-daemon -K -q -s 1 -x $rngd +    start-stop-daemon -K -q -s 1
> -x $rngd +    ;; +  restart) +    echo -n "Stopping random number
> generator daemon" +    start-stop-daemon -K -q -n rngd +    echo "." +
> echo -n "Starting random number generator daemon" +    start-stop-daemon
> -S -q -x $rngd $EXTRA_ARGS +    echo "." +    ;; +  *) +    echo "Usage:
> /etc/init.d/rng-tools {start|stop|reload|restart|force-reload}" +    exit
> 1 +esac + +exit 0 \ No newline at end of file diff --git
> a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
> b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb new file mode 100644 
> index 0000000..fc6c8ab --- /dev/null +++
> b/meta-oe/recipes-support/rng-tools/rng-tools_2.bb @@ -0,0 +1,28 @@ 
> +DESCRIPTION = "Random number generator daemon" +LICENSE = "GPL"

not a valid license

> +DEPENDS_append_libc-uclibc = " argp-standalone" +PR = "r4"

drop

> + +LIC_FILES_CHKSUM =
> "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

move next to LICENSE

> + +SRC_URI =
> "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \ +
> file://init \ +           file://default" + +inherit autotools
> update-rc.d + +INITSCRIPT_NAME = "rng-tools" +INITSCRIPT_PARAMS =
> "defaults"

move below do_install

> + +do_install_append() { +        install -d "${D}${sysconfdir}/init.d" +
> install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools +
> sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir},' \ +
> ${D}${sysconfdir}/init.d/rng-tools + +        install -d
> "${D}${sysconfdir}/default" +        install -m 0644 ${WORKDIR}/default
> ${D}${sysconfdir}/default +} + +SRC_URI[md5sum] =
> "63d503191eabed630324c104cc024475" +SRC_URI[sha256sum] =
> "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25ec2b1e"

move next to SRC_URI

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7q+REACgkQMkyGM64RGpEleQCeLpiC3BmucY+EXjYuN9DrG/Ed
C8IAnA1qpgRM9BKaHkTyv0kD1XQHB8o0
=thLO
-----END PGP SIGNATURE-----



