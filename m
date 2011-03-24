Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2jI4-0007JU-9z for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 13:05:24 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q2jGH-0006yd-D4 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 13:03:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 13:03:33 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 13:03:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 24 Mar 2011 13:03:21 +0100
Message-ID: <imfbu9$9t5$1@dough.gmane.org>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<imf8ac$l91$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <imf8ac$l91$1@dough.gmane.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 01/12] libnl: rename libnl2 to libnl as used in openembedded-core
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
X-List-Received-Date: Thu, 24 Mar 2011 12:05:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-03-11 12:01, Koen Kooi wrote:
> On 18-03-11 15:00, Martin Jansa wrote:
>> * libnl1/libnl2 still conflicts even when using separate includedir so
>>   it will be easier for distro maintainers to use only libnl1 or libnl2
>>   by PREFERRED_VERSION
> 
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> I added this into my maintenance staging branch:
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
> 
> If testing shows no regressions I'm going to do a pull request for it
> next week.

FWIW from
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/testlab/diff/beagleboard/GNOME-image/depends.dot?id=97bcd1b4d01073a30a54a1387a89a54fc9fa3fe3:

diff --git a/beagleboard/GNOME-image/depends.dot
b/beagleboard/GNOME-image/depends.dot
index f7b7cb3..ee4b521 100644
- --- a/beagleboard/GNOME-image/depends.dot
+++ b/beagleboard/GNOME-image/depends.dot
@@ -5924,8 +5924,6 @@ libnet_dbus_perl -> libdbus_1_3;
 libnet_dbus_perl -> libc6;
 libnl_genl2 -> libnl2;
 libnl_genl2 -> libc6;
- -libnl1 -> libc6;
- -libnl1 -> libgcc1;
 libnl2 -> libc6;
 libnl2 -> libgcc1;
 libnm_util1 -> libdbus_glib_1_2;
@@ -7166,7 +7164,7 @@ networkmanager -> libgio_2_0_0;
 networkmanager -> libgmodule_2_0_0;
 networkmanager -> policykit;
 networkmanager -> eggdbus;
- -networkmanager -> libnl1;
+networkmanager -> libgcc1;
 networkmanager -> iptables [style=dotted];
 networkmanager_locale_de -> libnm_util1;
 networkmanager_locale_de -> virtual_locale_de;

Seems to be working as expected!
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNizMIMkyGM64RGpERAsjkAKCk1B/gFOSkDBwDgXCmRWxmIIws0QCgtneF
DFp11bVF08UQKUrP+2/dgYQ=
=FWub
-----END PGP SIGNATURE-----



