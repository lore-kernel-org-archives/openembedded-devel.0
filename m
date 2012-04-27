Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SNfIf-00054C-2r for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 09:09:05 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SNf9I-0007HX-1b for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 08:59:24 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 08:59:23 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 08:59:23 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 27 Apr 2012 08:59:13 +0200
Message-ID: <jndg3u$phv$1@dough.gmane.org>
References: <cover.1335444528.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <cover.1335444528.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4
Subject: Re: [[meta-oe][meta-efl] 00/15] kernel.bbclass sync, new efl release, systemd machine support, update for oe-core changes
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
X-List-Received-Date: Fri, 27 Apr 2012 07:09:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-04-12 14:50, Martin Jansa schreef:
> The following changes since commit
> 1c2e52a30e7714931bb40a3812eff3cfd36def8a:
> 
> xserver-common: drop xinput-calibrator call as it is done by xdg now
> (2012-04-25 13:58:56 +0200)
> 
> are available in the git repository at: 
> git://git.openembedded.org/meta-openembedded-contrib jansa/pull2 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull2
>
>  Andreas Oberritter (1): {kernel, module}.bbclass: don't run depmod for
> module packages during do_rootfs
> 
> Martin Jansa (13): kernel.bbclass: resync with oe-core version 
> systemd.bbclass: allow recipe to inherit systemd with empty 
> SYSTEMD_SERVICE systemd-machine-units: add machine specific recipe for
> BSPs e-base: bump EFL_SRCREV for 1.2 meta-efl: add recipes for new
> released versions efl-from-svn.inc: rename eio: fix LIC_FILES_CHKSUM 
> expedite: add LIC_FILES_CHKSUM README: keep PATCH prefix in
> subject-prefix, some people filter their inbox based on that Saul Wold
> (1): kernel: Fix packaging issue

I merged the above into master and denzil

> qt4: rename bbappends to match 4.8.1 from oe-core librsvg, cairo, pixman,
> tiff, libgpg-error: remove native support, was moved to oe-core libusb*:
> remove native support, was moved to oe-core pango: native support and
> --disable-introspection moved to oe-core pango.inc

And these only into master


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPmkO+AAoJEHZqAkdh1vT6KMUP/jTZslBkJBiF4UJF3CTMmBAZ
lXQYMQLv7nTOD/3StL+2Zxtg039Y6imqlPzn/vCBEQPe8v84/H3RJANPMhLn/20n
Cwq0NYBAU0AySehgivgtd+97vgFAGY5XpIB1xaAQJv/U4WWI6uCWRWbdNuPf6iZn
loM8Mi+fz8vOkgpM7b7uuRYWmMHVS95XhyMXpicvGxDGqQw/EeWYDh7hm0L0q+Be
Vy4t5Rn6BcG4n/w52GhXJ8Vm9aQG44p6+TzqzHTB4a9duxLo4FhVJrwzM5HLl3dr
Q3tORmAynBJdHA6Z6bPp7F2hWQuaelAAiFZw3VVDedIf6tQO9Lj7s72+rctkA0Jz
KsSfbaWJaoKA0epx+6oULqa7+CUvWAokd3Lnu8B7h8KiCO2NHTkFUfJOSJrkXQvB
xkxgg+47llK0x26u6Of/ckN19rm+aZDNsMD2USE/9WcPsRlLsiDcZFjpBQbEnPom
3wpYfrUaAEnQeMSn//tyxCVOTXYaGnw4o0Eys6kir7pvMo+J6teqBgAl1xcnrpCl
U4Y3MamqJ5A1VYtMIJiQ9Mqh0phmnz5xeP1Xos5dczjgfw5nIeh1/e7KTQix/qR8
8bM70/Qw10P37j+isRH0S7LwqA7xjpJG7o1OZGkyMR+KXz13kiWvWHMckKm5GKN8
cGMCyPMZQqqgvO+q98oo
=EW2G
-----END PGP SIGNATURE-----



