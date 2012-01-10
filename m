Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RkWec-0007oc-NQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 09:01:58 +0100
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.213.0;
	Tue, 10 Jan 2012 08:53:26 +0100
Date: Tue, 10 Jan 2012 08:53:25 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20120110075324.GA3664@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <cover.1326114932.git.anders@chargestorm.se>
	<5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
	<20120109132816.GB3936@jama.jama.net>
	<20120109133703.GA5503@ad.chargestorm.se>
	<jegp84$91t$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jegp84$91t$1@dough.gmane.org>
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
X-List-Received-Date: Tue, 10 Jan 2012 08:01:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Koen Kooi <koen@dominion.thruhere.net> [120110 08:27]:

> Op 09-01-12 14:37, Anders Darander schreef:
> > * Martin Jansa <martin.jansa@gmail.com> [120109 14:28]:

> >> On Mon, Jan 09, 2012 at 02:18:38PM +0100, Anders Darander wrote:
> >>> Split systemd-analyze to a separate package, to remove the implicit 
> >>> dependency on python. (At least the rpm-packaging backend created a 
> >>> run-time dependency on python).

> >>> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs
> >>> ${PN}-analyze"

> >>> USERADD_PACKAGES = "${PN}" GROUPADD_PARAM_${PN} = "-r lock"

> >>> +FILES_${PN}-analyze = "${bindir}/systemd-analyze"

> >> according to your commit message, why not add RDEPENDS_${PN}-analyze =
> >> "python" here?

> > Yes, I should probably spin a v2 with: RDEPENDS_${PN}-analyze =
> > "python-dbus" as python alone isn't enough to run systemd-analyze.

> Don't forget python-pycairo for 'systemd-analyze plot'

Thanks, I'll add it as a RRECOMMENDS and send an updated patch series.
(I've only used systemd an headless systems, without any graphics
libraries at all, thus never been running systemd-analyze plot)

I'll use RRECOMMENDS as it is not necessary for running systemd-analyze,
which python-dbus is. Well, it is necessary for running 'systemd-analyze
plot', but not for the other commands in systemd-analyze.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB


