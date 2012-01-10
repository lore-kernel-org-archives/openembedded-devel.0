Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RkWED-0006vK-JW for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 08:34:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RkW70-0001jD-TA for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 08:27:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:27:14 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2012 08:27:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 10 Jan 2012 08:27:01 +0100
Message-ID: <jegp84$91t$1@dough.gmane.org>
References: <cover.1326114932.git.anders@chargestorm.se>
	<5fec4c565130ce5590d5073421f211898d12dc24.1326114932.git.anders@chargestorm.se>
	<20120109132816.GB3936@jama.jama.net>
	<20120109133703.GA5503@ad.chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <20120109133703.GA5503@ad.chargestorm.se>
X-Enigmail-Version: 1.3.4
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
X-List-Received-Date: Tue, 10 Jan 2012 07:34:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-01-12 14:37, Anders Darander schreef:
> * Martin Jansa <martin.jansa@gmail.com> [120109 14:28]:
> 
>> On Mon, Jan 09, 2012 at 02:18:38PM +0100, Anders Darander wrote:
>>> Split systemd-analyze to a separate package, to remove the implicit 
>>> dependency on python. (At least the rpm-packaging backend created a 
>>> run-time dependency on python).
> 
>>> +PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs
>>> ${PN}-analyze"
> 
>>> USERADD_PACKAGES = "${PN}" GROUPADD_PARAM_${PN} = "-r lock"
> 
>>> +FILES_${PN}-analyze = "${bindir}/systemd-analyze"
> 
>> according to your commit message, why not add RDEPENDS_${PN}-analyze =
>> "python" here?
> 
> Yes, I should probably spin a v2 with: RDEPENDS_${PN}-analyze =
> "python-dbus" as python alone isn't enough to run systemd-analyze.

Don't forget python-pycairo for 'systemd-analyze plot'

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8L6EMACgkQMkyGM64RGpFsMwCfYYRYu/3dMHcSatOubVTWgz8U
i8kAoI8iJsmGCdwTYWz492C5LJMn3uPH
=BrPL
-----END PGP SIGNATURE-----



