Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1IzMLX-0001J0-6S
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2007 02:13:11 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id D876A28C013; Tue,  4 Dec 2007 02:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	srv043.dedi23.de
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=AWL,BAYES_00,RCVD_IN_PBL,
	RCVD_IN_SORBS_DUL,REPTO_OVERQUOTE_THEBAT autolearn=no 
	version=3.1.7-deb
Received: from PROMETHEUS (e180131053.adsl.alicedsl.de [85.180.131.53])
	by srv043.dedi23.de (Postfix) with ESMTP id DA95B28C012;
	Tue,  4 Dec 2007 02:02:53 +0100 (CET)
Date: Tue, 4 Dec 2007 02:09:37 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.99.29) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <138810389.20071204020937@vanille-media.de>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1193675175.6161.60.camel@localhost.localdomain>
References: <1193675175.6161.60.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Staging changes
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
X-List-Received-Date: Tue, 04 Dec 2007 01:13:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> At OEDEM, there was basic agreement amongst the core devs that OE's
> current staging needs to evolve.

> The aim of this evolution is to head towards a staging that looks like
> the target system. This allows using the sysroot options of gcc/binutils
> to help us remove hacks like the symlinks in cross and the sed "magic"
> in pkgconfig.bbclass. In the future is could also lead to a staging task
> which just copies files from ${WORKDIR}/image to staging, speeding up
> builds a lot (make install is slow) as well as giving much more
> possibilities to packaged staging.

> I've had this working up to image generation with Poky. It does work and
> does lead to clean easier to understand build structures. I've pulled
> out a subset of my patches to Poky and checked them into OE. So far
> there are no behaviour changes, just several new variables become
> available to help us try and clean up the current staging references in
> the metadata.

> An example of these cleanups are those I've made to gnome-common as a
> random example:

> --- gnome-common_2.20.0.bb      (revision 2988)
> +++ gnome-common_2.20.0.bb      (working copy)
> @@ -19,7 +19,7 @@
>         rm -rf ${STAGE_TEMP}
>         mkdir -p ${STAGE_TEMP}
>         make DESTDIR="${STAGE_TEMP}" install
> -       cp -pPR ${STAGE_TEMP}${bindir}/* ${STAGING_DIR}/${BUILD_SYS}/bin
> +       cp -pPR ${STAGE_TEMP}${bindir}/* ${STAGING_BINDIR_NATIVE}
>         install -d ${STAGING_DATADIR}/gnome-common
>         install -d ${STAGING_DATADIR}/aclocal
>         cp -pPR ${STAGE_TEMP}${datadir}/gnome-common/* ${STAGING_DATADIR}/gnome-common

> Why? This will break if we switch to /usr/bin...

> The next step is to go through the metadata doing one of two things:

> * correcting things where we have variables we can use
> * listing problem areas (e.g. gcc configure options)

> Bad references which can be grepped for are:

> ${STAGING_DIR}/${BUILD_SYS}
> ${STAGING_DIR}/${HOST_SYS}
> ${STAGING_LIBDIR}/.. (anything with a .. in is likely to cause problems)
> ${STAGING_DIR}

> Python and Perl look like they're going to need special attention.

Right. Basically you have broken everything distutils with some of
these patches :D

Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



