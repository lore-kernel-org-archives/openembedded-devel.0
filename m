Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>)
	id 1IFlvg-0000g2-8M; Tue, 31 Jul 2007 09:14:04 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6V7CD1R012748; Tue, 31 Jul 2007 09:12:13 +0200
Message-ID: <46AEE0CC.8000605@dominion.kabel.utwente.nl>
Date: Tue, 31 Jul 2007 09:12:12 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IFdTE-0007J2-8h@linuxtogo.org>
In-Reply-To: <E1IFdTE-0007J2-8h@linuxtogo.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Michael Lauer <mickey@vanille-media.de>,
	openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev sane-srcdates.inc: openmoko*: add SRCDATE =	now until the integration work for new OpenMoko stuff has been done.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2007 07:14:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl commit schreef:
> sane-srcdates.inc: openmoko*: add SRCDATE = now until the integration work for new OpenMoko stuff has been done.

> +# OpenMoko
> +SRCDATE_libgsmd ?= "now"
> +SRCDATE_libmokogsmd2 ?= "now"
> +SRCDATE_libmokoui2 ?= "now"
> +SRCDATE_libmokojournal2 ?= "now"
> +SRCDATE_libmokopanelui2 ?= "now"
> +SRCDATE_openmoko-today2 ?= "now"
> +SRCDATE_openmoko-dialer2 ?= "now"
> +SRCDATE_openmoko-contacts2 ?= "now"
> +
> +SRCDATE_openmoko-panel-battery ?= "now"
> +SRCDATE_openmoko-panel-clock ?= "now"
> +SRCDATE_openmoko-panel-gsm ?= "now"
> +SRCDATE_openmoko-panel-usb ?= "now"
> +SRCDATE_openmoko-panel-bt ?= "now"
> +SRCDATE_openmoko-panel-gps ?= "now"

SRC_DATE="now" is *never* *ever* sane, so please move this to a different file and include
it in conf/distro/openmoko.conf instead of forcing *everyone* to build broken packages
(openmoko-foo_0.1.0+svnnow.ipk) that can't be upgraded.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGruDMMkyGM64RGpERAi/hAJ0WZSCgwqaLRIY/B1btMmd3SMZ4VgCgjDQx
gp1IydvPQ7rlRVnPQvSFIMk=
=03iq
-----END PGP SIGNATURE-----


