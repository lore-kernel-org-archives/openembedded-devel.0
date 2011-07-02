Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qd72g-00006W-Ph for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 22:43:54 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qd6z1-0002UF-D6 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jul 2011 22:40:07 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 22:40:07 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jul 2011 22:40:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 02 Jul 2011 22:37:09 +0200
Message-ID: <iunvhl$mg5$2@dough.gmane.org>
References: <1309624039-3330-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1309624039-3330-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH] systemd: Replace use of %m in printf formats
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
X-List-Received-Date: Sat, 02 Jul 2011 20:43:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-07-11 18:27, Khem Raj schreef:
> The patch is applied optionally only to uclibc builds

> @@ -25,7 +25,10 @@ SRC_URI =
> "git://anongit.freedesktop.org/systemd;protocol=git \ 
> file://0001-systemd-disable-xml-file-stuff-and-introspection.patch \ 
> file://paper-over-mkostemp.patch \ file://use-nonet-for-docbook.patch
> \ +           ${UCLIBCPATCHES} \ " +UCLIBCPATCHES = "" 
> +UCLIBCPATCHES_libc-uclibc = "file://format-replace-m-uclibc.patch"

Can you move mkostemp to UCLIBCPATCHES as well please?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOD4F1MkyGM64RGpERAq3XAKCUQ2ahSrJS/TqYeByoo76QTyMgywCfcqgh
0+qfOI0m2fv8YSby6uvQr5M=
=5xeP
-----END PGP SIGNATURE-----



