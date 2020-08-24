Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web11.190978.1598258027880310486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 01:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=iBEJXJF8;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598258028; x=1629794028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NSvViaiTuIdzdnEvFCq7gc+f8og/ZUHsuF82oXJ5Qcg=;
  b=iBEJXJF8LpI3qRFYh/VT6V8jQOTPZNBDxpYTMLl7pPbkLY25b+VYlRDx
   IrZ9A0v1MrU3dhQ54hVy5gLyqo7bfdKyGOAFrFb4shAMDBuNbtSXYoBW+
   FgtVij0DD+zXrnlAuKtDY+LTr93dFCaN2ef10u2ExtZpeJ1sMK4wzjOHR
   xdOWseA9/woXiiSh+jeGeKe4Yts3CvOwdwkE2uE65pYuKDbw/JxI8wvVT
   pJ/WShFL7tBFPN29sREEMPRwRhrCq6n6uXcYy0/+6mMbUSIB6DYZi6ev+
   acLoHtsNQH5CtgRRGgcZKfC7OW3zsxel4xQpyAsn5mwAdk/gVPsbMtJzg
   g==;
IronPort-SDR: 31MvT2vwXx51HkeEFGsHshS+5LXe5AHL0wE64e6DSxuBQUQIJgTawI86nOHQ2BmI0SZcdtrOoD
 eduO+bzXp67gW0/egZfdiwX5HQMKxcWCIwIQ6kXUd9wD/RYI+A3GJGtt1y1gmxEhrbGGp6nkU+
 43oIdZYskVUDN2jLF/MByc+kJOcNxJtsAio+UD2JYWoXWFKWoIGf61CBqv10M9ExBGNZy0x/aa
 GxH9DR1uUK45eOwaZqbVM0wBNFsV2/75GT3VkoqkDVuLx/KCa6RSXaal+iuT2DUv85+sUDwskq
 FTM=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26329913"
Date: Mon, 24 Aug 2020 10:33:45 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
Message-ID: <20200824083345.GG65616@pcleri>
References: <20200824062225.GD65616@pcleri>
 <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
MIME-Version: 1.0
In-Reply-To: <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 09:50:41AM +0200, Jacob Kroon wrote:
>=20
> After updating master I'm getting:
>=20
> > WARNING: openjdk-8-native-265-r0 do_fetch: Failed to fetch URL https://=
hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilenam=
e=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk, attempting MIRRO=
RS if available
> > ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure: Fetch command=
 export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export DBUS_=
SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export SSH_AUTH_SOC=
K=3D"/run/user/1000/keyring/ssh"; export PATH=3D"/home/jkroon/Projects/foo-=
linux/openembedded-core/scripts/native-intercept:/home/jkroon/Projects/foo-=
linux/openembedded-core/scripts:/tmp/ramdisk/foo-linux-master-glibc/work/x8=
6_64-linux/openjdk-8-native/265-r0/recipe-sysroot-native/usr/bin/x86_64-lin=
ux:/tmp/ramdisk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/2=
65-r0/recipe-sysroot-native/usr/bin:/tmp/ramdisk/foo-linux-master-glibc/wor=
k/x86_64-linux/openjdk-8-native/265-r0/recipe-sysroot-native/usr/sbin:/tmp/=
ramdisk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/re=
cipe-sysroot-native/usr/bin:/tmp/ramdisk/foo-linux-master-glibc/work/x86_64=
-linux/openjdk-8-native/265-r0/recipe-sysroot-native/sbin:/tmp/ramdisk/foo-=
linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/recipe-sysroot=
-native/bin:/home/jkroon/Projects/foo-linux/bitbake/bin:/tmp/ramdisk/foo-li=
nux-master-glibc/hosttools"; export HOME=3D"/home/jkroon"; /usr/bin/env wge=
t -t 2 -T 30 --passive-ftp --no-check-certificate -O /home/jkroon/Downloads=
/yocto/openjdk8-265-jdk8u-jdk8u265-ga.tar.bz2 -P /home/jkroon/Downloads/yoc=
to 'https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2' --=
progress=3Ddot -v failed with exit code 4, output:
> > --2020-08-24 07:30:12--  https://hg.openjdk.java.net/jdk8u/jdk8u/archiv=
e/jdk8u265-ga.tar.bz2
> > Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
> > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:=
443... connected.
> > HTTP request sent, awaiting response... Read error (Success.) in header=
s.
> > Retrying.
> >=20
> > --2020-08-24 07:30:44--  (try: 2)  https://hg.openjdk.java.net/jdk8u/jd=
k8u/archive/jdk8u265-ga.tar.bz2
> > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:=
443... connected.
> > HTTP request sent, awaiting response... Read error (Success.) in header=
s.
> > Giving up.
> >=20
> >=20
> > ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure for URL: 'http=
s://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfil=
ename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk'. Unable to f=
etch URL from any source.
> > ERROR: Logfile of failure stored in: /tmp/ramdisk/foo-linux-master-glib=
c/work/x86_64-linux/openjdk-8-native/265-r0/temp/log.do_fetch.756296
> > ERROR: Task (/home/jkroon/Projects/foo-linux/build/../meta-java/recipes=
-core/openjdk/openjdk-8-native_265.bb:do_fetch) failed with exit code '1'
> > WARNING: openjre-8-265-r0 do_fetch: Failed to fetch URL https://hg.open=
jdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dope=
njdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk, attempting MIRRORS if a=
vailable
> > ERROR: openjre-8-265-r0 do_fetch: Fetcher failure: Fetch command export=
 PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export DBUS_SESSION=
_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export SSH_AUTH_SOCK=3D"/r=
un/user/1000/keyring/ssh"; export PATH=3D"/home/jkroon/Projects/foo-linux/o=
penembedded-core/scripts:/tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-l=
inux/openjre-8/265-r0/recipe-sysroot-native/usr/bin/i686-oe-linux:/tmp/ramd=
isk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sysro=
ot/usr/bin/crossscripts:/tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-li=
nux/openjre-8/265-r0/recipe-sysroot-native/usr/sbin:/tmp/ramdisk/foo-linux-=
master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sysroot-native/usr/=
bin:/tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0=
/recipe-sysroot-native/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/i686-o=
e-linux/openjre-8/265-r0/recipe-sysroot-native/bin:/home/jkroon/Projects/fo=
o-linux/bitbake/bin:/tmp/ramdisk/foo-linux-master-glibc/hosttools"; export =
HOME=3D"/home/jkroon"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-chec=
k-certificate -O /home/jkroon/Downloads/yocto/openjdk8-265-jdk8u-jdk8u265-g=
a.tar.bz2 -P /home/jkroon/Downloads/yocto 'https://hg.openjdk.java.net/jdk8=
u/jdk8u/archive/jdk8u265-ga.tar.bz2' --progress=3Ddot -v failed with exit c=
ode 4, output:
> > --2020-08-24 07:31:15--  https://hg.openjdk.java.net/jdk8u/jdk8u/archiv=
e/jdk8u265-ga.tar.bz2
> > Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
> > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:=
443... connected.
> > HTTP request sent, awaiting response... Read error (Success.) in header=
s.
> > Retrying.
> >=20
> > --2020-08-24 07:31:47--  (try: 2)  https://hg.openjdk.java.net/jdk8u/jd=
k8u/archive/jdk8u265-ga.tar.bz2
> > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.63|:=
443... connected.
> > HTTP request sent, awaiting response... Read error (Success.) in header=
s.
> > Giving up.
> >=20
> >=20
> > ERROR: openjre-8-265-r0 do_fetch: Fetcher failure for URL: 'https://hg.=
openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=
=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk'. Unable to fetch =
URL from any source.
> > ERROR: Logfile of failure stored in: /tmp/ramdisk/foo-linux-master-glib=
c/work/i686-oe-linux/openjre-8/265-r0/temp/log.do_fetch.756297
> > ERROR: Task (/home/jkroon/Projects/foo-linux/build/../meta-java/recipes=
-core/openjdk/openjre-8_265.bb:do_fetch) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3854 tasks of which 3586 didn't need to =
be rerun and 2 failed.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 1 seconds
> >=20
> > Summary: 2 tasks failed:
> >   /home/jkroon/Projects/foo-linux/build/../meta-java/recipes-core/openj=
dk/openjdk-8-native_265.bb:do_fetch
> >   /home/jkroon/Projects/foo-linux/build/../meta-java/recipes-core/openj=
dk/openjre-8_265.bb:do_fetch
> > Summary: There were 2 WARNING messages shown.
> > Summary: There were 4 ERROR messages shown, returning a non-zero exit c=
ode.


It seems Oracle shut down the complete java.net site...

"We're sorry the java.net site has closed.

Most Open Source projects previously hosted on java.net have been
relocated. Please contact the corresponding project administrator for
relocation information."

Does anybody know where the official repository was relocated to?

The only thing I'm aware of is the read only mirror at
https://github.com/openjdk/jdk which doesn't host the jdk8u AFAIK...

regards;rl

