Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MM5eI-0003zz-IZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jul 2009 21:39:20 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KM400D42BDDWLD2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	01 Jul 2009 14:27:14 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 71D5A14AF5F; Wed,
	01 Jul 2009 15:27:13 -0400 (EDT)
Date: Wed, 01 Jul 2009 15:27:13 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090701192713.GL20815@denix.org>
References: <200907011818.18407.marcin@juszkiewicz.com.pl>
	<1246474496-16704-6-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1246474496-16704-6-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 041/125] Remove references to	base_set_filespath() from recipes that don't need it.
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
X-List-Received-Date: Wed, 01 Jul 2009 19:39:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jul 01, 2009 at 08:54:56PM +0200, Marcin Juszkiewicz wrote:
> From: Michael Smith <msmith@cbnco.com>
> 
> These recipes are covered by the default FILESPATHPKG setting.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> Acked-by: Tom Rini <trini@embeddedalley.com>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/db/db3-native_3.2.9.bb                     |    1 -
>  .../e2fsprogs-libs/e2fsprogs-libs-native_1.35.bb   |    1 -
>  .../e2fsprogs-libs/e2fsprogs-libs-native_1.41.2.bb |    1 -
>  recipes/e2fsprogs/e2fsprogs-native_1.38.bb         |    1 -
>  recipes/e2fsprogs/e2fsprogs-native_1.41.2.bb       |    1 -
>  recipes/e2tools/e2tools-native_0.0.16.bb           |    1 -
>  recipes/genext2fs/genext2fs-native_1.3.bb          |    1 -
>  recipes/mysql/mysql_4.1.22.bb                      |    2 --
>  recipes/recode/recode_3.6.bb                       |    7 ++-----
>  recipes/slugimage/slugimage-native.bb              |    2 --
>  recipes/slugtool/slugtool-native.bb                |    1 -
>  .../squashfs-tools/squashfs-tools-native_2.0r2.bb  |    2 --
>  .../squashfs-tools/squashfs-tools-native_2.2r2.bb  |    1 -
>  .../squashfs-tools/squashfs-tools-native_3.1r2.bb  |    1 -
>  .../squashfs-tools/squashfs-tools-native_3.3.bb    |    1 -
>  15 files changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/recipes/db/db3-native_3.2.9.bb b/recipes/db/db3-native_3.2.9.bb
> index 492f740..f16b19f 100644
> --- a/recipes/db/db3-native_3.2.9.bb
> +++ b/recipes/db/db3-native_3.2.9.bb
> @@ -4,5 +4,4 @@ CONFLICTS = "db-native"
>  inherit native
>  require db3_${PV}.bb
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/db3-${PV}', '${FILE_DIRNAME}/db3', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
> diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.35.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.35.bb
> index 9d0afa8..5f94c08 100644
> --- a/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.35.bb
> +++ b/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.35.bb
> @@ -2,5 +2,4 @@ SECTION = "base"
>  require e2fsprogs-libs_${PV}.bb
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/e2fsprogs-libs-${PV}', '${FILE_DIRNAME}/e2fsprogs-libs', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
> diff --git a/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.41.2.bb b/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.41.2.bb
> index 3db9e02..2632db4 100644
> --- a/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.41.2.bb
> +++ b/recipes/e2fsprogs-libs/e2fsprogs-libs-native_1.41.2.bb
> @@ -2,7 +2,6 @@ SECTION = "base"
>  require e2fsprogs-libs_${PV}.bb
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/e2fsprogs-libs-${PV}', '${FILE_DIRNAME}/e2fsprogs-libs', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  DEPENDS = "gettext-native"
> diff --git a/recipes/e2fsprogs/e2fsprogs-native_1.38.bb b/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
> index af49b0d..13fd2be 100644
> --- a/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
> +++ b/recipes/e2fsprogs/e2fsprogs-native_1.38.bb
> @@ -11,7 +11,6 @@ SRC_URI += "file://no-hardlinks.patch;patch=1 \
>  
>  EXTRA_OECONF = ""
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/e2fsprogs-${PV}', '${FILE_DIRNAME}/e2fsprogs', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  DEPENDS = ""
>  
> diff --git a/recipes/e2fsprogs/e2fsprogs-native_1.41.2.bb b/recipes/e2fsprogs/e2fsprogs-native_1.41.2.bb
> index f2c3898..8bccd7a 100644
> --- a/recipes/e2fsprogs/e2fsprogs-native_1.41.2.bb
> +++ b/recipes/e2fsprogs/e2fsprogs-native_1.41.2.bb
> @@ -7,7 +7,6 @@ DEFAULT_PREFERENCE = "-1"
>  
>  EXTRA_OECONF = ""
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/e2fsprogs-${PV}', '${FILE_DIRNAME}/e2fsprogs', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  DEPENDS = ""
>  
> diff --git a/recipes/e2tools/e2tools-native_0.0.16.bb b/recipes/e2tools/e2tools-native_0.0.16.bb
> index e37eed2..f23a0b1 100644
> --- a/recipes/e2tools/e2tools-native_0.0.16.bb
> +++ b/recipes/e2tools/e2tools-native_0.0.16.bb
> @@ -3,7 +3,6 @@ require e2tools_${PV}.bb
>  inherit native
>  
>  DEPENDS = "e2fsprogs-libs-native e2fsprogs-native"
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/e2tools-${PV}', '${FILE_DIRNAME}/e2tools', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  e2links = "e2ln e2ls e2mkdir e2mv e2rm e2tail"
> diff --git a/recipes/genext2fs/genext2fs-native_1.3.bb b/recipes/genext2fs/genext2fs-native_1.3.bb
> index 2e26fa0..50b371b 100644
> --- a/recipes/genext2fs/genext2fs-native_1.3.bb
> +++ b/recipes/genext2fs/genext2fs-native_1.3.bb
> @@ -1,6 +1,5 @@
>  require genext2fs_${PV}.bb
>  inherit native
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/genext2fs-${PV}', '${FILE_DIRNAME}/genext2fs', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  
>  do_stage () {
>  	install -m 0755 genext2fs ${STAGING_BINDIR}/
> diff --git a/recipes/mysql/mysql_4.1.22.bb b/recipes/mysql/mysql_4.1.22.bb
> index 5d5900c..bd75513 100644
> --- a/recipes/mysql/mysql_4.1.22.bb
> +++ b/recipes/mysql/mysql_4.1.22.bb
> @@ -14,8 +14,6 @@ SRC_URI = "http://downloads.mysql.com/archives/mysql-4.1/mysql-${PV}.tar.gz \
>  
>  S = "${WORKDIR}/mysql-${PV}"
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/mysql-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  BINCONFIG_GLOB = "mysql_config"
>  
>  inherit autotools binconfig update-rc.d
> diff --git a/recipes/recode/recode_3.6.bb b/recipes/recode/recode_3.6.bb
> index 6fd60ae..37e3b2a 100644
> --- a/recipes/recode/recode_3.6.bb
> +++ b/recipes/recode/recode_3.6.bb
> @@ -3,11 +3,8 @@ SECTION = "console/utils"
>  LICENSE = "GPL"
>  
>  PR = "r1"
> -SRC_URI = "${GNU_MIRROR}/recode/recode-${PV}.tar.gz"
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/recode-${PV}', '${FILE_DIRNAME}' ], d)}"
> -
> -SRC_URI += "file://recode-bitfield-width.patch;patch=1 \
> -            "
> +SRC_URI = "${GNU_MIRROR}/recode/recode-${PV}.tar.gz \
> +	file://recode-bitfield-width.patch;patch=1"
>  
>  inherit autotools
>  
> diff --git a/recipes/slugimage/slugimage-native.bb b/recipes/slugimage/slugimage-native.bb
> index 8b60ff1..f8408a1 100644
> --- a/recipes/slugimage/slugimage-native.bb
> +++ b/recipes/slugimage/slugimage-native.bb
> @@ -6,8 +6,6 @@ RDEPENDS = ""
>  
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/slugimage-${PV}', '${FILE_DIRNAME}/slugimage', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> -
>  do_stage () {
>  	install -m 0755 slugimage ${STAGING_BINDIR}/
>  }
> diff --git a/recipes/slugtool/slugtool-native.bb b/recipes/slugtool/slugtool-native.bb
> index 2d1fe91..088839c 100644
> --- a/recipes/slugtool/slugtool-native.bb
> +++ b/recipes/slugtool/slugtool-native.bb
> @@ -2,7 +2,6 @@ SECTION = "unknown"
>  require slugtool.bb
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/slugtool-${PV}', '${FILE_DIRNAME}/slugtool', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  do_stage () {
> diff --git a/recipes/squashfs-tools/squashfs-tools-native_2.0r2.bb b/recipes/squashfs-tools/squashfs-tools-native_2.0r2.bb
> index 2423e47..9ba5684 100644
> --- a/recipes/squashfs-tools/squashfs-tools-native_2.0r2.bb
> +++ b/recipes/squashfs-tools/squashfs-tools-native_2.0r2.bb
> @@ -1,11 +1,9 @@
>  require squashfs-tools_${PV}.bb
>  
>  DEPENDS = "lzma-native"
> -PN_BASE = "squashfs-tools"
>  
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/${PN_BASE}-${PV}', '${FILE_DIRNAME}/${PN_BASE}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  do_stage () {
> diff --git a/recipes/squashfs-tools/squashfs-tools-native_2.2r2.bb b/recipes/squashfs-tools/squashfs-tools-native_2.2r2.bb
> index b6ee6e7..9ba5684 100644
> --- a/recipes/squashfs-tools/squashfs-tools-native_2.2r2.bb
> +++ b/recipes/squashfs-tools/squashfs-tools-native_2.2r2.bb
> @@ -4,7 +4,6 @@ DEPENDS = "lzma-native"
>  
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/squashfs-tools-${PV}', '${FILE_DIRNAME}/squashfs-tools', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  do_stage () {
> diff --git a/recipes/squashfs-tools/squashfs-tools-native_3.1r2.bb b/recipes/squashfs-tools/squashfs-tools-native_3.1r2.bb
> index c35d183..c171e43 100644
> --- a/recipes/squashfs-tools/squashfs-tools-native_3.1r2.bb
> +++ b/recipes/squashfs-tools/squashfs-tools-native_3.1r2.bb
> @@ -2,7 +2,6 @@ require squashfs-tools_${PV}.bb
>  
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/squashfs-tools-${PV}', '${FILE_DIRNAME}/squashfs-tools', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  do_stage () {
> diff --git a/recipes/squashfs-tools/squashfs-tools-native_3.3.bb b/recipes/squashfs-tools/squashfs-tools-native_3.3.bb
> index 87ba761..5858bb1 100644
> --- a/recipes/squashfs-tools/squashfs-tools-native_3.3.bb
> +++ b/recipes/squashfs-tools/squashfs-tools-native_3.3.bb
> @@ -3,7 +3,6 @@ PR = "r0"
>  
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/squashfs-tools-${PV}', '${FILE_DIRNAME}/squashfs-tools', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
>  PACKAGES = ""
>  
>  do_stage () {
> -- 
> 1.6.3.1
> 
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


