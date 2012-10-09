Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLapk-0005Vh-NQ for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 16:30:56 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TLad9-00063b-2K for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2012 16:17:55 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 16:17:55 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 16:17:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 09 Oct 2012 16:17:43 +0200
Message-ID: <k51bm2$h7r$1@ger.gmane.org>
References: <1349784265-25901-1-git-send-email-mertsas@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1349784265-25901-1-git-send-email-mertsas@cisco.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH] libftdi: Change to use GPLv2 intead of GPLv2-REL
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
X-List-Received-Date: Tue, 09 Oct 2012 14:30:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-10-12 14:04, Martin Ertsaas schreef:
> According to http://www.intra2net.com/en/developer/libftdi/, libftdi
> itself is licensed under LGPLv2, with some parts (eeprom programmer) is
> licensed under GPLv2. There doesn't seem to be any part licensed under a
> GPLv2-REL variation of GPLv2, and so we should use GPLv2 instead of
> GPLv2-REL.
> 
> Signed-off-by: Martin Ertsaas <mertsas@cisco.com> --- 
> meta-oe/recipes-support/libftdi/libftdi_0.19.bb |    2 +- 1 files
> changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
> b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb index 2dba3f4..0842aaf
> 100644 --- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb +++
> b/meta-oe/recipes-support/libftdi/libftdi_0.19.bb @@ -4,7 +4,7 @@
> including the popular bitbang mode." HOMEPAGE =
> "http://www.intra2net.com/en/developer/libftdi/" SECTION = "libs"
> 
> -LICENSE = "LGPLv2.1 GPLv2-RLE" +LICENSE = "LGPLv2.1 GPLv2" 
> LIC_FILES_CHKSUM=
> "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe \ 
> file://COPYING.LIB;md5=db979804f025cf55aabec7129cb671ed \ "

Since LICENSE ends up in the package: missing PR bump.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQdDIGMkyGM64RGpERAlaLAKCCNbr1Tcydi+Re/9Wdoc/zKVibKwCgi2bH
MOFVynH6iiHafgC1/70Fq/M=
=PGD4
-----END PGP SIGNATURE-----



