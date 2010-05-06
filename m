Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9uuh-0001bV-2p for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:50:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9ur1-0004eS-Ur for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 08:46:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 08:46:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 May 2010 08:46:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 May 2010 08:46:32 +0200
Message-ID: <hrtok8$hr7$1@dough.gmane.org>
References: <1273127630-25388-1-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <1273127630-25388-1-git-send-email-denis@denix.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC, PATCH] qt4-embedded: change the default decoration (window title) styling
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
X-List-Received-Date: Thu, 06 May 2010 06:50:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-05-10 08:33, Denys Dmytriyenko wrote:
> Built all the decoration styles in, otherwsie there is no window title
> in QWS applications...

Acked-by: Koen Kooi <koen@openembedded.org>

Should we file this as bug with the Trolltech? Strace shows it's not
even attempting to open any decoration plugins when passed -decoration
<foo>.

regards,

Koen


> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/qt4/qt4-embedded.inc |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index 7e0be6e..3d78c7a 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
>  PRIORITY = "optional"
>  HOMEPAGE = "http://www.trolltech.com"
>  DEPENDS += "directfb tslib"
> -INC_PR = "r18"
> +INC_PR = "r19"
>  
>  QT_BASE_NAME ?= "qt4-embedded"
>  QT_BASE_LIB  ?= "libqt-embedded"
> @@ -28,7 +28,6 @@ S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
>  
>  QT_CONFIG_FLAGS += " \
>      -qtlibinfix ${QT_LIBINFIX} \
> -    -qt-decoration-styled -plugin-decoration-default -plugin-decoration-windows \
>      -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
>      -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb \
>      -qt-kbd-tty \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4mXIMkyGM64RGpERAlzdAKCIHn17o2J+tmzqHjGZJ1IkmATatACdEjkK
oG1sLuD9tZlYJhB94oLKXK8=
=qCXj
-----END PGP SIGNATURE-----



