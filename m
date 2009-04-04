Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lq26L-0000qa-2m
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 11:23:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Lq23o-0001Cz-L2
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 09:21:08 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 09:21:08 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 09:21:08 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Apr 2009 11:20:55 +0200
Message-ID: <gr78pn$si$1@ger.gmane.org>
References: <1238737194-32521-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238737194-32521-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] qt4-tools-native: set LFLAGS to pick up zlib from staging
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
X-List-Received-Date: Sat, 04 Apr 2009 09:23:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03-04-09 07:39, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>


>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/qt4/files/configure-lflags.patch |   13 +++++++++++++
>   recipes/qt4/qt4-tools-native.inc         |    3 ++-
>   recipes/qt4/qt4-tools-native_4.4.3.bb    |    2 +-
>   recipes/qt4/qt4-tools-native_4.5.0.bb    |    2 +-
>   4 files changed, 17 insertions(+), 3 deletions(-)
>   create mode 100644 recipes/qt4/files/configure-lflags.patch
>
> diff --git a/recipes/qt4/files/configure-lflags.patch b/recipes/qt4/files/configure-lflags.patch
> new file mode 100644
> index 0000000..df19549
> --- /dev/null
> +++ b/recipes/qt4/files/configure-lflags.patch
> @@ -0,0 +1,13 @@
> +Index: qtopia-core-opensource-src-4.3.3/configure
> +===================================================================
> +--- qtopia-core-opensource-src-4.3.3.orig/configure	2008-01-14 08:53:51.000000000 +0000
> ++++ qtopia-core-opensource-src-4.3.3/configure	2008-01-14 08:54:07.000000000 +0000
> +@@ -447,7 +447,7 @@
> + # initalize variables
> + #-------------------------------------------------------------------------------
> +
> +-SYSTEM_VARIABLES="CC CXX CFLAGS CXXFLAGS LDFLAGS"
> ++SYSTEM_VARIABLES="CC CXX CFLAGS CXXFLAGS LDFLAGS LFLAGS"
> + for varname in $SYSTEM_VARIABLES; do
> +     cmd=`echo \
> + 'if [ -n "\$'${varname}'" ]; then
> diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
> index fe2f94a..df5afd3 100644
> --- a/recipes/qt4/qt4-tools-native.inc
> +++ b/recipes/qt4/qt4-tools-native.inc
> @@ -8,6 +8,7 @@ LICENSE = "GPL"
>   inherit native
>
>   SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
> +           file://configure-lflags.patch;patch=1 \
>              file://qt-config.patch;patch=1 \
>              file://g++.conf \
>              file://linux.conf"
> @@ -29,7 +30,7 @@ EXTRA_OECONF = "-prefix ${prefix} \
>   EXTRA_OEMAKE = " "
>
>   do_configure() {
> -    echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
> +    echo yes | LFLAGS="-L${STAGING_LIBDIR_NATIVE}" ./configure ${EXTRA_OECONF} || die "Configuring qt failed. EXTRA_OECONF was ${EXTRA_OECONF}"
>   }
>
>   TOBUILD = "\
> diff --git a/recipes/qt4/qt4-tools-native_4.4.3.bb b/recipes/qt4/qt4-tools-native_4.4.3.bb
> index 8a8d46f..ef86db4 100644
> --- a/recipes/qt4/qt4-tools-native_4.4.3.bb
> +++ b/recipes/qt4/qt4-tools-native_4.4.3.bb
> @@ -1,2 +1,2 @@
>   require qt4-tools-native.inc
> -PR = "r2"
> +PR = "r3"
> diff --git a/recipes/qt4/qt4-tools-native_4.5.0.bb b/recipes/qt4/qt4-tools-native_4.5.0.bb
> index 6e5474b..ab63314 100644
> --- a/recipes/qt4/qt4-tools-native_4.5.0.bb
> +++ b/recipes/qt4/qt4-tools-native_4.5.0.bb
> @@ -1,5 +1,5 @@
>   require qt4-tools-native.inc
> -PR = "r0"
> +PR = "r1"
>
>   DEFAULT_PREFERENCE = "-1"
>   TOBUILD := "src/tools/bootstrap ${TOBUILD}"




