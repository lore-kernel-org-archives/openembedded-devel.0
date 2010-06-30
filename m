Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTrGP-0007Z1-Hu for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 08:59:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTrBp-0003oq-W7 for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 08:54:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 08:54:33 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 08:54:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Jun 2010 08:54:24 +0200
Message-ID: <i0epn0$ke6$1@dough.gmane.org>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
	<1277858599-27400-3-git-send-email-joaohf@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1277858599-27400-3-git-send-email-joaohf@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] replace sdk -> nativesdk
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
X-List-Received-Date: Wed, 30 Jun 2010 06:59:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Martin and I chatted about nativesdk a bit last week and after rereading
the email thread it seems that 'nativesdk' and 'sdk' should coexist for
awhile, so have both in BBCLASSEXTENDS?

regards,

Koen

On 30-06-10 02:43, Joao H. Freitas wrote:
> ---
>  recipes/cmake/cmake.inc      |    2 +-
>  recipes/cmake/cmake_2.8.1.bb |    2 --
>  2 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
> index 5601ddb..e53cd35 100644
> --- a/recipes/cmake/cmake.inc
> +++ b/recipes/cmake/cmake.inc
> @@ -10,7 +10,7 @@ PR = "r3"
>  CMAKE_MAJOR_VERSION = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
>  SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz"
>  
> -BBCLASSEXTEND = "native sdk"
> +BBCLASSEXTEND = "native nativesdk"
>  
>  inherit autotools
>  
> diff --git a/recipes/cmake/cmake_2.8.1.bb b/recipes/cmake/cmake_2.8.1.bb
> index 845ea7c..279495c 100644
> --- a/recipes/cmake/cmake_2.8.1.bb
> +++ b/recipes/cmake/cmake_2.8.1.bb
> @@ -1,7 +1,5 @@
>  require cmake.inc
>  
> -#inherit cmake
> -
>  do_configure_append() {
>  	sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=0,' CMakeCache.txt
>  }

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMKuogMkyGM64RGpERAvN7AKCEvgfnOi0yyFdM4TlIUMRURRCz/QCfe8TF
ZqNPtfxlSkMEMv8DajxRUCk=
=4FWY
-----END PGP SIGNATURE-----



