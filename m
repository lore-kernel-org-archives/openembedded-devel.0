Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYCdb-0003Eg-Af
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 08:37:15 +0200
Received: by iwn34 with SMTP id 34so4405612iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jul 2010 23:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=iKFbvmDlvZXPHcn3ltjJIO6zFXlY624mM+u3dPEIiMg=;
	b=jsNRzotMtDy5FSoCQPTdzZF30YoykmVzcURfjF5oFO4CsR7mRbyFgY5GLYtdpbrmwM
	1K5uQzA4gTcPTEGg+ANtxKkcwrn3BcxbZsA+jVsLeOcFTszw5YNyfjT2cqNVMNOBwQdx
	sjBceJ/u1aDCRWG3ACi10OzNKpF2hFKtXYd8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Mpl4grrjSSBHrIzQVs+uwf1BqVMEFzf4UdVDm+UdUbQAgD0akP6S1+nE92kentMUin
	5uaO+r1oMnggt1ooNO4InBnYJdwv6sNO6jNXyvTVIi+Aiy1/+Nn6ypyndhHm0/QKTTid
	pTkhA2WxvEp7RETYSysFml0tII+d6IkSy4TXA=
Received: by 10.231.32.129 with SMTP id c1mr13515484ibd.112.1278916336379; 
	Sun, 11 Jul 2010 23:32:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.17.132 with HTTP; Sun, 11 Jul 2010 23:31:56 -0700 (PDT)
In-Reply-To: <1278913254-30180-2-git-send-email-khimov@altell.ru>
References: <201007111103.21110.roman@khimov.ru>
	<1278913254-30180-1-git-send-email-khimov@altell.ru> 
	<1278913254-30180-2-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jul 2010 23:31:56 -0700
Message-ID: <AANLkTin5ott-60Mn_j6a7iPGhr30gQ9R1JaeuYOCezM-@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] perl 5.10.1: fix standard module rdependencies
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
X-List-Received-Date: Mon, 12 Jul 2010 06:37:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2010 at 10:40 PM, Roman I Khimov <khimov@altell.ru> wrote:
> Automatic dependency extraction script made some errors thus perl-modules
> wasn't installable.
>
> =A0* s/perl-module-encode-kr-2022_kr/perl-module-encode-kr-2022-kr/
> =A0* perl-module-your-module-here came from example in script, dropped it
> =A0* s/perl-module-cpan-exception-yaml_not_installed/perl-module-cpan-exc=
eption-yaml-not-installed/
> =A0* perl-module-dbd-sqlite - not part of standard perl, provided by libd=
bd-sqlite
> =A0* perl-module-dbix-simple - same as above, provided by libdbix-simple
>

now I get this error.

  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for task-sdk-native:
|  *    libdbd-sqlite *         libdbix-simple *
|


> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0recipes/perl/perl-rdepends_5.10.1.inc | =A0 23 +++++++++++------------
> =A0recipes/perl/perl_5.10.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A02 +-
> =A02 files changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/recipes/perl/perl-rdepends_5.10.1.inc b/recipes/perl/perl-rd=
epends_5.10.1.inc
> index d948417..62e7eed 100644
> --- a/recipes/perl/perl-rdepends_5.10.1.inc
> +++ b/recipes/perl/perl-rdepends_5.10.1.inc
> @@ -216,7 +216,7 @@ RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-defe=
rredcode "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-distribution "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-distrostatus "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-exception-recursivede=
pendency "
> -RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-exception-yaml_not_inst=
alled "
> +RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-exception-yaml-not-inst=
alled "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-ftp "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-handleconfig "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-cpan-infoobj "
> @@ -250,8 +250,8 @@ RDEPENDS_perl-module-cpan-exception-blocked_urllist +=
=3D "perl-module-overload"
> =A0RDEPENDS_perl-module-cpan-exception-blocked_urllist +=3D "perl-module-=
strict "
> =A0RDEPENDS_perl-module-cpan-exception-recursivedependency +=3D "perl-mod=
ule-overload"
> =A0RDEPENDS_perl-module-cpan-exception-recursivedependency +=3D "perl-mod=
ule-strict "
> -RDEPENDS_perl-module-cpan-exception-yaml_not_installed +=3D "perl-module=
-overload"
> -RDEPENDS_perl-module-cpan-exception-yaml_not_installed +=3D "perl-module=
-strict "
> +RDEPENDS_perl-module-cpan-exception-yaml-not-installed +=3D "perl-module=
-overload"
> +RDEPENDS_perl-module-cpan-exception-yaml-not-installed +=3D "perl-module=
-strict "
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-exporter"
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-fcntl"
> =A0RDEPENDS_perl-module-cpan +=3D "perl-module-file-basename"
> @@ -428,7 +428,6 @@ RDEPENDS_perl-module-cpanplus-internals-constants-rep=
ort +=3D "perl-module-package
> =A0RDEPENDS_perl-module-cpanplus-internals-constants-report +=3D "perl-mo=
dule-strict "
> =A0RDEPENDS_perl-module-cpanplus-internals-constants-report +=3D "perl-mo=
dule-test "
> =A0RDEPENDS_perl-module-cpanplus-internals-constants-report +=3D "perl-mo=
dule-vars"
> -RDEPENDS_perl-module-cpanplus-internals-constants-report +=3D "perl-modu=
le-your-module-here "
> =A0RDEPENDS_perl-module-cpanplus-internals-constants +=3D "perl-module-st=
rict "
> =A0RDEPENDS_perl-module-cpanplus-internals-constants +=3D "perl-module-va=
rs"
> =A0RDEPENDS_perl-module-cpanplus-internals +=3D "perl-module-cpanplus-err=
or "
> @@ -517,8 +516,8 @@ RDEPENDS_perl-module-cpanplus-internals-source-sqlite=
 +=3D "perl-module-cpanplus-e
> =A0RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-modul=
e-cpanplus-internals-constants "
> =A0RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-modul=
e-cpanplus-internals-source-sqlite-tie "
> =A0RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-modul=
e-data-dumper "
> -RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-module-=
dbd-sqlite "
> -RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-module-=
dbix-simple "
> +RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "libdbd-sqlit=
e "
> +RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "libdbix-simp=
le "
> =A0RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-modul=
e-locale-maketext-simple"
> =A0RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-modul=
e-params-check"
> =A0RDEPENDS_perl-module-cpanplus-internals-source-sqlite +=3D "perl-modul=
e-strict "
> @@ -786,13 +785,13 @@ RDEPENDS_perl-module-encode-jp-jis7 +=3D "perl-modu=
le-warnings "
> =A0RDEPENDS_perl-module-encode-jp +=3D "perl-module-strict "
> =A0RDEPENDS_perl-module-encode-jp +=3D "perl-module-warnings "
> =A0RDEPENDS_perl-module-encode-jp +=3D "perl-module-xsloader "
> -RDEPENDS_perl-module-encode-kr-2022_kr +=3D "perl-module-base"
> -RDEPENDS_perl-module-encode-kr-2022_kr +=3D "perl-module-encode"
> -RDEPENDS_perl-module-encode-kr-2022_kr +=3D "perl-module-encode-cjkconst=
ants"
> -RDEPENDS_perl-module-encode-kr-2022_kr +=3D "perl-module-strict "
> -RDEPENDS_perl-module-encode-kr-2022_kr +=3D "perl-module-warnings "
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-base"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-encode"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-encode-cjkconst=
ants"
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-strict "
> +RDEPENDS_perl-module-encode-kr-2022-kr +=3D "perl-module-warnings "
> =A0RDEPENDS_perl-module-encode-kr +=3D "perl-module-encode "
> -RDEPENDS_perl-module-encode-kr +=3D "perl-module-encode-kr-2022_kr "
> +RDEPENDS_perl-module-encode-kr +=3D "perl-module-encode-kr-2022-kr "
> =A0RDEPENDS_perl-module-encode-kr +=3D "perl-module-strict "
> =A0RDEPENDS_perl-module-encode-kr +=3D "perl-module-warnings "
> =A0RDEPENDS_perl-module-encode-kr +=3D "perl-module-xsloader "
> diff --git a/recipes/perl/perl_5.10.1.bb b/recipes/perl/perl_5.10.1.bb
> index c0f6378..c22ecd7 100644
> --- a/recipes/perl/perl_5.10.1.bb
> +++ b/recipes/perl/perl_5.10.1.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "Artistic|GPL"
> =A0PRIORITY =3D "optional"
> =A0# We need gnugrep (for -I)
> =A0DEPENDS =3D "virtual/db perl-native grep-native"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0# Not tested enough
> =A0DEFAULT_PREFERENCE =3D "-1"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


