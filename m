Received: from stoexhub02.domain01.net ([83.145.59.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkFWp-0007Wt-BQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 14:44:48 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhub02.domain01.net
	(10.12.10.2) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Mon, 9 Jan 2012 14:37:10 +0100
Date: Mon, 9 Jan 2012 14:37:08 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20120109133703.GA5503@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1326114932.git.anders@chargestorm.se>
	<5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
	<20120109132816.GB3936@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120109132816.GB3936@jama.jama.net>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH 2/2] systemd: split out systemd-analyze
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
X-List-Received-Date: Mon, 09 Jan 2012 13:44:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Martin Jansa <martin.jansa@gmail.com> [120109 14:28]:

> On Mon, Jan 09, 2012 at 02:18:38PM +0100, Anders Darander wrote:
> > Split systemd-analyze to a separate package, to remove the implicit
> > dependency on python. (At least the rpm-packaging backend created a
> > run-time dependency on python).

> > +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"

> >  USERADD_PACKAGES = "${PN}"
> >  GROUPADD_PARAM_${PN} = "-r lock"

> > +FILES_${PN}-analyze = "${bindir}/systemd-analyze"

> according to your commit message, why not add
> RDEPENDS_${PN}-analyze = "python"
> here?

Yes, I should probably spin a v2 with:
RDEPENDS_${PN}-analyze = "python-dbus"
as python alone isn't enough to run systemd-analyze.

Missing that as on our larger image, python was always explicitly
installed by other packages, and on this smaller one, we didn't want it.
Good catch, though!

> and maybe
> RSUGGESTS_${PN} += "${PN}-analyze"

Not sure about this one. It should probably be safe to add, although I'm
undecided...

Cheers,
Anders

> > +
> >  FILES_${PN}-initramfs = "/init"
> >  RDEPENDS_${PN}-initramfs = "${PN}"
-- 
Anders Darander
ChargeStorm AB / eStorm AB


