Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QQKYP-0007ar-CZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 May 2011 16:31:49 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id A83AC799021; Sat, 28 May 2011 16:28:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.1.37] (p5489BC57.dip.t-dialin.net [84.137.188.87])
	by gravedo.de (Postfix) with ESMTPSA id 8903379901E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2011 16:28:44 +0200 (CEST)
Message-ID: <4DE1069B.2030208@gravedo.de>
Date: Sat, 28 May 2011 16:28:43 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110528080123.GR3222@jama.jama.net>
	<1306570144-17979-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1306570144-17979-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] qt4: remove qte.sh from shared SRC_URI and	PACKAGE_ARCH_palmpre
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
X-List-Received-Date: Sat, 28 May 2011 14:31:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 28.05.2011 10:09, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes/qt4/qt-4.6.3.inc          |    3 ---
>  recipes/qt4/qt-4.7.3.inc          |    3 ---
>  recipes/qt4/qt4-embedded.inc      |    3 ---
>  recipes/qt4/qt4-embedded_4.6.3.bb |    4 ++++
>  recipes/qt4/qt4-embedded_4.7.3.bb |    4 ++++
>  5 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/recipes/qt4/qt-4.6.3.inc b/recipes/qt4/qt-4.6.3.inc
> index a35d57a..36c6a56 100644
> --- a/recipes/qt4/qt-4.6.3.inc
> +++ b/recipes/qt4/qt-4.6.3.inc
> @@ -19,9 +19,6 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.
>             file://linux.conf \
>             "
>  
> -# Set necessary variables in the profile
> -SRC_URI += "file://qte.sh"
> -
>  S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
>  
>  do_configure_prepend() {
> diff --git a/recipes/qt4/qt-4.7.3.inc b/recipes/qt4/qt-4.7.3.inc
> index 2450144..b29d892 100644
> --- a/recipes/qt4/qt-4.7.3.inc
> +++ b/recipes/qt4/qt-4.7.3.inc
> @@ -16,9 +16,6 @@ SRC_URI = "\
>  	file://linux.conf \
>  	"
>  
> -# Set necessary variables in the profile
> -SRC_URI += "file://qte.sh"
> -
>  S = "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
>  
>  FILES_${QT_BASE_NAME}-tools                += "${bindir}/qml"
> diff --git a/recipes/qt4/qt4-embedded.inc b/recipes/qt4/qt4-embedded.inc
> index 147126d..168a867 100644
> --- a/recipes/qt4/qt4-embedded.inc
> +++ b/recipes/qt4/qt4-embedded.inc
> @@ -28,9 +28,6 @@ SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${
>  # Set necessary variables in the profile
>  SRC_URI += "file://qte.sh"
>  
> -# For the palmpre we ship a modified qte.sh
> -PACKAGE_ARCH_palmpre = "${MACHINE_ARCH}"
> -
>  S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
>  
>  QT_CONFIG_FLAGS += " \
> diff --git a/recipes/qt4/qt4-embedded_4.6.3.bb b/recipes/qt4/qt4-embedded_4.6.3.bb
> index fe49fdb..8c883f5 100644
> --- a/recipes/qt4/qt4-embedded_4.6.3.bb
> +++ b/recipes/qt4/qt4-embedded_4.6.3.bb
> @@ -5,3 +5,7 @@ PR = "${INC_PR}.2"
>  QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
>  
>  require qt-${PV}.inc
> +
> +# SRC_URI from qt4-embedded.inc was replaced in .inc above and qte.sh lost
> +# Set necessary variables in the profile
> +SRC_URI += "file://qte.sh"
> diff --git a/recipes/qt4/qt4-embedded_4.7.3.bb b/recipes/qt4/qt4-embedded_4.7.3.bb
> index 7e3d4b8..47176a9 100644
> --- a/recipes/qt4/qt4-embedded_4.7.3.bb
> +++ b/recipes/qt4/qt4-embedded_4.7.3.bb
> @@ -8,6 +8,10 @@ QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
>  
>  require qt-${PV}.inc
>  
> +# SRC_URI from qt4-embedded.inc was replaced in .inc above and qte.sh lost
> +# Set necessary variables in the profile
> +SRC_URI += "file://qte.sh"
> +
>  QT_CONFIG_FLAGS += " \
>   -exceptions \
>  "

Isn't this needing a PR bump? Are we safe that the package is exactly
the same as before?

regards,
Simon


