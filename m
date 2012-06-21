Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ShlqS-0005Kw-0f for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 20:11:04 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Shlfz-0003zG-AO for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jun 2012 20:00:15 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:00:15 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:00:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 21 Jun 2012 19:59:59 +0200
Message-ID: <jrvnev$vv$1@dough.gmane.org>
References: <1340025471-3337-1-git-send-email-schnitzeltony@googlemail.com>
	<20120621073000.GE9352@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <20120621073000.GE9352@jama.jama.net>
X-Enigmail-Version: 1.4.1
Subject: Re: [meta-oe] libjpeg-turbo: update 1.2.1 / use version 8d to follow oe-core libjpeg update
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
X-List-Received-Date: Thu, 21 Jun 2012 18:11:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-06-12 09:30, Martin Jansa schreef:
> On Mon, Jun 18, 2012 at 03:17:51PM +0200, Andreas Müller wrote:
>> without following oe-core's version PREFERRED_PROVIDER_jpeg does not
>> work and libjpeg is build.
> 
> Hi,
> 
> this upgrade is causing many runtime dep issues, because libjpeg-turbo
> package now has not only: /usr/lib/libjpeg.so.8
> /usr/lib/libjpeg.so.8.0.2 but also: /usr/lib/libturbojpeg.so.0
> /usr/lib/libturbojpeg.so.0.0.0
> 
> http://git.shr-project.org/git/?p=buildhistory.git;a=blobdiff;f=packages/armv4t-oe-linux-gnueabi/libjpeg-turbo/libjpeg-turbo/latest;h=e449fd892c297995bf2f6a856eb875f7b5df42c0;hp=fdc1ae08fa4dbbf180b8d1e0b7ed54acb5a6743a;hb=9fe63f73e65260b6c8a3dfa5c488dac046667bba;hpb=10a01924024d30e90c9663c1317472830395f486
>
>  so packages got renamed from 
> ./067/ipk/armv7a-vfp-neon/libjpeg8_8c+1.2.0-r0_armv7a-vfp-neon.ipk 
> ./067/ipk/armv7a-vfp-neon/libturbojpeg_8c+1.2.0-r0_armv7a-vfp-neon.ipk to
> packages 
> ./068/ipk/armv7a-vfp-neon/libjpeg-turbo_8d+1.2.1-r0_armv7a-vfp-neon.ipk 
> ./068/ipk/armv7a-vfp-neon/libturbojpeg_8d+1.2.1-r0_armv7a-vfp-neon.ipk
> 
> and runtime deps like "libjpeg8 (>= 8c+1.2.0)" are not satisfied anymore 
> (e.g. do_rootfs fails).
> 
> Don't know why packaging is not showing warning about multiple .sonames 
> and asking for LEAD_SONAME :/.
> 
> Will send patch for it in few minutes.

crap,I had the same problem with the version I did and didn't check if this
patch also suffered from that problem.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP42EfAAoJEHZqAkdh1vT6oB4P/2dYmyOwiRdfqBWH/TL2a1+B
JpyATgj8YzBy7k4v6np8ZTmU9u14QWTQetjMrNp2jVSWK9J5Up41CsTilSk4cGej
sKfhciaR5aTtmjGQ7U3uKl5q4Jp+UCmuZEccHkXBRtEVsAz1DeOXXnlcPzzwwE+v
z5MS8GQmrpga3Q4Lqx6NGXgJvjLwXtJqjBY4g5P+9EAqPOSR0/3DvDljYTsyvWp0
7CQhzRkr1D+Tv05n/QctQoaMNgIuWxNYQWOt90SSIOE7qkmm0VM6OZy5Np/pGiHh
egp+lqnptDHDdfwZz7boRZzZr//GlxsoT0D2PtLYSMRbbEwsZWdT9fXKY+q1cKx8
T8X3Gx/Hq/uyHK7FE5Cy72XegLbzRTH49/AbuHJBKVns+AL1+ZyBWkgHhP/eyHfW
RkCwaoYq8mEhlRUUZeMRXzfdN5LQ/KNMPo841gvo3TwRiSJsTf185isYek5UE2UU
i0CcgBh+lX+42/zKM7MVeqfF0npgqyTE0dk6QODjupL3WDBWjOCuQTzl4xAsRQib
+zCMSodgRhhUEYfvC3HQUhi2iZkuZ7L0Ks44xlw79lW1BK0MLWLmKWSJl0DTTZp7
XrMpuKb9PYGj32tf2Ce0GhRngq2HzAtgPnvzgVMzdUDqdgwoRmQWNVarBi0V18Yh
7JhWxRRInETznzbXAhLR
=PDS5
-----END PGP SIGNATURE-----



