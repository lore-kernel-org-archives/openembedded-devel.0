Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q3s0d-0002OS-7i
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 17:36:12 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q3ryd-0004zz-Mp from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 27 Mar 2011 08:34:03 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 27 Mar 2011 08:33:59 -0700
Received: from [172.30.80.83] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Sun, 27 Mar 2011 08:33:58 -0700
Message-ID: <4D8F58E2.5000507@mentor.com>
Date: Sun, 27 Mar 2011 08:33:54 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <iml9ua$thk$1@dough.gmane.org>
In-Reply-To: <iml9ua$thk$1@dough.gmane.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 27 Mar 2011 15:33:59.0833 (UTC)
	FILETIME=[64A96890:01CBEC94]
Subject: Re: [2011.03-maintenance] Pull request #7 - the libnl one
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
X-List-Received-Date: Sun, 27 Mar 2011 15:36:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/26/2011 11:06 AM, Koen Kooi wrote:
> Tom,
> 
> Please pull the 15 commits from here:
> 
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance-pr7
> 
> Koen Kooi (2):
>        networkmanager 0.8.1: fix build against libl using the patch from
>        bluez 4.84: raise default preference after libnl changes
> 
> Martin Jansa (13):
>        libnl: rename libnl2 to libnl as used in openembedded-core
>        libnl: don't use /usr/include/libnl2 anymore
>        libnl: add libnl.inc and use INC_PR
>        SHR: drop blacklist entries for libnl, now when libnl2 is used by
> default
>        libfsobasics: depend only on libnl(-2.0) not libnl2(-2.0)
>        hostap-daemon: depend only on libnl(-2.0) not libnl2(-2.0)
>        iw: depend only on libnl(-2.0) not libnl2(-2.0)
>        ti-wifi-utils: depend only on libnl(-2.0) not libnl2(-2.0)
>        wpa-supplicant-0.7: depend only on libnl(-2.0) not libnl2(-2.0)
>        connman: depend only on libnl(-2.0) not libnl2(-2.0)
>        libnl_git: remove fix-pktloc-dep-race.patch from this version
>        libnl-1.1: rename to libnl1 and build only static lib
>        networkmanager_git: fix build with static libnl1
> 
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance-pr7
> 
> This was build tested from scratch for armv7a and armv5te, runtime
> tested on armv7a.
> 
> It has one patch that isn't in .dev, the "bluez 4.84: raise default
> preference after libnl changes" one. The dev branch has a much newer
> bluez4 version already to solve that.

Applied, thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNj1jhAAoJEI4NMjfc3nJxTG4H/i8iSEPZS6Zr3bJCZC+r6cmu
RRfm4fUk//0EuvimmB+yasZp5hyc1YrD6DkgvwtQqy6ZZiA+87iV/jSQNIUn0Aq6
DoX9kx4d6eez86UN14YeLk4MZ0ML9OKxWJpvjwWPEn5Cq8qYVZRxR0WnDfxbiOoY
xKhUy0UsjtWZWl83xpoggR00gH7eRBzJwBBTXMOrbMK28VqPvYXL1Ky2DgCmUqng
+XO9txOBpNXMwvDY+6XtooWslp469EeI2wsWyXzD2v9Z/eBv4zm9AdkfmMv6CFzj
m3TVMBpl+lY05gsBarh4c2Ibf7gl5BZuPPvkC+ks1rSNnU3rYKz/kUvMHMzS79g=
=QxH0
-----END PGP SIGNATURE-----


