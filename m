Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5ZzF-0000mG-4L for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 11:18:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5ZuA-00087g-3M for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 11:12:46 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 11:12:46 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 11:12:46 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Sep 2011 11:12:33 +0200
Message-ID: <j57121$rkg$1@dough.gmane.org>
References: <4E70C8BA.9030901@dresearch-fe.de>
	<4E736B6C.9060906@dresearch-fe.de>
	<1316187165.3510.37.camel@phil-desktop>
	<4E73760B.6020605@dresearch-fe.de>
	<20110919080621.GB3783@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <20110919080621.GB3783@chargestorm.se>
X-Enigmail-Version: 1.3.1
Subject: Systemd sysv compat mode, was: Re: guidelines for upstart in oe?
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
X-List-Received-Date: Mon, 19 Sep 2011 09:18:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 19-09-11 10:06, Anders Darander schreef:
> * Steffen Sledz <sledz@dresearch-fe.de> [110916 18:15]:
>> I'm not sure if there exist upstart based oe distros/images. But it 
>> seems that there are some systemd based ones 
>> (recipes/images/angstrom-systemd-image.bb).
> 
>> Do they have a similar problem? How do these handle the sysvinit config
>> vs. systemd config for the different services?
> 
> It varies slightly.
> 
> Some packages, e.g. dropbear, has an extra package dropbear-systemd in 
> meta-oe, that packages the systemd unit files for dropbear. The same is 
> true for dbus in oe-core.
> 
> Other packages, like ofono in oe-core, pacakages the systemd unit files 
> directly in the ofono-package.
> 
> In all these cases, sysvinit files are supplied directly in the main 
> package.

This works for systemd since it has a working sysv compat mode and override
mechanism. Consider the following scenarios:

a) native mode
/lib/systemd/system/foo.service

native systemd unit will get used

b) dual mode
/etc/init.d/foo
/lib/systemd/system/foo.service

native systemd unit will get used, sysv script gets ignored.

c) sysv mode
/lib/systemd/system/foo.service

sysv script will run

d) masking
/etc/init.d/foo
/lib/systemd/system/foo.service is a symlink to /dev/null

sysv script will not run

So in the systemd world we can control which system gets used quite well.
And coming from an OE world writing systemd units is easy since they are
conceptually the same as recipes (e.g. DEPENDS -> Requires:) and don't
require a ton of boilerplate.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOdweBMkyGM64RGpERAuuAAKCzWKuX6zVciC6VGoFv/udJlAgEmQCfRwx9
JDOJJKugRiyamOx+S9RJthg=
=bEGV
-----END PGP SIGNATURE-----



