Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6snH-0005wN-6v for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 23:58:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6sjk-0004NL-Sc for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 23:54:36 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 23:54:36 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Apr 2010 23:54:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 27 Apr 2010 23:54:26 +0200
Message-ID: <hr7mei$k3q$1@dough.gmane.org>
References: <1272401386.3865.719.camel@trini-m4400>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272401386.3865.719.camel@trini-m4400>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove scsi headers from linux-libc-headers
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
X-List-Received-Date: Tue, 27 Apr 2010 21:58:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I think this needs a PR bump in glibc, otherwise packaged-staging blows
away the headers without replacing them

On 27-04-10 22:49, Tom Rini wrote:
> linux-libc-headers: Go and delete include/scsi when it exists
> 
> With 2.6.31, the kernel started exporting SCSI headers again.  After
> talking with Christoph Hellwig and James Bottemley (scsi maintainer),
> these really should be removed.  A patch to the kernel to do so will be
> happening shortly, but for now fixup the broken recipes we have.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> 
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> index 2e4041f..c2cf5d4 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r3"
> +PR = "r4"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> @@ -44,6 +44,7 @@ do_compile () {
>  do_install() {
>  	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=
> $ARCH
> +	rm -rf ${D}${exec_prefix}/include/scsi
>  }
>  
>  SRC_URI[md5sum] = "84c077a37684e4cbfa67b18154390d8a"
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> index d82a749..b8b109e 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb
> @@ -2,7 +2,7 @@ require linux-libc-headers.inc
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> -PR = "r3"
> +PR = "r4"
>  
>  DEFAULT_PREFERENCE = "-1"
>  
> @@ -44,6 +44,7 @@ do_compile () {
>  do_install() {
>  	set_arch
>  	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=
> $ARCH
> +	rm -rf ${D}${exec_prefix}/include/scsi
>  }
>  
>  SRC_URI[md5sum] = "260551284ac224c3a43c4adac7df4879"
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFL110SMkyGM64RGpERAg2oAJjNEGuVsWkATuhTviqWhb2EiyA9AKCgkZsI
ruc1mGv+sj2uKD6VCc2hIA==
=DZcH
-----END PGP SIGNATURE-----



