Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PKS7r-0000J0-6D for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 09:51:53 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PKS6j-0005tW-QU for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 09:50:41 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 09:50:41 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 09:50:41 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Nov 2010 09:50:21 +0100
Message-ID: <icdase$jgd$1@dough.gmane.org>
References: <1290284795-7824-1-git-send-email-fransmeulenbroeks@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <1290284795-7824-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] update-rc.d: make update-rc.d local
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
X-List-Received-Date: Mon, 22 Nov 2010 08:51:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-11-10 21:26, Frans Meulenbroeks wrote:
> the recipe did not build any more as handhelds.org is gone.
> Since this one is fairly crucial as lots of recipes depend on it
> I decided to put the update-rc.d file in update-rc.d/ instead of
> fetching it.

If it's local, why are you still patching it in the recipe?


> 
> While at it als renamed files to update-rc.d
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  recipes/update-rc.d/files/add-verbose.patch       |   47 -----
>  recipes/update-rc.d/update-rc.d/add-verbose.patch |   47 +++++
>  recipes/update-rc.d/update-rc.d/update-rc.d       |  231 +++++++++++++++++++++
>  recipes/update-rc.d/update-rc.d_0.7.bb            |    7 +-
>  4 files changed, 282 insertions(+), 50 deletions(-)
>  delete mode 100644 recipes/update-rc.d/files/add-verbose.patch
>  create mode 100644 recipes/update-rc.d/update-rc.d/add-verbose.patch
>  create mode 100644 recipes/update-rc.d/update-rc.d/update-rc.d
> 
> diff --git a/recipes/update-rc.d/files/add-verbose.patch b/recipes/update-rc.d/files/add-verbose.patch
> deleted file mode 100644
> index 0f06830..0000000
> --- a/recipes/update-rc.d/files/add-verbose.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> ---- update-rc.d/update-rc.d.org	2005-01-03 00:30:47.000000000 +0200
> -+++ update-rc.d/update-rc.d	2007-12-01 19:41:08.000000000 +0200
> -@@ -19,6 +19,7 @@
> - notreally=0
> - force=0
> - dostart=0
> -+verbose=0
> - 
> - usage()
> - {
> -@@ -28,6 +29,7 @@
> -        update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl [runlvl] [...] .
> - 		-n: not really
> - 		-f: force
> -+		-v: verbose
> - 		-r: alternate root path (default is /)
> - 		-s: invoke start methods if appropriate to current runlevel
> - EOF
> -@@ -69,7 +71,7 @@
> - 	lev=`echo $2 | cut -d/ -f1`
> - 	nn=`echo $2 | cut -d/ -f2`
> - 	fn="${etcd}${lev}.d/${startstop}${nn}${bn}"
> --	echo "  $fn -> ../init.d/$bn"
> -+	[ $verbose -eq 1 ] && echo "  $fn -> ../init.d/$bn"
> - 	if [ $notreally -eq 0 ]; then
> - 		mkdir -p `dirname $fn`
> -  		ln -s ../init.d/$bn $fn
> -@@ -89,7 +91,7 @@
> - 		exit 0
> - 	fi
> - 
> --	echo " Adding system startup for $initd/$bn ..."
> -+	echo " Adding system startup for $initd/$bn."
> - 
> - 	for i in $startlinks; do
> - 		dolink S $i
> -@@ -105,6 +107,10 @@
> - 			shift
> - 			continue
> - 			;;
> -+		-v)	verbose=1
> -+			shift
> -+			continue
> -+			;;
> - 		-f)	force=1
> - 			shift
> - 			continue
> diff --git a/recipes/update-rc.d/update-rc.d/add-verbose.patch b/recipes/update-rc.d/update-rc.d/add-verbose.patch
> new file mode 100644
> index 0000000..0f06830
> --- /dev/null
> +++ b/recipes/update-rc.d/update-rc.d/add-verbose.patch
> @@ -0,0 +1,47 @@
> +--- update-rc.d/update-rc.d.org	2005-01-03 00:30:47.000000000 +0200
> ++++ update-rc.d/update-rc.d	2007-12-01 19:41:08.000000000 +0200
> +@@ -19,6 +19,7 @@
> + notreally=0
> + force=0
> + dostart=0
> ++verbose=0
> + 
> + usage()
> + {
> +@@ -28,6 +29,7 @@
> +        update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl [runlvl] [...] .
> + 		-n: not really
> + 		-f: force
> ++		-v: verbose
> + 		-r: alternate root path (default is /)
> + 		-s: invoke start methods if appropriate to current runlevel
> + EOF
> +@@ -69,7 +71,7 @@
> + 	lev=`echo $2 | cut -d/ -f1`
> + 	nn=`echo $2 | cut -d/ -f2`
> + 	fn="${etcd}${lev}.d/${startstop}${nn}${bn}"
> +-	echo "  $fn -> ../init.d/$bn"
> ++	[ $verbose -eq 1 ] && echo "  $fn -> ../init.d/$bn"
> + 	if [ $notreally -eq 0 ]; then
> + 		mkdir -p `dirname $fn`
> +  		ln -s ../init.d/$bn $fn
> +@@ -89,7 +91,7 @@
> + 		exit 0
> + 	fi
> + 
> +-	echo " Adding system startup for $initd/$bn ..."
> ++	echo " Adding system startup for $initd/$bn."
> + 
> + 	for i in $startlinks; do
> + 		dolink S $i
> +@@ -105,6 +107,10 @@
> + 			shift
> + 			continue
> + 			;;
> ++		-v)	verbose=1
> ++			shift
> ++			continue
> ++			;;
> + 		-f)	force=1
> + 			shift
> + 			continue
> diff --git a/recipes/update-rc.d/update-rc.d/update-rc.d b/recipes/update-rc.d/update-rc.d/update-rc.d
> new file mode 100644
> index 0000000..ec50d15
> --- /dev/null
> +++ b/recipes/update-rc.d/update-rc.d/update-rc.d
> @@ -0,0 +1,231 @@
> +#!/bin/sh
> +#
> +# update-rc.d	Update the links in /etc/rc[0-9S].d/
> +#
> +# (c) 2003, 2004 Phil Blundell <pb@handhelds.org>
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2, or (at your option)
> +# any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +
> +initd="/etc/init.d"
> +etcd="/etc/rc"
> +notreally=0
> +force=0
> +dostart=0
> +
> +usage()
> +{
> +	cat >&2 <<EOF
> +usage: update-rc.d [-n] [-f] [-r <root>] <basename> remove
> +       update-rc.d [-n] [-r <root>] [-s] <basename> defaults [NN | sNN kNN]
> +       update-rc.d [-n] [-r <root>] [-s] <basename> start|stop NN runlvl [runlvl] [...] .
> +		-n: not really
> +		-f: force
> +		-r: alternate root path (default is /)
> +		-s: invoke start methods if appropriate to current runlevel
> +EOF
> +}
> +
> +checklinks()
> +{
> +	local i dn fn remove=0
> +	if [ "x$1" = "xremove" ]; then
> +		echo " Removing any system startup links for $bn ..."
> +		remove=1
> +	fi
> +
> +	for i in 0 1 2 3 4 5 6 7 8 9 S; do
> +		dn="${etcd}${i}.d"
> +		if [ ! -d $dn ]; then
> +			continue;
> +		fi
> +		for f in ${dn}/[SK]??${bn}; do
> +			if [ -L $f ]; then
> +				if [ $remove -eq 0 ]; then
> +					return 1
> +				fi
> +				echo "  $f"
> +				if [ $notreally -eq 1 ]; then
> +					continue
> +				fi
> +				rm $f
> +			fi
> +		done
> +	done
> +
> +	return 0
> +}
> +
> +dolink()
> +{
> +	startstop=$1
> +	lev=`echo $2 | cut -d/ -f1`
> +	nn=`echo $2 | cut -d/ -f2`
> +	fn="${etcd}${lev}.d/${startstop}${nn}${bn}"
> +	echo "  $fn -> ../init.d/$bn"
> +	if [ $notreally -eq 0 ]; then
> +		mkdir -p `dirname $fn`
> + 		ln -s ../init.d/$bn $fn
> +	fi
> +	if [ $dostart -eq 1 ] && [ $startstop = "S" ] && [ $lev = $RUNLEVEL ]; then
> +		$fn start || true
> +	fi
> +}
> +
> +makelinks()
> +{
> +	if ! checklinks; then
> +		echo " System startup links for $initd/$bn already exist."
> +		if [ $dostart -eq 1 ] && [ $notreally -eq 0 ] && [ -L ${etcd}${RUNLEVEL}.d/S??${bn} ]; then
> +			${etcd}${RUNLEVEL}.d/S??${bn} restart || true
> +		fi
> +		exit 0
> +	fi
> +
> +	echo " Adding system startup for $initd/$bn ..."
> +
> +	for i in $startlinks; do
> +		dolink S $i
> +	done
> +	for i in $stoplinks; do
> +		dolink K $i
> +	done
> +}
> +
> +while [ $# -gt 0 ]; do
> +	case $1 in
> +		-n)	notreally=1
> +			shift
> +			continue
> +			;;
> +		-f)	force=1
> +			shift
> +			continue
> +			;;
> +		-s)	dostart=1
> +			shift
> +			continue
> +			;;
> +		-r)     shift
> +			root=$1
> +			initd="${root}${initd}"
> +			etcd="${root}${etcd}"
> +			shift
> +			;;
> +		-h | --help)
> +			usage
> +			exit 0
> +			;;
> +		-*)
> +			usage
> +			exit 1
> +			;;
> +		*)
> +			break
> +			;;
> +	esac
> +done
> +
> +if [ $# -lt 2 ]; then
> +	usage
> +	exit 1
> +fi
> +
> +bn=$1
> +shift
> +
> +if [ $1 != "remove" ]; then
> +	if [ ! -f "$initd/$bn" ]; then
> +		echo "update-rc.d: $initd/$bn: file does not exist" >&2
> +		exit 1
> +	fi
> +else
> +	if [ -f "$initd/$bn" ]; then
> +		if [ $force -eq 1 ]; then
> +			echo "update-rc.d: $initd/$bn exists during rc.d purge (continuing)" >&2
> +		else
> +			echo "update-rc.d: $initd/$bn exists during rc.d purge (use -f to force)" >&2
> +			exit 1
> +		fi
> +	fi
> +fi
> +
> +if [ $dostart -eq 1 ]; then
> +	#RUNLEVEL=`sed 's/.*\[\(.*\)\]/\1/' < /proc/1/cmdline`
> +	RUNLEVEL=`runlevel | cut -d" " -f2`
> +	if [ "x$RUNLEVEL" = "x" ]; then
> +		echo "Unable to determine current runlevel" >&2
> +		exit 1
> +	fi
> +fi
> +
> +case $1 in
> +	remove)
> +		checklinks "remove"
> +		;;
> +
> +	defaults)
> +		if [ $# -gt 3 ]; then
> +			echo "defaults takes only one or two arguments" >&2
> +			usage
> +			exit 1
> +		fi
> +		start=20
> +		stop=20
> +		if [ $# -gt 1 ]; then
> +			start=$2
> +			stop=$2
> +		fi
> +		if [ $# -gt 2 ]; then
> +			stop=$3
> +		fi
> +		start=`printf %02d $start`
> +		stop=`printf %02d $stop`
> +		stoplinks="0/$stop 1/$stop 6/$stop"
> +		startlinks="2/$start 3/$start 4/$start 5/$start"
> +		makelinks
> +		;;
> +
> +	start | stop)
> +		while [ $# -gt 0 ]; do
> +			if [ $1 = "start" ]; then
> +				letter=S
> +			elif [ $1 = "stop" ]; then
> +				letter=K
> +			else
> +				echo "expected start or stop" >&2
> +				usage
> +				exit 1
> +			fi
> +			shift
> +			NN=`printf %02d $1`
> +			shift
> +			while [ "x$1" != "x." ]; do
> +				if [ $# -eq 0 ]; then
> +					echo "action with list of runlevels not terminated by \`.'" >&2
> +					exit 1
> +				fi
> +				level=$1
> +				shift
> +				case $letter in
> +					S) startlinks="$startlinks $level/$NN" ;;
> +					K) stoplinks="$stoplinks $level/$NN" ;;
> +				esac
> +			done
> +			shift
> +		done
> +		makelinks
> +		;;
> +
> +	*)
> +		usage
> +		exit 1
> +		;;
> +esac
> diff --git a/recipes/update-rc.d/update-rc.d_0.7.bb b/recipes/update-rc.d/update-rc.d_0.7.bb
> index b36b8ca..43ebd04 100644
> --- a/recipes/update-rc.d/update-rc.d_0.7.bb
> +++ b/recipes/update-rc.d/update-rc.d_0.7.bb
> @@ -2,13 +2,14 @@ SECTION = "base"
>  PRIORITY = "standard"
>  DESCRIPTION = "Manage symlinks in /etc/rcN.d"
>  LICENSE = "GPLv2+"
> -S = "${WORKDIR}/update-rc.d"
> +S = "${WORKDIR}"
> +# S = "${WORKDIR}/update-rc.d"
>  INHIBIT_DEFAULT_DEPS = "1"
> -PR = "r1"
> +PR = "r2"
>  
>  BBCLASSEXTEND = "native"
>  
> -SRC_URI = "${HANDHELDS_CVS};module=apps/update-rc.d;tag=r0_7 \
> +SRC_URI = "file://update-rc.d \
>             file://add-verbose.patch"
>  
>  PACKAGE_ARCH = "all"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFM6i7NMkyGM64RGpERAlYCAJ9y0f7oLFE5gxZi9pbvQ+P8NCNPOQCgukWC
I6KRX7XYgJeIXjEitRxfgyg=
=npja
-----END PGP SIGNATURE-----



