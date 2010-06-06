Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OLKpP-0008FH-O7 for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 20:44:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OLKlG-0004NI-Is for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jun 2010 20:39:54 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 20:39:54 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jun 2010 20:39:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 06 Jun 2010 20:39:46 +0200
Message-ID: <hugq1i$olq$1@dough.gmane.org>
References: <alpine.DEB.2.00.1006061411390.3532@lynx>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <alpine.DEB.2.00.1006061411390.3532@lynx>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] matrix-gui, udev: Remove superfluous "patch=1" parameters.
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
X-List-Received-Date: Sun, 06 Jun 2010 18:44:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-06-10 20:13, Robert P. J. Day wrote:
> 
> Any file reference that has a suffix of ".diff" or ".patch" has no
> need of a "patch=1" parameter.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

Acked-by: Koen Kooi <k-kooi@ti.com>

> 
> ---
> 
> diff --git a/recipes/ti/matrix-gui_svn.bb b/recipes/ti/matrix-gui_svn.bb
> index 4388d28..4bfe7c2 100644
> --- a/recipes/ti/matrix-gui_svn.bb
> +++ b/recipes/ti/matrix-gui_svn.bb
> @@ -9,7 +9,7 @@ PV = "1.0"
>  PR = "r14+svnr${SRCPV}"
> 
>  SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
> -    file://0001-Disable-cursor-override-for-X11.patch;patch=1 \
> +    file://0001-Disable-cursor-override-for-X11.patch \
>  	file://init \
>      file://matrix-gui.desktop \
>  "
> diff --git a/recipes/udev/udev_092.bb b/recipes/udev/udev_092.bb
> index 3ed05d1..a3c5521 100644
> --- a/recipes/udev/udev_092.bb
> +++ b/recipes/udev/udev_092.bb
> @@ -9,12 +9,12 @@ LD = "${CC}"
> 
>  PR = "${INC_PR}.0"
> 
> -SRC_URI += "file://noasmlinkage.patch;patch=1 \
> -	    file://flags.patch;patch=1 \
> -	    file://udevsynthesize.patch;patch=1 \
> +SRC_URI += "file://noasmlinkage.patch \
> +	    file://flags.patch \
> +	    file://udevsynthesize.patch \
>  	    file://udevsynthesize.sh \
> -            file://arm_inotify_fix.patch;patch=1 \
> -	    file://mtd-exclude-persistent.patch;patch=1 \
> +            file://arm_inotify_fix.patch \
> +	    file://mtd-exclude-persistent.patch \
>  	    file://mount.blacklist \
>  	   "
> 
> diff --git a/recipes/udev/udev_097.bb b/recipes/udev/udev_097.bb
> index 8757794..84d4b61 100644
> --- a/recipes/udev/udev_097.bb
> +++ b/recipes/udev/udev_097.bb
> @@ -14,8 +14,8 @@ PR = "${INC_PR}.0"
> 
>  LD = "${CC}"
> 
> -SRC_URI += "file://noasmlinkage.patch;patch=1 \
> -	    file://flags.patch;patch=1 \
> +SRC_URI += "file://noasmlinkage.patch \
> +	    file://flags.patch \
>  	    file://mount.blacklist \
>  	   "
> 
> diff --git a/recipes/udev/udev_100.bb b/recipes/udev/udev_100.bb
> index 7261483..a6692cf 100644
> --- a/recipes/udev/udev_100.bb
> +++ b/recipes/udev/udev_100.bb
> @@ -15,9 +15,9 @@ PR = "${INC_PR}.0"
> 
>  LD = "${CC}"
> 
> -SRC_URI += "file://noasmlinkage.patch;patch=1 \
> -	    file://flags.patch;patch=1 \
> -	    file://mtd-exclude-persistent.patch;patch=1 \
> +SRC_URI += "file://noasmlinkage.patch \
> +	    file://flags.patch \
> +	    file://mtd-exclude-persistent.patch \
>  	    file://mount.blacklist \
>  	    file://mount.sh \
>  	   "
> 
> 
> rday
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMC+tyMkyGM64RGpERAlVaAKCC/IHQ8wU9RSKpcJxnH/8Q2CyhOQCfXvWw
y3sJYxjsGZzcwZdzDIIbAeo=
=cONN
-----END PGP SIGNATURE-----



