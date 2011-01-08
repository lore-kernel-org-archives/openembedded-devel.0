Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pbi8D-0002l5-Ru
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Jan 2011 00:23:34 +0100
Received: by pzk12 with SMTP id 12so3779783pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jan 2011 15:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=7Z9fLtQpuwJFH4P77QDxDOecumBfcSI05j8onva5quA=;
	b=Rrp/h7Ir8KyzAilrFTFHU3sup6guhBUT4rdWS270aInXhCKntFO5gNF+tfCKXJFpUs
	Cm0gXkmEeCg1NAC3RTEtwDR4MawayJU8HyOyUoV6fdw1s06kqvfyWDAlJvuu/P76MT+C
	tBs2z/SXT7uiKNMTgFhgpug+e9nY9rw6b2zLs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=hO1Kj6s9irPvpQhr5g65rKUFq9hTvkx2iBniK5JvkkTOB911z5bbBEo2elC3OKEemE
	4d4JYHFvmqVBG1j0f8Xugx2GZxjs4BdXNqvFRcG/TaMY9Jr/GS5ppHZInh5Ab/Q7Yx/p
	PLDxbnpkzBlMFjV88MAfeR2pSwmMB982tS+AY=
Received: by 10.143.35.14 with SMTP id n14mr2954772wfj.158.1294528985432;
	Sat, 08 Jan 2011 15:23:05 -0800 (PST)
Received: from [192.168.1.68] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w22sm5010868wfd.7.2011.01.08.15.23.04
	(version=SSLv3 cipher=RC4-MD5); Sat, 08 Jan 2011 15:23:04 -0800 (PST)
Message-ID: <4D28F1CB.4080809@gmail.com>
Date: Sat, 08 Jan 2011 15:22:51 -0800
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.13) Gecko/20101207 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1294518772-24804-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1294518772-24804-1-git-send-email-khimov@altell.ru>
Subject: Re: [PATCH] perl: blacklist perl-module-cpanplus-internals-source-sqlite for perl-modules
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
X-List-Received-Date: Sat, 08 Jan 2011 23:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 1/8/2011 12:32 PM, Roman I Khimov wrote:
> It has runtime dependencies on libdbd-sqlite-perl and libdbix-simple-perl
> which doesn't get built automatically if not required as build time dependency
> for something.
>
> It's not possible to add them as build time dependencies for
> perl itself since they're in turn depend on perl making a circular dependency
> (and they _really_ depend on perl because they build binaries, so no way to
> cheat by making this recipes not to depend on perl).
>
> It's also not correct to downgrade this runtime dependency to recommendation,
> since the module is really unusable without its dependencies.
>
> The most annoying thing about all this is that this dependency situation renders
> perl-modules package uninstallable by itself, failing with something like:
>
>   Collected errors:
>    * satisfy_dependencies_for: Cannot satisfy the following dependencies for
>   task-sdk-native:
>    *    libdbd-sqlite-perl *    libdbix-simple-perl *
>
> So the best way to solve it IMO is to just blacklist it from perl-modules
> since the value of this module is questionable. It's experimental CPANPLUS
> backend that's not used by default, you have to specifically configure your
> perl to use it. And if you _really_ want to use it - the module package itself
> will still contain proper dependencies, you just need to get them built and
> installed.
>
> The problem only exists in perl 5.10.1, but 5.8.8 doesn't have this module, so
> blacklisting in common .inc doesn't hurt.
>
> Signed-off-by: Roman I Khimov<khimov@altell.ru>

Thanks for doing it. May be now distros can use 5.10.1 but 5.12.1 is 
already out :)

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
>   recipes/perl/perl.inc       |    2 +-
>   recipes/perl/perl_5.10.1.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/perl/perl.inc b/recipes/perl/perl.inc
> index ddde0b8..3d8b9bb 100644
> --- a/recipes/perl/perl.inc
> +++ b/recipes/perl/perl.inc
> @@ -1,7 +1,7 @@
>   # helper functions for perl
>   def all_perl_packages(d):
>       depchains = (d.getVar("DEPCHAIN_POST", True) or "").split()
> -    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc"]
> +    blacklist = ["perl-modules", "perl-misc", "perl-pod", "perl-doc", "perl-module-cpanplus-internals-source-sqlite", "perl-module-cpanplus-internals-source-sqlite-tie"]
>       for pkg in d.getVar("PACKAGES", True).split():
>           if not pkg in blacklist and not any(pkg.endswith(post) for post in depchains):
>               yield pkg
> diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
> index 4e6bc33..33ddffe 100644
> --- a/recipes/perl/perl_5.10.1.bb
> +++ b/recipes/perl/perl_5.10.1.bb
> @@ -5,7 +5,7 @@ LICENSE = "Artistic|GPLv1+"
>   PRIORITY = "optional"
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db perl-native grep-native"
> -PR = "r19"
> +PR = "r20"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"



