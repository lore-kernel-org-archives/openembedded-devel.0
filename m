Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1M12vT-0005RV-AY
	for openembedded-devel@openembedded.org; Mon, 04 May 2009 20:30:03 +0200
Received: (qmail 28745 invoked from network); 4 May 2009 18:24:14 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 4 May 2009 11:24:14 -0700
Date: Mon, 4 May 2009 11:24:13 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090504182413.GI7973@smtp.west.cox.net>
References: <20090504154624.GH7973@smtp.west.cox.net>
	<1241460204-24010-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1241460204-24010-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] qemu: add version 0.10.3, initial
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
X-List-Received-Date: Mon, 04 May 2009 18:30:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 04, 2009 at 10:03:24PM +0400, Roman I Khimov wrote:

> Finally not requiring GCC3. Added with masked preference, need to carefully
> sort out and apply OE's patches.

Thanks, Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  conf/checksums.ini                   |    4 ++++
>  recipes/qemu/qemu-native.inc         |    5 +----
>  recipes/qemu/qemu-native_0.10.3.bb   |    2 ++
>  recipes/qemu/qemu-native_0.9.1.bb    |    3 +++
>  recipes/qemu/qemu-native_20070613.bb |    3 ++-
>  recipes/qemu/qemu-native_cvs.bb      |    3 +++
>  recipes/qemu/qemu-native_svn.bb      |    3 +++
>  recipes/qemu/qemu_0.10.3.bb          |   22 ++++++++++++++++++++++
>  8 files changed, 40 insertions(+), 5 deletions(-)
>  create mode 100644 recipes/qemu/qemu-native_0.10.3.bb
>  create mode 100644 recipes/qemu/qemu_0.10.3.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 6f15ceb..bf7477a 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -19902,6 +19902,10 @@ sha256=c85ba04c9459cbc283a6f04ced730b49dc9966cf749808e8f960305116d525e6
>  md5=a31f12647c5bb5f93c81465b4e5ff25a
>  sha256=5795b9d619142e2d01016130c7ac71298aa1cabda4806f11762bb8fd489293af
>  
> +[http://download.savannah.gnu.org/releases/qemu/qemu-0.10.3.tar.gz]
> +md5=320d6c536c8a1288cdc6c809f487e6d7
> +sha256=89540d7a8c880a6ae33f8a55d55d580f3f03c10b02e32b7323719b3354f7b077
> +
>  [http://fabrice.bellard.free.fr/qemu/qemu-0.9.1.tar.gz]
>  md5=6591df8e9270eb358c881de4ebea1262
>  sha256=4756d0b4a4dc7dd88354bc6b37d381e4462dd328d0feef94803e90c0455835a5
> diff --git a/recipes/qemu/qemu-native.inc b/recipes/qemu/qemu-native.inc
> index 3e6433c..e4064a2 100644
> --- a/recipes/qemu/qemu-native.inc
> +++ b/recipes/qemu/qemu-native.inc
> @@ -1,6 +1,3 @@
>  inherit native
>  
> -DEPENDS = "libsdl-native zlib-native gcc3-native"
> -
> -require qemu-gcc3-check.inc
> -
> +DEPENDS = "libsdl-native zlib-native"
> diff --git a/recipes/qemu/qemu-native_0.10.3.bb b/recipes/qemu/qemu-native_0.10.3.bb
> new file mode 100644
> index 0000000..16984a3
> --- /dev/null
> +++ b/recipes/qemu/qemu-native_0.10.3.bb
> @@ -0,0 +1,2 @@
> +require qemu_${PV}.bb
> +require qemu-native.inc
> diff --git a/recipes/qemu/qemu-native_0.9.1.bb b/recipes/qemu/qemu-native_0.9.1.bb
> index 16984a3..4c418f6 100644
> --- a/recipes/qemu/qemu-native_0.9.1.bb
> +++ b/recipes/qemu/qemu-native_0.9.1.bb
> @@ -1,2 +1,5 @@
>  require qemu_${PV}.bb
>  require qemu-native.inc
> +require qemu-gcc3-check.inc
> +
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu-native_20070613.bb b/recipes/qemu/qemu-native_20070613.bb
> index dc9852b..4c418f6 100644
> --- a/recipes/qemu/qemu-native_20070613.bb
> +++ b/recipes/qemu/qemu-native_20070613.bb
> @@ -1,4 +1,5 @@
>  require qemu_${PV}.bb
>  require qemu-native.inc
> +require qemu-gcc3-check.inc
>  
> -
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu-native_cvs.bb b/recipes/qemu/qemu-native_cvs.bb
> index c9db5e3..51e6028 100644
> --- a/recipes/qemu/qemu-native_cvs.bb
> +++ b/recipes/qemu/qemu-native_cvs.bb
> @@ -1,2 +1,5 @@
>  require qemu_cvs.bb
>  require qemu-native.inc
> +require qemu-gcc3-check.inc
> +
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu-native_svn.bb b/recipes/qemu/qemu-native_svn.bb
> index 1e3a4db..b530bbd 100644
> --- a/recipes/qemu/qemu-native_svn.bb
> +++ b/recipes/qemu/qemu-native_svn.bb
> @@ -1,2 +1,5 @@
>  require qemu_svn.bb
>  require qemu-native.inc
> +require qemu-gcc3-check.inc
> +
> +DEPENDS += "gcc3-native"
> diff --git a/recipes/qemu/qemu_0.10.3.bb b/recipes/qemu/qemu_0.10.3.bb
> new file mode 100644
> index 0000000..d6ad1d7
> --- /dev/null
> +++ b/recipes/qemu/qemu_0.10.3.bb
> @@ -0,0 +1,22 @@
> +LICENSE = "GPL"
> +DEPENDS = "zlib"
> +
> +# Need to port OE patches there
> +DEFAULT_PREFERENCE = "-1"
> +
> +FILESPATH = "${FILE_DIRNAME}/qemu-${PV}"
> +FILESDIR = "${WORKDIR}"
> +
> +SRC_URI = "\
> +    http://download.savannah.gnu.org/releases/qemu/qemu-${PV}.tar.gz \
> +    "
> +
> +S = "${WORKDIR}/qemu-${PV}"
> +
> +EXTRA_OECONF += "--disable-gfx-check"
> +
> +inherit autotools
> +
> +do_configure() {
> +	${S}/configure --prefix=${prefix} ${EXTRA_OECONF}
> +}
> -- 
> 1.6.2.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


