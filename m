Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJhz0-0005FA-MH for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 10:07:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QJhwG-0003bu-I7 for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 10:05:04 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 10:05:04 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 10:05:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 May 2011 10:01:01 +0200
Message-ID: <iqarbt$fvf$3@dough.gmane.org>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
	<1305013151-17485-2-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305013151-17485-2-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 2/2] recipes: drop '+' from LICENSE fields
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
X-List-Received-Date: Tue, 10 May 2011 08:07:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-05-11 09:39, Martin Jansa wrote:
> * '+' is valid folder name, so it does not break distribute_sources like & does,
>   but still tmp/deploy/sources/+ folder doesn't make sense at all
> * PR was bumped only when white-spaces were removed from LICENSE field causing
>   sources to be stored in different folder (classpathx recipes)
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  recipes/classpathx/gnujaf_1.1.1.bb      |    4 ++--
>  recipes/classpathx/gnumail_1.1.2.bb     |    4 ++--
>  recipes/classpathx/inetlib_1.1.1.bb     |    4 ++--
>  recipes/gpe-themes/gpe-theme-e17_0.1.bb |    2 +-
>  recipes/hwdata/hwdata_0.191.bb          |    2 +-
>  recipes/sdr/soft66_git.bb               |    2 +-
>  recipes/tesseract/tesseract_1.0.bb      |    2 +-
>  7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/recipes/classpathx/gnujaf_1.1.1.bb b/recipes/classpathx/gnujaf_1.1.1.bb
> index e0dfd24..94560ea 100644
> --- a/recipes/classpathx/gnujaf_1.1.1.bb
> +++ b/recipes/classpathx/gnujaf_1.1.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Provides a mean to type data and locate components suitable for performing various kinds of action on it."
> -LICENSE = "GPL + library exception"
> +LICENSE = "GPL+libraryexception"
>  AUTHOR = "GNU ClasspathX"
>  
>  SRC_URI = "\
> @@ -12,7 +12,7 @@ inherit autotools java-library
>  
>  S = "${WORKDIR}/activation-${PV}"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  export JAVAC = "javac"
>  
> diff --git a/recipes/classpathx/gnumail_1.1.2.bb b/recipes/classpathx/gnumail_1.1.2.bb
> index 3eab0f6..0c3afd8 100644
> --- a/recipes/classpathx/gnumail_1.1.2.bb
> +++ b/recipes/classpathx/gnumail_1.1.2.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "GNU's free implementation of the JavaMail API specification"
> -LICENSE = "GPL + library exception"
> +LICENSE = "GPL+libraryexception"
>  AUTHOR = "GNU ClasspathX"
>  
>  SRC_URI = "\
> @@ -14,7 +14,7 @@ S = "${WORKDIR}/mail-${PV}"
>  DEPENDS = "fastjar-native gnujaf inetlib"
>  DEPENDS_virtclass-native = "fastjar-native gnujaf-native inetlib-native"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  export JAVAC = "${STAGING_BINDIR_NATIVE}/javac"
>  export JAVA = "${STAGING_BINDIR_NATIVE}/java"
> diff --git a/recipes/classpathx/inetlib_1.1.1.bb b/recipes/classpathx/inetlib_1.1.1.bb
> index 9377d6d..7d8e89d 100644
> --- a/recipes/classpathx/inetlib_1.1.1.bb
> +++ b/recipes/classpathx/inetlib_1.1.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "A Java library of clients for common internet protocols"
> -LICENSE = "GPL + library exception"
> +LICENSE = "GPL+libraryexception"
>  AUTHOR = "GNU Classpath"
>  HOMEPAGE = "http://gnu.org/software/classpath/inetlib.html"
>  
> @@ -12,7 +12,7 @@ inherit java-library autotools
>  
>  DEPENDS = "fastjar-native"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  JPN = "libgnuinet-java"
>  
> diff --git a/recipes/gpe-themes/gpe-theme-e17_0.1.bb b/recipes/gpe-themes/gpe-theme-e17_0.1.bb
> index bf29f9b..9b76007 100644
> --- a/recipes/gpe-themes/gpe-theme-e17_0.1.bb
> +++ b/recipes/gpe-themes/gpe-theme-e17_0.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION =	"GTK+ enlightenment theme adjusted for GPE"
> -LICENSE = 	"MIT + GPL"
> +LICENSE = 	"MIT GPL"
>  PR =		"r1"
>  
>  #it doesn't really depends on it, but it's nice to make OE build it
> diff --git a/recipes/hwdata/hwdata_0.191.bb b/recipes/hwdata/hwdata_0.191.bb
> index 527efdf..e94d997 100644
> --- a/recipes/hwdata/hwdata_0.191.bb
> +++ b/recipes/hwdata/hwdata_0.191.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "This package contains various hardware identification and configuration data, such as the pci.ids database, or the XFree86/xorg Cards database. It's needed for the kudzu hardware detection."
> -LICENSE = "GPL + X11"
> +LICENSE = "GPL X11"
>  
>  PR = "r1"
>  
> diff --git a/recipes/sdr/soft66_git.bb b/recipes/sdr/soft66_git.bb
> index 8955d1e..7aa827f 100644
> --- a/recipes/sdr/soft66_git.bb
> +++ b/recipes/sdr/soft66_git.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Library and tools for Soft66ADD and related SDR radio receivers"
> -LICENSE = "GPLv3 + LGPLv3"
> +LICENSE = "GPLv3 LGPLv3"
>  
>  DEPENDS = "libftdi"
>  
> diff --git a/recipes/tesseract/tesseract_1.0.bb b/recipes/tesseract/tesseract_1.0.bb
> index 762eb95..de20403 100644
> --- a/recipes/tesseract/tesseract_1.0.bb
> +++ b/recipes/tesseract/tesseract_1.0.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "A commercial quality OCR engine "
> -LICENSE = "APL + others"
> +LICENSE = "APL others"
>  
>  DEPENDS = "tiff"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNyPC9MkyGM64RGpERApcpAKCpHvFEqaG50Z9dIMxzHwm6ccY6GQCdEESy
GHutDfOjxispdcit8ypbqDk=
=Uz9S
-----END PGP SIGNATURE-----



