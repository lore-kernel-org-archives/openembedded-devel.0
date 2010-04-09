Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O0L4J-00052Y-18 for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 22:44:48 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O0L10-0002K5-QG for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 22:41:22 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 22:41:22 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Apr 2010 22:41:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 09 Apr 2010 22:41:07 +0200
Message-ID: <hpo3d3$ado$1@dough.gmane.org>
References: <20100409213945.fdbf907b.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100329 Shredder/3.0.5pre
In-Reply-To: <20100409213945.fdbf907b.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libmokoui2 needs pygtk-codegen-2.0
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
X-List-Received-Date: Fri, 09 Apr 2010 20:44:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-04-10 21:39, Antonio Ospite wrote:
> Hi,
> 
> when building libmokoui2 I get this:
> http://tinderbox.openembedded.org/packages/544186/
> 
> basically:
> /bin/sh: pygtk-codegen-2.0: command not found
> 
> With this change to python-pygtk_2.16.0.bb I can make it build:
> 
> diff --git a/recipes/python/python-pygtk_2.16.0.bb b/recipes/python/python-pygtk_2.16.0.bb
> index e2b0602..de570c7 100644
> --- a/recipes/python/python-pygtk_2.16.0.bb
> +++ b/recipes/python/python-pygtk_2.16.0.bb
> @@ -36,7 +36,6 @@ do_configure_prepend() {
>  # dirty fix #1: remove dependency on python-pygobject-dev
>  do_install_append() {
>         find ${D} -name "*.la"|xargs rm -f
> -       rm -f ${D}/${bindir}/pygtk-codegen-2.0
>         rm -rf ${D}/${libdir}/pkgconfig
>  }
> 
> Is this the way to go? Why pygtk-codegen-2.0 is not supplied?

It's part of python-gobject nowadays (and named differently).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLv5DjMkyGM64RGpERAsLlAJsEuyS3Pi8XL9kJ/wBhakzBwpHFowCfTYzt
AOPKZEt90htljLC3kqUSEBI=
=5fkL
-----END PGP SIGNATURE-----



