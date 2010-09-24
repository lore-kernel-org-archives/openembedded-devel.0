Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oz4b6-0003Kr-4u for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:31:09 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oz4az-0003QA-Im for openembedded-devel@lists.openembedded.org;
	Fri, 24 Sep 2010 11:29:33 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:29:33 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Sep 2010 11:29:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 24 Sep 2010 11:29:25 +0200
Message-ID: <i7hr1l$kte$1@dough.gmane.org>
References: <4C9C696B.4050800@dresearch.de>
	<1285320191-22618-1-git-send-email-sledz@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1285320191-22618-1-git-send-email-sledz@dresearch.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libatasmart-0.13: resolve cross compile problem
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
X-List-Received-Date: Fri, 24 Sep 2010 09:32:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-09-10 11:23, Steffen Sledz wrote:
> * This patch solves a cross/native compile problem:
> | ./strpool atasmart.c atasmart.strpool.c
> | ./strpool: ./strpool: cannot execute binary file
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>

Acked-by: Koen Kooi <koen@openembedded.org>


> ---
>  recipes/devicekit/libatasmart-0.13/strpool.patch |   11 +++++++++++
>  recipes/devicekit/libatasmart_0.13.bb            |   12 +++---------
>  2 files changed, 14 insertions(+), 9 deletions(-)
>  create mode 100644 recipes/devicekit/libatasmart-0.13/strpool.patch
> 
> diff --git a/recipes/devicekit/libatasmart-0.13/strpool.patch b/recipes/devicekit/libatasmart-0.13/strpool.patch
> new file mode 100644
> index 0000000..e9f6ab3
> --- /dev/null
> +++ b/recipes/devicekit/libatasmart-0.13/strpool.patch
> @@ -0,0 +1,11 @@
> +--- git/Makefile.am.orig	2010-09-24 11:03:40.917602895 +0200
> ++++ git/Makefile.am	2010-09-24 11:07:04.145852660 +0200
> +@@ -81,5 +81,8 @@
> + BUILT_SOURCES = \
> + 	atasmart.strpool.c
> + 
> ++strpool: $(strpool_SOURCES)
> ++	$(BUILD_CC) -o $@ $?
> ++
> + atasmart.strpool.c: atasmart.c strpool
> + 	$(top_builddir)/strpool $< $@
> diff --git a/recipes/devicekit/libatasmart_0.13.bb b/recipes/devicekit/libatasmart_0.13.bb
> index 992ff3e..4a4986e 100644
> --- a/recipes/devicekit/libatasmart_0.13.bb
> +++ b/recipes/devicekit/libatasmart_0.13.bb
> @@ -2,20 +2,14 @@ DEPENDS = "udev"
>  LICENSE = "LGPL"
>  
>  SRCREV = "a80d7d5c25e88adea7b8e843cdb57143e6cfb46b"
> -SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git"
> +SRC_URI = "git://git.0pointer.de/libatasmart.git;protocol=git \
> +	file://strpool.patch"
>  
>  S = "${WORKDIR}/git"
> -PR = "r1"
> +PR = "r2"
>  
>  inherit autotools lib_package
>  
> -do_compile_prepend() {
> -	rm strpool -f
> -	${BUILD_CC} -o strpool strpool.c
> -	chmod +x strpool
> -}
> -
>  do_install_append() {
>  	sed -i -e s://:/:g -e s:${base_libdir}/libudev.la:-ludev:g ${D}${libdir}/libatasmart.la
>  }
> -

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMnG91MkyGM64RGpERAlY2AJ9wplA9f6GVaujRIBGDCnAoxS55JgCfZ4Aq
9hQELdWnRM7EXaeK4hxcdSI=
=zbi2
-----END PGP SIGNATURE-----



