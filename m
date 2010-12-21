Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PUzIj-00012W-Es for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 11:18:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PUzIX-0000qt-Em for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 11:18:25 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 11:18:25 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 11:18:25 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Dec 2010 11:18:07 +0100
Message-ID: <iepusv$t59$1@dough.gmane.org>
References: <1292925966-65237-1-git-send-email-koen@openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1292925966-65237-1-git-send-email-koen@openembedded.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] package ipk bbclass: store build branch and revision in ipkg metadata
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
X-List-Received-Date: Tue, 21 Dec 2010 10:18:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

There is no 2/2, this is the only patch in the series, I had a git
format-patch slip up on my end.

On 21-12-10 11:06, Koen Kooi wrote:
> The ipkg metadata will look like this now:
> 
> koen@dominion:/OE/angstrom-dev/deploy/glibc$ dpkg-deb -I ipk/am3517-evm/matrix-gui_1.3-r19.0.6_am3517-evm.ipk
>  new debian package, version 2.0.
>  size 24112 bytes: control archive= 540 bytes.
>      629 bytes,    13 lines      control
>  Package: matrix-gui
>  Version: 1.3-r19.0.6
>  Description: Matrix GUI for Qt X11
>  Section: multimedia
>  Priority: optional
>  Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
>  License: BSD
>  Architecture: am3517-evm
>  OE: matrix-gui
>  Homepage: https://gforge.ti.com/gf/project/matrix_gui/
>  Build: org.openembedded.dev/f35ab2d
>  Depends: matrix-gui-common, libpng12-0, libfreetype6, libz1, libgthread-2.0-0, libqtwebkit4, libphonon4, libqtdbus4, libqtxml4, libqtgui4, libqtnetwork4, libqtcore4, libglib-2.0-0, libc6, libstdc++6, libgcc1
>  Source: svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd=''
> koen@dominion:/OE/angstrom-dev/deploy/glibc$
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  classes/package_ipk.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/package_ipk.bbclass b/classes/package_ipk.bbclass
> index 5d388da..97e5cd8 100644
> --- a/classes/package_ipk.bbclass
> +++ b/classes/package_ipk.bbclass
> @@ -224,6 +224,7 @@ python do_package_ipk () {
>  		fields.append(["Architecture: %s\n", ['PACKAGE_ARCH']])
>  		fields.append(["OE: %s\n", ['PN']])
>  		fields.append(["Homepage: %s\n", ['HOMEPAGE']])
> +		fields.append(["Build: %s/%s\n", ['METADATA_BRANCH', 'METADATA_REVISION']])
>  
>  		def pullData(l, d):
>  			l2 = []

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNEH7fMkyGM64RGpERAtfoAJ4wwHII7rXn7YG4gCKFSQd1B9SmEACeIg/Y
rhw39nBhCibyooRTxx+zAZM=
=SkML
-----END PGP SIGNATURE-----



