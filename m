Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 116AE6E791
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 10:41:11 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1W8SZz-0002Qt-M6 for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jan 2014 11:41:11 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 11:41:11 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 11:41:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 29 Jan 2014 11:41:42 +0100
Message-ID: <lcalrg$uah$1@ger.gmane.org>
References: <1390943894-18907-1-git-send-email-Martin.Jansa@gmail.com>	<lcac4m$c5i$2@ger.gmane.org>
	<20140129101553.GP3718@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <20140129101553.GP3718@jama>
X-Enigmail-Version: 1.6
Subject: Re: [meta-systemd][PATCH] connman: Rename .bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jan 2014 10:41:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Martin Jansa schreef op 29-01-14 11:15:
> On Wed, Jan 29, 2014 at 08:55:50AM +0100, Koen Kooi wrote: Martin Jansa
> schreef op 28-01-14 22:18:
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> --- 
>>>> .../connman/{connman_1.20.bbappend => connman_%.bbappend} | 0 1
>>>> file changed, 0 insertions(+), 0 deletions(-) rename 
>>>> meta-systemd/oe-core/recipes-connectivity/connman/{connman_1.20.bbappend
>>>>
>>>> 
=> connman_%.bbappend} (100%)
>>>> 
>>>> diff --git 
>>>> a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend
>>>>
>>>> 
b/meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
>>>> similarity index 100% rename from 
>>>> meta-systemd/oe-core/recipes-connectivity/connman/connman_1.20.bbappend
>>>>  rename to 
>>>> meta-systemd/oe-core/recipes-connectivity/connman/connman_%.bbappend
>
>>>> 
> Can we come up with a plan to drop these packaging bbappends? We've
> already had more than one OE (well yoctoproject) release so distros have
> had ample time to adjust to the new packaging system.
> 
>> I have already updated SHR as distro, but that doesn't fix
>> upgrade-path on target (for crazy folks who would try to opkg upgrade
>> themselves from dylan to master).

I think we need to be pragmatic here, dylan -> master won't work when using
opkg (haven't tried RPM), so I'd like to get rid of bbappends that are
present purely for historical reasons.
I'm sure someone can come up with a image recipe in dylan where upgrade to
master does work, but it breaks for the commonly used angstrom images.

So after 'dizzy' (or whatever RP will call it) can we drop these bbappends?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFS6NrmMkyGM64RGpERAtf+AJ4wQeFFJUPngxOudYONWaKcH2kF2QCfclab
MDqmkEQ+AWT9bmozHspawxE=
=eQfD
-----END PGP SIGNATURE-----


