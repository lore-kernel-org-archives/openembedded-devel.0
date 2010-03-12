Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nq81F-0000Jc-60 for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 17:47:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nq7yM-0005Da-NR for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 17:44:26 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 17:44:26 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 17:44:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 12 Mar 2010 17:44:09 +0100
Message-ID: <hndr0p$old$1@dough.gmane.org>
References: <1268407797-717-1-git-send-email-valentin.longchamp@epfl.ch>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1268407797-717-1-git-send-email-valentin.longchamp@epfl.ch>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Do not generate NEON code for qt-4.6.2 embedded
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
X-List-Received-Date: Fri, 12 Mar 2010 16:47:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-03-10 16:29, Valentin Longchamp wrote:
> http://bugreports.qt.nokia.com/browse/QTBUG-8749
> Neon code is generated for armv6 processor, where it should be armv7 only.
> This results in illegal instructions with some of the qt4 libraries.
> 
> The current solution is not optimal, I just needed a quick fix for my arch
> and I don't have the needed knowledge in OE to fix it cleanly, but I wanted
> to point this issue out.

Thanks for looking into this, could you please redo this patch with a PR
increase so distributions get the update automatically?

regards,

Koen


> ---
>  recipes/qt4/qt4-embedded_4.6.2.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/qt4/qt4-embedded_4.6.2.bb b/recipes/qt4/qt4-embedded_4.6.2.bb
> index 94ecd01..2d59609 100644
> --- a/recipes/qt4/qt4-embedded_4.6.2.bb
> +++ b/recipes/qt4/qt4-embedded_4.6.2.bb
> @@ -2,5 +2,7 @@ require qt4-embedded.inc
>  
>  PR = "${INC_PR}.0"
>  
> +QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
> +
>  require qt-${PV}.inc
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLmm9ZMkyGM64RGpERAnhkAJ4juTtN1P8CFWLeAjgQ0Mweon/WGQCgrhvN
vxsU6USZPP5CTP6ka7TTXDQ=
=Nf3F
-----END PGP SIGNATURE-----



