Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1JWVdH-0006G3-9N
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 12:48:38 +0100
Received: from andromeda (e180186093.adsl.alicedsl.de [85.180.186.93])
	by drlauer-research.com (Postfix) with ESMTP id 6F7EE584C5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2008 12:53:54 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 4 Mar 2008 12:47:39 +0100
User-Agent: KMail/1.9.9
References: <200803041240.17891.thomas.cooksey@trolltech.com>
In-Reply-To: <200803041240.17891.thomas.cooksey@trolltech.com>
MIME-Version: 1.0
Message-Id: <200803041247.39758.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Missing includes in STAGING_INCDIR
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
X-List-Received-Date: Tue, 04 Mar 2008 11:48:38 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Tom,

On Tuesday 04 March 2008 12:40:17 Tom Cooksey wrote:
> I am writing a recipie for Qt/Embedded 4.4 beta (using qt4 recipies as a
> base). At the moment Qt's configure test fails on dbus. I have added
> -I${STAGING_INCDIR}/dbus-1.0 to the configure flags so the configure test
> now picks up dbus/dbus.h correctly.
>
> However, dbus.h itself includes dbus/dbus-arch-deps.h, which is not in
> ${STAGING_INCDIR}/dbus-1.0/*, but _is_ in the dbus work dir. This means I
> have to add the dbus work dir to the include list, which feels wrong.

Surely that's wrong. Actually dbus-arch-deps.h is where it belongs to, 
${libdir}/dbus-1.0/include/. On my favourite system this is:

tmp/staging/arm-angstrom-linux-gnueabi/lib/dbus-1.0/include/dbus/dbus-arch-deps.h

> I have had the same problem with gstreamer too. I think something has
> broken recently, as I've tried building the existing qtopia core recipies
> and had the same failures.

Just rely on pkgconfig and it will do the job. The relevant excerpt for dbus 
is:

Name: dbus
Description: Free desktop message bus
Version: 1.1.20
Libs: -L${libdir} -ldbus-1
Cflags: -I${includedir}/dbus-1.0 -I${libdir}/dbus-1.0/include

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


