Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Shveh-000219-5S
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 06:39:35 +0200
Received: by dalh21 with SMTP id h21so1727971dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 21:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=ueXujmyFjY4kTZhiv19Edbto9rYPUou6zFqpf6Jhmt4=;
	b=Son5NFXDc00n5bYxNpMZ5B8JwAZ8cGT1RQWcgVcYJu/tNVGOyROc7x2UQ2eoveQ8eG
	bvpJrircj/NjxUk/fWinuKR68F4T8GbHF+GHAYTzTuMg4t0i0H/FYplhDzXVQ7xcmwh7
	Ri4wjGx6A6soq0yOcqaR9UD/ltNS5w7WdSXfrjfX9uqE207548f4YdA8IycIOzy9CVBd
	2HWsUhUH2Lf/6kpr2TMoSousdNOWXO1SleuX9qONZ7qXQp+ryfAzonl3rdCIstEwNFPJ
	nMuyJpb/qjisvHHfG82arTSe8rfavYDNvXkwDJP6pQwUNVAbLHOVUXKJRp6qsUBC651B
	qixw==
Received: by 10.68.231.40 with SMTP id td8mr5319993pbc.150.1340339327640;
	Thu, 21 Jun 2012 21:28:47 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id og4sm37711569pbb.48.2012.06.21.21.28.46
	(version=SSLv3 cipher=OTHER); Thu, 21 Jun 2012 21:28:46 -0700 (PDT)
Message-ID: <4FE3F482.50506@gmail.com>
Date: Thu, 21 Jun 2012 21:28:50 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
In-Reply-To: <1340338450-23907-1-git-send-email-elvis.dowson@gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-openembedded] python_numpy: Fix SRC_URI warnings.
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
X-List-Received-Date: Fri, 22 Jun 2012 04:39:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/21/2012 9:14 PM, Elvis Dowson wrote:
> This commit fixes the following warnings: WARNING: Unable to get
> checksum for python-numpy SRC_URI entry config.h: file could not be
> found WARNING: Unable to get checksum for python-numpy SRC_URI
> entry numpyconfig.h: file could not be found
> 
> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com> --- 
> .../recipes-devtools/python/python-numpy_1.4.1.bb  |   12
> +++++++++--- 1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
> b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb index
> a67bf8b..bdcdf91 100644 ---
> a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb +++
> b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb @@ -2,11
> +2,17 @@ DESCRIPTION = "A sophisticated Numeric Processing Package
> for Python" SECTION = "devel/python" LICENSE = "PSF" 
> LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=3c42211d73c3faa1026e671dd39883fa" -PR =
> "r3" +PR = "r4"
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \ -
> file://config.h \ -	   file://numpyconfig.h \ +	  " +SRC_URI_arm +=
> " \ +           file://arm/config.h \ +
> file://arm/numpyconfig.h \ +	  " +SRC_URI_mipsel += " \ +
> file://mipsel/config.h \ +           file://mipsel/numpyconfig.h \ 
> "
> 

Did you test it on arm/mipsel and made sure that SRC_URI is correct
after this change ?

> S = "${WORKDIR}/numpy-${PV}"
> 


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/j9IIACgkQuwUzVZGdMxRdNwCfRMpvWZtDIwMi4EkqZVhN9YbW
WPwAn3VFiygw3k119AqPDm7gxm8UVIl2
=NYbZ
-----END PGP SIGNATURE-----


