Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLwMP-0001xv-9z for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:21:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLwLA-00074u-Dn for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:19:44 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 12:19:44 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 12:19:44 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 26 Nov 2010 12:19:29 +0100
Message-ID: <ico541$f8$1@dough.gmane.org>
References: <1290766973-11967-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1290766973-11967-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] add qt4-x11-base and demo images
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
X-List-Received-Date: Fri, 26 Nov 2010 11:21:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Could you please put those in a task so they can be reused in other images?

On 26-11-10 11:22, Eric Bénard wrote:
> these are images integrating qt4-x11-free librarie and its demo
> applications running using Xorg.
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/images/qt4-x11-base-image.bb |   59 ++++++++++++++++++++++++++++++++++
>  recipes/images/qt4-x11-demo-image.bb |    7 ++++
>  2 files changed, 66 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/images/qt4-x11-base-image.bb
>  create mode 100644 recipes/images/qt4-x11-demo-image.bb
> 
> diff --git a/recipes/images/qt4-x11-base-image.bb b/recipes/images/qt4-x11-base-image.bb
> new file mode 100644
> index 0000000..d559c96
> --- /dev/null
> +++ b/recipes/images/qt4-x11-base-image.bb
> @@ -0,0 +1,59 @@
> +require micro-base-image.bb
> +
> +TOUCH = ' ${@base_contains("MACHINE_FEATURES", "touchscreen", "tslib tslib-calibrate tslib-tests", "",d)}'
> +
> +XSERVER ?= "xserver-xorg \
> +           xf86-input-evdev \
> +           xf86-input-tslib \
> +           xf86-video-fbdev "
> +
> +RDEPENDS_append += " \
> +        qt4-x11-free \
> +        "
> +
> +QT_INSTALL = " \
> +        libqt3support4 \
> +        libqtclucene4 \
> +        libqtcore4 \
> +        libqtdbus4 \
> +        libqtgui4 \
> +        libqthelp4 \
> +        libqtmultimedia4 \
> +        libqtnetwork4 \
> +        libqtscript4 \
> +        libqtscripttools4 \
> +        libqtsql4 \
> +        libqtsvg4 \
> +        libqttest4 \
> +        libqtwebkit4 \
> +        libqtxml4 \
> +        libqtxmlpatterns4 \
> +        qt4-fonts \
> +        qt4-plugin-iconengine-svgicon \
> +        qt4-plugin-imageformat-gif \
> +        qt4-plugin-imageformat-ico \
> +        qt4-plugin-imageformat-jpeg \
> +        qt4-plugin-imageformat-mng \
> +        qt4-plugin-imageformat-svg \
> +        qt4-plugin-imageformat-tiff \
> +        qt4-plugin-phonon-backend-gstreamer \
> +        qt4-plugin-script-dbus \
> +        qt4-plugin-sqldriver-sqlite2 \
> +        qt4-plugin-sqldriver-sqlite \
> +"
> +
> +IMAGE_INSTALL += "\
> +	initscripts \
> +	kernel-modules \
> +	gdbserver \
> +	strace \
> +	module-init-tools \
> +	${QT_INSTALL} \
> +	${TOUCH} \
> +	qwt \
> +	pointercal \
> +	${XSERVER} \
> +	ttf-liberation-sans ttf-liberation-serif ttf-liberation-mono \
> +	xauth xhost xset xrandr \
> +"
> +
> diff --git a/recipes/images/qt4-x11-demo-image.bb b/recipes/images/qt4-x11-demo-image.bb
> new file mode 100644
> index 0000000..8d14dc1
> --- /dev/null
> +++ b/recipes/images/qt4-x11-demo-image.bb
> @@ -0,0 +1,7 @@
> +require qt4-x11-base-image.bb
> +
> +IMAGE_INSTALL += "\
> +        qt4-demos qt4-examples qt-demo-init \
> +        qt4-assistant \
> +        qwt-examples \
> +"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM75fBMkyGM64RGpERAtC8AJsGzlOp2CYEyO/RnjX1iOShBpD2OACgiILB
4HT1IOg9RJeJzsxa7tvfRYY=
=AvOj
-----END PGP SIGNATURE-----



