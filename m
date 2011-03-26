Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3XuC-0007be-JQ for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 19:08:08 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q3XsM-0003U6-4Q for openembedded-devel@lists.openembedded.org;
	Sat, 26 Mar 2011 19:06:14 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 19:06:14 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2011 19:06:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 26 Mar 2011 19:06:02 +0100
Message-ID: <iml9ua$thk$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: [2011.03-maintenance] Pull request #7 - the libnl one
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
X-List-Received-Date: Sat, 26 Mar 2011 18:08:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom,

Please pull the 15 commits from here:

URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
Branch: 2011.03-maintenance-pr7

Koen Kooi (2):
      networkmanager 0.8.1: fix build against libl using the patch from
      bluez 4.84: raise default preference after libnl changes

Martin Jansa (13):
      libnl: rename libnl2 to libnl as used in openembedded-core
      libnl: don't use /usr/include/libnl2 anymore
      libnl: add libnl.inc and use INC_PR
      SHR: drop blacklist entries for libnl, now when libnl2 is used by
default
      libfsobasics: depend only on libnl(-2.0) not libnl2(-2.0)
      hostap-daemon: depend only on libnl(-2.0) not libnl2(-2.0)
      iw: depend only on libnl(-2.0) not libnl2(-2.0)
      ti-wifi-utils: depend only on libnl(-2.0) not libnl2(-2.0)
      wpa-supplicant-0.7: depend only on libnl(-2.0) not libnl2(-2.0)
      connman: depend only on libnl(-2.0) not libnl2(-2.0)
      libnl_git: remove fix-pktloc-dep-race.patch from this version
      libnl-1.1: rename to libnl1 and build only static lib
      networkmanager_git: fix build with static libnl1

You can view the branch online at
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance-pr7

This was build tested from scratch for armv7a and armv5te, runtime
tested on armv7a.

It has one patch that isn't in .dev, the "bluez 4.84: raise default
preference after libnl changes" one. The dev branch has a much newer
bluez4 version already to solve that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNjisKMkyGM64RGpERAhujAJ0VsK7SfpYQ3ftqt5BOkAdhtuJfOQCgn32R
06V+fdOr4jjbfxwWNpDbywY=
=Ej3+
-----END PGP SIGNATURE-----



