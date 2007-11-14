Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IsFZW-0002ox-7L
	for openembedded-devel@openembedded.org; Wed, 14 Nov 2007 11:34:14 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAEAWXZn009375 for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2007 11:32:34 +0100
Message-ID: <473ACEC2.2010605@student.utwente.nl>
Date: Wed, 14 Nov 2007 11:32:34 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IsEEa-00018Z-9f@linuxtogo.org>
In-Reply-To: <E1IsEEa-00018Z-9f@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev disapproval of revision	'9430cfa5a334ac688d23932a066f6495abfa4709'
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
X-List-Received-Date: Wed, 14 Nov 2007 10:34:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

koen commit schreef:
> disapproval of revision '9430cfa5a334ac688d23932a066f6495abfa4709'

See yesterday's IRC discussion and commits, the matchbox-<foo>-2 commit
history and
http://lists.linuxtogo.org/pipermail/angstrom-distro-devel/2007-November/000900.html
to see why RPROVIDES+RREPLACES is a deadly combo


> Author: koen@openembedded.org
> Branch: org.openembedded.dev
> Revision: 3427857ae867148c9cee6fd31cb4e0c9e020553d
> ViewMTN: http://monotone.openembedded.org/revision/info/3427857ae867148c9cee6fd31cb4e0c9e020553d
> Files:
> 1
> packages/openmoko2/openmoko-session2.bb
> Diffs:
> 
> #
> # mt diff -r9430cfa5a334ac688d23932a066f6495abfa4709 -r3427857ae867148c9cee6fd31cb4e0c9e020553d
> #
> # 
> # 
> # patch "packages/openmoko2/openmoko-session2.bb"
> #  from [6a49d5ee5cf7764ce7cabf3a367907f08278c1dc]
> #    to [f6635b41edbfb8e7f33d5335810429dd06cb03a5]
> # 
> ============================================================
> --- packages/openmoko2/openmoko-session2.bb	6a49d5ee5cf7764ce7cabf3a367907f08278c1dc
> +++ packages/openmoko2/openmoko-session2.bb	f6635b41edbfb8e7f33d5335810429dd06cb03a5
> @@ -1,11 +1,10 @@ RDEPENDS += "openmoko-common2 openmoko-t
>  DESCRIPTION = "Custom Matchbox session files for OpenMoko"
>  LICENSE = "GPL"
>  SECTION = "x11"
>  RDEPENDS = "matchbox-applet-startup-monitor matchbox-panel-2"
>  RDEPENDS += "openmoko-common2 openmoko-today2 openmoko-dialer2"
> -RREPLACES = "openmoko-session matchbox-common"
> -RPROVIDES = "matchbox-common"
> -PR = "r42"
> +RCONFLICTS_${PN} = "openmoko-session matchbox-common"
> +PR = "r41"
>  
>  SRC_URI = "\
>    file://etc \
> 
> 
> 
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHOs7CMkyGM64RGpERApomAJ0ZJxiVylbGFNv30BPw6wQhWohttwCghUp6
lCmPQQ500In5yvJwo1k6FOQ=
=qyIu
-----END PGP SIGNATURE-----


