Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7607665D8C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 12:24:49 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WXV4z-0007fP-8Y for openembedded-devel@lists.openembedded.org;
	Tue, 08 Apr 2014 14:24:41 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 14:24:41 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 14:24:41 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 08 Apr 2014 14:24:32 +0200
Message-ID: <li0ppv$tv0$1@ger.gmane.org>
References: <1396957806-7835-1-git-send-email-Christian.Ziethen@enea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
In-Reply-To: <1396957806-7835-1-git-send-email-Christian.Ziethen@enea.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-networking][PATCH] Incrementing dnsmasq version to address a bug with libvirt and DHCP.
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
X-List-Received-Date: Tue, 08 Apr 2014 12:24:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Christian Ziethén schreef op 08-04-14 13:50:

> Subject: Incrementing dnsmasq version to address a bug with libvirt and
> DHCP.

The OE styleguide says the commit summary should look like this:

	dnsmasq: update to 2.68 to fix a bug with libvirt and DHCP

And if would be nice if you can state what that bug was in the commit log.

> 
> Signed-off-by: Christian Ziethén <Christian.Ziethen@enea.com> --- 
> meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb |    4 ---- 
> meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb |    4 ++++ 2
> files changed, 4 insertions(+), 4 deletions(-) delete mode 100644
> meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb create mode
> 100644 meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> 
> diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb
> b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb deleted file
> mode 100644 index 2df3713..0000000 ---
> a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.63.bb +++ /dev/null 
> @@ -1,4 +0,0 @@ -require dnsmasq.inc - -SRC_URI[dnsmasq-2.63.md5sum] =
> "43e771997615ebcd8f6c6ffa60c3e40b" -SRC_URI[dnsmasq-2.63.sha256sum] =
> "fd86e3bcc6a63c76e35e4a20baa790e7bbbfc7b43845cae85ca8ffd024467710" diff
> --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb
> b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb new file mode
> 100644 index 0000000..651c304 --- /dev/null +++
> b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.68.bb @@ -0,0 +1,4
> @@ +require dnsmasq.inc + +SRC_URI[dnsmasq-2.63.md5sum] =
> "6f8351ca0901f248efdb81532778d2ef" +SRC_URI[dnsmasq-2.63.sha256sum] =
> "402019d61f53f1ccc04cc6218719fd3b158ea3fca9a83ab55471f981a2097c2f"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTQ+p/MkyGM64RGpERApogAJ0dFnpj5z5+j173AaYJUWDtDYC1TQCgiVNX
cpQyNpJHFEcv6uqeHfCymuc=
=PnyA
-----END PGP SIGNATURE-----


