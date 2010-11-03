Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDj59-0005g8-5e for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 20:33:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PDj4G-00047z-9b for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 20:32:20 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 20:32:20 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 20:32:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 03 Nov 2010 20:32:00 +0100
Message-ID: <iasdbg$25j$1@dough.gmane.org>
References: <1288809530-19973-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.14) Gecko/20101002 Shredder/3.0.9pre
In-Reply-To: <1288809530-19973-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] meta-toolchain-qte: fill OE_QMAKE_AR
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
X-List-Received-Date: Wed, 03 Nov 2010 19:33:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-11-10 19:38, Eric Bénard wrote:
> this allows the sdk to be used to compile libraries, else, we get :
> make[1]: cqs : command not found
> 
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
>  recipes/meta/meta-toolchain-qte.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/meta/meta-toolchain-qte.bb b/recipes/meta/meta-toolchain-qte.bb
> index 708803b..058f0d8 100644
> --- a/recipes/meta/meta-toolchain-qte.bb
> +++ b/recipes/meta/meta-toolchain-qte.bb
> @@ -1,5 +1,5 @@
>  # Qt Embedded toolchain
> -PR = "r4"
> +PR = "r5"
>  TOOLCHAIN_HOST_TASK = "task-qte-toolchain-host"
>  TOOLCHAIN_TARGET_TASK = "task-qte-toolchain-target"
>  
> @@ -15,6 +15,7 @@ do_populate_sdk_append() {
>         echo 'export OE_QMAKE_CC=${TARGET_SYS}-gcc' >> $script
>         echo 'export OE_QMAKE_CXX=${TARGET_SYS}-g++' >> $script
>         echo 'export OE_QMAKE_LINK=${TARGET_SYS}-g++' >> $script
> +       echo 'export OE_QMAKE_AR=${TARGET_SYS}-ar' >> $script
>         echo 'export OE_QMAKE_LIBDIR_QT=${SDKPATH}/${TARGET_SYS}/${libdir}' >> $script
>         echo 'export OE_QMAKE_INCDIR_QT=${SDKPATH}/${TARGET_SYS}/${includedir}/${QT_DIR_NAME}' >> $script
>         echo 'export OE_QMAKE_MOC=${SDKPATH}/bin/moc4' >> $script

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM0biwMkyGM64RGpERAom0AJ4sLqGyithRoYrr9tDrh/gNSLoftACgoNwf
NZtFw2dhpo6Pz12Go4EwUBA=
=9+c8
-----END PGP SIGNATURE-----



