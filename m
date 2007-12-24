Received: from [66.111.4.28] (helo=out4.smtp.messagingengine.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rod@whitby.id.au>) id 1J6bzU-0007wo-4G
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Dec 2007 02:20:24 +0100
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by out1.messagingengine.com (Postfix) with ESMTP id F03CA81C15
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2007 20:14:56 -0500 (EST)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Sun, 23 Dec 2007 20:14:56 -0500
X-Sasl-enc: RccQ5bwx663lxxjruVEn6HbZvTnN5AOp0qxCTIgXT5Tz 1198458896
Received: from [192.168.18.11] (CPE-121-209-21-249.sa.bigpond.net.au
	[121.209.21.249])
	by mail.messagingengine.com (Postfix) with ESMTP id 2A6ACFBB1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2007 20:14:55 -0500 (EST)
Message-ID: <476F07C6.7010308@whitby.id.au>
Date: Mon, 24 Dec 2007 11:43:42 +1030
From: Rod Whitby <rod@whitby.id.au>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
Subject: RFC: DISTRO_FEED_CONFIGS
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
X-List-Received-Date: Mon, 24 Dec 2007 01:20:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I would like to propose a new standard OE variable called
DISTRO_FEED_CONFIGS which is a list of packages to be installed in a
rootfs to enable the corresponding DISTRO_PACKAGE_MANAGER to actually
access the feeds associated with the distro.  A distro which did not
have feed config packages could leave it as the default empty string and
remain unchanged in the face of this RFC.

This variable would be set in the respective distro.conf, along with
DISTRO_PACKAGE_MANAGER.  It would initially be used in base-image.bb
(see that file for an example of use), and then elsewhere as desired.

For example, in Angstrom, it would replace the existing
ANGSTROM_FEED_CONFIGS variable.

-- Rod


