Received: from [74.125.46.152] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lquf5-0000yu-GK
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 21:39:18 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1601727ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Apr 2009 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=dqCZKzLatfMW9tb8834M4X9l8ePGFgKYNydiF1osWyU=;
	b=JI0xRhb9ksnqRuN+EeZcBQiBBWKe1MxnmNNUurOFHjB5c8of/PkhzAi/DXbIHmBKmC
	dzoasm+t9PaXuQDNv+mldMsKUPdtUmHhAp/5O3pL6EKIx2gs3F1yA9ZxS8TYkjwoAgbI
	kUR5WuwzW2qd5yC3Dj2RAQzrOwyqB9yy98BE4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=aUOz/y03V0D4tGCb+uqwEkyvF3zdRADoOm+qjmuRrv8lkH24hz0WOr6hZ2AjYBT5lN
	a7XgjlbAHsKZ4oYW0dA3IFg0KCVOWCEpmJdkPAGue2JpCt6WxlNv6aA+LNuu+PDPmonl
	bLHe4/AW9Mure5jthFBzFWtHUfQVaoe56USkc=
MIME-Version: 1.0
Received: by 10.100.248.4 with SMTP id v4mr9034329anh.57.1239046583297; Mon, 
	06 Apr 2009 12:36:23 -0700 (PDT)
In-Reply-To: <20090403221813.GK30840@smtp.west.cox.net>
References: <20090403221352.GH30840@smtp.west.cox.net>
	<20090403221721.GI30840@smtp.west.cox.net>
	<20090403221751.GJ30840@smtp.west.cox.net>
	<20090403221813.GK30840@smtp.west.cox.net>
Date: Mon, 6 Apr 2009 12:36:23 -0700
Message-ID: <19c1b8a90904061236h5df3dda5j30d64c8b1f8e54db@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.46.152
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] meta-toolchain, canadian-sdk: Move C++ headers into 	the correct location, bump PR
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
X-List-Received-Date: Mon, 06 Apr 2009 19:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

ok with this change, you can apply the previous patch fully.

On 4/3/09, Tom Rini <trini@kernel.crashing.org> wrote:
> meta-toolchain, canadian-sdk: Move C++ headers into the correct location,
> bump PR
>  A gcc that has sysroot support expects that the default C++ headers
>  (iostream, etc) are in <toolchain prefix>/include/c++ while regular C
>  headers are still in <toolchain prefix>/usr/include.
>
> ---
>  recipes/meta/canadian-sdk.bb            |    8 +++++++-
>  recipes/meta/meta-toolchain-fso.bb      |    2 +-
>  recipes/meta/meta-toolchain-gpe-sbox.bb |    3 ++-
>  recipes/meta/meta-toolchain-gpe.bb      |    3 ++-
>  recipes/meta/meta-toolchain-neuros.bb   |    2 +-
>  recipes/meta/meta-toolchain-openmoko.bb |    2 +-
>  recipes/meta/meta-toolchain-opie.bb     |    1 +
>  recipes/meta/meta-toolchain-sbox.bb     |    1 +
>  recipes/meta/meta-toolchain.bb          |    6 ++++++
>  9 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/meta/canadian-sdk.bb b/recipes/meta/canadian-sdk.bb
> index 150c752..9126c7e 100644
> --- a/recipes/meta/canadian-sdk.bb
> +++ b/recipes/meta/canadian-sdk.bb
> @@ -1,7 +1,7 @@
>  DESCRIPTION = "Meta package for building a installable toolchain"
>  LICENSE = "MIT"
>  DEPENDS = "ipkg-native ipkg-utils-native fakeroot-native sed-native
> zip-native"
> -PR = "r2"
> +PR = "r3"
>
>  inherit canadian-sdk meta
>
> @@ -100,6 +100,12 @@ do_populate_sdk() {
>  	# gcc-cross-sdk get built :( (30/11/07)
>  	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libgcc_s.so
>
> +	# With sysroot support, gcc expects the default C++ headers to be
> +	# in a specific place.
> +	install -d ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include
> +	mv ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/usr/include/c++ \
> +		${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include/
> +
>  	# Fix or remove broken .la files
>  	for i in `find ${SDK_OUTPUT}/${prefix}/${TARGET_SYS} -name \*.la`; do
>  		sed -i 	-e
> "/^dependency_libs=/s,\([[:space:]']\)${layout_base_libdir},\1${prefix}/${TARGET_SYS}${layout_base_libdir},g"
> \
> diff --git a/recipes/meta/meta-toolchain-fso.bb
> b/recipes/meta/meta-toolchain-fso.bb
> index fbfbb0a..4873c42 100644
> --- a/recipes/meta/meta-toolchain-fso.bb
> +++ b/recipes/meta/meta-toolchain-fso.bb
> @@ -1,4 +1,4 @@
> -PR = "r0"
> +PR = "r1"
>
>  TOOLCHAIN_TARGET_TASK = "task-fso-toolchain-target"
>  TOOLCHAIN_HOST_TASK = "task-fso-toolchain-host"
> diff --git a/recipes/meta/meta-toolchain-gpe-sbox.bb
> b/recipes/meta/meta-toolchain-gpe-sbox.bb
> index 74ba038..29e39c5 100644
> --- a/recipes/meta/meta-toolchain-gpe-sbox.bb
> +++ b/recipes/meta/meta-toolchain-gpe-sbox.bb
> @@ -1,3 +1,4 @@
> +PR = "r1"
>  TOOLCHAIN_TARGET_TASK = "\
>      task-sdk-base \
>      task-sdk-sbox \
> @@ -9,4 +10,4 @@ TOOLCHAIN_TARGET_TASK = "\
>
>  require meta-toolchain.bb
>
> -SDK_SUFFIX = "toolchain-gpe-sbox"
> \ No newline at end of file
> +SDK_SUFFIX = "toolchain-gpe-sbox"
> diff --git a/recipes/meta/meta-toolchain-gpe.bb
> b/recipes/meta/meta-toolchain-gpe.bb
> index bcfb1e1..7b962bf 100644
> --- a/recipes/meta/meta-toolchain-gpe.bb
> +++ b/recipes/meta/meta-toolchain-gpe.bb
> @@ -1,3 +1,4 @@
> +PR = "r1"
>  TOOLCHAIN_TARGET_TASK = "\
>      task-sdk-base \
>      task-sdk-x11 \
> @@ -6,4 +7,4 @@ TOOLCHAIN_TARGET_TASK = "\
>
>  require meta-toolchain.bb
>
> -SDK_SUFFIX = "toolchain-gpe"
> \ No newline at end of file
> +SDK_SUFFIX = "toolchain-gpe"
> diff --git a/recipes/meta/meta-toolchain-neuros.bb
> b/recipes/meta/meta-toolchain-neuros.bb
> index 087ddcb..445a187 100644
> --- a/recipes/meta/meta-toolchain-neuros.bb
> +++ b/recipes/meta/meta-toolchain-neuros.bb
> @@ -1,6 +1,6 @@
>  # Toolchain for neuros-osd devices
>
> -PR = "r4"
> +PR = "r5"
>
>  TOOLCHAIN_HOST_TASK = "task-sdk-host \
>                         qmake2-sdk uicmoc4-sdk"
> diff --git a/recipes/meta/meta-toolchain-openmoko.bb
> b/recipes/meta/meta-toolchain-openmoko.bb
> index b7e5626..b265615 100644
> --- a/recipes/meta/meta-toolchain-openmoko.bb
> +++ b/recipes/meta/meta-toolchain-openmoko.bb
> @@ -1,4 +1,4 @@
> -PR = "r1"
> +PR = "r2"
>
>  TOOLCHAIN_TARGET_TASK = "task-openmoko-toolchain-target"
>  TOOLCHAIN_HOST_TASK = "task-openmoko-toolchain-host"
> diff --git a/recipes/meta/meta-toolchain-opie.bb
> b/recipes/meta/meta-toolchain-opie.bb
> index c72208c..9f4b9ac 100644
> --- a/recipes/meta/meta-toolchain-opie.bb
> +++ b/recipes/meta/meta-toolchain-opie.bb
> @@ -1,3 +1,4 @@
> +PR = "r1"
>  TOOLCHAIN_TARGET_TASK = "\
>      task-sdk-base \
>      task-sdk-opie"
> diff --git a/recipes/meta/meta-toolchain-sbox.bb
> b/recipes/meta/meta-toolchain-sbox.bb
> index 1283c59..0138329 100644
> --- a/recipes/meta/meta-toolchain-sbox.bb
> +++ b/recipes/meta/meta-toolchain-sbox.bb
> @@ -1,3 +1,4 @@
> +PR = "r1"
>  TOOLCHAIN_TARGET_TASK = "\
>      task-sdk-bare \
>      task-sdk-sbox"
> diff --git a/recipes/meta/meta-toolchain.bb b/recipes/meta/meta-toolchain.bb
> index f892d22..b641be1 100644
> --- a/recipes/meta/meta-toolchain.bb
> +++ b/recipes/meta/meta-toolchain.bb
> @@ -117,6 +117,12 @@ do_populate_sdk() {
>  	# gcc-cross-sdk get built :( (30/11/07)
>  	ln -sf libgcc_s.so.1 ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/lib/libgcc_s.so
>
> +	# With sysroot support, gcc expects the default C++ headers to be
> +	# in a specific place.
> +	install -d ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include
> +	mv ${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/usr/include/c++ \
> +		${SDK_OUTPUT}/${prefix}/${TARGET_SYS}/include/
> +
>  	# Fix or remove broken .la files
>  	for i in `find ${SDK_OUTPUT}/${prefix}/${TARGET_SYS} -name \*.la`; do
>  		sed -i 	-e
> "/^dependency_libs=/s,\([[:space:]']\)${layout_base_libdir},\1${prefix}/${TARGET_SYS}${layout_base_libdir},g"
> \
> --
> 1.6.0.4
>
> --
> Tom Rini
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


