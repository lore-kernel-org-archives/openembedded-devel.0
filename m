Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PWXxc-0006rE-Ij
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Dec 2010 18:31:16 +0100
Received: by pxi17 with SMTP id 17so1634620pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Dec 2010 09:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=UiR8HoJ22UD3uttiVgddlXIA6kAo1eTG5MixLPS/C/M=;
	b=M1HySxolMk3KV4acTtMU5OkxeBMJ1y0/1RfCSR9IL5zwb1bslscVLNA1diWnt6FjJ5
	M3HLJ7dvWMw3NFTM0KFFlPdzgJZxiGl85FLTmXqTVOt9kP+xk9SO4FVfvxFRATsBmKvx
	Wa36KABsM30nEKeH9BDvShs3TjxpweeGKeYvI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=O9SYO8mkz4MLSnZhvP7w9t1UW1A3QeZa6LoKwlhqY3BGNayVVygF1s1S33vQ7Myxps
	ukTyaCXhL9de4/lZqPj4ksy/rzcX2fl+8B+zg+ujz3Mn2c5nkOZkwPfd+0plVvkFK1Iw
	spXgqiWfIUxh5oE9zmZi/bBs1CvjgObPKQLaw=
Received: by 10.142.7.6 with SMTP id 6mr8391228wfg.363.1293298256815;
	Sat, 25 Dec 2010 09:30:56 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id p8sm14395683wff.16.2010.12.25.09.30.55
	(version=SSLv3 cipher=RC4-MD5); Sat, 25 Dec 2010 09:30:55 -0800 (PST)
Message-ID: <4D162A49.8060009@gmail.com>
Date: Sat, 25 Dec 2010 09:30:49 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1293274109-15695-1-git-send-email-khimov@altell.ru>
	<1293274109-15695-2-git-send-email-khimov@altell.ru>
In-Reply-To: <1293274109-15695-2-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH 2/5] perl 5.10.1: fix Time::HiRes cross-compilation
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
X-List-Received-Date: Sat, 25 Dec 2010 17:31:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/25/2010 2:48 AM, Roman I Khimov wrote:
> We can't do 'run' check, so let's hope compile check is enough.
> Fixes
>
> Time::HiRes::nanosleep(): unimplemented in this platform
>
> error.
>
> Signed-off-by: Roman I Khimov<khimov@altell.ru>

is it possible to cache the vars instead? that will be better to keep
list of variables that are not runchecked

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   .../perl-time-hires-fix-cross-compilation.patch    |   29 ++++++++++++++++++++
>   recipes/perl/perl_5.10.1.bb                        |    3 +-
>   2 files changed, 31 insertions(+), 1 deletions(-)
>   create mode 100644 recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch
>
> diff --git a/recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch b/recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch
> new file mode 100644
> index 0000000..7c8b47e
> --- /dev/null
> +++ b/recipes/perl/perl-5.10.1/perl-time-hires-fix-cross-compilation.patch
> @@ -0,0 +1,29 @@
> +Index: perl-5.10.1/ext/Time-HiRes/Makefile.PL
> +===================================================================
> +--- perl-5.10.1.orig/ext/Time-HiRes/Makefile.PL	2010-11-23 12:05:59.000000000 +0300
> ++++ perl-5.10.1/ext/Time-HiRes/Makefile.PL	2010-11-23 12:06:42.000000000 +0300
> +@@ -157,24 +157,6 @@
> + 	    my $res = system($cccmd);
> + 	    $ok = defined($res)&&  $res == 0&&  -s $tmp_exe&&  -x _;
> +
> +-	    if ( $ok&&  exists $args{run}&&  $args{run}) {
> +-		my $tmp_exe =
> +-		    File::Spec->catfile(File::Spec->curdir, $tmp_exe);
> +-		printf "Running $tmp_exe..." if $VERBOSE;
> +-		if (system($tmp_exe) == 0) {
> +-		    $ok = 1;
> +-		} else {
> +-		    $ok = 0;
> +-		    my $errno = $?>>  8;
> +-		    local $! = $errno;
> +-		    printf<<EOF;
> +-
> +-*** The test run of '$tmp_exe' failed: status $?
> +-*** (the status means: errno = $errno or '$!')
> +-*** DO NOT PANIC: this just means that *some* functionality will be missing.
> +-EOF
> +-		}
> +-	    }
> + 	    unlink("$tmp.c", $tmp_exe);
> +         }
> +     }
> diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
> index 387755e..0e6a1f9 100644
> --- a/recipes/perl/perl_5.10.1.bb
> +++ b/recipes/perl/perl_5.10.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
>   PRIORITY = "optional"
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db perl-native grep-native"
> -PR = "r15"
> +PR = "r16"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
> @@ -62,6 +62,7 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz;name=perl-${PV} \
>   	file://arm-alignment.diff \
>   	file://fcgi-test.diff \
>   	file://hurd-ccflags.diff \
> +	file://perl-time-hires-fix-cross-compilation.patch \
>   	\
>           file://Makefile.patch \
>           file://Makefile.SH.patch \



