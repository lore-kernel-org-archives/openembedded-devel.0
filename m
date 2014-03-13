Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 859226121F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 08:34:50 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1WO16D-0000Qg-UC for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2014 09:34:45 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:34:45 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:34:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Mar 2014 09:35:15 +0100
Message-ID: <lfrqi9$7ka$1@ger.gmane.org>
References: <1394638020-27867-1-git-send-email-javier.viguera@digi.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
In-Reply-To: <1394638020-27867-1-git-send-email-javier.viguera@digi.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-networking][PATCH] crda: fix udev rule
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
X-List-Received-Date: Thu, 13 Mar 2014 08:34:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Javier Viguera schreef op 12-03-14 16:27:
> The SBINDIR variable in makefile's install rule needs to have a trailing 
> slash so the path to the 'crda' binary in the udev rule is correct.
> 
> Otherwise the udev rule has a wrong path:
> 
> KERNEL=="regulatory*", ACTION=="change", SUBSYSTEM=="platform",
> RUN+="/usr/sbincrda"
> 
> and at runtime udev complains:
> 
> failed to execute '/usr/sbincrda'
> 
> when a regulatory domain event is triggered.

That explains a lot :)

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> 
> Signed-off-by: Javier Viguera <javier.viguera@digi.com> --- 
> meta-networking/recipes-connectivity/crda/crda_1.1.3.bb | 2 +- 1 file
> changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
> b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb index
> bee3e826d9a8..0bb899860bc4 100644 ---
> a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb +++
> b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb @@ -24,7 +24,7
> @@ do_compile() { }
> 
> do_install() { -    oe_runmake SBINDIR=${sbindir} install +    oe_runmake
> SBINDIR=${sbindir}/ install
> 
> install -d ${D}${libdir}/crda/
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTIW3DMkyGM64RGpERAocGAKCiI+ynx1m6Il+BsO6/MzbF9OkHigCfbzN6
HaDitNRN4Xl7pLk1AAlBG5E=
=G2ib
-----END PGP SIGNATURE-----


