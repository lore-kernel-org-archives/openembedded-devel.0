Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rb6tE-0004Rl-ET for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:42:08 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Rb6mQ-0006cv-Lr for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 09:35:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 09:35:06 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 09:35:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 15 Dec 2011 09:30:03 +0100
Message-ID: <jccb63$qlr$2@dough.gmane.org>
References: <1323794683-24233-1-git-send-email-dbaryshkov@gmail.com>
	<1963512.neekAovJTQ@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1963512.neekAovJTQ@helios>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-opie 0/6] Fix SDK generation
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
X-List-Received-Date: Thu, 15 Dec 2011 08:42:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-12-11 23:58, Paul Eggleton schreef:
> On Tuesday 13 December 2011 20:44:37 Dmitry Eremin-Solenikov wrote:
>> The following changes since commit
>> ad8e8dc745831e2f8523757d790294906500b0ad:
>> 
>> Fix LIC_FILES_CHKSUM for change to common LGPL-2.0 license file 
>> (2011-12-09 12:18:49 +0000)
>> 
>> are available in the git repository at: 
>> https://github.com/lumag/meta-opie master
>> 
>> Dmitry Eremin-Solenikov (6): uicmoc: do also provide nativesdk variant 
>> qmake: do also provide nativesdk variant task-opie, task-opie-16mb:
>> make whole recipe a machine-only opie-button-settings: make whole
>> recipe a machine-only libopie2: make libopie2-dev package installable 
>> opie: fix SDK generation
>> 
>> recipes-opie/libopie/libopie2.inc                  |    6 ++- 
>> recipes-opie/meta/meta-toolchain-opie.bb           |   30 
>> ++++++++++++++++--- .../opie-button-settings/opie-button-settings.inc
>> | 2 +- recipes-opie/tasks/task-opie-16mb.bb               |    5 +-- 
>> .../tasks/task-opie-toolchain-host-nativesdk.bb    |    8 +++++ 
>> recipes-opie/tasks/task-opie-toolchain-target.bb   |   16 ++++++++++ 
>> recipes-opie/tasks/task-opie.bb                    |    9 +---- 
>> .../{qmake-native_1.07a.bb => qmake_1.07a.bb}      |    8 ++--- 
>> .../64bit-cleanup.patch                            |    0 
>> .../fix-makefile.patch                             |    0 
>> .../gcc3_4.patch                                   |    0 
>> .../gcc4.patch                                     |    0 
>> .../gcc4_1.patch                                   |    0 
>> .../kernel-asm-page.patch                          |    0 
>> .../{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb}  |   11 +++++-- 15
>> files changed, 69 insertions(+), 26 deletions(-) create mode 100644
>> recipes-opie/tasks/task-opie-toolchain-host-nativesdk.bb create mode
>> 100644 recipes-opie/tasks/task-opie-toolchain-target.bb rename 
>> recipes-qt/qmake/{qmake-native_1.07a.bb => qmake_1.07a.bb} (92%)
>> rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => 
>> uicmoc-2.3.10}/64bit-cleanup.patch (100%) rename 
>> recipes-qt/uicmoc/{uicmoc-native-2.3.10 => 
>> uicmoc-2.3.10}/fix-makefile.patch (100%) rename 
>> recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc3_4.patch 
>> (100%) rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => 
>> uicmoc-2.3.10}/gcc4.patch (100%) rename 
>> recipes-qt/uicmoc/{uicmoc-native-2.3.10 => uicmoc-2.3.10}/gcc4_1.patch 
>> (100%) rename recipes-qt/uicmoc/{uicmoc-native-2.3.10 => 
>> uicmoc-2.3.10}/kernel-asm-page.patch (100%) rename 
>> recipes-qt/uicmoc/{uicmoc-native_2.3.10.bb => uicmoc_2.3.10.bb} (81%)
> 
> Merged to meta-opie, thanks!

Please update patchwork as well
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7psAsACgkQMkyGM64RGpG6tgCfQ3U30t28AoikM/rGKNoSbleO
sq0AnjDcZm7cpjBncK3XUel93PYXWsYB
=Ef7a
-----END PGP SIGNATURE-----



