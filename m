Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTrLi-0008J1-Jv for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 09:04:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OTrH9-00066N-TG for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 09:00:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 09:00:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 09:00:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 30 Jun 2010 08:55:27 +0200
Message-ID: <i0epov$ke6$2@dough.gmane.org>
References: <1277858599-27400-1-git-send-email-joaohf@gmail.com>
	<1277858599-27400-2-git-send-email-joaohf@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <1277858599-27400-2-git-send-email-joaohf@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] add cmake 2.8.1recipes/cmake/cmake-native_2.8.1.bb
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
X-List-Received-Date: Wed, 30 Jun 2010 07:04:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Does 'bitbake cmake' work with this version?

On 30-06-10 02:43, Joao H. Freitas wrote:
> ---
>  recipes/cmake/cmake-sdk_2.8.1.bb |    5 -----
>  recipes/cmake/cmake.inc          |    2 ++
>  recipes/cmake/cmake_2.8.1.bb     |   11 +++++++++++
>  3 files changed, 13 insertions(+), 5 deletions(-)
>  delete mode 100644 recipes/cmake/cmake-sdk_2.8.1.bb
>  create mode 100644 recipes/cmake/cmake_2.8.1.bb
> 
> diff --git a/recipes/cmake/cmake-sdk_2.8.1.bb b/recipes/cmake/cmake-sdk_2.8.1.bb
> deleted file mode 100644
> index 86356f7..0000000
> --- a/recipes/cmake/cmake-sdk_2.8.1.bb
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -inherit sdk
> -require cmake.inc
> -
> -SRC_URI[md5sum] = "feadc2e5ebbfed0efc90178583503725"
> -SRC_URI[sha256sum] = "7eae74ab7673974a68e395c211854d318f0af2d320590a670339ee8ee9422242"
> diff --git a/recipes/cmake/cmake.inc b/recipes/cmake/cmake.inc
> index 631d846..5601ddb 100644
> --- a/recipes/cmake/cmake.inc
> +++ b/recipes/cmake/cmake.inc
> @@ -10,6 +10,8 @@ PR = "r3"
>  CMAKE_MAJOR_VERSION = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
>  SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz"
>  
> +BBCLASSEXTEND = "native sdk"
> +
>  inherit autotools
>  
>  S = "${WORKDIR}/cmake-${PV}"
> diff --git a/recipes/cmake/cmake_2.8.1.bb b/recipes/cmake/cmake_2.8.1.bb
> new file mode 100644
> index 0000000..845ea7c
> --- /dev/null
> +++ b/recipes/cmake/cmake_2.8.1.bb
> @@ -0,0 +1,11 @@
> +require cmake.inc
> +
> +#inherit cmake
> +
> +do_configure_append() {
> +	sed -i -e 's,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=1,HAVE_GLIBC_STRERROR_R__TRYRUN_OUTPUT-ADVANCED:INTERNAL=0,' CMakeCache.txt
> +}
> +
> +
> +SRC_URI[md5sum] = "feadc2e5ebbfed0efc90178583503725"
> +SRC_URI[sha256sum] = "7eae74ab7673974a68e395c211854d318f0af2d320590a670339ee8ee9422242"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFMKupfMkyGM64RGpERAoW2AJih+hEVyZFaQ0aPs9UYbrxarQ6HAJ9tr/Jl
QtcrDrBnCAUlWTMJJVGpJw==
=SRkX
-----END PGP SIGNATURE-----



