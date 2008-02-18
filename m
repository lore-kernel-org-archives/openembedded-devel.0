Received: from [64.233.182.186] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JRCaN-0006mh-Gy
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Feb 2008 21:27:37 +0100
Received: by nf-out-0910.google.com with SMTP id h3so632037nfh.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Feb 2008 12:26:51 -0800 (PST)
Received: by 10.78.14.13 with SMTP id 13mr9832055hun.48.1203366409564;
	Mon, 18 Feb 2008 12:26:49 -0800 (PST)
Received: from widy.localdomain ( [88.231.76.37])
	by mx.google.com with ESMTPS id h6sm830923nfh.30.2008.02.18.12.26.46
	(version=SSLv3 cipher=OTHER); Mon, 18 Feb 2008 12:26:48 -0800 (PST)
Date: Mon, 18 Feb 2008 22:27:16 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080218222716.7fb73014@widy.localdomain>
In-Reply-To: <200802182052.30981.mickey@vanille-media.de>
References: <200802182052.30981.mickey@vanille-media.de>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 64.233.182.186
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: mickey@vanille-media.de
Subject: Re: DISTRO override logic in angstrom.inc
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
X-List-Received-Date: Mon, 18 Feb 2008 20:27:37 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 18 Feb 2008 20:52:30 +0100
Michael 'Mickey' Lauer <mickey@vanille-media.de> wrote:

> Not having paid close attention to the "A case for user distro"
> thread, I was quite surprised when today the OpenMoko distro override
> no longer worked.
> 
> OpenMoko bases on angstrom and subsequently includes angstrom.inc
> which forcefully sets DISTRO = angstrom. I wonder whether this is a
> bit too violent against sharing files.
> 
> I had to 
> 
> -OVERRIDES = "local:${MACHINE}:${DISTRO}:angstrom:${TARGET_OS}:
> ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> +OVERRIDES = "local:${MACHINE}:openmoko:angstrom:${TARGET_OS}:
> ${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"
> 
> to get the wanted behaviour back.

Hm, but that only shows that overriding DISTRO is indeed weird thing
which can lead to complex include file interactions. So, how it was
before is:

1. openmoko.conf includes angstrom-2007-for-openmoko.inc which
indirectly includes angstrom.inc which overrides DISTRO.
2. Then, openmoko.conf had DISTRO="openmoko" which looked like null
assignment, but actually re-set DISTRO after angstrom.inc's deeds.

Well, I went over all distro confs and removed everything which looked
like empty assignments, who could imagine there's such imperative logic
based on include order happens with OpenMoko? I'm sorry for the hassle
this caused, but in the end Angstrom seems to be the offender as the
only distro which plays tricks with DISTRO.

I believe the OVERRIDES update above is the correct and reliable
solution to this issue, and would like to propose that we finished with
this DISTRO override cleanup:

1. Treat DISTRO as the input-only parameter from user, and thus ban
assignments to it.
2. Make Angstrom to use OVERRIDES like above.

I don't know if Angstrom relies somewhere else on DISTRO to be
overriden, but that can, and should be fixed too (usage in OVERRIDES
apparently should be the most heavy assumption).

I also think that using literal values like "openmoko" and "angstrom"
is the right way, though for completeness, here's version with extra
indirection. In bitbake.conf:

DISTRO_OVERRIDE = ${DISTRO}
OVERRIDES =
"local:${MACHINE}:${DISTRO_OVERRIDES}:${TARGET_OS}:${TARGET_ARCH}:build-${BUILD_OS}:fail-fast:pn-${PN}"

Then distros which need that can use DISTRO_OVERRIDE :=

Again, IMHO that just complicates the matter.

> 
> :M:
> 
> -- 
> Dr. Michael 'Mickey' Lauer | IT-Freelancer |
> http://www.vanille-media.de
[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


