Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9aGh-0001zb-FN for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:29:07 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9a4f-000327-Bt for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 13:16:41 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 13:16:41 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 13:16:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 06 Sep 2012 13:16:36 +0200
Message-ID: <k2a0m9$1it$1@ger.gmane.org>
References: <1346858494-4849-1-git-send-email-ml@communistcode.co.uk>
	<1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346858494-4849-2-git-send-email-ml@communistcode.co.uk>
X-Enigmail-Version: 1.4.4
Subject: Re: [PATCHv4 2/3] liblockdev: new recipe, new version of libcec requires it
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
X-List-Received-Date: Thu, 06 Sep 2012 11:29:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-09-12 17:21, ml@communistcode.co.uk schreef:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> V4
> 
> - Remove debian packaging patch, it is not needed
> 
> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk> --- 
> .../liblockdev/liblockdev_1.0.3.bb                 | 26
> ++++++++++++++++++++++ 1 file changed, 26 insertions(+) create mode
> 100644 meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
> 
> diff --git a/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb
> b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb new file mode
> 100644 index 0000000..be5ce44 --- /dev/null +++
> b/meta-oe/recipes-extended/liblockdev/liblockdev_1.0.3.bb @@ -0,0 +1,26
> @@ +DESCRIPTION = "Manage character and block device lockfiles." 
> +HOMEPAGE =
> "http://anonscm.debian.org/gitweb/?p=lockdev/lockdev.git;a=summary" + 
> +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=d8045f3b8f929c1cb29a1e3fd737b499" + +PV = "1.0.3"

That's superfluous


> +FILES_{PN} = "${includedir}/* \ +              ${libdir}/* \ +"

This concerns me, what is going wrong in the regular FILES_${PN} situation?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQSIYUMkyGM64RGpERAq3vAJ9JrlmJY5WRA4sKpp1xs+m5jcQCdwCfSgmr
u+zcjBy1Y1NbD+muNrVgCts=
=11Ia
-----END PGP SIGNATURE-----



