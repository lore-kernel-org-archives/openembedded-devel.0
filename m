Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKCka-0002jI-Ao for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:54:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OKCgT-0001IT-IR for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 17:50:17 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 17:50:17 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 17:50:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 03 Jun 2010 17:50:06 +0200
Message-ID: <hu8ivf$250$1@dough.gmane.org>
References: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <1275578113-17291-1-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: rename qtdemo file
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
X-List-Received-Date: Thu, 03 Jun 2010 15:54:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-06-10 17:15, Chase Maupin wrote:
> * Changed the name of the qtdemo exectable installed
>   in the /usr/bin directory to qtdemoE for Qt
>   embedded builds.  This allows the Qt embedded
>   version of the demos package to co-exist with
>   the Qt X11 version.
> * Changed the demos package file list to accept
>   both qtdemo and qtdemoE.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Koen Kooi <k-kooi@ti.com>



> ---
>  recipes/qt4/qt-4.6.2.inc     |    3 +++
>  recipes/qt4/qt4-embedded.inc |    2 +-
>  recipes/qt4/qt4.inc          |    4 ++--
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/qt4/qt-4.6.2.inc b/recipes/qt4/qt-4.6.2.inc
> index e89cf17..4a9f077 100644
> --- a/recipes/qt4/qt-4.6.2.inc
> +++ b/recipes/qt4/qt-4.6.2.inc
> @@ -57,6 +57,9 @@ do_install_append() {
>  	for i in rcc uic moc ; do
>  		install -m 0755 ${S}/bin/$i ${D}${bindir}/
>  	done
> +
> +	#Append an E to the qtdemo file
> +	mv ${D}${bindir}/qtdemo ${D}${bindir}/qtdemo${QT_LIBINFIX}
>  }
>  
>  LICENSE = "LGPLv2.1 GPLv3"
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index 9aaca6e..436f64c 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -4,7 +4,7 @@ LICENSE = "GPL QPL"
>  PRIORITY = "optional"
>  HOMEPAGE = "http://www.trolltech.com"
>  DEPENDS += "directfb tslib"
> -INC_PR = "r19"
> +INC_PR = "r20"
>  
>  QT_BASE_NAME ?= "qt4-embedded"
>  QT_BASE_LIB  ?= "libqt-embedded"
> diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
> index 5a19f65..e246e17 100644
> --- a/recipes/qt4/qt4.inc
> +++ b/recipes/qt4/qt4.inc
> @@ -103,8 +103,8 @@ FILES_${QT_BASE_NAME}-common               = "${bindir}/qtconfig"
>  FILES_${QT_BASE_NAME}-common-dbg           = "${bindir}/.debug/qtconfig"
>  FILES_${QT_BASE_NAME}-dbus                 = "${bindir}/qdbus ${bindir}/qdbusxml2cpp ${bindir}/qdbuscpp2xml ${bindir}/qdbusviewer"
>  FILES_${QT_BASE_NAME}-dbus-dbg             = "${bindir}/.debug/qdbus ${bindir}/.debug/qdbusxml2cpp ${bindir}/.debug/qdbuscpp2xml ${bindir}/.debug/qdbusviewer"
> -FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo ${bindir}/${QT_DIR_NAME}/demos/*"
> -FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
> +FILES_${QT_BASE_NAME}-demos                = "${bindir}/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/*"
> +FILES_${QT_BASE_NAME}-demos-dbg            = "${bindir}/.debug/qtdemo* ${bindir}/${QT_DIR_NAME}/demos/.debug/*  ${bindir}/${QT_DIR_NAME}/demos/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/.debug  ${bindir}/${QT_DIR_NAME}/demos/*/*/*/.debug"
>  FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
>  FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
>  FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMB88uMkyGM64RGpERAvNNAJ9dxgbS0or8dffW2g3EyQDgy2+YLACeKsUl
aw4UUGIRN8dpTA3Y694MOFY=
=YC+E
-----END PGP SIGNATURE-----



