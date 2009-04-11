Received: from [85.33.3.5] (helo=smtp-OUT05A.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1LsctS-0004m8-77
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Apr 2009 15:05:16 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sat, 11 Apr 2009 14:56:55 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sat, 11 Apr 2009 15:01:46 +0200
Received: from [192.168.1.107] ([79.17.29.155]) by FBCMCL01B02.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Sat, 11 Apr 2009 15:01:46 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090407212047.6CF5A1893D2@amethyst.openembedded.net>
References: <20090407212047.6CF5A1893D2@amethyst.openembedded.net>
Date: Sat, 11 Apr 2009 15:04:19 +0200
Message-Id: <1239455059.9086.1.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 11 Apr 2009 13:01:46.0445 (UTC)
	FILETIME=[AB61BFD0:01C9BAA5]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Stanislav Brabec : autoconf213-native: Added old autoconf for fennec recipe .
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
X-List-Received-Date: Sat, 11 Apr 2009 13:05:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2009-04-07 at 23:20 +0200, GIT User account wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: 949728423681eda38e5e34b84cd3281bba71fdf7
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=949728423681eda38e5e34b84cd3281bba71fdf7
> 
> Author: Stanislav Brabec <utx@penguin.cz>
> Date:   Tue Apr  7 21:16:38 2009 +0000
> 
> autoconf213-native: Added old autoconf for fennec recipe.
> 
> ---
> 
>  conf/checksums.ini                          |    4 ++++
>  recipes/autoconf/autoconf213-native_2.13.bb |    9 +++++++++
>  recipes/autoconf/autoconf213_2.13.bb        |    5 +++++
>  recipes/mozilla/fennec_hg.bb                |    2 +-
>  4 files changed, 19 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 0b05edf..48edc83 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -1970,6 +1970,10 @@ sha256=fce50bc26351bbbe31154d9a734cb433ec8fb404efc5febd50c149e5eaf62449
>  md5=dc3fc7209752207c23e7c94ab886b340
>  sha256=636eef7f400c2f3df489c0d2fa21507e88692113561e75a40a26c52bc422d7fc
>  
> +[ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.13.tar.gz]
> +md5=9de56d4a161a723228220b0f425dc711
> +sha256=f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e
> +
>  [ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.57.tar.bz2]
>  md5=407ea53787ce13f5ca427e9a51e05bc2
>  sha256=e1035aa2c21fae2a934d1ab56c774ce9d22717881dab8a1a5b16d294fb793489
> diff --git a/recipes/autoconf/autoconf213-native_2.13.bb b/recipes/autoconf/autoconf213-native_2.13.bb
> new file mode 100644
> index 0000000..3954ef3
> --- /dev/null
> +++ b/recipes/autoconf/autoconf213-native_2.13.bb
> @@ -0,0 +1,9 @@
> +require autoconf213_${PV}.bb
> +
> +DEPENDS = "m4-native gnu-config-native"
> +RDEPENDS_${PN} = "m4-native gnu-config-native"
> +
> +S = "${WORKDIR}/autoconf-${PV}"
> +FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/autoconf-${PV}"
> +
> +inherit native
> diff --git a/recipes/autoconf/autoconf213_2.13.bb b/recipes/autoconf/autoconf213_2.13.bb
> new file mode 100644
> index 0000000..022f696
> --- /dev/null
> +++ b/recipes/autoconf/autoconf213_2.13.bb
> @@ -0,0 +1,5 @@
> +require autoconf.inc
> +SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz"
> +PR = "r1"
> +EXTRA_OECONF = "--program-transform-name=s/\$/2.13/"
> +EXTRA_OEMAKE = 'acdatadir="${datadir}/autoconf-${PV}" infodir="${datadir}/autoconf-${PV}/info"'
> diff --git a/recipes/mozilla/fennec_hg.bb b/recipes/mozilla/fennec_hg.bb
> index fad2203..18286a0 100644
> --- a/recipes/mozilla/fennec_hg.bb
> +++ b/recipes/mozilla/fennec_hg.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Mozilla Mobile browser"
> -DEPENDS += "cairo alsa-lib "
> +DEPENDS += "autoconf213-native cairo alsa-lib"
>  
>  PV = "0.9+1.0b2pre"
>  MOZPV = "1.0b2pre"
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
I've a question about this commit:
if someone bitbakes autoconf-2.13 does it overwrite the one that there
was before?
Denis.




