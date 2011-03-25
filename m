Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q39eH-0008Gc-V2 for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 17:14:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q39cT-0008Ii-Sf for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 17:12:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 17:12:13 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Mar 2011 17:12:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 25 Mar 2011 17:12:01 +0100
Message-ID: <imiesh$fqt$1@dough.gmane.org>
References: <imht74$3ej$1@dough.gmane.org> <4D8CB3AB.4010203@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D8CB3AB.4010203@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [2011.03-maintenance] Pull request #5
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
X-List-Received-Date: Fri, 25 Mar 2011 16:14:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-03-11 16:24, Tom Rini wrote:
> On 03/25/2011 04:10 AM, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Tom,
>>
>> Please pull the 27 commits from here:
>>
>> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
>> Branch: 2011.03-maintenance
>>
>> Kartik Mohta (1):
>>        libarchive: Requires libxml2
>>
>> Khem Raj (2):
>>        cairo_1.10.0.bb: Fennec will now need tee support in cairo so
>>        fennec: Make it build on ARM eglibc/uclibc
>>
>> Koen Kooi (3):
>>        networkmanager 0.8.1: fix build against libl using the patch from
>>        x-load git: update to 1.5.0
>>        u-boot git: remove duplicate filesdir line
>>
>> Martin Jansa (14):
>>        libnl: rename libnl2 to libnl as used in openembedded-core
>>        libnl: don't use /usr/include/libnl2 anymore
>>        libnl: add libnl.inc and use INC_PR
>>        SHR: drop blacklist entries for libnl, now when libnl2 is used by
>>        libfsobasics: depend only on libnl(-2.0) not libnl2(-2.0)
>>        hostap-daemon: depend only on libnl(-2.0) not libnl2(-2.0)
>>        iw: depend only on libnl(-2.0) not libnl2(-2.0)
>>        ti-wifi-utils: depend only on libnl(-2.0) not libnl2(-2.0)
>>        wpa-supplicant-0.7: depend only on libnl(-2.0) not libnl2(-2.0)
>>        connman: depend only on libnl(-2.0) not libnl2(-2.0)
>>        libnl_git: remove fix-pktloc-dep-race.patch from this version
>>        libnl-1.1: rename to libnl1 and build only static lib
>>        networkmanager_git: fix build with static libnl1
>>        mc: add RRECOMMENDed mc-skins package and more files to FILES_PN
>>
>> Roger Monk (3):
>>        u-boot-git:  Add omap4430-panda to u-boot git recipe
>>        omap4430-panda: Prefer u-boot-git and remove extra custom x-load
>>        gst-plugins-good: update to 0.10.28
>>
>> Siddharth Heroor (4):
>>        TI IPC: Fix License field.
>>        TI IPC: Add missing dependencies
>>        TI IPC: Add version 1.22.04.25
>>        TI XDCTools: Add version 3.20.08.88
>>
>> You can view the branch online at
>> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
>>
>>
>> This biggest chunk is the libnl situation, that was runtime tested on
>> angstrom/beagleboard and angstrom/hawkboard. After that there's the TI
>> stuff update, which only impacts out-of-tree recipes, the pandaboard
>> changes which were runtime tested on angstrom/pandaboard, a gstreamer
>> update and small updates for fennec, mc and libarchive.
> 
> The libnl stuff makes me nervous.  Can you throw it through your whole
> build matrix easily?

I built angstrom-gnome-image for both armv5te and armv7a, I queued it up
for the whole matrix a few minutes ago. I'll report back when it has
finished.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjL7RMkyGM64RGpERApFWAJ4vgcSKEP3gpIXmoUby4UKN3iRaLgCeKAyV
m1IFnsoHfsbnBYlRXBgrLro=
=lOYm
-----END PGP SIGNATURE-----



