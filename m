Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4A13F7EC56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Sep 2019 06:39:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46Lk9845YBz2Y;
	Sun,  1 Sep 2019 08:39:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567319996;
	bh=BnF4uzbA/4l0EgvNPTS0zFMteALrrxVdFpFdjM8WnDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdDkg3FQBlYMU+9+sZQYxMowRncNKdZCFrx13SW70PgpJhXShnDLvAP10qBUGVso9
	S4jX/EifGzjFSyukInNMYPtn48m3Y4nxDioYwyrxDzcEudyxoiWem5rfX1Q0p19iRl
	9625Qsa4Os6jmO6vaqbJ3Loxc+xS4mNIAG88lRZumTdB0nm0bv7A0qrJrKKR1pLbxI
	f/1+jrB+LgwDtuN0FvL8c9IZ469cSloYxIyzXIOJ1GnKgIvGKC1aB9WhY1D00/Tump
	FqcdN13ABh732REG5s75dr0DeS+ebQzxbRzIgZahCMnl7PQKgBZ1Xz7h3UfHxjvWM7
	LfMa3aAIN33ba7esHfn8FbXCn1LgRtwrz6gYrB7MEjcBFY8ebILZVlTaXzTO1d2MLj
	xEmSQVPx5IxuOYvIb61kaFJtgF8SJvd8bHUIXwK4On7YRX5ukZ7oTcWnGOl35Wm5d2
	gNAJvc5as1yaxyy+FIuj7bDclRbar67KIuSh5OVTx3Sq8vCa+3T2Nj5wqw5M67FdI+
	wAWyCsxBW/vTwt/+gdHpTIj5DyX9movm4b+9z5hVWHarJBgVn8jvwyumWFM3x5/QFt
	kfD6y9WRxhe1sITA5XzJovfaOSZNNlCeNd7YV1r7+3BNOcOnwISMV0BrrMq3rOmmCi
	xX3/8S/bcawOY2ZIC8Ndsumw=
Date: Sun, 1 Sep 2019 09:39:54 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Armin Kuster <akuster808@gmail.com>
Message-ID: <20190901063954.GB22307@localhost>
References: <cover.1567286967.git.akuster808@gmail.com>
	<c9e4dfbcc163fdc33f62419b5c65c057c924247d.1567286967.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c9e4dfbcc163fdc33f62419b5c65c057c924247d.1567286967.git.akuster808@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [warrior 04/23] network-manager-applet: Remove obsolete dbus-glib and libnm-glib dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 01 Sep 2019 06:39:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Aug 31, 2019 at 02:31:25PM -0700, Armin Kuster wrote:
> From: Adrian Bunk <bunk@stusta.de>
> 
> network-manager-applet stopped using dbus-glib 3 years ago.
> 
> Building of the obsolete libnm-gtk is disabled by default in 1.8.20.
>...

This commit is not really appropriate for stable branches.

> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
> @@ -2,7 +2,7 @@ SUMMARY = "GTK+ applet for NetworkManager"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  
> -DEPENDS = "gtk+3 libnotify libsecret networkmanager dbus-glib \
> +DEPENDS = "gtk+3 libnotify libsecret networkmanager \
>...

That's a cleanup change removing an unused build dependency with
no (intentional) changes to the built binaries.

> --- a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# networkmanager-applet requires glib support
> -PACKAGECONFIG_append = " glib"
>...

The bbappend might not be nice, but removing it would be a behaviour 
change in a stable branch.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


