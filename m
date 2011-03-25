Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q38u7-0004Yc-DX
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 16:26:23 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q38sI-00046B-RB from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 08:24:30 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 25 Mar 2011 08:24:30 -0700
Received: from [172.30.80.83] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Fri, 25 Mar 2011 08:24:30 -0700
Message-ID: <4D8CB3AB.4010203@mentor.com>
Date: Fri, 25 Mar 2011 08:24:27 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <imht74$3ej$1@dough.gmane.org>
In-Reply-To: <imht74$3ej$1@dough.gmane.org>
X-OriginalArrivalTime: 25 Mar 2011 15:24:30.0659 (UTC)
	FILETIME=[BC94D930:01CBEB00]
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
X-List-Received-Date: Fri, 25 Mar 2011 15:26:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/25/2011 04:10 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Tom,
>
> Please pull the 27 commits from here:
>
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
>
> Kartik Mohta (1):
>        libarchive: Requires libxml2
>
> Khem Raj (2):
>        cairo_1.10.0.bb: Fennec will now need tee support in cairo so
>        fennec: Make it build on ARM eglibc/uclibc
>
> Koen Kooi (3):
>        networkmanager 0.8.1: fix build against libl using the patch from
>        x-load git: update to 1.5.0
>        u-boot git: remove duplicate filesdir line
>
> Martin Jansa (14):
>        libnl: rename libnl2 to libnl as used in openembedded-core
>        libnl: don't use /usr/include/libnl2 anymore
>        libnl: add libnl.inc and use INC_PR
>        SHR: drop blacklist entries for libnl, now when libnl2 is used by
>        libfsobasics: depend only on libnl(-2.0) not libnl2(-2.0)
>        hostap-daemon: depend only on libnl(-2.0) not libnl2(-2.0)
>        iw: depend only on libnl(-2.0) not libnl2(-2.0)
>        ti-wifi-utils: depend only on libnl(-2.0) not libnl2(-2.0)
>        wpa-supplicant-0.7: depend only on libnl(-2.0) not libnl2(-2.0)
>        connman: depend only on libnl(-2.0) not libnl2(-2.0)
>        libnl_git: remove fix-pktloc-dep-race.patch from this version
>        libnl-1.1: rename to libnl1 and build only static lib
>        networkmanager_git: fix build with static libnl1
>        mc: add RRECOMMENDed mc-skins package and more files to FILES_PN
>
> Roger Monk (3):
>        u-boot-git:  Add omap4430-panda to u-boot git recipe
>        omap4430-panda: Prefer u-boot-git and remove extra custom x-load
>        gst-plugins-good: update to 0.10.28
>
> Siddharth Heroor (4):
>        TI IPC: Fix License field.
>        TI IPC: Add missing dependencies
>        TI IPC: Add version 1.22.04.25
>        TI XDCTools: Add version 3.20.08.88
>
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
>
> This biggest chunk is the libnl situation, that was runtime tested on
> angstrom/beagleboard and angstrom/hawkboard. After that there's the TI
> stuff update, which only impacts out-of-tree recipes, the pandaboard
> changes which were runtime tested on angstrom/pandaboard, a gstreamer
> update and small updates for fennec, mc and libarchive.

The libnl stuff makes me nervous.  Can you throw it through your whole 
build matrix easily?

-- 
Tom Rini
Mentor Graphics Corporation


