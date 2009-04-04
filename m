Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Lq2A8-00011r-1W
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 11:27:42 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lq27a-0001Kv-SF
	for openembedded-devel@openembedded.org; Sat, 04 Apr 2009 09:25:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 09:25:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 04 Apr 2009 09:25:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 04 Apr 2009 11:21:58 +0200
Message-ID: <gr78rm$si$2@ger.gmane.org>
References: <1238737335-32556-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090328 Shredder/3.0b3pre
In-Reply-To: <1238737335-32556-1-git-send-email-jeremy.laine@bolloretelecom.eu>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW, RDNS_NONE, SPF_HELO_PASS, SPF_PASS,
	URIBL_SBL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE][PATCH] perl-5.8.8: use LDFLAGS for shared libraries (fixes QA error)
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
X-List-Received-Date: Sat, 04 Apr 2009 09:27:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03-04-09 07:42, Jeremy Lainé wrote:
> From: Jeremy Lainé<jeremy.laine@m4x.org>

Acked-by: Koen Kooi <koen@openembedded.org>

>
>
> Signed-off-by: Jeremy Lainé<jeremy.laine@m4x.org>
> ---
>   recipes/perl/perl-5.8.8/shared-ldflags.patch |   11 +++++++++++
>   recipes/perl/perl_5.8.8.bb                   |    6 +++++-
>   2 files changed, 16 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/perl/perl-5.8.8/shared-ldflags.patch
>
> diff --git a/recipes/perl/perl-5.8.8/shared-ldflags.patch b/recipes/perl/perl-5.8.8/shared-ldflags.patch
> new file mode 100644
> index 0000000..b872dc9
> --- /dev/null
> +++ b/recipes/perl/perl-5.8.8/shared-ldflags.patch
> @@ -0,0 +1,11 @@
> +diff -urN perl-5.8.8.orig/Cross/generate_config_sh perl-5.8.8/Cross/generate_config_sh
> +--- perl-5.8.8.orig/Cross/generate_config_sh	2003-09-05 08:31:08.000000000 +0000
> ++++ perl-5.8.8/Cross/generate_config_sh	2009-04-02 14:59:56.000000000 +0000
> +@@ -30,6 +30,7 @@
> + $callbacks->{'cppstdin'} = [\&simple_process_append, ["CC", "arm-linux-gcc -E", "-E"]];
> + $callbacks->{'full_ar'} = [\&backtick, ["AR", "which $ENV{AR}", "/usr/local/arm/2.95.3/bin/arm-linux-ar"]];
> + $callbacks->{'ld'} = [\&simple_process, ["LD", "arm-linux-ld"]];
> ++$callbacks->{'lddlflags'} = [\&simple_process, ["LDDLFLAGS", ""]];
> + $callbacks->{'ldflags'} = [\&simple_process, ["LDFLAGS", ""]];
> + $callbacks->{'ldflags_uselargefiles'} = [\&simple_process, ["LDFLAGS", ""]];
> + $callbacks->{'myarchname'} = [\&simple_process, ["SYS", "armv4l-linux"]];
> diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
> index 2118bba..521cdf6 100644
> --- a/recipes/perl/perl_5.8.8.bb
> +++ b/recipes/perl/perl_5.8.8.bb
> @@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
>   PRIORITY = "optional"
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db perl-native grep-native"
> -PR = "r26"
> +PR = "r27"
>
>   # Major part of version
>   PVM = "5.8"
> @@ -29,6 +29,7 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
>           file://62_debian_cpan_definstalldirs.patch;patch=1 \
>           file://64_debian_enc2xs_inc.patch;patch=1 \
>           file://asm-pageh-fix.patch;patch=1 \
> +        file://shared-ldflags.patch;patch=1 \
>           file://config.sh \
>           file://config.sh-32 \
>           file://config.sh-32-le \
> @@ -43,6 +44,9 @@ HOSTPERL = "${STAGING_BINDIR_NATIVE}/perl${PV}"
>   # Where to find .so files - use the -native versions not those from the target build
>   export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
>
> +# LDFLAGS for shared libraries
> +export LDDLFLAGS = "${LDFLAGS} -shared"
> +
>   do_configure() {
>           # Make hostperl in build directory be the native perl
>           cp -f ${HOSTPERL} hostperl




