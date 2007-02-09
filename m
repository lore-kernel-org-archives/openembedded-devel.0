Received: from [83.151.25.170] (helo=srv043.dedi23.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@vanille-media.de>) id 1HFfZi-0002Ih-4d
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Feb 2007 00:54:42 +0100
Received: by srv043.dedi23.de (Postfix, from userid 65534)
	id AF33528C012; Sat, 10 Feb 2007 00:49:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.1.7 (2006-10-05) on srv043.dedi23.de
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=RCVD_IN_NJABL_DUL,
	RCVD_IN_SORBS_DUL autolearn=no version=3.1.7
Received: from [192.168.2.128] (e180176234.adsl.alicedsl.de [85.180.176.234])
	by srv043.dedi23.de (Postfix) with ESMTP id F03DC28C011
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Feb 2007 00:49:28 +0100 (CET)
Date: Sat, 10 Feb 2007 00:54:41 +0100
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
X-Mailer: The Bat! (v3.95.6) Professional
Organization: Vanille-Media
X-Priority: 3 (Normal)
Message-ID: <1642991562.20070210005441@vanille-media.de>
To: Michael 'Mickey' Lauer <openembedded-devel@lists.openembedded.org>
In-Reply-To: <E1HFetV-00006y-I4@linuxtogo.org>
References: <E1HFetV-00006y-I4@linuxtogo.org>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev packages/libgpelaunch/libgpelaunch_svn.bb
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
X-List-Received-Date: Fri, 09 Feb 2007 23:54:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

philippe commit wrote:
> --- packages/libgpelaunch/libgpelaunch_svn.bb
> 6ed0bcd177f121a099e8f426711856a18f78b5b2
> +++ packages/libgpelaunch/libgpelaunch_svn.bb  
> 6ed0bcd177f121a099e8f426711856a18f78b5b2
> @@ -0,0 +1,21 @@
> +MAINTAINER = "Philippe De Swert <philippedeswert@scarlet.be>"

We no longer use the MAINTAINER field in .bb's. Please remove it.

> +LICENSE = "LGPL"
> +DESCRIPTION = "GPE program launcher library"
> +SECTION = "libs"
> +DEPENDS = "gtk+ startup-notification"
> +PR = "r0"
> +PV = "0.14+svn${SRCDATE}"
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +SRC_URI =
> "svn://projects.linuxtogo.org/svn/gpe/trunk/base;module=${PN}"
> +
> +S = "${WORKDIR}/${PN}"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN}-dbg += "/usr/libexec/libgpelaunch/.debug"
> +
> +do_stage() {
> +       autotools_stage_all
> +}

If you add new recipes, please run them through oe-stylize. We have
defined some best practices for metadata order and style.

Thanks,


Regards,

:M:
-- 
Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de



