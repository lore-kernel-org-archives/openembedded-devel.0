Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLeQ0-0006Ca-SU for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 17:11:33 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PLeOe-0001KC-JA for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 17:10:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 17:10:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 17:10:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Nov 2010 17:09:49 +0100
Message-ID: <icm1od$i70$1@dough.gmane.org>
References: <AANLkTi=tM7VYvnfq7+1RHy0mMtvgvxE+Ksc37t4D5vuJ@mail.gmail.com>
	<1290700469-3396-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1290700469-3396-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4x11: set QT_LIBINFIX and QT_DIR_NAME
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
X-List-Received-Date: Thu, 25 Nov 2010 16:11:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-11-10 16:54, Eric Bénard wrote:
> this will fix the following issue with qwt 5.2.1 where obj dir is:
> work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj${QT_LIBINFIX}/
> instead of :
> work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.2.1/src/obj/
> 
> From: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  classes/qt4x11.bbclass |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/qt4x11.bbclass b/classes/qt4x11.bbclass
> index 2d56b7e..abb1d9d 100644
> --- a/classes/qt4x11.bbclass
> +++ b/classes/qt4x11.bbclass
> @@ -2,5 +2,8 @@ DEPENDS_prepend = "${@["qt4-x11-free ", ""][(bb.data.getVar('PN', d, 1)[:12] ==
>  
>  inherit qmake2
>  
> +QT_DIR_NAME = "qt4"
> +QT_LIBINFIX = ""
> +
>  # Qt4 uses atomic instructions not supported in thumb mode
>  ARM_INSTRUCTION_SET = "arm"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM7opNMkyGM64RGpERAqO2AJ9nyr/drAT7t6LPEG1A+QyhVnWEhACgi29X
l9NpDotshYsD4jtyeSSNT8s=
=3G1E
-----END PGP SIGNATURE-----



