Received: from stoexhub01.domain01.net ([83.145.59.142]
	helo=stoexhub02.domain01.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1R5Ywl-0007aw-MH
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 10:11:23 +0200
Received: from localhost (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server id 8.3.137.0; Mon, 19 Sep 2011
	10:06:06 +0200
Date: Mon, 19 Sep 2011 10:06:22 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20110919080621.GB3783@chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
	<1316187165.3510.37.camel@phil-desktop>
	<4E73760B.6020605@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <4E73760B.6020605@dresearch-fe.de>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Mon, 19 Sep 2011 08:11:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Steffen Sledz <sledz@dresearch-fe.de> [110916 18:15]:
> I'm not sure if there exist upstart based oe distros/images. But it
> seems that there are some systemd based ones
> (recipes/images/angstrom-systemd-image.bb).
 
> Do they have a similar problem? How do these handle the sysvinit
> config vs. systemd config for the different services?

It varies slightly. 

Some packages, e.g. dropbear, has an extra package dropbear-systemd in
meta-oe, that packages the systemd unit files for dropbear. The same is
true for dbus in oe-core.

Other packages, like ofono in oe-core, pacakages the systemd unit files
directly in the ofono-package.

In all these cases, sysvinit files are supplied directly in the main
package.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


