Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPeqT-0004pE-Oi for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 21:04:13 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SPeh3-0003Gk-8v for openembedded-devel@lists.openembedded.org;
	Wed, 02 May 2012 20:54:29 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 20:54:29 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 May 2012 20:54:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 02 May 2012 20:54:19 +0200
Message-ID: <jnrvsr$4jc$1@dough.gmane.org>
References: <1335980745-29862-1-git-send-email-philip@balister.org>
	<1335980745-29862-2-git-send-email-philip@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <1335980745-29862-2-git-send-email-philip@balister.org>
X-Enigmail-Version: 1.4
Subject: Re: [meta-oe 1/1] lxc : Add recipe for building Linux Containers tools.
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
X-List-Received-Date: Wed, 02 May 2012 19:04:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 02-05-12 19:45, Philip Balister schreef:
> Linux containers are a lightweight virtualization system.
> 
> Compile tested on F15 and lightly run tested on a pandaboard.
> 
> Signed-off-by: Philip Balister <philip@balister.org> --- 
> meta-oe/recipes-extended/lxc/lxc_git.bb |   21 +++++++++++++++++++++ 1
> files changed, 21 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-extended/lxc/lxc_git.bb
> 
> diff --git a/meta-oe/recipes-extended/lxc/lxc_git.bb
> b/meta-oe/recipes-extended/lxc/lxc_git.bb new file mode 100644 index
> 0000000..8f22e77 --- /dev/null +++
> b/meta-oe/recipes-extended/lxc/lxc_git.bb @@ -0,0 +1,21 @@ +SUMMARY =
> "Linux Containers tools" +DESCRIPTION = "Linux containers are a light
> weight isolation system for Linux." +HOMEPAGE =
> "http://lxc.sourceforge.net" +LICENSE = "LGPLv2.1"

Move LIC_FILES_CHKSUM to here

> + +PV = "0.8.0-rc2"

That violates the versioning policy

> + +RDEPENDS_${PN} = "perl perl-modules"

That needs to go below do_install() and specify the actual modules it needs,
not the blanket meta-package.

Speaking of lxc, have you tried systemd-nspawn to launch containers yet?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPoYLZAAoJEHZqAkdh1vT6aSkP/icOR0X1LViS570mPPq2AVuN
f2eFS33G0ozGu6ZMJGgoQ788Hbzi4cBb53jTek1UDjJbRu34pwpEMJJFuKQB53m+
S66ayFiiEBMeTm8YttY/XscJBR07FP/T1ZDhAJJEdd8P4UOqQG7hee46SyeH7NIX
dFKwahfIbfVHjnV5Ub46UzuDYEPMSiJFtsFWE6AeNg7y2rPcCjAKpaTRI8UjDCFk
G9VkptMHoShSHRechYELIgMPpUrVw8JgGX0KBmAsK0GedKtgBFmr3pa1g3y6uORn
oVlUJOzUo5vxOkcNaL6wg06q3IomUNemQX70pF8Oy89DV7FqhPM95/pOL3B/89DR
+qEuJreGW/fQJUiZVX252YhY+dzVb+JZJObtiDMOxfJMyA9AG1YoATFtOGOTYJT/
3gCwEVs0N5LIP/KF9Ox9205+qtEn5uJzmxy7ZQp5SuNx5skxJL0OyPufm/Tpr6/T
6cDeEVsKKTEYXNiqIxOvG9LlnVWy/v+DgqHCCxEVs9MlCizC0dghE4kslcsAYd9S
fK5PzuFLb9IcLTDIwRIUuSsaj7Z9L8Y7L24daFlfIGblDn8jAlxTXn8OuheRvFSh
q8csWl6KuTFoQ1TvEsF3wg/B6UdFyCb1Vtj+0t4ekcSzLNlUrhaXJG0IJ6kDC/Pm
wfS4dMFyAcBfDXqjSCeN
=Cv0C
-----END PGP SIGNATURE-----



