Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1wqP-0006kq-Ic for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:21:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q1wof-0006ev-Mq for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 09:19:49 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:19:49 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 09:19:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 22 Mar 2011 09:19:38 +0100
Message-ID: <im9m2q$pse$1@dough.gmane.org>
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-2-git-send-email-heinold@inf.fu-berlin.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1300780910-28866-2-git-send-email-heinold@inf.fu-berlin.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/3] libatomic-ops: switch to own directroy and use cvs version
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
X-List-Received-Date: Tue, 22 Mar 2011 08:21:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-03-11 09:01, heinold@inf.fu-berlin.de wrote:
> From: Henning Heinold <heinold@inf.fu-berlin.de>


> +++ b/recipes/libatomic-ops/libatomic-ops_cvs.bb
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "A library for atomic integer operations"
> +LICENSE = "MIT"
> +
> +PV = "4.0+cvs${SRCDATE}"
> +
> +SRC_URI = "cvs://anonymous@bdwgc.cvs.sourceforge.net/cvsroot/bdwgc;module=bdwgc"
> +
> +S = "${WORKDIR}/bdwgc/libatomic_ops/"
> +
> +inherit autotools pkgconfig
> +
> +# Allow empty package to fix SDK depchains
> +ALLOW_EMPTY_${PN} = "1"
> +
> +FILES_${PN}-doc += "${datadir}/libatomic_ops/COPYING ${datadir}/libatomic_ops/*.txt"

Where are you setting SRCDATE for this recipe?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNiFuaMkyGM64RGpERAkn6AKC5bgVE7shDA6lUCMmPVjP4NdqaagCfQ4L4
aenatxfKDnffrucGwrGnD7I=
=N/3n
-----END PGP SIGNATURE-----



