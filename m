Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PEjF2-0005Lr-HG
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 14:55:37 +0100
Received: from p5b036781.dip.t-dialin.net ([91.3.103.129] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PEjEA-0004c7-6p by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 14:54:44 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PEjE8-0000Aw-WF
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 14:54:41 +0100
Date: Sat, 6 Nov 2010 14:54:40 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101106135440.GD6691@excalibur.local>
References: <1258996635-20162-1-git-send-email-ricardo.salveti@openbossa.org>
	<1258996635-20162-2-git-send-email-ricardo.salveti@openbossa.org>
MIME-Version: 1.0
In-Reply-To: <1258996635-20162-2-git-send-email-ricardo.salveti@openbossa.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] libxml, rpm, zope: avoid generating native packages
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
X-List-Received-Date: Sat, 06 Nov 2010 13:55:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2009-11-23 at 14:17, Ricardo Salveti de Araujo wrote:
> Signed-off-by: Ricardo Salveti de Araujo <ricardo.salveti@openbossa.org>
> ---
>  recipes/libxml/libxml2-native.inc |    2 +-
>  recipes/rpm/rpm-native_4.4.2.3.bb |    5 ++---
>  recipes/zope/zope-native_3.3.1.bb |    2 +-
>  3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-native.inc
> index 3f67152..395a3a9 100644
> --- a/recipes/libxml/libxml2-native.inc
> +++ b/recipes/libxml/libxml2-native.inc
> @@ -5,7 +5,7 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libxml2-${PV}"
>  SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz"
>  S = "${WORKDIR}/libxml2-${PV}"
>  
> -inherit autotools native pkgconfig distutils-native-base
> +inherit autotools pkgconfig distutils-native-base native
>  
>  do_configure_prepend () {
>  	EXTRA_LIBXML2_OECONF="\
> diff --git a/recipes/rpm/rpm-native_4.4.2.3.bb b/recipes/rpm/rpm-native_4.4.2.3.bb
> index 3cfb43e..d27a392 100644
> --- a/recipes/rpm/rpm-native_4.4.2.3.bb
> +++ b/recipes/rpm/rpm-native_4.4.2.3.bb
> @@ -1,8 +1,7 @@
> -inherit native distutils-native-base
> -
>  require rpm-${PV}.inc
>  
> +inherit distutils-native-base native
> +
>  DEPENDS = "beecrypt-native gettext-native zlib-native file-native popt-native python-native"
> -PACKAGES = ""
>  
>  export varprefix = "${localstatedir}"
> diff --git a/recipes/zope/zope-native_3.3.1.bb b/recipes/zope/zope-native_3.3.1.bb
> index cb0d690..a1c5eac 100644
> --- a/recipes/zope/zope-native_3.3.1.bb
> +++ b/recipes/zope/zope-native_3.3.1.bb
> @@ -1,4 +1,4 @@
> -inherit native distutils-native-base
> +inherit distutils-native-base native

So, you are sorting the inherit differently. How does this avoid generating
native packages? Is there some magic I don't understand?

regards
Stefan Schmidt


