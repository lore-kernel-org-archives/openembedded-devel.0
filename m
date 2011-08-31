Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qyi1v-0004eS-Dz for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 12:28:23 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyhxA-0003a2-S0 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 12:23:28 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 12:23:28 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 12:23:28 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 12:23:17 +0200
Message-ID: <j3l22l$5ti$1@dough.gmane.org>
References: <1314745564-3331-1-git-send-email-schnitzeltony@gmx.de>
	<j3kn1n$tqr$1@dough.gmane.org>
	<1314785183.3769.22.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314785183.3769.22.camel@mattotaupa>
X-Enigmail-Version: 1.3.1
Subject: Re: `PR = "r0"`: Add or not to add?
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
X-List-Received-Date: Wed, 31 Aug 2011 10:28:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 12:06, Paul Menzel schreef:
> Am Mittwoch, den 31.08.2011, 09:15 +0200 schrieb Koen Kooi:
>> Op 31-08-11 01:06, Andreas Müller schreef:
>>> * build & partially run tested on overo
>>> 
>>> Signed-off-by: Andreas Müller <schnitzeltony@gmx.de> --- .../thunar-volman/thunar-volman_0.6.0.bb           |   12 ++++++++++++ 1 files changed, 12 insertions(+), 0 deletions(-) create mode 100644 meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb
>>> 
>>> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb new file mode 100644 index 0000000..ad11d84 --- /dev/null +++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.6.0.bb @@ -0,0 +1,12 @@ +DESCRIPTION = 
>>> "Automatic management of removable drives and media for thunar" +SECTION = "x11" +LICENSE = "GPLv2" +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f" +DEPENDS = "exo gtk+ libxfce4ui libxfce4util xfconf libnotify" + +PR = "r0"
> 
> (Koen, your messages are still not displayed correctly. The line breaks are missing. Could you check your setup? Your messages are the only ones displaying that problem [1].)

I blame thunderbird auto updates, it suddenly started doing this and I couldn't figure out when to change it back. And honestly, I don't care.

> 
>> please remove PR in new recipes
> 
> Actually I would favor to leave them in.

Well I don't, and atm I decide if it goes in or not.

> The manual also advises to do this.

The manual says a lot of things and was written for .dev, not OE-core or meta-oe.

> To change that policy, I would favor a survey/poll so that not every developers says something different as s/he sees best fit.

Be sure to include every other variable with a default in that poll in order to be consistent.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFOXguVMkyGM64RGpERAkKZAJjDc20vYI5rFNfg6RU3Fc27kh64AJ9Im+Oo
CkuOFUfDcIWraxzeWj3oFw==
=n8yR
-----END PGP SIGNATURE-----



