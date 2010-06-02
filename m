Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJuni-0006qM-Te for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:44:35 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJuja-0003DO-1K for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 22:40:18 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 22:40:18 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 22:40:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 02 Jun 2010 22:40:07 +0200
Message-ID: <hu6fj7$gg4$1@dough.gmane.org>
References: <1275509300-18170-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <1275509300-18170-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4.inc: split font package
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
X-List-Received-Date: Wed, 02 Jun 2010 20:44:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-06-10 22:08, Eric Bénard wrote:
> * Before :
> 4228    KiB /armv5te/qt4-embedded-fonts_4.6.2-r19.1.5_armv5te.ipk
> 
> * After :
> 1058300 armv5te/qt4-embedded-fonts-pfa_4.6.2-r19.1.5_armv5te.ipk
>  293236 armv5te/qt4-embedded-fonts-pfb_4.6.2-r19.1.5_armv5te.ipk
>  649442 armv5te/qt4-embedded-fonts-qpf_4.6.2-r19.1.5_armv5te.ipk
> 1917230 armv5te/qt4-embedded-fonts-ttf-dejavu_4.6.2-r19.1.5_armv5te.ipk
>  344114 armv5te/qt4-embedded-fonts-ttf-vera_4.6.2-r19.1.5_armv5te.ipk

Could you make this patch keep the -fonts packages which will RRECOMMEND
the new ones from compat?

regards,

Koen

> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>
> ---
>  recipes/qt4/qt4.inc |   14 +++++++++++---
>  1 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
> index 5a19f65..eddfc64 100644
> --- a/recipes/qt4/qt4.inc
> +++ b/recipes/qt4/qt4.inc
> @@ -78,7 +78,11 @@ OTHER_PACKAGES = "\
>               ${QT_BASE_NAME}-demos \
>               ${QT_BASE_NAME}-designer \
>               ${QT_BASE_NAME}-examples \
> -             ${QT_BASE_NAME}-fonts \
> +             ${QT_BASE_NAME}-fonts-ttf-vera \
> +             ${QT_BASE_NAME}-fonts-ttf-dejavu \
> +             ${QT_BASE_NAME}-fonts-pfa \
> +             ${QT_BASE_NAME}-fonts-pfb \
> +             ${QT_BASE_NAME}-fonts-qpf \
>               ${QT_BASE_NAME}-linguist \
>               ${QT_BASE_NAME}-makeqpf \
>               ${QT_BASE_NAME}-mkspecs \
> @@ -86,7 +90,7 @@ OTHER_PACKAGES = "\
>               ${QT_BASE_NAME}-qt3to4"
>  
>  PACKAGES += "${LIB_PACKAGES} ${DEV_PACKAGES} ${DBG_PACKAGES} ${OTHER_PACKAGES}"
> -PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-*  ${QT_BASE_NAME}-translation-*"
> +PACKAGES_DYNAMIC = "${QT_BASE_NAME}-plugin-* ${QT_BASE_NAME}-translation-* ${QT_BASE_NAME}-fonts-*"
>  
>  ALLOW_EMPTY_${PN} = "1"
>  FILES_${PN}     = ""
> @@ -109,7 +113,11 @@ FILES_${QT_BASE_NAME}-designer             = "${bindir}/*designer*"
>  FILES_${QT_BASE_NAME}-designer-dbg         = "${bindir}/.debug/*designer*"
>  FILES_${QT_BASE_NAME}-examples             = "${bindir}/${QT_DIR_NAME}/examples/*"
>  FILES_${QT_BASE_NAME}-examples-dbg         = "${bindir}/${QT_DIR_NAME}/examples/.debug ${bindir}/${QT_DIR_NAME}/examples/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/.debug ${bindir}/${QT_DIR_NAME}/examples/*/*/*/*/.debug"
> -FILES_${QT_BASE_NAME}-fonts                = "${libdir}/fonts"
> +FILES_${QT_BASE_NAME}-fonts-ttf-vera       = "${libdir}/fonts/Vera*.ttf"
> +FILES_${QT_BASE_NAME}-fonts-ttf-dejavu     = "${libdir}/fonts/DejaVu*.ttf"
> +FILES_${QT_BASE_NAME}-fonts-pfa            = "${libdir}/fonts/*.pfa"
> +FILES_${QT_BASE_NAME}-fonts-pfb            = "${libdir}/fonts/*.pfb"
> +FILES_${QT_BASE_NAME}-fonts-qpf            = "${libdir}/fonts/*.qpf"
>  FILES_${QT_BASE_NAME}-linguist             = "${bindir}/*linguist* ${bindir}/lrelease ${bindir}/lupdate ${bindir}/lconvert ${bindir}/qm2ts"
>  FILES_${QT_BASE_NAME}-linguist-dbg         = "${bindir}/.debug/*linguist* ${bindir}/.debug/lrelease ${bindir}/.debug/lupdate ${bindir}/.debug/lconvert ${bindir}/.debug/qm2ts"
>  FILES_${QT_BASE_NAME}-pixeltool            = "${bindir}/pixeltool"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMBsGnMkyGM64RGpERAqLRAJ9RQkzA9RlyDBflWpfWI4U3LijgpQCgsuh2
wWlJ02MZesyLt3L4XXgW2/Y=
=KzQt
-----END PGP SIGNATURE-----



