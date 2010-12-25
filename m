Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWY0M-0006ts-Sd
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 18:34:07 +0100
Received: by pxi17 with SMTP id 17so1634816pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=FEp5GGAGQOFV2Blrj7Yb0ff946S5VxEc3YkejWMeW5g=;
	b=R4na+tzJyoksr/IYcvbuP+vEEw/9YIvhyNR/lrJrus+hvt2ijdNSU7hL1OcXw7aPQJ
	0ZL6q58yJlu7SnlcNm6E3+LiFIs+FVf0nsdjQOwlnPMmSSgaWe9AQGN4Cs9xk3c/7qL2
	S+sMZfM/rWvHu0OMwrrgbSyehR0rOAX0ko4dU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=Maa5djin79Z/3OsogWY8K5QiYJexsOFV0JXOKGif0eavLzsGqCrDCw2fwTG3L37EDb
	HCHvKBZPlFGNBRxWITx/m4Q6Lp4tpR1tZC14G53xC9b1Hbm22EJKdFSIGnYO1zwCF6Fz
	ccpyN6EYXhSX9naOrGe6lgliUkwj+VQX0o8gE=
Received: by 10.142.135.18 with SMTP id i18mr8395278wfd.377.1293298423980;
	Sat, 25 Dec 2010 09:33:43 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm14401673wff.4.2010.12.25.09.33.42
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 09:33:43 -0800 (PST)
Message-ID: <4D162AF0.3050608@gmail.com>
Date: Sat, 25 Dec 2010 09:33:36 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>	<1293274109-15695-2-git-send-email-khimov@altell.ru>
	<1293274109-15695-3-git-send-email-khimov@altell.ru>
In-Reply-To: <1293274109-15695-3-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH 3/5] perl-native: fix ExtUtils::Liblist::Kid library check for cross-build
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
X-List-Received-Date: Sat, 25 Dec 2010 17:34:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> MakeMaker uses it to check for libraries presence and if the library is not
> found in host dirs (/lib, /usr/lib, etc) it fails with messages like:
>
> Note (probably harmless): No library found for -lpcap
>
> Unfortunately it's not harmless, since MakeMaker removes such libs from flags
> passed to link target modules which obviously breaks them.
>
> As I don't know exact semantic and all use-cases of libpth config variable
> I've workarounded this issue by prepending ldflags (and this does contain the
> right path) to lib flags.
>
> Signed-off-by: Roman I Khimov<khimov@altell.ru>

is this a problem for perl-native or target perl ?

> ---
>   .../perl-5.10.1/perl-fix-cross-library-check.patch |   19 +++++++++++++++++++
>   recipes/perl/perl-native_5.10.1.bb                 |    3 ++-
>   2 files changed, 21 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch
>
> diff --git a/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch b/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch
> new file mode 100644
> index 0000000..1c51609
> --- /dev/null
> +++ b/recipes/perl/perl-5.10.1/perl-fix-cross-library-check.patch
> @@ -0,0 +1,19 @@
> +Index: perl-5.10.1/lib/ExtUtils/Liblist/Kid.pm
> +===================================================================
> +--- perl-5.10.1.orig/lib/ExtUtils/Liblist/Kid.pm	2010-11-23 13:54:41.000000000 +0300
> ++++ perl-5.10.1/lib/ExtUtils/Liblist/Kid.pm	2010-11-23 14:18:13.000000000 +0300
> +@@ -33,6 +33,14 @@
> + 	$potential_libs .= " " if $potential_libs;
> + 	$potential_libs .= $Config{perllibs};
> +     }
> ++
> ++    if ($Config{ldflags}) {
> ++	# Dynamic libraries are not transitive, so we may need including
> ++	# the libraries linked against perl.dll again.
> ++
> ++	$potential_libs = $Config{ldflags} . " " . $potential_libs;
> ++    }
> ++
> +     return ("", "", "", "", ($give_libs ? [] : ())) unless $potential_libs;
> +     warn "Potential libraries are '$potential_libs':\n" if $verbose;
> +
> diff --git a/recipes/perl/perl-native_5.10.1.bb b/recipes/perl/perl-native_5.10.1.bb
> index 8b275a2..c523974 100644
> --- a/recipes/perl/perl-native_5.10.1.bb
> +++ b/recipes/perl/perl-native_5.10.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
>   SECTION = "libs"
>   LICENSE = "Artistic|GPLv1+"
>   DEPENDS = "virtual/db-native gdbm-native"
> -PR = "r7"
> +PR = "r8"
>   NATIVE_INSTALL_WORKS = "1"
>
>   # Not tested enough
> @@ -21,6 +21,7 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
>              file://perl-configpm-switch.patch \
>              file://native-nopacklist.patch \
>              file://native-perlinc.patch \
> +	   file://perl-fix-cross-library-check.patch \
>   	   "
>
>   SRC_URI[perl-5.10.1.md5sum] = "b9b2fdb957f50ada62d73f43ee75d044"



