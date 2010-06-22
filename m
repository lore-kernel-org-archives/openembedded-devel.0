Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR4dW-00030k-0b for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:39:38 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OR4Z6-0008Qk-2h for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 16:35:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 16:35:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 16:35:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 22 Jun 2010 16:30:06 +0200
Message-ID: <hvqhde$hqo$3@dough.gmane.org>
References: <1277215552-10039-1-git-send-email-chase.maupin@ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <1277215552-10039-1-git-send-email-chase.maupin@ti.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/1] matrix-gui-e: add dependency on common files
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
X-List-Received-Date: Tue, 22 Jun 2010 14:39:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-06-10 16:05, Chase Maupin wrote:
> * Added runtime dependency on matrix-gui-common package
>   which contains the runtime scripts that the matrix-gui
>   application requires.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  recipes/ti/matrix-gui-e_svn.bb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/ti/matrix-gui-e_svn.bb b/recipes/ti/matrix-gui-e_svn.bb
> index 78ef003..1cda40f 100644
> --- a/recipes/ti/matrix-gui-e_svn.bb
> +++ b/recipes/ti/matrix-gui-e_svn.bb
> @@ -6,7 +6,7 @@ PRIORITY = "optional"
>  
>  SRCREV = "58"
>  PV = "1.0"
> -PR = "r13+svnr${SRCPV}"
> +PR = "r14+svnr${SRCPV}"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/matrix_gui/;module=trunk;proto=https;user=anonymous;pswd='' \
>  	file://init \
> @@ -28,3 +28,5 @@ do_install() {
>  }
>  
>  RRECOMMENDS_${PN} = "qt4-embedded-plugin-mousedriver-tslib"
> +
> +RDEPENDS_${PN} += "matrix-gui-common"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIMjuMkyGM64RGpERAq/EAJwL/KHuBi76cVsFJjm3TN1xVu0YkQCfWpk+
YLruWehlaDNjVnngatlAWGg=
=2PEK
-----END PGP SIGNATURE-----



