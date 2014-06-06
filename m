Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6D82F6FCB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 10:54:10 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wsrmk-000715-EV for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jun 2014 12:54:10 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 12:54:10 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jun 2014 12:54:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 06 Jun 2014 12:53:59 +0200
Message-ID: <lms6k7$tb1$1@ger.gmane.org>
References: <1402049928-10313-2-git-send-email-yaoxp@cn.fujitsu.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1402049928-10313-2-git-send-email-yaoxp@cn.fujitsu.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe][PATCH] lvm2.inc: EXTRA_OECONF is been overwrited.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jun 2014 10:54:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yao Xinpan schreef op 06-06-14 12:18:
> EXTRA_OECONF has been assigned before ‘EXTRA_OECONF =
> "--with-usrlibdir=${libdir}"’. collaps the 2 lines into a single
> EXTRA_OECONF.

Minor nit: the commit summary could be written as

'lvm2: don't overrwrite EXTRA_OECONF

> 
> Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com> --- 
> meta-oe/recipes-support/lvm2/lvm2.inc | 2 +- 1 file changed, 1
> insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc index c6a9ec0..5f77fe6 100644 ---
> a/meta-oe/recipes-support/lvm2/lvm2.inc +++
> b/meta-oe/recipes-support/lvm2/lvm2.inc @@ -28,6 +28,7 @@ EXTRA_OECONF =
> "--with-user= \ --enable-pkgconfig \ --enable-dmeventd \ 
> --with-udev-prefix= \ +                --with-usrlibdir=${libdir} \ "
> 
> PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux',
> 'selinux', '', d)}" @@ -47,4 +48,3 @@ FILES_${PN} +=
> "${libdir}/device-mapper/*.so ${base_libdir}/udev" FILES_${PN}-dbg +=
> "${libdir}/device-mapper/.debug"
> 
> RDEPENDS_${PN} = "bash" -EXTRA_OECONF = "--with-usrlibdir=${libdir}"

The patch itself looks good.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTkZ3HMkyGM64RGpERAjfhAJ4s1w90KTzPYajHI6Joe7Cww8VF/ACfdgO5
3PqFp52Qkkg4/RO/7W7PCys=
=RBeY
-----END PGP SIGNATURE-----


