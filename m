Received: from [66.111.4.29] (helo=out5.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rod@whitby.id.au>) id 1HQav4-0002uM-DG
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Mar 2007 04:09:54 +0100
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id 0D63A1F73FF
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2007 23:09:54 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by out1.internal (MEProxy); Sun, 11 Mar 2007 23:09:54 -0400
X-Sasl-enc: XeNyGeBGD85J2AqpfsybEz2igMzeqyTscy/fL43bjBQq 1173668993
Received: from [127.0.0.1] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id 248CF8F03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2007 23:09:52 -0400 (EDT)
Message-ID: <45F4C45B.8020601@whitby.id.au>
Date: Mon, 12 Mar 2007 13:39:15 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 1.5.0.10 (Windows/20070221)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.0.0
Subject: [RFC] madwifi staging and hostap-deamon support for madwifi
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
X-List-Received-Date: Mon, 12 Mar 2007 03:09:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I want to get hostap-deamon working for madwifi (on the IOMega NAS100d,
and D-Link DSMG-600 RevA).

Currently, it does not support madwifi, and the current madwifi-ng
recipe is putting the include files in a place other than the place that
hostapd looks for them during the compile.  Also, hostapd has an
RDEPENDS on hostapd-modules, which does not make sense for madwifi.

I'd like to change madwifi-ng to put the files in the right place, and
then change hostap-daemon to enable madwifi support and use those
include files.  Are there any other known packages that use madwifi
include files that may be affected?

I can either enable this globally, or enable it for the slugos distro
only, or enable it for ixp4xx machines only.  Which should I do?

Here is the madwifi-ng.inc patch:

>  do_stage() {
> -       install -d ${STAGING_INCDIR}/${PN}/include
> -       install -d ${STAGING_INCDIR}/${PN}/net80211
> -       cp --dereference include/compat.h ${STAGING_INCDIR}/${PN}/include/
> -       cp --dereference net80211/*.h ${STAGING_INCDIR}/${PN}/net80211/
> +       install -d ${STAGING_INCDIR}/net80211
> +       cp --dereference include/compat.h ${STAGING_INCDIR}/net80211/
> +       cp --dereference net80211/*.h ${STAGING_INCDIR}/net80211/
>  }

Here is the hostap-daemon.inc patch (example using a _ixp4xx override):

> -RDEPENDS = "hostap-modules hostap-utils (${PV})"
> +RDEPENDS = "hostap-utils (${PV})"
> +DEPENDS_append_ixp4xx = " madwifi-ng"
> 
> +do_configure_ixp4xx() {
> +        sed -e 's/\#CONFIG_DRIVER_MADWIFI=y/CONFIG_DRIVER_MADWIFI=y/' \
> +               '${WORKDIR}/defconfig' >>'${S}/.config'
> +}

If there are no responses, I will continue with the madwifi-ng change as
above, and do the override for all _ixp4xx machines.

-- Rod


